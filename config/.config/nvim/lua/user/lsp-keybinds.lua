vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local fzfLua = require('fzf-lua')
      vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "lsp: definitions" })

      vim.keymap.set("n", "gV",  ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "lsp: open defnition in vertical split" })
      vim.keymap.set("n", "gH",  ":split | lua vim.lsp.buf.definition()<CR>", { desc = "lsp: open definition in horizontal split" })
      vim.keymap.set("n", "gt",  fzfLua.lsp_typedefs, { desc = "lsp: tpye defintions" })
      vim.keymap.set("n", "gi",  fzfLua.lsp_implementations, { desc = "lsp: implementations" })
      vim.keymap.set("n", "gic", vim.lsp.buf.incoming_calls, { desc = "lsp: upstream calls. who calls this symbol?" })
      vim.keymap.set("n", "goc", vim.lsp.buf.outgoing_calls, { desc = "lsp: downstream calls. What does this symbol call?" })
      vim.keymap.set("n", "gr",  fzfLua.lsp_references, { desc = "lsp: references" })
      vim.keymap.set("n", "gds", fzfLua.lsp_document_symbols, { desc = "lsp: document symbls" })
      vim.keymap.set("n", "gws", fzfLua.lsp_live_workspace_symbols, { desc = "lsp: dynamic workspace symbols" })

      -- diagnostics
      vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, wrap = false }) end, { desc = "lsp: previous diagnostic" })
      vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, wrap = false }) end, { desc = "lsp: next diagnostic" })

      local winoptsConfig = { preview = { layout = "vertical" } }
      -- project diagnostics
      vim.keymap.set("n", "<leader>wa",function()  fzfLua.diagnostics_workspace({winopts = winoptsConfig}) end, { desc = "lsp: workspace diagnostics" })
      vim.keymap.set("n", "<leader>we", function() fzfLua.diagnostics_workspace({ severity_only = vim.diagnostic.severity.ERROR, winopts = winoptsConfig }) end, { desc = "lsp: workspace error diagnostics" })
      vim.keymap.set("n", "<leader>ww", function() fzfLua.diagnostics_workspace({ severity_only = vim.diagnostic.severity.WARN, winopts = winoptsConfig }) end, { desc = "lsp: workspace warning diagnostics" })
      -- buffer diagnostics
      vim.keymap.set("n", "<leader>ba", function() fzfLua.diagnostics_document({winopts = winoptsConfig}) end, { desc = "lsp: buffer diagnostics" })
      vim.keymap.set("n", "<leader>be", function() fzfLua.diagnostics_document({severity_only = vim.diagnostic.severity.ERROR, winopts = winoptsConfig }) end, { desc = "lsp: buffer error diagnostics" })
      vim.keymap.set("n", "<leader>bw", function() fzfLua.diagnostics_document({severity_only = vim.diagnostic.severity.WARN, winopts = winoptsConfig }) end, { desc = "lsp: buffer warning diagnostics" })

      vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { desc = "lsp: code lens" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "lsp: rename" })
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, { desc = "lsp: format" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", fzfLua.lsp_code_actions, { desc = "lsp: code action" })
      vim.keymap.set("n", "<leader>in", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "lsp: inlay hints toggle"})

      local diag_with_virtual_lines = {
        virtual_text = {
          severity = {
            max = vim.diagnostic.severity.WARN,
          },
        },
        virtual_lines = {
          severity = {
            min = vim.diagnostic.severity.ERROR,
          },
        },
      }
      local diag_without_virtual_lines = {
        virtual_text = true,
        virtual_lines = false,
      }
      vim.diagnostic.config(diag_with_virtual_lines)
      local diag_config_basic = false
      vim.keymap.set("n", "gK", function()
        diag_config_basic = not diag_config_basic
        if diag_config_basic then
          vim.diagnostic.config(diag_without_virtual_lines)
        else
          vim.diagnostic.config(diag_with_virtual_lines)
        end
      end, { desc = "lsp: Toggle diagnostic virtual_lines" })

    end
 })
