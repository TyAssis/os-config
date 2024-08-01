local dap_servers = {
  "delve",
}

require("mason-nvim-dap").setup({
  ensure_installed = dap_servers,
  automatic_installation = true,
})

require("dap-go").setup()


local dap = require('dap')
local opts = { noremap = true, silent = true }

dap.listeners.before['event_initialized']['nvim-dap'] = function()
  vim.keymap.set("n", "<F10>", dap.step_over, opts)
  vim.keymap.set("n", "<F11>", dap.step_into, opts)
  vim.keymap.set("n", "<F12>", dap.step_out, opts)
end

-- to do things at the end of the debug session
-- dap.listeners.before['event_terminated']['nvim-dap'] = function()
--   vim.keymap.del("n", "l")
--   vim.keymap.del("n", "j")
--   vim.keymap.del("n", "k")
--   vim.keymap.del("n", "h")
-- end

local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>ds", ":lua require('dapui').float_element('scopes', { enter = true}) <CR>", opts)
