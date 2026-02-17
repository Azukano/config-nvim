return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.config")
    config.setup({
      ensure_installed = {"lua", "javascript", "elixir", "heex"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
