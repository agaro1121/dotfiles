local set = vim.opt
---------------- vim options  ----------------
set.relativenumber = true         -- shows relative line numbers
set.number = true                 -- shows line numbers. Shows actual line number instead of '0' when combined with relativenumber.
set.showmatch=true                -- show matching
set.tabstop=2                     -- number of columns occupied by a tab
set.shiftwidth=2                  -- indentation used by autoindent
set.expandtab = true
set.cursorline=true               -- highlight current cursorline
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
set.termguicolors = true          -- enables terminal colors
set.splitright = true             -- splits automatically go to the right
set.splitbelow = true             -- splits automatically go to the bottom
set.listchars:append "tab:» "
set.listchars:append "trail: "
set.clipboard='unnamedplus'
set.autowriteall=true
set.laststatus=0
set.showmode=false                -- disables the '-- INSERT --' text under the status line
set.mouse = ""                    -- disables mouse in neovim
set.breakindent = true            -- Every wrapped line will continue visually indented. Makes for horizontal blocks.
-- case-insensitive search
set.ignorecase = true
set.smartcase = true
set.signcolumn='yes'
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
-- Taken from: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
