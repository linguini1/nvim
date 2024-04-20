return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            overrides = {
                ["@punctuation.special"] = { link = "Special" },
                ["@punctuation.delimiter"] = { link = "Special" },
                ["@punctuation.bracket"] = { link = "Special" },
                ["@punctuation"] = { link = "Special" },
                ["Delimiter"] = { link = "Special" },
            },
        })
        vim.cmd.colorscheme("gruvbox")
        vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    end,
}
