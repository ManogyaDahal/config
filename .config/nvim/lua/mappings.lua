require "nvchad.mappings"

local map = vim.keymap.set
-- local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>x", ":quit<CR>", { desc = "exit"})

--half page up and down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

--Nvim tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- map('n', 'gc', '<leader>gc', { noremap = true, silent = true })

--lsp
map('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "formats the code" })
map('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagonostic message in float" })
map('n', '<leader>ad', ':Telescope diagnostics<CR>', { noremap = true, silent = true, desc = "Go to references" })
map("n", "<leader>ca", require("actions-preview").code_actions, { desc = "Open diagonostic message in float" })
map('n', '<leader>z', ':SimpleZoomToggle<CR>', { silent = true })
