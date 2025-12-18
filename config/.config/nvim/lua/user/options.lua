---------------- vim options  ----------------
vim.opt.relativenumber = true         -- shows relative line numbers
vim.opt.number = true                 -- shows line numbers. Shows actual line number instead of '0' when combined with relativenumber.
vim.opt.numberwidth = 2               -- number width in sign column
vim.opt.showmatch=true                -- show matching
---- ONLY spaces
vim.opt.expandtab = true              -- automatically create tabs from spaces
vim.opt.tabstop=2                     -- number of columns occupied by a tab
vim.opt.shiftwidth=2                  -- indentation used by autoindent
vim.opt.softtabstop=-1                -- Use value of shiftwidth
vim.opt.smarttab = true
vim.opt.autoindent = false
--// ONLY spaces
vim.opt.cursorline=true               -- highlight current cursorline
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true          -- enables terminal colors
vim.opt.splitright = true             -- splits automatically go to the right
vim.opt.splitbelow = true             -- splits automatically go to the bottom
vim.opt.listchars:append 'tab:» '
vim.opt.listchars:append 'trail: '
vim.opt.clipboard='unnamedplus'
vim.opt.autowriteall=true
vim.opt.laststatus=0
vim.opt.showmode=false                -- disables the '-- INSERT --' text under the status line
vim.opt.mouse = ''                    -- disables mouse in neovim
vim.opt.breakindent = true            -- Every wrapped line will continue visually indented. Makes for horizontal blocks.
---- case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
--// case-insensitive search
vim.opt.signcolumn='auto'
vim.opt.timeoutlen = 400              -- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.ruler=false                   -- Disable default ruler
vim.opt.scrolloff=4                   -- How many lines before/after cursor when scrolling off the page

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

-- folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.opt.foldcolumn = '0' -- '0' is not bad
vim.o.foldmethod = 'expr'
vim.o.fillchars = [[eob: ,fold: ,foldsep: ,foldopen:,foldclose:]]

-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
         local client = vim.lsp.get_client_by_id(args.data.client_id)
         if client and client:supports_method('textDocument/foldingRange') then
             local win = vim.api.nvim_get_current_win()
             vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
 })
