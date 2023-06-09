-- Lsp-zero
local lsp = require("lsp-zero").preset("recommended")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- Luasnip
local ls = require("luasnip")

-- Luasnippets
require("luasnip.loaders.from_lua").load()
ls.setup({
    history = true,
    update_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set(
        "n",
        "gr",
        "<Cmd>Telescope lsp_references<CR>",
        { buffer = true, desc = "Show references in a Telescope window." }
    )
end)

-- Language servers
lsp.ensure_installed({
    "eslint",
    "pyright",
    "emmet_ls",
    "cssls",
    "lua_ls",
    "cmake",
    "clangd",
})
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- Completion setup
cmp.setup({
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip", option = { show_autosnippets = true } },
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }), -- Tab autocomplete
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter to complete
        ["<Up>"] = cmp.mapping.abort(),               -- No up and down selection
        ["<Down>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping(function(fallback)    -- Move choice forward
            if ls.choice_active() then
                ls.change_choice()
            else
                fallback()
            end
        end),
        ["<C-h>"] = cmp.mapping(function(fallback) -- Move chocie backward
            if ls.choice_active() then
                ls.change_choice(-1)
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
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
})

-- Autoclose parenthesis on function completion
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lsp.setup()
