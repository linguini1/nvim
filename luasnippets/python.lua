-- Regular snippets
return {
    s({ trig = "main", name = "Main gaurd.", dscr = "Python __main__ gaurd." }, {
        t({ 'if __name__ == "__main__":', "\t" }),
        c(1, {
            t(""),
            t("main()"),
        }),
    }),
},
-- Autosnippets
{
    s({ trig = "!author", dscr = "Set __author__ to my name." }, { t('__author__ = "Matteo Golin"') }),
    s({ trig = "def", dscr = "Create a function/method definition with standard parameters." }, {
        t({ "def " }),
        i(1, "fn_name"),
        d(2, function(args)
            local in_class = false
            local node = vim.treesitter.get_node()

            -- Move up the tree until a class node is found
            while node ~= nil do
                in_class = node:type() == "class_definition"
                if in_class then break end
                node = node:parent()
            end

            local pos = vim.api.nvim_win_get_cursor(0)
            local decorator = vim.api.nvim_buf_get_lines(0, pos[1] - 3, pos[1] - 2, false)

            -- Decide default arguments based on nodes
            local arguments = "("
            if in_class then
                if string.find(decorator[1], "classmethod") then
                    arguments = arguments .. "cls, "
                elseif not string.find(decorator[1], "staticmethod") then
                    arguments = arguments .. "self, "
                end
            end

            return sn(nil, {
                t({ arguments }),
                i(1, "params"),
                t({ ") -> " }),
            })
        end),
        i(3, "None"),
        t({ ":", "\t" }),
        i(0, "pass"),
    }),
}
