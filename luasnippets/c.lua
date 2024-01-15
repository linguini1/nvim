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
    s({ trig = "ifndef", dscr = "Create an ifndef header file guard." }, {
        t("#ifndef "),
        i(1),
        f(function(args) return { "", "#define " .. args[1][1], "" } end, { 1 }),
        i(0),
        f(function(args) return { "", "#endif // " .. args[1][1] } end, { 1 }),
    }),
    s({ trig = "/*", dscr = "Multi-line comment." }, { t("/* "), i(1, "comment"), t(" */") }),
},
-- Autosnippets
{
    s({ trig = "/**", dscr = "Multi-line javadoc comment." }, { t("/** "), i(1, "comment"), t(" */") }),
}
