local set = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

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

autocmd("FileType", {
  desc = "Launch Clangd",
  pattern = {"c","cpp"},
  callback = function()
    vim.lsp.start({
      name = "clangd",
      cmd = { "clangd" },
    })
  end
})

autocmd("FileType", {
  desc = "lua_ls",
  pattern = {"lua"},
  callback = function()
    vim.lsp.start({
      name = "lua_ls",
      cmd = { "lua-language-server" },
    })
  end
})


set('n','H','<cmd>lua vim.lsp.buf.hover()<CR>')
set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
set('n','gf','<cmd>lua vim.lsp.buf.formatting()<CR>')
set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
set('n','gR','<cmd>lua vim.lsp.buf.rename()<CR>')
set('n','ga','<cmd>lua vim.lsp.buf.code_action()<CR>')
