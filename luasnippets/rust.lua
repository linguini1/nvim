-- Regular snippets
return {
    s({ trig = "test", dscr = "Expands to the test attribute." }, { t("#[test]") }),
},
-- Autosnippets
{
    s({ trig = "/*", dscr = "Multi-line comment." }, { t("/* "), i(1, "comment"), t(" */") }),
    s({ trig = "#test", dscr = "Expands to the test attribute." }, { t("#[test]") }),
}
