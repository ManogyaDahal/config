local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvimtree.setup({
  disable_netrw = false,
  hijack_netrw = true,
  git = { enable = true },
  renderer = {
    root_folder_label = true,
    highlight_git = true,
    icons = { show = { git = true } },
  },
})
