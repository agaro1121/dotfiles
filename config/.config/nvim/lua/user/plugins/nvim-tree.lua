-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.6  -- You can change this too

-- optional on_attach to modify mappings
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'H', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'L', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'p', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', 'F', api.live_filter.clear, opts('Live Filter: Clear'))
  vim.keymap.set('n', 'f', api.live_filter.start, opts('Live Filter: Start'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'ge', api.fs.copy.basename, opts('Copy Basename'))                        -- fileName, no ext
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))                             -- filename
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<ESC>', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'r', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'go', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'C', api.tree.collapse_all, opts('Collapse All'))
  vim.keymap.set('n', 'dd', api.fs.remove, opts('Delete'))
end

local opts = {
  on_attach = my_on_attach,
  view = {
    number = true,
    relativenumber = true,
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
            - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  renderer = {
    group_empty = true,
    highlight_git = false,
  },
  filters = {
    dotfiles = true,
    custom = { '^.git$' }, -- hide .git dir
  },
  git = {
    enable = false,
  },
  live_filter = {
    always_show_folders = false,
  },
}

local function open_in_oil()
  local api = require('nvim-tree.api')
  local oil_status_ok, _ = pcall(require, 'oil')
  if not oil_status_ok then
    return
  end
  local node = api.tree.get_node_under_cursor()
  if not node then
    vim.notify('No node under cursor', vim.log.levels.WARN)
    return
  end
  local basedir = node.type == 'directory' and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ':h')
  vim.cmd('Oil --float ' .. vim.fn.fnameescape(basedir))
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  cmd = 'NvimTreeToggle',
  config = function()
    require('nvim-tree').setup(opts)
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = 'nvimtree: Toggele' })
    vim.keymap.set('n', '<leader>s', ':NvimTreeFindFile<cr>', { desc = 'nvimtree: Find file in tree' })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'NvimTree',
      callback = function()
        vim.keymap.set(
          'n',
          'o',
          open_in_oil,
          { buffer = true, desc = 'Open Oil in directory' }
        )
      end,
    })
  end,
}
