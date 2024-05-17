return {
  {
    -- To check it's working: :checkhealth telescope
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-treesitter/nvim-treesitter" },
      -- other deps (non-nvim):
      -- finder: shardpd/fd
      -- BurntSushi/ripgrep
    },
    conf = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf") -- more performant algorithm for searching.
    end,
   opts = {
      defaults = { -- see helptag telescope.layout
	-- TODO: configure keymaps to scroll results left/right for long filenames.
        layout_strategy = "horizontal",
        layout_config = {
                height = 0.7,
          prompt_position = "top",
          preview_width = 0.55,
          scroll_speed = 3
        },
        sorting_strategy = "ascending",
        path_display = { "shorten" }, -- this can be configured further, or set to a function.
        -- file_ignore_patterns = {} -- files here will not appear even in the lsp_ pickers.
      }
    },
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "RRethy/nvim-treesitter-endwise" }
    },
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "ruby" },
        sync_install = false,
        highlight = { enable = true },
        -- indent = { enable = true }, -- this dedents when using dot (.) in Ruby.
        endwise = { enable = true },
      })
    end
  },
  { "neovim/nvim-lspconfig", lazy = false },
  -- start of themes.
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- end of themes.
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
      },
      sections = {
        lualine_x = { "filetype" }
      },
    }
  }
}
