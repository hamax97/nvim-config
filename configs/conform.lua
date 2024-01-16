local options = {
	lsp_fallback = true,

	formatters_by_ft = {
    ruby = { "rubocop" },
		lua = { "stylua" },

		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },

		sh = { "shfmt" },
	},
}

require("conform").setup(options)
