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
                local decorator_node = nil
                local node = vim.treesitter.get_node()

                -- Move up the tree until a class node is found
                while node ~= nil do
                    in_class = node:type() == "class_definition"
                    if in_class then
                        break
                    end
                    node = node:parent()
                end

                -- Decide default args based on nodes
                local arguments = "("
                if in_class then
                    arguments = arguments .. "self, "
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
