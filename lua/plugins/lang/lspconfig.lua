return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
      lspconfig.eslint.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.nil_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.ts_ls.setup({})

      -- Keymaps
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

      -- Show diagnostic on hover
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end,
  },
}
