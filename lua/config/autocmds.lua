-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

------ DISABLE HIGHLGHT AFTER SEARCH ------
vim.cmd([[
  augroup disable_highlight_after_search
    autocmd!
    autocmd CursorMoved * set nohlsearch
  augroup END
]])

------ DISABLE DEFAULT KEYMAP ------
vim.cmd("map q <Nop>")

------ STARTER ------
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
      require('startup').display()
    end
  end,
})
