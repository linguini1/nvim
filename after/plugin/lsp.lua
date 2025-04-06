-- Lsp-zero
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lsnip = require("luasnip")
local conform = require("conform")

-- LSP attach and capabilities
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local function on_attach()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show documentation in hover window." })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Jump to definition." })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Jump to declaration." })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Jump to implementation." })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = 0, desc = "Jump to type definition." })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = 0, desc = "Jump to signature help." })
    vim.keymap.set(
        "n",
        "gq",
        function() conform.format({ timeout_ms = 500, lsp_fallback = true, async = true }) end,
        { buffer = 0, desc = "Format buffer." }
    )
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Rename symbol under cursor." })
    vim.keymap.set(
        "n",
        "gr",
        require("telescope.builtin").lsp_references,
        { buffer = 0, desc = "Show references in a Telescope window." }
    )

    -- Diagnostics
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0, desc = "Jump to next diagnostic." })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0, desc = "Jump to previous diagnostic." })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = 0, desc = "Show diagnostic information in hover." })

    -- Code actions
    if vim.lsp.buf.range_code_action then
        vim.keymap.set("x", "<leader>la", vim.lsp.buf.range_code_action, { buffer = 0, desc = "Range code action." })
    else
        vim.keymap.set("x", "<leader>la", vim.lsp.buf.code_action, { buffer = 0, desc = "Code action." })
    end
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
        "clangd",
        "rust_analyzer",
        "texlab",
    },
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
    on_attach = on_attach,
    capabilities = lsp_capabilities,
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
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
            rustfmt = {
                extraArgs = { "--config", "max_width=120" },
            },
        },
    },
})
lspconfig.texlab.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.hdl_checker.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
})
lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
    java = {
        home = vim.fn.expand("$JAVA_HOME"),
    },
})

-- Completion setup
cmp.setup({
    sources = {
        { name = "luasnip", option = { show_autosnippets = true } },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "neorg" },
        { name = "path" },
    },
    mapping = {
        -- Tab autocomplete
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif lsnip.expand_or_jumpable() then
                lsnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif lsnip.jumpable(-1) then
                lsnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter to complete
        ["<C-y>"] = cmp.mapping.confirm({ select = false }), -- Ctrl + Y to complete too
        ["<C-l>"] = cmp.mapping(function(fallback) -- Move choice forward
            if lsnip.choice_active() then
                lsnip.change_choice()
            else
                fallback()
            end
        end),
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

-- Automatically close parenthesis on function completion
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Styling
vim.opt.winhighlight = cmp.config.window.bordered().winhighlight -- Hover window looks nice
vim.diagnostic.config({
    float = { border = "rounded" },
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
