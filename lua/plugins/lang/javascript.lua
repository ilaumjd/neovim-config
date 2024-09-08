return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      require("lspconfig").ts_ls.setup({})
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        jsx = { "prettier" },
        tsx = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        jsx = { "eslint" },
        tsx = { "eslint" },
        json = { "eslint" },
        html = { "eslint" },
        css = { "eslint" },
        yaml = { "eslint" },
      }
    end,
  },
}
