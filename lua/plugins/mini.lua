return {
    {
        "echasnovski/mini.operators",
        config = function()
            require("mini.operators").setup({
                replace = { prefix = "" },
                sort = { prefix = "ts" },
                exchange = { prefix = "" },
            })
        end,
    },
    {
        "echasnovski/mini.comment",
        keys = { { "<C-/>", mode = "n" }, { "gc", mode = "x" } },
        config = function()
            require("mini.comment").setup({
                mappings = {
                    comment_line = "<C-/>", -- <C-/>
                    text_object = "gc",
                    comment = "gc",
                },
            })
        end,
    },
    { "echasnovski/mini.surround", config = function() require("mini.surround").setup() end },
}
