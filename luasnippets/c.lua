local regular_snippets = {}

-- Regular C snippets

table.insert(
    regular_snippets,
    s({ trig = "ifndef", dscr = "Create an ifndef header file guard." }, {
        t("#ifndef "),
        i(1),
        f(
            function(args) return { "", "#define " .. args[1][1], "" } end,
            { 1 }
        ),
        i(0),
        f(function(args) return { "", "#endif // " .. args[1][1] } end, { 1 }),
    })
)

table.insert(
    regular_snippets,
    s(
        { trig = "/**", dscr = "Multi-line javadoc comment." },
        { t("/** "), i(1, "comment"), t(" */") }
    )
)

table.insert(
    regular_snippets,
    s(
        { trig = "/*", dscr = "Multi-line comment." },
        { t("/* "), i(1, "comment"), t(" */") }
    )
)

table.insert(
    regular_snippets,
    s({ trig = "main", dscr = "Main function definition." }, {
        unpack(fmt("int main({}) {{\n\t{}\n\treturn 0;\n}}", {
            c(1, {
                t("void"),
                t("int argc, char **argv"),
            }),
            i(0),
        })),
    })
)

local arr_size = s({ trig = "!arr_size", dscr = "Array size macro" }, {
    t("#define arr_size(arr) (sizeof(arr)/sizeof(arr[0]))"),
})

local deref = s({ trig = "!deref", dscr = "Pointer dereferencing macro" }, {
    t("#define deref(type, p) (*((type*)(p)))"),
})

-- NuttX specific snippets

-- Comment headers for sections
local COMMENT_HEADERS = {
    "Included Files",
    "Pre-processor Definitions",
    "Private Types",
    "Public Types",
    "Private Data",
    "Public Data",
    "Private Function Prototypes",
    "Public Function Prototypes",
    "Private Functions",
    "Public Functions",
}

local function comment_header(text)
    return t({
        "/****************************************************************************",
        "* " .. text,
        "****************************************************************************/",
    })
end

for _, header in ipairs(COMMENT_HEADERS) do
    table.insert(
        regular_snippets,
        s({
            trig = header,
            dscr = header .. " Comment Header",
        }, {
            comment_header(header),
        })
    )
end

return regular_snippets,
    -- Autosnippets
    {
        javadoc_comment,
        arr_size,
        deref,
    }
