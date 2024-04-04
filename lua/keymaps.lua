-- Telescope.
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>fs', telescope.treesitter, {}) -- show function names and variables in file.
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>sg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>sw', telescope.grep_string, {}) -- search word under the cursor.
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>sb', telescope.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>th', telescope.colorscheme, {})
vim.keymap.set('n', '<leader>vo', telescope.vim_options, {})

-- TODO: configure LSP for the following keymaps.
vim.keymap.set('n', '<leader>lr', telescope.lsp_references, {})
vim.keymap.set('n', '<leader>li', telescope.lsp_implementations, {})
vim.keymap.set('n', '<leader>ld', telescope.lsp_definitions, {})
vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ws', telescope.lsp_workspace_symbols, {})

vim.keymap.set('n', '<leader>gs', telescope.git_status, {})
vim.keymap.set('n', '<leader>gj', telescope.git_stash, {})
