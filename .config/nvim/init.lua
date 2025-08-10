---------Vim Options-----------
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.number = true
vim.o.ignorecase = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.scrolloff = 0
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.winborder = "rounded"
vim.o.incsearch = true
vim.o.undofile = true
vim.opt.colorcolumn = "80"

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
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>') --Look into this
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')--Look into this
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')--Look into this

-----------Vim Plugins----------------
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/arnamak/stay-centered.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
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


--snippets
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
