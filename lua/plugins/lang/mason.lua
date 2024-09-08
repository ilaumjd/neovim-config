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
          "eslint",
          "lua_ls",
          "nil_ls",
          "rust_analyzer",
          "tsserver",
        },
        automatic_installation = true,
      })
    end,
  },
}
