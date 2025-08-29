local M = {}

--------------------------------Toggle Term------------------------------------
local Terminal = require("toggleterm.terminal").Terminal

-- floating terminal
local float_term = Terminal:new({ direction = "float" })
M.float_toggle = function()
  float_term:toggle()
end
-- horizontal terminal
local horiz_term = Terminal:new({ direction = "horizontal", size = 15 })
M.horiz_toggle = function()
  horiz_term:toggle()
end
-- vertical terminal
local verti_term = Terminal:new({ direction = "vertical", size = 55 })
M.vert_toggle = function()
  verti_term:toggle()
end

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
