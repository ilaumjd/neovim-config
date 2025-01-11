return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      go = { "gofmt" },
      lua = { "stylua" },
      nix = { "nixfmt" },
      eruby = { "erb_format" },
      ruby = { "rubocop" },
      rust = { "rustfmt" },
      sql = { "sql_formatter" },
      swift = { "swiftformat" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      yaml = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 2500,
      lsp_fallback = true,
    },
    formatters = {
      sql_formatter = {
        inherit = false,
        command = "sql-formatter",
        args = { "-l", "postgresql" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
