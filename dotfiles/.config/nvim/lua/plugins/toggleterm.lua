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
        "<cmd>ToggleTerm size=30 dir=~/Desktop direction=horizontal<cr>",
        desc = "Open a smaller horizontal terminal at the Desktop directory",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm size=30 direction=vertical<cr>",
        desc = "Open a vertical terminal",
      },
    },
  },
}
