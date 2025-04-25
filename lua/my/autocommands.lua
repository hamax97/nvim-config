-- Automatically toggle between relative and absolute line numbers
vim.api.nvim_exec([[
  augroup ToggleRelativeNumbers
    autocmd!
    " Turn on relative line numbers when entering a window, except for certain filetypes
    autocmd WinEnter * if &filetype !~# 'Avante\|AvanteInput\|TelescopePrompt\|lazy\|netrw' | set relativenumber | endif
    " Turn off relative line numbers when leaving a window, except for certain filetypes
    autocmd WinLeave * if &filetype !~# 'Avante\|AvanteInput\|TelescopePrompt\|lazy\|netrw' | set norelativenumber | endif
    " Turn on relative line numbers when Neovim gains focus, except for certain filetypes
    autocmd FocusGained * if &filetype !~# 'Avante\|AvanteInput\|TelescopePrompt\|lazy\|netrw' | set relativenumber | endif
    " Turn off relative line numbers when Neovim loses focus, except for certain filetypes
    autocmd FocusLost * if &filetype !~# 'Avante\|AvanteInput\|TelescopePrompt\|lazy\|netrw' | set norelativenumber | endif
  augroup END
]], false)

-- Disable linenumbers in Telescope.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
