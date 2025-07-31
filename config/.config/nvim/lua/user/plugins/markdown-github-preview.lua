return {
  "wallpants/github-preview.nvim",
  cmd = { "GithubPreviewToggle" },
  keys = { "<leader>md" },
  config = function(_, opts)
    local gpreview = require("github-preview")
    gpreview.setup(opts)

    local fns = gpreview.fns
    map("n", "<leader>md", fns.toggle, { desc = "markdown.toggle preview" })
    map("n", "<leader>mds", fns.single_file_toggle, { desc = "markdown.toggle single file" })
    map("n", "<leader>mdd", fns.details_tags_toggle, { desc = "markdown.toggle details tags" })
  end,
}
-- NOTE: requires Bun
-- brew tap oven-sh/bun
-- brew install bun@1.2.2 # working version for now
