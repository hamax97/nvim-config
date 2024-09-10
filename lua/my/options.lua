-- Code folding.
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99

-- Line numbers.
vim.o.number = true
vim.o.numberwidth = 3
vim.o.relativenumber = true

-- For bufferline.nvim
vim.opt.termguicolors = true

-- For CopilotChat.
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- Others.
vim.o.cursorline = true -- Highlight cursorline.
vim.o.expandtab = true -- Use spaces instead of tabs.
vim.o.tabstop = 2 -- Number of spaces per tab.
vim.o.autoindent = true -- Indent operators (<, >) use spaces if expandtab is set.
vim.o.shiftwidth = 2 -- Spaces to (auto)indent.
vim.o.smartindent = true -- Syntax aware indent on new lines. TODO: How to make this work for Ruby?
vim.o.clipboard = "unnamed" -- Yank to clipboard too.
vim.o.splitright = true -- New vertical splits will go to the right.
vim.o.splitbelow = true -- New horizontal splits will go below.
vim.o.scrolloff = 5 -- Keep the cursor X lines below/above the first/last line of the screen.
