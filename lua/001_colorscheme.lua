local opt = vim.opt

vim.cmd.colorscheme "catppuccin"
opt.termguicolors = true
opt.winblend = 40
opt.pumblend = 60
vim.cmd("highlight EndOfBuffer ctermbg=NONE ctermfg=NONE")
