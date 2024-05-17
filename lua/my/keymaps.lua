-- Telescope.
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>fs', telescope.treesitter, { desc = "Find symbols (function names and variables) in file" })
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = "Search with grep" })
vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = "Search for word/selection under cursor with grep" })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>sb', telescope.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
vim.keymap.set('n', '<leader>th', telescope.colorscheme, { desc = "Change colorschemes" })
vim.keymap.set('n', '<leader>vo', telescope.vim_options, { desc = "Find vim options" })
vim.keymap.set('n', '<leader>ht', telescope.help_tags, { desc = "Find help tags" })

vim.keymap.set('n', '<leader>gs', telescope.git_status, { desc = "Git status" })
vim.keymap.set('n', '<leader>gj', telescope.git_stash, { desc = "Git stash" })

-- Toggle line numbers.
vim.keymap.set('n', '<leader>rn', telescope.git_stash, { desc = "Git stash" })
