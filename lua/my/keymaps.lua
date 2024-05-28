-- Examples:
-- https://neovim.io/doc/user/lua.html#vim.keymap.set()

-- Telescope.
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>fs', telescope.treesitter, { desc = "Find symbols (function names and variables) in file" })
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = "Search with grep" })
vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = "Search for word/selection under cursor with grep" })
vim.keymap.set('n', '<leader>sb', telescope.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
vim.keymap.set('n', '<leader>th', telescope.colorscheme, { desc = "Change colorschemes" })
vim.keymap.set('n', '<leader>vo', telescope.vim_options, { desc = "Find vim options" })
vim.keymap.set('n', '<leader>ht', telescope.help_tags, { desc = "Find help tags" })

-- TODO: make this keymap work
-- vim.keymap.set('n', '<C-k>', require("telescope.actions").preview_scrolling_right, { desc = "[Telescope] Scroll right preview" })

-- TODO: configure keymaps to scroll results left/right for long filenames.

vim.keymap.set('n', '<leader>gs', telescope.git_status, { desc = "Git status" })
vim.keymap.set('n', '<leader>gj', telescope.git_stash, { desc = "Git stash" })

-- Toggle line numbers.
vim.keymap.set('n', '<leader>rn', telescope.git_stash, { desc = "Git stash" })

-- Buffers.
vim.keymap.set("n", "<C-P>", "<cmd>bp<cr>", { desc = "[cmd] Previous buffer" })
vim.keymap.set("n", "<C-N>", "<cmd>bn<cr>", { desc = "[cmd] Next buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "[cmd] Delete buffer" })
vim.keymap.set("n", "<leader>cf", telescope.buffers, { desc = "[Telescope] Find buffers (change files)" })

-- Utils.
vim.keymap.set("n", "<leader>nk", "<cmd>lua require('plenary.reload').reload_module('my.keymaps')<cr>", { desc = "[Plenary] Reload keymaps" })
