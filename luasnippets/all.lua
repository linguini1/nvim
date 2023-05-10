local function date() return { os.date("%Y-%m-%d") } end

-- Regular snippets
return {},

    -- Auto snippets
    {
        s({ trig = "!date", dscr = "Date in format yyyy-mm-dd." }, { f(date) }),
        s({ trig = "!author", dscr = "My name." }, { t("Matteo Golin") }),
    }
