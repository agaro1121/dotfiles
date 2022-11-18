local api = vim.api

-- writes buffer after exiting Insert mode. Does not trigger when exiting with <C-c>
api.nvim_create_autocmd(
  { "InsertLeave" },
	{ pattern = "*", command = "write" }
)

