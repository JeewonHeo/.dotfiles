return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "bash"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true , disable = {}},
      })

		-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		-- parser_config.org = {
  	-- install_info = {
  	--   url = "https://github.com/milisims/tree-sitter-org",
  	--   files = { "src/parser.c"},
  	--   branch = "main",
  	-- },
  	-- filetype = "org",
		-- }
  end
}
