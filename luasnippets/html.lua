local function tag(tag_type)
    return sn(nil, {
        unpack(fmt("<{}>\n\t{}\n<{}>", {
            t(tag_type),
            i(0),
            t(tag_type),
        })),
    })
end

local class = sn({ trig = [[([a-zA-Z]+)\.([a-zA-Z]+)]], regTrig = true, trigEngine = "pattern" }, {
    d(1, function(args, parent)
        return
            -- Create a tag snippet with the tag name and class
            tag(parent.snippet.captures[1])
    end),
})

-- Regular snippets
return {},
-- Auto snippets
{}
