return {
  "startup-nvim/startup.nvim",
  dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    local function get_neovim_version()
      local v = vim.version()
      return string.format("Neovim v%d.%d.%d", v.major, v.minor, v.patch)
    end

    require"startup".setup({
      header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
          "•┓       • ┓",
          "┓┃┏┓┓┏┏┳┓┓┏┫",
          "┗┗┗┻┗┻┛┗┗┃┗┻",
          "         ┛  ",
        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
      },
      body = {
        type = "mapping",
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
          { " Find File", "Telescope find_files", "f" },
          { " New File", "enew", "n" },
          { " Recent Files", "Telescope oldfiles", "r" },
          { " Find Text", "Telescope live_grep", "g" },
          { " Bookmarks", "Telescope marks", "b" },
          { " Quit", "qa", "q" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
      },
      footer = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { get_neovim_version(), stats.count .. " plugins loaded in " .. ms .. "ms" }
        end,
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
      },
      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = {1,2,2,2,1},
      },
      mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
      },
      colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
      },
      parts = {"header", "body", "footer"},
    })
  end
}
