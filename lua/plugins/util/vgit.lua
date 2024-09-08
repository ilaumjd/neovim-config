return {
  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = { enabled = true },
          live_gutter = { enabled = true },
          authorship_code_lens = { enabled = true },
          scene = { diff_preference = "split" },
          diff_preview = {
            keymaps = {
              buffer_stage = "S",
              buffer_unstage = "U",
              buffer_hunk_stage = "s",
              buffer_hunk_unstage = "u",
              toggle_view = "t",
              close = "q",
            },
          },
        },
      })

      vim.keymap.set("n", "<C-k>", function()
        require("vgit").hunk_up()
      end, { desc = "Previous hunk" })
      vim.keymap.set("n", "<C-j>", function()
        require("vgit").hunk_down()
      end, { desc = "Next hunk" })
      vim.keymap.set("n", "<leader>gs", function()
        require("vgit").buffer_hunk_stage()
      end, { desc = "Stage hunk" })
      vim.keymap.set("n", "<leader>gr", function()
        require("vgit").buffer_hunk_reset()
      end, { desc = "Reset hunk" })
      vim.keymap.set("n", "<leader>gp", function()
        require("vgit").buffer_hunk_preview()
      end, { desc = "Preview hunk" })
      vim.keymap.set("n", "<leader>gb", function()
        require("vgit").buffer_blame_preview()
      end, { desc = "Blame preview" })
      vim.keymap.set("n", "<leader>gf", function()
        require("vgit").buffer_diff_preview()
      end, { desc = "File diff preview" })
      vim.keymap.set("n", "<leader>gh", function()
        require("vgit").buffer_history_preview()
      end, { desc = "File history preview" })
      vim.keymap.set("n", "<leader>gu", function()
        require("vgit").buffer_reset()
      end, { desc = "Reset buffer" })
      vim.keymap.set("n", "<leader>gl", function()
        require("vgit").buffer_gutter_blame_preview()
      end, { desc = "Gutter blame preview" })
      vim.keymap.set("n", "<leader>gH", function()
        require("vgit").buffer_hunks_preview()
      end, { desc = "Buffer hunks preview" })
      vim.keymap.set("n", "<leader>gS", function()
        require("vgit").project_hunks_staged_preview()
      end, { desc = "Staged hunks preview" })
      vim.keymap.set("n", "<leader>gd", function()
        require("vgit").project_diff_preview()
      end, { desc = "Project diff preview" })
      vim.keymap.set("n", "<leader>gq", function()
        require("vgit").project_hunks_qf()
      end, { desc = "Hunks to quickfix" })
      vim.keymap.set("n", "<leader>gx", function()
        require("vgit").toggle_diff_preference()
      end, { desc = "Toggle diff preference" })
    end,
  },
}
