return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer" },
        automatic_installation = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup({})

      if opts.servers.sourcekit then
        lspconfig.sourcekit.setup(opts.servers.sourcekit)
      end

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Quickfix Diagnostics" })

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
    opts = {
      servers = {
        sourcekit = {
          root_dir = function(filename, _)
            local util = require("lspconfig.util")
            return util.root_pattern("buildServer.json")(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.find_git_ancestor(filename)
              or util.root_pattern("Package.swift")(filename)
          end,
        },
      },
    },
  },
}
