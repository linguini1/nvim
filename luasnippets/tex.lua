return {
    s(
        {
            trig = "\\begin",
            priority = 1001,
            name = "begin",
            dscr = "Opens a begin directive with a matching end directive.",
        },
        {
            t("\\begin{"),
            i(1),
            t({ "}", "\t" }),
            i(0),
            f(function(args) return { "", "\\end{" .. args[1][1] .. "}" } end, { 1 }),
        }
    ),
}, {
    s({ trig = "\\frac", name = "Fraction.", dscr = "LaTeX fraction." }, {
        t("\\frac{"),
        i(1, ""),
        t("}{"),
        i(0, ""),
        t("}"),
    }),
    s({ trig = "\\author", name = "author", dscr = "My name as an author directive." }, {
        t("\\author{Matteo Golin}"),
    }),
}
