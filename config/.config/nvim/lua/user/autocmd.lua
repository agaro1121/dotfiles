local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- breadcrumb auto attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client.server_capabilities.documentSymbolProvider then
      vim.notify(
        'breadcrumb: Server "' .. client.name .. '" does not support documentSymbols.',
        vim.log.levels.ERROR
      )
      return
    end
    local breadcrumb = require("breadcrumb")
    breadcrumb.attach(client, bufnr)
  end,
})

