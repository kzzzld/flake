local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })

map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
