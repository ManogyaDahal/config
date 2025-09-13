local M = {}

--------------------------------Nvim mini.completion --------------------------

-- Tab completion
function M.smart_tab()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"  -- move down in menu
  else
    return "<Tab>"  -- fallback to literal Tab
  end
end

-- Shift-Tab completion
function M.smart_s_tab()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"  -- move up in menu
  else
    return "<C-x><C-o>"  -- trigger completion
  end
end

return M
