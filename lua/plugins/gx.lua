return {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    config = function() require("gx").setup({ handler_options = { search_engine = "duckduckgo" } }) end,
}
