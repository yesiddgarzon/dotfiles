require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- utils
map("n", "<Leader>w", "<cmd> wq <cr>",{ desc = "Save & Close" })

-- move x lines at a time
map("n", "<C-j>", "5j",{ desc = "Move 5 lines down" })
map("n", "<C-k>", "5k",{ desc = "Move 5 lines up" })

-- move lines up and down
map("n", "<S-k>", ":m+<CR>==",{ desc = "Move line down" })
map("n", "<S-j>", ":m-2<CR>==",{ desc = "Move line up" })
map("v", "<S-k>", ":m'>+<CR>gv=gv",{ desc = "Move lines down" })
map("v", "<S-j>", ":m-2<CR>gv=gv",{ desc = "Move lines up" })

