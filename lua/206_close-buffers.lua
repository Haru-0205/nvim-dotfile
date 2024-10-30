local set = vim.keymap.set

set("n", "<A-w>", "<cmd>lua require('close_buffers').delete({ type = 'this' })<CR>")
set("n", "<A-W>", "<cmd>lua require('close_buffers').delete({ type = 'hidden', force = true })<CR>")
