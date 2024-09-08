return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      require("lspconfig").nil_ls.setup({})
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "nixfmt" },
      },
    },
  },
}
