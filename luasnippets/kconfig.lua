local choice_block = s({ trig = "choice", dscr = "Kconfig choice of options definition" }, {
    t({ "choice", '\tprompt "' }),
    i(1, "prompstr"),
    t({ '"', "\tdefault " }),
    i(2, "DEFAULT_VAL"),
    t({ "", "\t" }),
    i(0),
    t({ "", "endchoice" }),
})

local if_block = s({ trig = "if", dscr = "Kconfig if/endif block" }, {
    t("if "),
    i(1),
    t({ "", "" }),
    i(0),
    f(function(args) return { "", "endif # " .. args[1][1] } end, { 1 }),
})

local menu_block = s({ trig = "menu", dscr = "Kconfig menu block" }, {
    t('menu "'),
    i(1),
    t({ '"', "" }),
    i(0),
    f(function(args) return { "", "endmenu # " .. args[1][1] } end, { 1 }),
})

-- `default` values for config options
local bool_type = sn(nil, { c(1, { t("y"), t("n") }) })
local tristate_type = sn(nil, { c(1, { t("y"), t("n"), t("m") }) })
local string_type = sn(nil, { t('"'), i(1, "text"), t('"') })

-- TODO: would be really useful if I could choose to not have a `default`, but if I put d(4, ...) in a choice node I
-- can't make it dependent on i(2, ...). If I put the choice node inside a dynamic node that propagates the value of
-- `type`, then I have to put the 'no default' option first or I am unable to jump to the choice node to make a
-- selection (I would much prefer to have the `default` option first since that is more common)
local config_block = s({ trig = "config", dscr = "Kconfig configuration option definition" }, {
    t("config "),
    i(1),
    t({ "", "\t" }),
    i(2, "type"),
    t(' "'),
    i(3, "name"),
    t({ '"', "\tdefault " }),
    d(4, function(args)
        local s_type = args[1][1] -- Grab the value of `type`
        -- Choose the nodes in the 'default' snippet based on the `type`
        if s_type == "bool" then
            return bool_type
        elseif s_type == "string" then
            return string_type
        elseif s_type == "tristate" then
            return tristate_type
        else
            return sn(nil, { i(1, "custom") })
        end
    end, { 2 }),
    t({ "", "\t---help---", "\t\t" }),
    i(0),
})

-- Regular snippets
return {
    config_block,
    menu_block,
    if_block,
    choice_block,
},
-- Autosnippets
{}
