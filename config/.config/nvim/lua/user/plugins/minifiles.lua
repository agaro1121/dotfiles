return {
  "echasnovski/mini.files",
  config = function()
    local MiniFiles = require("mini.files")
    MiniFiles.setup({
      mappings = {
        -- close = "q",
      },
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

    local split_vertical = function (buf_id, lhs)
      local rhs = function ()
        local fs_entry = MiniFiles.get_fs_entry()
        vim.schedule(function()
          vim.cmd('vsplit '..fs_entry.path)
        end)
      end
      map('n', lhs, rhs, { buffer = buf_id, desc = 'split vertical' })
    end

    local split_horizontal = function (buf_id, lhs)
      local rhs = function ()
        local fs_entry = MiniFiles.get_fs_entry()
        vim.schedule(function()
          vim.cmd('split '..fs_entry.path)
        end)
      end
      map('n', lhs, rhs, { buffer = buf_id, desc = 'split horizontal' })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        split_vertical(buf_id, 'gv')
        split_horizontal(buf_id, 'gs')
      end,
    })
    map("n", "<leader>mf", require("mini.files").open)
  end
}
