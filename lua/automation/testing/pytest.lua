local test_name_pattern = "[a-zA-Z|\\d|_]* "
local passing_virt_text = { "", "DiagnosticOk" }
local failing_virt_text = "󱈸"

--- @class PytestTest
--- @field passed boolean True if the test passed, false otherwise
--- @field test_name string The name of the test

--- Populates the tests table with the pass/fail data gained from Pytest
--- @param data string[] Table containing the lines parsed from Pytest output
--- @param tests PytestTest[] Table to be populated with test objects
--- @return nil
local function parse_data(data, tests)
    for _, value in ipairs(data) do
        local test_name = string.match(value, test_name_pattern)

        if test_name then
            test_name = string.sub(test_name, 1, -2) -- Remove lingering space
        end

        local test = { test_name = test_name }

        if string.match(value, "PASSED") then
            test.passed = true
            table.insert(tests, test)
        elseif string.match(value, "FAILED") then
            test.passed = false
            table.insert(tests, test)
        end
    end
end

--- Adds diagnostics to the buffer virtual text
--- @param test PytestTest The test to add diagnostics for
--- @param lnr number The line number to add the diagnostics to
--- @param bufnr number The buffer to add diagnostics to
--- @param failed_list table The table which will be populated with the failing test case data required for diagnostics
--- @return nil
local function add_diagnostic(test, lnr, bufnr, ns, failed_list)
    -- Test passed
    if test.passed then
        vim.api.nvim_buf_set_extmark(bufnr, ns, lnr, 0, { virt_text = { passing_virt_text } })
        return
    end

    -- Test failed
    table.insert(failed_list, {
        bufnr = bufnr,
        lnum = lnr,
        col = 0,
        severity = vim.diagnostic.severity.ERROR,
        source = "pytest",
        message = "Test failed.",
        user_data = {},
    })
end

--- @param opts UserCmdCallbackOpts
--- @return nil
vim.api.nvim_create_user_command("RunPytest", function(opts)
    local test_file = vim.api.nvim_buf_get_name(0) -- Get filename of current buffer
    local bufnr = vim.api.nvim_get_current_buf() -- Get current buffer

    -- Clear name space in case tests were run previously
    local ns = vim.api.nvim_create_namespace("test-run")
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    --- @type PytestTest[]
    local tests = {}
    vim.fn.jobstart({ "pytest", test_file, "--verbose", "--no-header", "--no-summary" }, {
        stdout_buffered = true,
        --- @param data table
        on_stdout = function(_, data)
            if not data then return end
            parse_data(data, tests)
        end,
        on_exit = function(_, _, _)
            local failed = {}
            for _, test in ipairs(tests) do
                -- Find line number where test is written
                local line_number = -1
                vim.api.nvim_buf_call(bufnr, function() line_number = vim.fn.search(test.test_name) - 1 end)
                add_diagnostic(test, line_number, bufnr, ns, failed) -- Record failed tests for diagnostic
            end
            vim.diagnostic.set(ns, bufnr, failed, { virtual_text = { prefix = failing_virt_text } }) -- Display diagnostic
        end,
    })
end, {
    desc = "Runs the current file's Pytest tests and updates the diagnostics with the results.",
    nargs = 0,
})
