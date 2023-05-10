-- Regular snippets
return {
        s({ trig = "main", name = "Main gaurd.", dscr = "Python __main__ gaurd." }, {
            t({"if __name__ == \"__main__\":", "\t"}),
            c(1, {
                t(""),
                t("main()"),
            }),
        }),
    },

    -- Autosnippets
    {
        s({ trig = "!author", dscr = "Set __author__ to my name." }, { t("__author__ = \"Matteo Golin\"") }),
    }
