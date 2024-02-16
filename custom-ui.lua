local ui = {}

ui = {
  theme = "nightfox",

  statusline = {
    theme = "default",
    separator_style = "arrow"
  },

  -- You can see the hightlight groups available in: https://github.com/NvChad/base46/tree/v2.0/lua/base46/integrations
  -- You can see the colors your theme uses in: https://github.com/NvChad/base46/tree/v2.0/lua/base46/themes
  hl_override = {
    -- enable cursorline highlight
    CursorLine = {
      bg = "black2"
    },
    -- Make the line numbers where there's no cursor a little more visible.
    LineNr = { fg = "#959696" },

    -- Make git signs more visible.
    DiffAdded = {
      fg = "#42bd7f",
    },
    DiffChange = {
      fg = "#2885f7",
    },
  }
}

return ui
