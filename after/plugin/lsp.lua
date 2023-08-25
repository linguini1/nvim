-- Lsp-zero
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lsnip = require("luasnip")

-- LSP attach
local function on_attach()
    vim.keymap.set(
        "n",
        "gr",
        "<Cmd>Telescope lsp_references<CR>",
        { buffer = 0, desc = "Show references in a Telescope window." }
    )
end

-- Mason
mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "eslint",
        "pyright",
        "emmet_ls",
        "cssls",
        "lua_ls",
        "cmake",
        "clangd",
        "rust_analyzer",
    },
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
            on_attach = on_attach,
        })
    end,
})

-- Luasnip
require("luasnip.loaders.from_lua").load()
lsnip.setup({
    history = true,
    update_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
})

-- Language servers
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "s", "t", "i", "d", "c", "sn", "f" },
            },
            format = {
                enable = false,
            },
        },
    },
})
lspconfig.clangd.setup({
    arguments = { "-Wall" },
})
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportPropertyTypeMismatch = true,
                    reportImportCycles = "warning",
                    reportUnusedFunction = "warning",
                    reportDuplicateImport = "warning",
                    reportPrivateUsage = "warning",
                    reportTypeCommentUsage = "warning",
                    reportConstantRedefinition = "error",
                    reportDeprecated = "warning",
                    reportIncompatibleMethodOverride = "error",
                    reportIncompatibleVariableOverride = "error",
                    reportInconsistentConstructor = "error",
                    reportOverlappingOverload = "error",
                    reportMissingSuperCall = "error",
                    reportUnititializedInstanceVariable = "error",
                    reportUnknownParameterType = "warning",
                    reportUnknownArgumentType = "warning",
                    reportUnknownLambdaType = "warning",
                    reportUnknownVariableType = "warning",
                    reportUnknownMemberType = "warning",
                    reportMissingParameterType = "error",
                    reportMissingTypeArgument = "warning",
                    reportUnnecessaryIsInstance = "warning",
                    reportUnnecessaryCast = "warning",
                    reportUnnecessaryComparison = "warning",
                    reportUnnecessaryContains = "warning",
                    reportAssertAlwaysTrue = "warning",
                    reportSelfClsParameterName = "error",
                    reportImplicitStringConcatenation = "warning",
                    reportUnusedExpression = "warning",
                    reportUnnecessaryTypeIgnoreComment = "warning",
                    reportMatchNotExhaustive = "error",
                    reportShadowedImports = "error",
                },
            },
        },
    },
})
lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

-- Completion setup
cmp.setup({
    sources = {
        { name = "luasnip", option = { show_autosnippets = true } },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
    },
    mapping = {
        --- @param fallback function
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif lsnip.expand_or_jumpable() then
                lsnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }), -- Tab autocomplete
        --- @param fallback function
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif lsnip.jumpable(-1) then
                lsnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter to complete
        ["<Up>"] = cmp.mapping.abort(), -- No up and down selection
        ["<Down>"] = cmp.mapping.abort(),
        --- @param fallback function
        ["<C-l>"] = cmp.mapping(function(fallback) -- Move choice forward
            if lsnip.choice_active() then
                lsnip.change_choice()
            else
                fallback()
            end
        end),
        --- @param fallback function
        ["<C-h>"] = cmp.mapping(function(fallback) -- Move choice backward
            if lsnip.choice_active() then
                lsnip.change_choice(-1)
            else
                fallback()
            end
        end),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- Expands snippets
    snippet = {
        expand = function(args) lsnip.lsp_expand(args.body) end,
    },
})

-- Autoclose parenthesis on function completion
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
