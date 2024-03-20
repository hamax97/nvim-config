return {
  {
    -- To check it's working: :checkhealth telescope
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
      -- other deps (non-nvim):
      -- finder: shardpd/fd
    },
    conf = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end
  }
}
