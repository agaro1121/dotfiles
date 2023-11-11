return {
  "wallpants/github-preview.nvim",
  cmd = { "GithubPreviewToggle" },
  keys = { "<leader>md" },
  opts = {
    -- config goes here
  },
  config = function(_, opts)
    local gpreview = require("github-preview")
    gpreview.setup(opts)

    local fns = gpreview.fns
    vim.keymap.set("n", "<leader>md", fns.toggle)
    vim.keymap.set("n", "<leader>mds", fns.single_file_toggle)
    vim.keymap.set("n", "<leader>mdd", fns.details_tags_toggle)
  end,
}
-- NOTE: requires Bun
-- brew tap oven-sh/bun
-- brew install bun
