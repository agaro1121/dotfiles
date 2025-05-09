return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    config = function()
      require('blink-cmp').setup({
        keymap = {
          preset = 'default',
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
          default = { 'lazydev', 'lsp', 'buffer', 'snippets', 'path' },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              -- make lazydev completions top priority (see `:h blink.cmp`)
              score_offset = 100,
            },
          },
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
}
