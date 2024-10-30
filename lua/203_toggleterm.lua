local set = vim.keymap.set
local Term = require("toggleterm.terminal").Terminal
local lazygit = Term:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true
})

function _lazygit_toggle()
  lazygit:toggle()
end

set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>")
set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>")
set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
