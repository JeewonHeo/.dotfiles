return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.config")

    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "bash" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true, disable = {} },
    })
  end,
}
