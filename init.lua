---@diagnostic disable: undefined-global

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

-- Options.
require("my.options")

-- Plugins.
local plugins = require("my.plugins")
local lazy_opts = {}

-- TODO: learn how to split plugins in multiple modules easily: https://lazy.folke.io/usage/structuring
require("lazy").setup(plugins, lazy_opts)

-- LSP.
require("my.lsp")

-- Keymaps.
require("my.keymaps")

-- Themes.
require("my.colors")

-- Autocommands.
require("my.autocommands")
