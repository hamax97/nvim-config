local M = {}

vim.wo.relativenumber = true

-- Fix dedent issue when typing . (dot) to call a method in Ruby (obj.method)
vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]

return M
