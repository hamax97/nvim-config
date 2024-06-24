return {
  -- To check it's working: :checkhealth telescope
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-treesitter/nvim-treesitter" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    -- other deps (non-nvim):
    -- finder: shardpd/fd
    -- BurntSushi/ripgrep
  },
  conf = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
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
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              -- TODO: make this mapping work, the C-k won't do anything on the prompt.
              -- ["<C-k>"] = lga_actions.quote_prompt({ postfix = " -t " }),
            },
          }
        },
      },
      -- pickers = {
      --   lsp_definitions = {
      --     layout_strategy = "vertical",
      --     layout_config = {}
      --   }
      -- }
      lazy = false
    })

    require("telescope").load_extension("fzf") -- more performant algorithm for searching.
    require("telescope").load_extension("live_grep_args")
  end,
}
