-- Regular snippets
return {
    s({ trig = "ifndef", dscr = "Create an ifndef header file guard." }, {
        t("#ifndef "),
        i(1),
        f(function(args) return { "", "#define " .. args[1][1], "" } end, { 1 }),
        i(0),
        f(function(args) return { "", "#endif // " .. args[1][1] } end, { 1 }),
    }),
},
-- Autosnippets
{
    s({ trig = "/*", dscr = "Multi-line comment." }, { t("/* "), i(1, "comment"), t(" */") }),
}
