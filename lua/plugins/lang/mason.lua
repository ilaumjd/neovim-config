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
        ensure_installed = {
          "clangd",
          "eslint",
          "lua_ls",
          "nil_ls",
          "rust_analyzer",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },
}
