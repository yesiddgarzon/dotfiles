local M = {}

M.disabled = {
}

M.custom = {
  n = {
    ["<leader>q"] = { "<cmd> q <CR>", "Close" },
    ["<leader>w"] = { "<cmd> wq <CR>", "Save & Exit" },
    ["<C-down>"] = { "5j", "Move 5 lines at once" },
    ["<C-up>"] = { "5k", "Move 5 lines at once" },
    ["<A-j>"] = { "<cmd> m .+1 <CR>==", "Move line down" },
    ["<A-k>"] = { "<cmd> m .-2 <CR>==", "Move line up" },
    ["<A-down>"] = { "<cmd> res -1 <CR>", "Resize down" },
    ["<A-up>"] = { "<cmd> res +1 <CR>", "Resize up" },
    ["<A-left>"] = { "<cmd> vertical resize-1 <CR>", "Resize left" },
    ["<A-right>"] = { "<cmd> vertical resize+1 <CR>", "Resize right" },
  },
  i = {
    ["<A-j>"] = { "<cmd> m .+1 <CR>", "Move line down" },
    ["<A-k>"] = { "<cmd> m .-2 <CR>", "Move line up" },
  },
}

return M
