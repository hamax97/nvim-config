local opts = {
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
}

return opts
