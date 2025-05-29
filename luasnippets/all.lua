local today = s(
    { trig = "!today", name = "today", dscr = "Today's in ISO format." },
    { f(function() return { os.date("%Y-%m-%d") } end) }
)
local date = s({ trig = "!date", name = "date", dscr = "Date in ISO format" }, {
    unpack(fmt("{}-{}-{}", {
        i(1, "YYYY"),
        i(2, "mm"),
        i(3, "dd"),
    })),
})
local name = s({ trig = "!name", name = "name", dscr = "My name." }, { t("Matteo Golin") })
local email = s({ trig = "!email", name = "email", dscr = "My email." }, { t("matteo.golin@gmail.com") })

-- Regular snippets
return {},
-- Auto snippets
{
    today,
    name,
    email,
    date,
}
