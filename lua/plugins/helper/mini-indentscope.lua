return {
  "echasnovski/mini.indentscope",
  version = "*",
  config = function()
    require("mini.indentscope").setup({
      options = {
        try_as_border = false,
      },
      init = function()
        -- Only enable for normal buffers (excludes special buffers automatically)
        if vim.bo.buftype ~= "" then
          vim.b.miniindentscope_disable = true
        end
      end,
    })

    -- For new buffers
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        if vim.bo.buftype ~= "" then
          vim.b.miniindentscope_disable = true
        end
      end,
    })
  end,
}
