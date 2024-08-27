vim.g.mapleader = " "

vim.keymap.set("n", "<leader>se", "<C-w>=")            -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")    -- close current window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     -- go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     -- go to previous tab

-- vim.keymap.set("n", "<leader>ot", "<C-w>s:te<CR>i")                              -- open terminal below
vim.keymap.set("n", "<leader>ot", "<cmd>Lspsaga term_toggle<cr>")                    -- open terminal via lspsaga

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle current reveal_force_cwd<cr>") -- show neo tree

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")                          --show undo tree

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>p', "<cmd>Telescope git_files<cr>")
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', '<leader>fs', "<cmd>Telescope grep_string<cr>")
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>")

vim.keymap.set('n', '<leader>rp', "<cmd>Spectre<cr>")
vim.keymap.set('v', '<leader>rp', "<esc><cmd>lua require('spectre').open_visual()<CR>")

--#region lsp

vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>Lspsaga show_workspace_diagnostics<CR>")

vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)


-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set('n', 'gd', "<cmd>Lspsaga goto_definition<CR>")
vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'gi', "<cmd>Lspsaga finder imp<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>")
vim.keymap.set('n', 'gt', "<cmd>Lspsaga goto_type_definition<CR>")
vim.keymap.set('n', 'gr', "<cmd>Lspsaga rename<CR>")
vim.keymap.set('n', '<leader>fr', function()
    vim.lsp.buf.format { async = true }
end, opts)

--#endregion

