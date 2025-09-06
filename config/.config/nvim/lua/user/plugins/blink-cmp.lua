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
    dependencies = { 'rafamadriz/friendly-snippets', "nvim-tree/nvim-web-devicons" },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
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
              blocked_filetypes = { "scala", "sbt" },
            },
            kind_resolution = {
              enabled = true,
              blocked_filetypes = { "scala", "sbt" },
            }
          }
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1, "kind", "source_name" } },
            components = {}
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
