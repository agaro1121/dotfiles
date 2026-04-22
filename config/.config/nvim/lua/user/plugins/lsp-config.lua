vim.pack.add({
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup()
require("mason-lspconfig").setup {
    automatic_enable = {
        "lua_ls", "smithy_ls", "jsonls", "yamlls", "marksman"
    }
}

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
  desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function(_)
  local state_path = vim.fn.stdpath("state")
  local log_path = vim.fs.joinpath(state_path, "lsp.log")

  vim.cmd(string.format("edit %s", log_path))
end, {
  desc = "Show LSP log",
})

vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
  desc = "Restart LSP",
})

-- NOTE: Cannot use this since it is limited to 1 source and snippets cannot be added
--       Will use blink.cmp instead
-- vim.o.autocomplete = true
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--     end
--   end
-- })
-- vim.cmd('set completeopt+=noselect') -- do not automatically select the first entry
-- vim.cmd('set completeopt+=popup') -- shows extra info as a popup

vim.diagnostic.config({
  underline = false,
  virtual_lines = false,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR
  },
  signs = {
    severity = vim.diagnostic.severity.ERROR
  }
})
