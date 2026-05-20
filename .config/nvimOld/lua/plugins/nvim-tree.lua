return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        side = "left",
        width = 30,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },
}
