-- Code folding.
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99

-- Line numbers.
vim.o.number = true
vim.o.numberwidth = 3
vim.o.relativenumber = true

-- Others.
vim.o.cursorline = true -- Highlight cursorline.
vim.o.expandtab = true -- Use spaces instead of tabs.
vim.o.tabstop = 2 -- Number of spaces per tab.
vim.o.autoindent = true -- Indent operators (<, >) use spaces if expandtab is set.
vim.o.shiftwidth = 2 -- Spaces to (auto)indent.
vim.o.smartindent = true -- Syntax aware indent on new lines. TODO: How to make this work for Ruby?
vim.o.clipboard = "unnamed" -- Yank to clipboard too.
