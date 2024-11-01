local set = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

--autocmd("BufRead", {
--  desc = "React FileType",
--  pattern = "*.tsx",
--  callback = function ()
--    vim.opt.filetype="typesctiptreact"
--  end
--})

autocmd("FileType", {
  desc = "launch TSServer",
  pattern = {"typescriptreact", "typescript"},
  callback = function()
    vim.lsp.start({
      name = "tsserver",
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({"package.json"}, {upward = true})[1]),
    })
  end
})

autocmd("FileType", {
  desc = "Launch Tailwindcss",
  pattern = {"typescriptreact", "javascriptreact", "html"},
  callback = function()
    vim.lsp.start({
      name = "tailwind_ls",
      cmd = { "tailwindcss-language-server" },
      root_dir = vim.fs.dirname(vim.fs.find({"package.json"}, {upward = true})[1]),
    })
  end
})

require("mason").setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end,
})

set('n','H','<cmd>lua vim.lsp.buf.hover()<CR>')
set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
set('n','gf','<cmd>lua vim.lsp.buf.formatting()<CR>')
set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
set('n','gR','<cmd>lua vim.lsp.buf.rename()<CR>')
set('n','ga','<cmd>lua vim.lsp.buf.code_action()<CR>')
