return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  event = "InsertEnter",
  dependencies = {
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { "ms-jpq/coq.thirdparty", branch = "3p" },
  },
  init = function()
    -- Disable built-in autocompletion
    vim.g.coq_settings = {
      auto_start = "shut-up",
      keymap = {
        recommended = false,
        manual_complete = "<C-Space>",
      },
      clients = {
        snippets = {
          warn = {},
        },
        tmux = {
          enabled = false,
        },
        tree_sitter = {
          enabled = false,
        },
      },
    }
  end,
  config = function()
    local coq = require("coq")

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
      -- Your Lua LSP settings here
    }))

    vim.keymap.set("i", "<C-h>", function()
      return vim.fn.pumvisible() == 1 and "<C-e>" or "<C-h>"
    end, { expr = true })
    vim.keymap.set("i", "<C-j>", function()
      return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
    end, { expr = true })
    vim.keymap.set("i", "<C-k>", function()
      return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
    end, { expr = true })
  end,
}
