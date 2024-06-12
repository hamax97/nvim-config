local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.solargraph.setup {
  capabilities = capabilities
}
lspconfig.lua_ls.setup { -- https://github.com/LuaLS/lua-language-server
  capabilities = capabilities
}

-- TODO: read this on diagnostics: https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/

-- For more information see: :help lsp-config
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local telescope = require("telescope.builtin")
    vim.keymap.set('n', '<leader>lr', telescope.lsp_references, { desc = "[Telescope] Fuzzy find LSP references" })
    vim.keymap.set('n', '<leader>li', telescope.lsp_implementations, { desc = "[Telescope] LSP implementations" }) -- Not supported by solargraph.
    -- TODO: configure this to have a vertical layout.
    vim.keymap.set('n', '<leader>ld', telescope.lsp_definitions, { desc = "[Telescope] Go to (or fuzzy find) LSP definitions" })
    vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, { desc = "[Telescope] LSP document symbols" })
    vim.keymap.set('n', '<leader>ws', telescope.lsp_workspace_symbols, { desc = "[Telescope] LSP workspace symbols" })

    vim.keymap.set("n", "K", vim.lsp.buf.hover,
                   { buffer = args.buf, desc = "Docs of the object under cursor" })
  end
})
