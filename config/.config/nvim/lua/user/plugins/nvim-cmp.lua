return {
 "hrsh7th/nvim-cmp",
 event = "InsertEnter",
 dependencies = {
   "neovim/nvim-lspconfig",
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   -- needed for metals?
   "hrsh7th/cmp-vsnip",
   "hrsh7th/vim-vsnip",
 },
 config = function()
  -- most of this is copied from nvim-metals
   local cmp = require("cmp")
   cmp.setup({
     completion = {
       completeopt = "menu,menuone,preview,noinsert,noselect",
     },
     sources = cmp.config.sources({
       { name = "nvim_lsp" },
       { name = "vsnip" },
       { name = "nvim_lsp_document_symbol" },
       { name = "nvim_lsp_signature_help" },
       { name = "rg" }, --ripgrep results
       { name = "buffer" },
       { name = "path" },
       { name = "nvim_lua" }, -- neovim lua api
     }),
     snippet = {
       expand = function(args)
         -- Comes from vsnip
         vim.fn["vsnip#anonymous"](args.body)
       end,
     },
     mapping = cmp.mapping.preset.insert({
       -- None of this made sense to me when first looking into this since there
       -- is no vim docs, but you can't have select = true here _unless_ you are
       -- also using the snippet stuff. So keep in mind that if you remove
       -- snippets you need to remove this select
       ["<C-k"] = cmp.mapping.select_prev_item(),
       ["<C-j"] = cmp.mapping.select_next_item(),
       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
       ["<C-f>"] = cmp.mapping.scroll_docs(4),
       ["<C-Space>"] = cmp.mapping.complete(),
       ["<C-e>"] = cmp.mapping.abort(),
       ["<CR>"] = cmp.mapping.confirm({ select = true }),
       -- I use tabs... some say you should stick to ins-completion but this is just here as an example
       ["<Tab>"] = function(fallback)
         if cmp.visible() then
           cmp.select_next_item()
         else
           fallback()
         end
       end,
       ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
           cmp.select_prev_item()
         else
           fallback()
         end
       end,
     }),
   })
 end,
}
