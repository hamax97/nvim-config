local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
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
        -- "solargraph",
      }
    }
  },
  {
    "tpope/vim-rails",
    ft = "ruby"
  },
  {
    "stevearc/conform.nvim",
    -- TODO: use the suggested config in: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
    conf = function()
      require "custom.configs.conform"
    end,
  }
}

return plugins
