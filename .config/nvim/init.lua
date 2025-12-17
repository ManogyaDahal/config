--------------------------------Nvim Options ----------------------------------
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.tabstop = 2
vim.o.number = true
vim.o.ignorecase = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.scrolloff = 0
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.winborder = "rounded"
vim.o.incsearch = true
vim.o.undofile = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

vim.g.undotree_WindowLayout = 2
vim.g.undotree_SplitWidth = 30
vim.g.undotree_SetFocusWhenToggle = 1

-------------------------------Nvim Packages ---------------------------------
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/arnamak/stay-centered.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/OXY2DEV/markview.nvim" },
})

-----------------------Package with Defaults-----------------------------------
require("nvim-web-devicons").setup({})
require("stay-centered").setup({})
require("mason").setup({})
require("mini.pairs").setup({})
require("mini.completion").setup({})
require("mini.comment").setup({})
local func = require("func")

--------------------------Markview-------------------------------------------
-- Disable automatic previews.
require("markview").setup({
    preview = { enable = false }
});

vim.api.nvim_set_keymap("n", "<leader>pm", "<CMD>Markview splitToggle<CR>", { desc = "Toggles `splitview` for current buffer." });

---------------------------- Telescope ------------------------------------------
require("telescope").setup({
	defaults = {
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.6 }
	},
})

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
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
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
  end,
})


--------------------------lsp -------------------------------------------------
vim.lsp.enable({
	"lua_ls",
	"clangd",
	"gopls",
	"pylsp",
	"rust_analyzer",
	"biome",
	"vtsls"
})
----------------------------------Tree Sitter----------------------------------
require "nvim-treesitter.configs".setup({
	ensure_installed = {
		"c",
		"go",
		"javascript",
		"lua",
		"python",
		"rust",
	},
	highlight = { enable = true }
})
----------------------------Conform Nvim (Formatter)---------------------------
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback", stop_after_first = true },
  },
})
-------------------------------nvim lint (linter)------------------------------
require('lint').linters_by_ft = {
  markdown = {'vale'},
}

-----------------------------Snippets------------------------------------------
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

--------------------------------Nvim keybinds ---------------------------------
vim.keymap.set('n', '<leader>so', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>x', ':quit<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

--Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>lb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fw', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>gr', ':Telescope lsp_references<CR>', { noremap = true, silent = true, desc = "Go to references" })
vim.keymap.set('n', '<leader>ad', ':Telescope diagnostics<CR>', { noremap = true, silent = true, desc = "Go to references" })
vim.keymap.set('n', 'gd',         ':Telescope lsp_definitions<CR>', { desc = "goto defination" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "goto declaration" })


--lsp
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "formats the code" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagonostic message in float" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open diagonostic message in float" })


--Nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- mini completion
vim.keymap.set("i", "<Tab>", function() return func.smart_tab() end, { expr = true, noremap = true })
vim.keymap.set("i", "<S-Tab>", function() return func.smart_s_tab() end, { expr = true, noremap = true })

-- undo tree
vim.keymap.set({ 'n', 'v', 't' }, '<leader>u', ':UndotreeToggle<CR>',
			{ noremap = true, silent = true, desc = "Toggle Undotree" })
