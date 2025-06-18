return {
  'mcauley-penney/visual-whitespace.nvim',
  config = true,
  event = "ModeChanged *:[vV\22]",   -- optionally, lazy load on entering visual mode
  opts = {
    enabled = false
  },
  init = function()
    vim.keymap.set({ 'n', 'v' }, "<leader>tw", require("visual-whitespace").toggle, {})
  end
}
