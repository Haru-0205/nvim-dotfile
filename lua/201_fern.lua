local set = vim.keymap.set
set("n", "<C-a>", "<cmd>Fern . -reveal=% -drawer -toggle -width=30<CR>")
vim.g["fern#renderer"] = "nerdfont"
