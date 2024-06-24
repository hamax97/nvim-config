return {
  require("my.plugins.telescope"),
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
          ["<C-x>"] = cmp.mapping.abort(),
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
