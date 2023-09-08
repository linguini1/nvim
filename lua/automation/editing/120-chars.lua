-- Lua module to help me keep lines formatted to 120 characters.
local PUNCTUATION = { "!", ".", ",", "?" }

--- Detects if a character is equal to a space
--- @param char string A single character
--- @return boolean If the character is a space
local function is_space(char) return char == " " end

--- Detects if a character is a punctuation symbol
--- @param char string A single character
--- @return boolean If the character is punctuation
local function is_punctuation(char)
    for _, p in ipairs(PUNCTUATION) do
        if char == p then return true end
    end
    return false
end

--- Detects if a character is a space or punctuation
--- @param char string A single character
--- @return boolean If the character is a space or punctuation
local function is_punc_or_ws(char) return is_space(char) or is_punctuation(char) end

--- Formats text lines into lines of 'linelen' characters.
--- @param text string[] A table of text lines
--- @param linelen integer The maximum line length to adhere to when formatting text
--- @return string[] A table of formatted text lines
local function format_text(text, linelen)
    local super_str = table.concat(text, " ") -- Acts like <J>
    local substr_count = 0

    while substr_count * 120 < #super_str do
        -- Get substring and increment the substring count
        local start = substr_count * 120
        substr_count = substr_count + 1
        local end_pos = substr_count * 120

        local new_strings = {}

        -- Check if 120th character is punctuation/whitespace or is followed by whitespace
        if is_punc_or_ws(super_str:sub(end_pos, end_pos)) or is_space(super_str:sub(end_pos + 1, end_pos + 1)) then
            table.insert(new_strings, super_str:sub(start, end_pos))
        else
            -- Need to go back a word
        end
    end
end
