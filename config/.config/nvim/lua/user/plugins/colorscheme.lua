vim.pack.add({
  {
    src = 'https://github.com/sainnhe/sonokai',
  },
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin'
  },
  {
    src = 'https://github.com/folke/tokyonight.nvim'
  },
  {
    src = 'https://github.com/serhez/teide.nvim'
  }
})

vim.g.sonokai_enable_italic = true

require('catppuccin').setup({
  flavour = 'macchiato', -- latte, frappe, macchiato, mocha
})

-- colorschme and fixing highlights
local function swap_fg_with_bg_and_set_white(group)
  -- Resolve links and get the effective highlight
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })

  if not hl or not hl.bg then
    vim.notify(
      ("Highlight group '%s' has no guibg"):format(group),
      vim.log.levels.WARN
    )
    return
  end

  vim.api.nvim_set_hl(0, "VirtualTextError", {
    fg = 0xFF0000 -- explicit white (more reliable than "White")
  })

  vim.api.nvim_set_hl(0, group, {
    fg = hl.bg,     -- numeric color is OK
    bg = 0xFFFFFF, -- explicit white (more reliable than "White")
  })
end

-- must be called in this order
vim.cmd.colorscheme('catppuccin-macchiato')
swap_fg_with_bg_and_set_white("Visual")
