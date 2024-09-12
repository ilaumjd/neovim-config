return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    -- lsp_lines
    local lsp_lines = require("lsp_lines")
    lsp_lines.setup()
    vim.keymap.set("", "<Leader>xl", lsp_lines.toggle, { desc = "Toggle lsp_lines" })

    -- virtual_text
    vim.diagnostic.config({
      virtual_text = false,
    })
    vim.keymap.set("", "<Leader>xv", function()
      local new_value = not vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = new_value })
      print("Virtual text " .. (new_value and "enabled" or "disabled"))
    end, { desc = "Toggle virtual_text" })
  end,
}
