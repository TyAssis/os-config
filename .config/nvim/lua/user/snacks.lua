local snacks_status_ok, snacks = pcall(require, "snacks")
if not snacks_status_ok then
  return
end

snacks.setup {
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = { enabled = true },
  indent = { enabled = true, use_treesitter = false },
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}
