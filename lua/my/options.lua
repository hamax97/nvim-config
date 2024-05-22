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
-- TODO: make this only indent by two spaces.
vim.o.autoindent = true -- Indent operators (<, >) use spaces if expandtab is set.
