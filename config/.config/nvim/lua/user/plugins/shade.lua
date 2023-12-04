return {
  "sunjon/shade.nvim",
  config = function()
    local Shade = require("shade")
    Shade.setup({
      overlay_opacity = 35,
      opacity_step = 1,
      keys = {
        brightness_up   = '<C-Up>',
        brightness_down = '<C-Down>',
        toggle          = '<leader>S',
      }
    })

   --NOTE: Start disabled. Clashes with floating windows like nvim-tree
   Shade.toggle()
  end
}
