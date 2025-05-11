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
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500
        },
        accept = {
          auto_brackets = { -- automatically insert brackets when accepting functions/methods
            enabled = true,
            semantic_token_resolution = {
              blocked_filetypes = { "scala" },
            }
          }
        },
        menu = {
          draw = {
            columns = { {"kind_icon"}, { "label", "label_description", gap = 1, "kind", "source_name" } },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  -- if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  --   local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  --   if dev_icon then
                  --     icon = dev_icon
                  --   end
                  -- else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                  -- end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                -- highlight = function(ctx)
                --   local hl = ctx.kind_hl
                --   if vim.tbl_contains({ "Path" }, ctx.source_name) then
                --     local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                --     if dev_icon then
                --       hl = dev_hl
                --     end
                --   end
                --   return hl
                -- end,
              }
            }
          }
        },
      },
      signature = {
        enabled = true
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
