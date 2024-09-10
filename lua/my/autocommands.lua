-- Automatically toggle between relative and absolute line numbers
vim.api.nvim_exec([[
  augroup ToggleRelativeNumbers
    autocmd!
    " Turn on relative line numbers when entering a window
    autocmd WinEnter * set relativenumber
    " Turn off relative line numbers (use absolute) when leaving a window
    autocmd WinLeave * set norelativenumber
  augroup END
]], false)
