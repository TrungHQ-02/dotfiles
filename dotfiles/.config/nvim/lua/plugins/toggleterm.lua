return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        size = 20,
        shade_terminals = false,
        shell = "zsh --login",
      })
    end,
    keys = {
      { [[<C-\>]] },
      { "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
      {
        "<leader>td",
        "<cmd>ToggleTerm size=30 direction=horizontal<cr>",
        desc = "Open a horizontal terminal",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm size=30 direction=vertical<cr>",
        desc = "Open a vertical terminal",
      },
      {
        "<leader>tf",
        "<cmd>ToggleTerm size=30 direction=float<cr>",
        desc = "Open a float terminal",
      },
    },
  },
}
