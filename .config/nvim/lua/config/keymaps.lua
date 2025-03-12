-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map <Esc> to exit terminal-mode
vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true })
