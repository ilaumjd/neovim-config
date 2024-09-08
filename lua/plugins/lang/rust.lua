return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      require("lspconfig").rust_analyzer.setup({})
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = function()
      require("lint").linters_by_ft = {
        rust = { "clippy" },
      }
    end,
  },
}
