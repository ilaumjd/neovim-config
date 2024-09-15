return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    })

    local map = vim.keymap.set

    -- Peek
    map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" })
    map("n", "J", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
    map("n", "U", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })

    -- Go to
    map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
    map("n", "gy", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Go to Type Definition" })
    map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })

    -- Code
    map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
    map("n", "<leader>cm", "<cmd>Lspsaga outline<CR>", { desc = "Code Map Outline" })
    map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" })
    map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" })

    -- Diagnostics
    map("n", "<leader>xd", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
    map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic" })
    map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
  end,
}
