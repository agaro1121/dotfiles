local breadcrumb = function()
  local breadcrumb_status_ok, breadcrumb = pcall(require, "breadcrumb")
  if not breadcrumb_status_ok then
    return
  end
  return breadcrumb.get_breadcrumb()
end

local opts = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {},
    lualine_x = { },
    lualine_y = { 'diagnostics', { 'filename', path = 0 }, 'filesize', 'encoding' },
    lualine_z = { 'location', 'progress' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_y = { { 'filename', path = 3 } },
  },
  winbar = {
    lualine_c = { breadcrumb },
  },
  inactive_winbar = {},
  extensions = { 'nvim-tree', 'symbols-outline', 'quickfix' }
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons", "loctvl842/breadcrumb.nvim" },
  config = function()
    require('lualine').setup(opts)
  end,
}
