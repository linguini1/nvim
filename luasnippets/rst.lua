local directive_node = s({
    trig = ".. ",
    name = "RST directive",
    dscr = "Adaptive RST directive",
}, {
    t(".. "),
    i(1, "dir"),
    d(2, function(args)
        -- Based on the name of the directive, choose the content

        local dir = args[1][1]

        -- `code` block
        if dir == "code" then
            return sn(nil, {
                t(":: "),
                i(1, "lang"),
                t({ "", "", "   " }),
                i(0),
            })
            -- Tags directive
        elseif dir == "tags" then
            return sn(nil, {
                t(":: "),
                i(1, "tag:name"),
            })
            -- Figure directive
        elseif dir == "figure" then
            return sn(nil, {
                t(":: "),
                i(1, "image.png"),
                t({ "", "   :figwidth: " }),
                i(2, "30%"),
                t({ "", "   :align: " }),
                i(3, "center"),
                t({ "", "   :alt: " }),
                i(4, "alt-text"),
            })
        -- Regular directive block (i.e. `note`)
        else
            return sn(nil, {
                t({ "::", "", "   " }),
            })
        end
    end, { 1 }),
})

local link = s({ trig = "link", name = "RST hyperlink", dscr = "RST hyperlink" }, {
    unpack(fmt("`{} <{}>`_", {
        i(1, "text"),
        i(2, "link"),
    })),
})

local doc_link = s({ trig = ":doc", name = ":doc:", dscr = "Documentation link" }, {
    t(":doc:`"),
    i(1),
    d(2, function(args)
        if string.find(args[1][1], " ") == nil and string.find(args[1][1], "/") ~= nil then
            -- The text is a link already
            return sn(nil, { t() })
        else
            -- The text is text and we need link braces
            return sn(nil, { t(" <"), i(1, "link"), t(">") })
        end
    end, { 1 }),
    t("`"),
})

return
-- Regular snippets
{
    link,
},
-- Auto-snippets
{
    doc_link,
    directive_node,
}
