return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            overrides = {
                ["@punctuation.bracket"] = { link = "Special" },
                ["@punctuation.delimiter"] = { link = "Special" },
                ["@punctuation.special"] = { link = "Special" },
            },
        })
        vim.cmd.colorscheme("gruvbox")
        vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    end,
}
