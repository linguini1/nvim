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
        keys = { "<C-_>" },
        config = function()
            require("mini.comment").setup({
                mappings = {
                    comment_line = "<C-_>", -- <C-/>
                    text_object = "<C-_>",
                    comment = "<C-_>",
                },
            })
        end,
    },
    { "echasnovski/mini.surround", config = function() require("mini.surround").setup() end },
}
