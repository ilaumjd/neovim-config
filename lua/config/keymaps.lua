-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------ NORMAL ------
map("n", "x", '"_x', { desc = "Prevent copy on press x" })

----- INSERT ------
map("i", "jk", "<ESC>", { desc = "Press jk fast to enter" })

------ VISUAL BLOCK ------
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down (Alt)" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up (Alt)" })
