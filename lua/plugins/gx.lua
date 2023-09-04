return {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "gx" },
    config = function() require("gx").setup({ handler_options = { search_engine = "google" } }) end,
}
