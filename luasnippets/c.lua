-- Regular snippets
return {
    s({ trig = "main", dscr = "Main function definition." }, {
        t("int main("),
        c(1, {
            t("void"),
            t("int argc, char **argv"),
        }),
        t({ ") {", "\t" }),
        i(0),
        t({ "", "\treturn 0;", "}" }),
    }),
},
-- Autosnippets
{
    s({ trig = "/*", dscr = "Multi-line comment." }, { t("/* "), i(1, "comment"), t(" */") }),
}
