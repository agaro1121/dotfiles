function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- vim config
map("n","<leader>E", ":source $HOME/.config/nvim/init.lua<cr>")

-- window navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Up>", ":resize +2<cr>")
map("n", "<C-Down>", ":resize -2<cr>")
map("n", "<C-Left>", ":vertical resize +2<cr>")
map("n", "<C-Right>", ":vertical resize -2<cr>")
map("n", "<Leader>th", "<C-w>t<C-w>H")
map("n", "<Leader>tk", "<C-w>t<C-w>K")

-- break the habit
map("n", "<Up>",    "<NOP>")
map("n", "<Down>",  "<NOP>")
map("n", "<Left>",  "<NOP>")
map("n", "<Right>", "<NOP>")
map("i", "<Up>",    "<NOP>")
map("i", "<Down>",  "<NOP>")
map("i", "<Left>",  "<NOP>")
map("i", "<Right>", "<NOP>")

