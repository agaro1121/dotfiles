local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug('kyazdani42/nvim-tree.lua')
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x'})
  Plug('Fannheyward/telescope-coc.nvim')
  Plug 'sudormrfbin/cheatsheet.nvim'
  Plug('thefux/lazygit.nvim', { branch = 'bug/60-fix-lazygit-telescope-extension' })
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})      -- Needed for telescope
  Plug('vim-airline/vim-airline')
  Plug('vim-airline/vim-airline-themes')
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug('scalameta/nvim-metals')
  Plug('hrsh7th/nvim-cmp')
  Plug('hrsh7th/cmp-nvim-lsp')
  Plug('hrsh7th/cmp-vsnip')
  Plug('hrsh7th/vim-vsnip')
  Plug('mfussenegger/nvim-dap')
  Plug('neoclide/coc.nvim', { branch = 'release' })
  Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'lukas-reineke/cmp-rg'
  Plug 'simrat39/symbols-outline.nvim'
	Plug 'neoclide/jsonc.vim'
	Plug('tpope/vim-abolish')
	Plug 'tpope/vim-commentary'
  -- Plug 'tpope/vim-surround'
  Plug 'kylechui/nvim-surround'
  -- Plug 'tpope/vim-capslock'
  Plug 'mrjones2014/smart-splits.nvim'
  Plug('toppair/peek.nvim', {['do'] = 'deno task --quiet build:fast' })
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  -- themes
  Plug('dracula/vim', { as = 'dracula' })
  Plug('rakr/vim-one')
  Plug('sonph/onehalf', { rtp = 'vim' })
  Plug('doums/darcula')
  Plug('sickill/vim-monokai')
	Plug 'marko-cerovac/material.nvim'
	Plug 'Mofiqul/vscode.nvim'
	Plug 'Th3Whit3Wolf/one-nvim'
  Plug 'drewtempelmeyer/palenight.vim'
vim.call('plug#end')
