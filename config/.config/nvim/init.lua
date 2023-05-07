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

require("user.options")
require("user.keybinds")
require("user.keybinds_lsp")
require("lazy").setup("user.plugins")
require("user.colorscheme")
require("user.autocmd")

vim.cmd('source ~/.config/nvim/vimrc.vim')
