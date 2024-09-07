return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      animation = true,
    },
    version = '^1.0.0',
    config = function()
      vim.keymap.set('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Go to previous tab', noremap = true, silent = true })
      vim.keymap.set('n', '<S-l>', '<Cmd>BufferNext<CR>', { desc = 'Go to next tab', noremap = true, silent = true })
      vim.keymap.set('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close all tabs but current', noremap = true, silent = true })
      vim.keymap.set('n', '<leader>bd', '<Cmd>BufferClose<CR>', { desc = 'Close current tab', noremap = true, silent = true })
    end,
  },
}
