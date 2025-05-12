return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("octo").setup({
      use_local_fs = true,
      default_to_projects_v2 = false
    })
    vim.cmd("hi link @text.diff.add DiffAdd") -- used for octo
    vim.cmd("hi link @text.diff.delete DiffDelete") -- used for octo
    map("n", "<leader>oa", ":Octo actions<CR>", {desc = "octa.actions"})
  end
}
