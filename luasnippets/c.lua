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

local javadoc_comment = s(
    { trig = "/**", dscr = "Multi-line javadoc comment." },
    { t("/** "), i(1, "comment"), t(" */") }
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

table.insert(
    regular_snippets,
    s({
        trig = "nxheader",
        dscr = "NuttX top-file comment header with SPDX info",
    }, {
        t({
            "/****************************************************************************",
            "* ",
        }),
        -- Get the workdir-relative file name for the top
        f(function(_) return vim.fn.expand("%") end),
        t({
            "",
            "*",
            "* SPDX-License-Identifer: ",
        }),
        -- License choice
        c(1, {
            t("Apache-2.0"),
            i(0, "Other license"),
        }),
        t({ "", "*", "" }),
        -- Copyright text
        d(2, function(args)
            if args[1][1] == "Apache-2.0" then
                return sn(nil, {
                    t({
                        [[* Licensed to the Apache Software Foundation (ASF) under one or more]],
                        [[* contributor license agreements. See the NOTICE file distributed with]],
                        [[* this work for additional information regarding copyright ownership. The]],
                        [[* ASF licenses this file to you under the Apache License, Version 2.0 (the]],
                        [[* "License"); you may not use this file except in compliance with the]],
                        [[* License. You may obtain a copy of the License at]],
                        [[*]],
                        [[*   http://www.apache.org/licenses/LICENSE-2.0]],
                        [[*]],
                        [[* Unless required by applicable law or agreed to in writing, software]],
                        [[* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT]],
                        [[* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the]],
                        [[* License for the specific language governing permissions and limitations]],
                        [[* under the License.]],
                    }),
                })
            else
                return sn(nil, { t("* "), i(1, "Custom text") })
            end
        end, { 1 }),
        t({
            "",
            "*",
            "****************************************************************************/",
        }),
    })
)

return regular_snippets,
    -- Autosnippets
    {
        javadoc_comment,
        arr_size,
        deref,
    }
