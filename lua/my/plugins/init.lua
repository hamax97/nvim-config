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
        -- layout_strategy = "horizontal",
        -- layout_config = {
        --   height = 0.7,
        --   prompt_position = "top",
        --   preview_width = 0.55,
        --   scroll_speed = 3
        -- },
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          scroll_speed = 3
        },
        sorting_strategy = "ascending",
        path_display = { "shorten" }, -- this can be configured further, or set to a function.
        file_ignore_patterns = { "tmp" }, -- files here will not appear even in the lsp_ pickers.
      },
      -- pickers = {
      --   lsp_definitions = {
      --     layout_strategy = "vertical",
      --     layout_config = {}
      --   }
      -- }
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
  {
    "zaldih/themery.nvim",
    lazy = false,
    opts = {
      themes = { -- my list of installed themes.
        {
          name = "gruvbox dark",
          colorscheme = "gruvbox",
          before = [[
            vim.opt.background = "dark"
            require("lualine").setup({ options = { theme = "gruvbox" }})
          ]]
        },
        {
          name = "catppuccin latte",
          colorscheme = "catppuccin-latte",
          before = [[
            require("lualine").setup({ options = { theme = "catppuccin" }})
          ]]
        }
      },
      themeConfigFile = "~/.config/mynvim/lua/my/colors/theme.lua",
      livePreview = true
    }
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- end of themes.
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin", -- modified by Themery.
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' }
      },
      sections = {
        lualine_x = { "filetype" }
      },
      -- custom_highlights = function(colors)
      --   return {
      --     CursorLine = {
      --       bg = "#e5e5e5"
      --     }
      --   }
      -- end
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = require("my.plugins.gitsigns")
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {}
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- TODO: configure this plugin:
    --   show the whitespaces, tabs, eols (maybe)
    --   In Ruby it doesn't detect properly the levels of indentation.
    --   Any other plugin?
    opts = {}
  },
  -- TODO: try stevearc/oil.nvim as a File explorer.
}
