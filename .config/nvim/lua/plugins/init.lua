return {
  { "folke/which-key.nvim",  enabled = false },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    'arnamak/stay-centered.nvim',
    lazy = false,
    opts = {
      skip_filetypes = {
        'help',
        'nvdash',
        -- 'man', 
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        preview = { treesitter = false },
        color_devicons = true,
        sorting_strategy = "ascending",
        borderchars = {
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
        },
        path_display = { "smart" },
        layout_config = {
          height = 100,
          width = 400,
          prompt_position = "top",
          preview_cutoff = 40,
        },
      })

      return opts
    end,
  },
{
  "jiaoshijie/undotree",
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
},

{
  "aznhe21/actions-preview.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("actions-preview").setup({
      telescope = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_width = 0.6,
        },
      },
      diff = {
        algorithm = "patience",
        ignore_whitespace = true,
      },
    })
  end,
},
{
  "fasterius/simple-zoom.nvim",
  opts = {},
  config = true,
  lazy=false,
},

{
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
},

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "diff", "rust", "go"
  		},
  	},
  },
}
