return {
  "j-morano/buffer_manager.nvim",
  config = function()
    require("buffer_manager").setup({})
  end,
  keys = { { "H", "<Cmd>lua require('buffer_manager.ui').toggle_quick_menu()<CR>", desc = "Open bufferlist" } },
}
