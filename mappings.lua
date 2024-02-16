local M = {}

-- M.vim_rspec = {
--   plugin = true,
--   n = {
--     ["<leader>tf"] = {":lua vim.fn.RunCurrentSpecFile()<CR>", "Run current spec file"}
--   }
-- }

vim.wo.relativenumber = true

-- Fix dedent issue when typing . (dot) to call a method in Ruby (obj.method)
vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]

-- For folding (default ones)
-- zc - Close (fold) the current fold under the cursor.
-- zo - Open (unfold) the current fold under the cursor.
-- za - Toggle between closing and opening the fold under the cursor.
-- zR - Open all folds in the current buffer.
-- zM - Close all folds in the current buffer.

return M
