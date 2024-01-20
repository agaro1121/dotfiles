return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local MiniFiles = require("mini.files")
    MiniFiles.setup({
      mappings = { },
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = false,
      },
      windows = {
        preview = true,
        width_preview = 75
      }
    })

    local split_vertical = function ()
        local fs_entry = MiniFiles.get_fs_entry()
        vim.schedule(function()
          vim.cmd('vsplit '..fs_entry.path)
        end)
      end

    local split_horizontal = function ()
        local fs_entry = MiniFiles.get_fs_entry()
        vim.schedule(function()
          vim.cmd('split '..fs_entry.path)
        end)
      end

    local go_in_plus = function()
      for _ = 1, vim.v.count1 do
        MiniFiles.go_in({ close_on_file = true })
      end
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local map_buf = function(lhs, rhs) vim.keymap.set('n', lhs, rhs, { buffer = args.data.buf_id }) end
        map_buf('gv', split_vertical)
        map_buf('gs', split_horizontal)
        map_buf('L', go_in_plus)
      end,
    })

    -- opens mini.files at current file location
    map("n", "<leader>-", function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
      MiniFiles.reveal_cwd()
    end)
  end
}
