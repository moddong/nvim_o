vim.g.mapleader = " "
-- fix map gg conflict
vim.keymap.set("n", "gg", "1G", {noremap = true, silent = true})
-- nvimtree
vim.keymap.set("n", "<c-q>", "<cmd>NvimTreeToggle<cr>", {noremap = true, silent = true})
-- bufferline
vim.keymap.set("n", "<leader>dd", "<cmd>bdelete<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", {noremap = true, silent = true})
-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true})
vim.keymap.set("n", "[b", "<cmd>bn<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "]b", "<cmd>bp<cr>", {noremap = true, silent = true})

vim.keymap.set("n", "<c-h>", "<c-w><c-h>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", {noremap = true, silent = true})
vim.keymap.set("n", "Y", "y$", {noremap = true, silent = true})
-- insert
vim.keymap.set("i", "<c-h>", "<left>", {noremap = true, silent = true})
vim.keymap.set("i", "<c-j>", "<down>", {noremap = true, silent = true})
vim.keymap.set("i", "<c-k>", "<up>", {noremap = true, silent = true})
vim.keymap.set("i", "<c-l>", "<right>", {noremap = true, silent = true})

-- lspsaga
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "gs", "<cmd>Lspsaga signature_help<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<cr>", {noremap = true, silent = true})
-- floaterm lazygit
vim.keymap.set("n", "<a-=>", "<cmd>Lspsaga open_floaterm<cr>", {noremap = true, silent = true})
vim.keymap.set("t", "<a-=>", "<c-\\><c-n><cmd>Lspsaga close_floaterm<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>g", "<cmd>Lspsaga open_floaterm lazygit<cr>", {noremap = true, silent = true})
