---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  hl_override = {
    -- enable cursorline highlight
    CursorLine = {
      bg = "black2"
    }
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
