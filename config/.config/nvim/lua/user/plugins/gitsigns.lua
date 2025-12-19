return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    local gitsigns = require("gitsigns")
    gitsigns.setup{
      auto_attach = false,
      gh = true,
      on_attach = function (bufr)

        vim.keymap.set("n", "<leader>gd", gitsigns.detach,                    { desc = "gitsigns: detach"})
        -- Actions
        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk,                { desc = "gitsigns: stage_hunk"})
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk,                { desc = "gitsigns: reset_hunk" })
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk,              { desc = "gitsigns: preview_hunk" })
        vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline,       { desc = "gitsigns: preview_hunk_inline" })
        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis,                  { desc = "gitsigns: diffthis" })
        vim.keymap.set("n", "]h", function() gitsigns.nav_hunk('next') end,   { desc = "gitsigns: next hunk" })
        vim.keymap.set("n", "[h", function() gitsigns.nav_hunk('prev') end,   { desc = "gitsigns: previous hunk" })
        -- Toggles
        vim.keymap.set("n", "<leader>bl", gitsigns.toggle_current_line_blame, { desc = "diffthis: toggle_current_line_blame" })
        -- Text Object
        vim.keymap.set({"o", "x"}, "ih",  gitsigns.select_hunk,               { desc = "gitsigns: select_hunk" })

      end
    }

    vim.keymap.set("n", "<leader>ga", gitsigns.attach,                        { desc = "gitsigns: attach"})
  end
}
