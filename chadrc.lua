---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.ui = require "custom.custom-ui"

-- Code folding.
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99 -- avoid default folding of a file when opened.
-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

return M
