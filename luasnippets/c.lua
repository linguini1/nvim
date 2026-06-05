local nuttx = require("luasnippets.nuttx");

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

local arr_size = s({ trig = "!arr_size", dscr = "Array size macro" }, {
    t("#define arr_size(arr) (sizeof(arr)/sizeof(arr[0]))"),
})

local deref = s({ trig = "!deref", dscr = "Pointer dereferencing macro" }, {
    t("#define deref(type, p) (*((type*)(p)))"),
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
    arr_size,
    deref,
}
