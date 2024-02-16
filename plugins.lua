local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "ruby",
        "html",
        "javascript",
        "typescript",
        "css",
        "scss",
        "json",
        "bash",
        "c",
        "cpp",
        "markdown",
        "sql",
        "yaml",
      },
      -- available after installing: RRethy/nvim-treesitter-endwise
      endwise = {
        enable = true
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        -- Install solargraph through your Gemfile better.
        -- Also install solargprah-rails gem and reference it in .solargraph.yml,
        -- plus generate the yard docs for it work. See the instructions: https://github.com/iftheshoefritz/solargraph-rails
        -- "solargraph",
      }
    }
  },
  {
    "tpope/vim-rails",
    ft = "ruby"
  },
  {
    -- Reference: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- Everything in opts will be passed to setup()
    opts = require "custom.configs.conform"
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter"
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true
        }
      }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        autocomplete = false,
      },
      mapping = require "custom.configs.cmp-mappings"
    }
  },
  {
    -- TODO: make the commands for this mappings; can this be used to run in a terminal?
    "klen/nvim-test",
    ft = { "ruby" },
    opts = {}
  },
  -- TODO: install akinsho/toggleterm.nvim and try to use it. Do the terms keep the sizing when toggled?
  -- TODO: disable nvterm? can I use the same keymaps?
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = "*",
  --   opts = {}
  -- }
}

return plugins
