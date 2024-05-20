vim.g.mapleader = " "

-- Setup Lazy plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins.
local plugins = require("my.plugins")
local lazy_opts = {}

require("lazy").setup(plugins, lazy_opts)

-- LSP.
require("my.lsp")

-- Keymaps.
require("my.keymaps")

-- Options.
require("my.options")

-- Themes.
require("my.colors")

-- TODOs:
-- How to disable the lua-ls diagnostic for the vim global?
-- Use gitsigns.
--   How to undo a specific hunk?
-- Use spaces instead of tabs?
