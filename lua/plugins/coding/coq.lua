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
        jump_to_mark = "<C-\\>",
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
}
