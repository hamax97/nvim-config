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
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        ruby = { "rubocop" },
        lua = { "stylua" },

        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },

        sh = { "shfmt" },
      },
      -- Customize formatters
      formatters = {
        rubocop = {
          prepend_args = { "-a" }
        }
      },
    },
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
  }
}

return plugins
