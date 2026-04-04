-- Set leader key before lazy loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Path for lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Load options first
require("vim-options")

-- Load keymaps
require("keymaps")

-- Setup lazy.nvim and load all plugins from lua/plugins/
require("lazy").setup("plugins")

-- Load custom color overrides
require("custom-colors")
