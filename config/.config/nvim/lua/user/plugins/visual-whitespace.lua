return {
  'mcauley-penney/visual-whitespace.nvim',
  config = true,
  event = "ModeChanged *:[vV\22]",   -- optionally, lazy load on entering visual mode
  opts = {
    enabled = false
  },
  init = function()
    map({ 'n', 'v' }, "<leader>tw", require("visual-whitespace").toggle, {desc = "visual-whitespace.toggle"})
  end
}
