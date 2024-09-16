return {
  "jiaoshijie/undotree",
  config = function()
    require("undotree").setup({
      float_diff = false,
      layout = "left_left_bottom",
      position = "left",
    })
  end,
  keys = {
    { "<leader>cu", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
