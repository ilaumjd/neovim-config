return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        adaptive_size = false,
        width = 30,
        side = "left",
        signcolumn = "no",
        preserve_window_proportions = false,
      },
      renderer = {
        group_empty = true,
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    })

    -- Auto-open nvim-tree when opening a directory
    local function open_nvim_tree(data)
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- Function to expand and focus on the current file
    local function focus_current_file()
      local api = require("nvim-tree.api")
      local current_file = vim.fn.expand("%:p")
      if current_file ~= "" then
        api.tree.open()
        api.tree.find_file(current_file, true)
      end
    end

    -- Keymap to toggle tree and focus on current file
    vim.keymap.set("n", "<leader>e", function()
      if require("nvim-tree.view").is_visible() then
        require("nvim-tree.api").tree.toggle()
      else
        focus_current_file()
      end
    end, { desc = "Toggle file explorer and focus current file" })
  end,
}
