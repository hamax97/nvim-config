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
  -- start of completion.
  {
    "L3MON4D3/LuaSnip",
    -- TODO: configure it?
  },
  {
    -- TODO: make this work, why there's no completion?
    -- continue here https://www.youtube.com/watch?v=_DnmphIwnjo on 13:30
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" }, -- autocompletion source for lua in the context of nvim.
      { "hrsh7th/cmp-nvim-lsp" },
    },
    event = "BufEnter",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<leader>c"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        },
        sources = {
          -- Notes:
          -- the order of the sources gives priority (by default), you can also specify 'priority = #'
          -- you can configure also:
          --   keyword_length
          --   priority
          --   max_item_count
          --   more?
          --
          -- To add aditional sources for specific filetypes:
          --   autocmd FileType ruby lua require("cmp").setup.buffer {
          --     sources = {
          --       { name = "some_ruby_source" },
          --     }
          --   }
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "nvim_path" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 5 },
        },
        -- TODO: Customize the menu: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        -- formatting = {
        --   with_text = true,
        --   menu = {
        --     buffer = "[buf]",
        --     nvim_lsp = "[LSP]",
        --     nvim_lua = "[nvim]",
        --     path = "[path]",
        --     luasnip = "[snip]",
        --   }
        -- }
      })
    end
  },
  -- end of completion.
  -- TODO: try stevearc/oil.nvim as a File explorer.
}
