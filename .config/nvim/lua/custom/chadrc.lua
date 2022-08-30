local M = {}

M.plugins = {

  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "vim",
      },
    },

    ["NvChad/ui"] = {
      statusline = {
        separator_style = "arrow",
      }
    },

    ["nvim-treesitter/nvim-treesitter"] = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

}

M.mappings = require "custom.mappings"

M.ui = {
  theme = "gruvchad",
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },
}

return M
