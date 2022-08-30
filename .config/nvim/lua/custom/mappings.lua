local M = {}

M.disabled = {
  "<C-k>",
}

M.custom = {
  n = {
    ["<leader>w"] = { "<cmd> wq <CR>", "Save & Exit" },
    ["<leader>q"] = { "<cmd> q <CR>", "Close" },
    ["<C-j>"] = { "5j", "Move 5 lines at once" },
    ["<C-k>"] = { "5k", "Move 5 lines at once" },
    ["<A-j>"] = { "<cmd> m .+1 <CR>", "Move line down" },
    ["<A-k>"] = { "<cmd> m .-2 <CR>", "Move line up" },
  },
  i = {
    ["<A-j>"] = { "<cmd> m .+1 <CR>", "Move line down" },
    ["<A-k>"] = { "<cmd> m .-2 <CR>", "Move line up" },
  },
}

return M
