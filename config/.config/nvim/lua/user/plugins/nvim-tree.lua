-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.6  -- You can change this too

local opts = {
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  -- on_attach = "default",
  on_attach = function ()
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "<C-v>",       api.node.open.vertical,             opts("Open: Vertical Split"))
    vim.keymap.set("n", "<C-x>",       api.node.open.horizontal,           opts("Open: Horizontal Split"))
    vim.keymap.set("n", "H",           api.node.navigate.parent_close,     opts("Close Directory"))
    vim.keymap.set("n", "L",           api.node.open.edit,                 opts("Open"))
    vim.keymap.set("n", "J",           api.node.navigate.sibling.last,     opts("Last Sibling"))
    vim.keymap.set("n", "p",           api.node.open.preview,              opts("Open Preview"))
    vim.keymap.set("n", "E",           api.tree.expand_all,                opts("Expand All"))
    vim.keymap.set("n", "F",           api.live_filter.clear,              opts("Live Filter: Clear"))
    vim.keymap.set("n", "f",           api.live_filter.start,              opts("Live Filter: Start"))
    vim.keymap.set("n", "gy",          api.fs.copy.absolute_path,          opts("Copy Absolute Path"))
    vim.keymap.set("n", "ge",          api.fs.copy.basename,               opts("Copy Basename")) -- fileName, no ext
    vim.keymap.set("n", "y",           api.fs.copy.filename,               opts("Copy Name")) -- filename
    vim.keymap.set("n", "Y",           api.fs.copy.relative_path,          opts("Copy Relative Path"))
    vim.keymap.set("n", ".",           api.tree.toggle_hidden_filter,      opts("Toggle Filter: Dotfiles"))
    vim.keymap.set("n", "I",           api.tree.toggle_gitignore_filter,   opts("Toggle Filter: Git Ignore"))
    vim.keymap.set("n", "P",           api.node.navigate.parent,           opts("Parent Directory"))
    vim.keymap.set("n", "q",           api.tree.close,                     opts("Close"))
    vim.keymap.set("n", "r",           api.tree.reload,                    opts("Refresh"))
    vim.keymap.set("n", "o",           api.node.run.system,                opts("Run System"))
    vim.keymap.set("n", "C",           api.tree.collapse_all,              opts("Collapse All"))
  end,
  select_prompts = false,
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,
    signcolumn = "yes",
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
          border = "rounded",
          relative = "editor",
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
    add_trailing = false,
    group_empty = true,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    git_clean = false,
    no_buffer = false,
    custom = { "^.git$" }, -- hide .git dir
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = false,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}

function open_in_oil()
  local api = require("nvim-tree.api")
  local oil_status_ok, _ = pcall(require, "oil")
    if not oil_status_ok then
      return
    end
  local node = api.tree.get_node_under_cursor()
  if not node then
    vim.notify("No node under cursor", vim.log.levels.WARN)
    return
  end
  local basedir = node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
  vim.cmd("Oil --float " .. vim.fn.fnameescape(basedir))
end

return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(opts)
    map("n","<leader>e", ":NvimTreeToggle<cr>", {desc = "nvimtree.Toggele"})
    map("n","<leader>s", ":NvimTreeFindFile<cr>", {desc = "nvimtree.find file in tree"})
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.keymap.set(
          "n",
          "go",
          open_in_oil,
          { buffer = true, desc = "Open Oil in directory" }
        )
      end,
    })
  end,
}
