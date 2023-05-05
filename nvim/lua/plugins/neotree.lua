return {
  "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
   dependencies = {
 "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
"MunifTanjim/nui.nvim",
  },
    config = function()
      require("neo-tree").setup({
          window = {
              mappings = {
                  ["l"] = "open",
                  ["h"] = "close_node",
                  --["l"] = "focus_preview"

              }
          }

      })
    end,
}
