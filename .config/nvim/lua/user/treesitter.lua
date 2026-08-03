local treesitter = require("nvim-treesitter")

treesitter.install({
    "bash",
    "go",
    "gomod",
    "gosum",
    "lua",
    "javascript",
    "json",
    "markdown",
    "python",
    "query",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  })


-- check if those config still work on nvim 0.11
treesitter.setup {
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
