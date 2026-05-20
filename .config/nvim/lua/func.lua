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
    return "<C-p>"
  else
    return "<S-Tab>"  -- or "<Tab>" if you want dedent behavior
  end
end

return M
