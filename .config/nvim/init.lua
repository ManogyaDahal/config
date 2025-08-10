---------Vim Options-----------
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.number = true
vim.o.ignorecase = true
vim.o.relativenumber = true
vim.o.wrap = false -- wrap: prevents the text exceeding the width of the window
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.scrolloff = 0
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.winborder = "rounded"
vim.o.incsearch = true
vim.o.undofile = true

-------Vim Keybinds----------
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>so', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>x', ':quit<CR>')

vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fw', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })

-----------Vim Plugins----------------
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/arnamak/stay-centered.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("nvim-web-devicons").setup()
require("stay-centered").setup({})
require("mini.pick").setup({})
require("mason").setup({})
require('nvim-tree').setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = 'left',
		width = 30,
	},
	actions = {
		open_file = {
			quit_on_open = true, -- auto close tree on file open
		},
	},
})
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

--lsp
vim.lsp.enable({ "lua_ls", "clang" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
