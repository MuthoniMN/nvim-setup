return {
  "scottmckendry/cyberdream.nvim",
  name = "cyberdream",
  lazy = false,
  priority = 1000,
  opts = {
    italic_comments = true,
    extensions = {
      telescope = true,
      notify = true,
      mini = true,
      treesitter = true,
      lualine = true,
    },
  },
  config = function()
    require("cyberdream").setup({
      transparent = true,
      hide_fillchars = true,
      terminal_colors = true,
      theme = {
        variant = "default",
      },
    })
    vim.cmd.colorscheme('cyberdream')
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "black", bg = "white" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
  end
}
