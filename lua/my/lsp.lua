local lspconfig = require("lspconfig")

lspconfig.solargraph.setup {}
lspconfig.lua_ls.setup {} -- https://github.com/LuaLS/lua-language-server

-- TODO: read this on diagnostics: https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/

-- For more information see: :help lsp-config
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- TODO: why are some of these not working for solargraph? do they work for ruby-lsp?
    local telescope = require("telescope.builtin")
    vim.keymap.set('n', '<leader>lr', telescope.lsp_references, { desc = "LSP references" })
    vim.keymap.set('n', '<leader>li', telescope.lsp_implementations, { desc = "LSP implementations" })
    vim.keymap.set('n', '<leader>ld', telescope.lsp_definitions, { desc = "LSP definitions" })
    vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, { desc = "LSP document symbols" })
    vim.keymap.set('n', '<leader>ws', telescope.lsp_workspace_symbols, { desc = "LSP workspace symbols" })

    vim.keymap.set("n", "K", vim.lsp.buf.hover,
                   { buffer = args.buf, desc = "Docs of the object under cursor" })
  end
})
