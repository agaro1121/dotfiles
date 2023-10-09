return {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
    map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
    map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")
  end
}
