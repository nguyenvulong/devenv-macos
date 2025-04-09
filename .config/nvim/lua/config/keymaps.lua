-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- <UndotreeToggle>
if not vim.fn.isdirectory(vim.g.undotree_UndoDir) then
  vim.fn.mkdir(vim.g.undotree_UndoDir, "p")
end

vim.keymap.set("n", "<leader>z", ":UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle UndoTree" })

-- Map <Esc> to exit terminal-mode
vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true })
