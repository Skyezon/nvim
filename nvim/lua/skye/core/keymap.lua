vim.g.mapleader = " "

function explorer()
	vim.cmd.Ex()
end

vim.keymap.set("n","<leader>ee",explorer)

