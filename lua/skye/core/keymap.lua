vim.g.mapleader = " "

vim.keymap.set("n", "<leader>sr", "<C-w>v") -- split window right
vim.keymap.set("n", "<leader>sb", "<C-w>s") -- split window below 
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab



vim.keymap.set("n", "<leader>e", ":NeoTreeShow<CR>")
