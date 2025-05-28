local ifndef_block = s({ trig = "ifndef", dscr = "Create an ifndef header file guard." }, {
    t("#ifndef "),
    i(1),
    f(function(args) return { "", "#define " .. args[1][1], "" } end, { 1 }),
    i(0),
    f(function(args) return { "", "#endif // " .. args[1][1] } end, { 1 }),
})

local javadoc_comment = s(
    { trig = "/**", dscr = "Multi-line javadoc comment." },
    { t("/** "), i(1, "comment"), t(" */") }
)

local multiline_comment = s({ trig = "/*", dscr = "Multi-line comment." }, { t("/* "), i(1, "comment"), t(" */") })

local main_func = s({ trig = "main", dscr = "Main function definition." }, {
    unpack(fmt("int main({}) {{\n\t{}\n\treturn 0;\n}}", {
        c(1, {
            t("void"),
            t("int argc, char **argv"),
        }),
        i(0),
    })),
})

-- Regular snippets
return {
    ifndef_block,
    multiline_comment,
    main_func,
},
-- Autosnippets
{
    javadoc_comment,
}
