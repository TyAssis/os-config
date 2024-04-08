local dap_servers = {
  "delve",
}

require("mason-nvim-dap").setup({
  ensure_installed = dap_servers,
  automatic_installation = true,
})

require("dap-go").setup()
