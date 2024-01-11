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
        "solargraph",
        "tsserver",
      }
    }
  }
}

return plugins
