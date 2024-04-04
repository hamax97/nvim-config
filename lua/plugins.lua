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
    end
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
  }
}
