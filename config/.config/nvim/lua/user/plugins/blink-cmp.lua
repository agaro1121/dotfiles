return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  config = function()
    require('blink-cmp').setup({
      keymap = {
        preset = 'default',
        -- ['<C-n>'] = { 'select_next', 'fallback' }, -- Tab
        -- ['<C-p>'] = { 'select_prev', 'fallback' }, --S-Tab
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
      sources = {
        default = { 'lsp', 'buffer', 'snippets', 'path' },
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
        documentation = {
          auto_show = true,
        }
      },
      signature = {
        enabled = true,
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    })
  end
}
