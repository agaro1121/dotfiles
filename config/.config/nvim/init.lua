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

--require "user.plugins"
--require "user.theme"
--require "user.nvimtree"
--require "user.airline"
--require "user.cmp"
-- require "user.coc"
--require "user.metals"
--require "user.indent-blankline"
--require "user.lsp-config"
--require "user.treesitter"
--require "user.autocmd"
--require "user.symbols-outline"
--require "user.smart-splits"
--require "user.peek"
--require "user.nvim-surround"
--require "user.nvim-treesitter-textobjects"
--require "user.autoclose"

vim.cmd('source ~/.config/nvim/vimrc.vim')
