vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
if not config_status_ok then
    return
end

local function edit_or_open()
  local node = nvim_tree_api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    nvim_tree_api.node.open.edit()
  else
    nvim_tree_api.node.open.edit()
    nvim_tree_api.tree.close()
  end
end

local function vsplit_preview()
  local node = nvim_tree_api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    nvim_tree_api.node.open.edit()
  else
    nvim_tree_api.node.open.vertical()
  end

  nvim_tree_api.tree.focus()
end

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  api.config.mappings.default_on_attach(bufnr)

  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "l", edit_or_open, opts)
  vim.keymap.set("n", "L", vsplit_preview, opts)
  vim.keymap.set("n", "h", nvim_tree_api.tree.close, opts)
  vim.keymap.set("n", "H", nvim_tree_api.tree.collapse_all, opts)
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw  = true,
  hijack_cursor = true,
  on_attach = on_attach,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    number = false,
    relativenumber = false,
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          untracked = "󰘓"
        }
      }
    }
  }
}

