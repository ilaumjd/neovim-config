-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  augroup disable_highlight_after_search
    autocmd!
    autocmd CursorMoved * set nohlsearch
  augroup END
]])
