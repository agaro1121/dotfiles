-- window navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>th", "<C-w>t<C-w>H")
map("n", "<leader>tk", "<C-w>t<C-w>K")

-- break the habit
map({"n", "i"}, "<Up>",    "<NOP>")
map({"n", "i"}, "<Down>",  "<NOP>")
map({"n", "i"}, "<Left>",  "<NOP>")
map({"n", "i"}, "<Right>", "<NOP>")

