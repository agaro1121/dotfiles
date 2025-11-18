return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  config = function ()
    require("gitsigns").setup{
      auto_attach = false,
      gh = true,
      on_attach = function (bufr)
        local gitsigns = require("gitsigns")
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "gitsigns.stage_hunk"})
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "gitsigns.reset_hunk" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "gitsigns.preview_hunk" })
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "gitsigns.preview_hunk_inline" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "gitsigns.diffthis" })
        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "diffthis.toggle_current_line_blame" })
        map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "gitsigns.toggle_word_diff" })
        -- Text Object
        map({"o", "x"}, "ih",  gitsigns.select_hunk, { desc = "gitsigns.select_hunk" })

        map("n", "<leader>gd", gitsigns.detach, { desc = "gitsigns.detach"})
      end
    }
    map("n", "<leader>ga", ":Gitsigns attach<CR>", { desc = "gitsigns.attach"})

  end
}
