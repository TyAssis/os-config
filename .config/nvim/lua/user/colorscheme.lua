local colorscheme = "catppuccin"

local settings = {
  catppuccin = {
    flavour = "macchiato",
    transparent = true,
    dim_inactive = {
      enable = true,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" }
    },
    lsp_styles = {
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    }
  },
}

-- Try to require the theme module (not vim.cmd)
local ok, theme = pcall(require, colorscheme)
if not ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end

-- Apply settings if they exist
if settings[colorscheme] then
  theme.setup(settings[colorscheme])
end

-- Now apply the theme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Failed to load colorscheme: " .. colorscheme)
end

