-- local status_ok, _ = pcall(function()
--   vim.lsp.config('*')
-- end)
-- 
-- if not status_ok then
--   return
-- end

require "user.lsp.servers"
require("user.lsp.handlers").setup()
require("user.lsp.dap")
require "user.lsp.null-ls"
