-- return {
--   {
--     "saghen/blink.cmp",
--     dependencies = { 'rafamadriz/friendly-snippets' },

--     -- use a release tag to download pre-built binaries
--     version = '1.*',
--     config = function()
--       require('blink-cmp').setup({
--         keymap = {
--           preset = 'default',
--           ['<CR>'] = { 'select_and_accept', 'fallback' },
--         },
--         sources = {
--           default = {'lsp', 'buffer', 'snippets', 'path' },
--         },
--         completion = {
--           ghost_text = {
--             enabled = true,
--           },
--           documentation = {
--             auto_show = true,
--           }
--         },
--         signature = {
--           enabled = true,
--         },
--         fuzzy = {
--           implementation = "prefer_rust_with_warning",
--         },
--       })
--     end
--   }
-- }

return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = {
        auto_show = true
      },
    },
    signature = {
      enabled = true
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
