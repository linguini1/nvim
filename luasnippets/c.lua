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

-- All of the different `printf` format specifiers associated with a name
local PRINTF_FORMAT_SPECIFIERS = {
    ["%%c"] = "char",
    ["%%d"] = "int",
    ["%%e"] = "float",
    ["%%E"] = "float",
    ["%%f"] = "float",
    ["%%g"] = "float",
    ["%%G"] = "float",
    ["%%i"] = "int",
    ["%%ld"] = "long",
    ["%%li"] = "long",
    ["%%lf"] = "double",
    ["%%Lf"] = "long double",
    ["%%lu"] = "unsigned int",
    ["%%lld"] = "long long",
    ["%%lli"] = "long long",
    ["%%llu"] = "unsigned long long",
    ["%%o"] = "octal",
    ["%%p"] = "pointer",
    ["%%s"] = "char *",
    ["%%u"] = "unsigned int",
    ["%%x"] = "hex",
    ["%%X"] = "hex",
}

local function printf_args(index, deps)
    return d(index, function(args)
        local fmt_str = args[1][1] -- Format string
        local nodes = {} -- Argument placeholder nodes

        -- Get all of the format string options in order
        local fmt_args = {}
        for pattern, name in pairs(PRINTF_FORMAT_SPECIFIERS) do
            for _ in string.gmatch(fmt_str, pattern) do
                table.insert(fmt_args, name)
            end
        end

        -- Loop over all format options and create an argument placeholder for them
        for n, argument in ipairs(fmt_args) do
            table.insert(nodes, t(", "))
            table.insert(nodes, i(n, argument))
        end

        -- Return the full list of arguments
        return sn(nil, nodes)
    end, deps)
end

local printf = s({ trig = "printf", dscr = "printf argument expansion" }, {
    unpack(fmt('printf("{}"{})', {
        i(1, "const char *fmt"),
        printf_args(2, 1),
    })),
})

local fprintf = s({ trig = "fprintf", dscr = "fprintf argument expansion" }, {
    unpack(fmt('fprintf({}, "{}"{})', {
        i(1, "FILE *stream"),
        i(2, "const char *fmt"),
        printf_args(3, 2),
    })),
})

local dprintf = s({ trig = "dprintf", dscr = "dprintf argument expansion" }, {
    unpack(fmt('dprintf({}, "{}"{})', {
        i(1, "int fd"),
        i(2, "const char *fmt"),
        printf_args(3, 2),
    })),
})

local sprintf = s({ trig = "sprintf", dscr = "sprintf argument expansion" }, {
    unpack(fmt('sprintf({}, "{}"{})', {
        i(1, "char *str"),
        i(2, "const char *fmt"),
        printf_args(3, 2),
    })),
})

local snprintf = s({ trig = "snprintf", dscr = "snprintf argument expansion" }, {
    unpack(fmt('snprintf({}, {}, "{}"{})', {
        i(1, "char *str"),
        i(2, "unsigned long long"),
        i(3, "const char *fmt"),
        printf_args(4, 3),
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
    printf,
    fprintf,
    dprintf,
    sprintf,
    snprintf,
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
