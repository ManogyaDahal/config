--------------------------------Nvim Options ----------------------------------
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

--------------------------------Nvim keybinds ---------------------------------
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>so', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>x', ':quit<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>') --Look into this
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')        --Look into this
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')       --Look into this

--Mini pick
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fw', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

--lsp
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "formats the code" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "goto defination" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "goto declaration" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>ad", vim.diagnostic.setloclist, { desc = "Open all diagonostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagonostic message in float" })

--Nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

--------------------------------Nvim Packages ---------------------------------
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/arnamak/stay-centered.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-----------------------Package with Defaults-----------------------------------
require("nvim-web-devicons").setup({})
require("stay-centered").setup({})
require("mason").setup({})
require("mini.pairs").setup({})
require("mini.pick").setup({})
require("mini.completion").setup({})


---------------------------------Toggle Term ----------------------------------
require("toggleterm").setup({
	shade_terminals = false,
	start_in_insert = true,
	persist_size = false,
	float_opts = {
		border = 'curved'
	}
})

local Terminal = require("toggleterm.terminal").Terminal
local float_term = Terminal:new({ direction = "float" })
function _FLOAT_TOGGLE()
	float_term:toggle()
end

local horiz_term = Terminal:new({ direction = "horizontal", size = 15 })
function _HORIZ_TOGGLE()
	horiz_term:toggle()
end

local verti_term = Terminal:new({ direction = "vertical", size = 55 })
function _VERT_TOGGLE()
	verti_term:toggle()
end

vim.keymap.set({ "n", "t" }, "<A-i>", _FLOAT_TOGGLE, { noremap = true, silent = true })
vim.keymap.set({ "n", "t" }, "<A-h>", _HORIZ_TOGGLE, { noremap = true, silent = true })
vim.keymap.set({ "n", "t" }, "<A-v>", _VERT_TOGGLE, { noremap = true, silent = true })

-- This is for the navigation in terminal
function _G.set_terminal_keymaps()
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = 0 })
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

----------------------------Nvim Tree------------------------------------------
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
			quit_on_open = true,
		},
	},
})

---------------------Color Scheme and Transparency-----------------------------
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
--transparent floating window
vim.cmd [[
  highlight NormalFloat guibg=none
  highlight FloatBorder guibg=none
]]


--------------------------lsp -------------------------------------------------
vim.lsp.enable({
	"lua_ls",
	"clang",
	"gopls",
})


----------------------------------Tree Sitter----------------------------------
require "nvim-treesitter.configs".setup({
	ensure_installed = {
		"go",
		"lua",
		"c",
		"rust",
	},
	highlight = { enable = true }
})

-----------------------------Snippets------------------------------------------
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
