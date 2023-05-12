-- Adding
vim.keymap.set("n", "<leader>ga", ":Git add", {desc = "Set up git add."})
vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>", {desc = "Add all files to git."})

-- Restoring
vim.keymap.set("n", "<leader>gr", ":Git restore --staged", {desc = "Set up git restore staged files."})
vim.keymap.set("n", "<leader>gra", ":Git restore --staged .<CR>", {desc = "Restore all staged files."})

-- Committing
vim.keymap.set("n", "<leader>gc", ":Git commit -m \"\"<left>", {desc = "Set up git commit."})
vim.keymap.set("n", "<leader>gca", ":Git commit -a -m \"\"<left>", {desc = "Sets up a git commit which automatically adds modified files."})
vim.keymap.set("n", "<leader>gs", ":Git status<CR>", {desc = "Check git status."})

-- Pushing/pulling
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {desc = "Push changes to the git repo."})
vim.keymap.set("n", "<leader>gf", ":Git fetch<CR>", {desc = "Fetch changes from the git repo."})
vim.keymap.set("n", "<leader>gpu", ":Git pull<CR>", {desc = "Pull changes from the git repo."})
