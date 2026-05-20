return {
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
}
