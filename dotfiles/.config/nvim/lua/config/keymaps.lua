-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select all lines and yank" })
vim.keymap.set({ "n", "i" }, "<C-n>", "0i<Enter><Esc>k", { desc = "Insert a newline above the current line" })
