-- return {
--   'nvim-orgmode/orgmode',
--   event = 'VeryLazy',
--   config = function()
--     require('orgmode').setup({
--       org_agenda_files = '~/orgfiles/**/*',
--       org_default_notes_file = '~/orgfiles/refile.org',
--     })
--   end,
-- }
return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' }
    },
    config = function()
      -- require("orgmode").setup_ts_grammar()
      -- require("nvim-treesitter.configs").setup({
      --   highlight = {
      --     enable = true,
      --     additional_vim_regex_highlighting = { "org" },
      --   },
      --   ensure_installed = { "org" }, -- Or run :TSUpdate org
      -- })
      require("orgmode").setup({
        org_agenda_files = { "~/Documents/org-files/**/*" },
        org_default_notes_file = "~/Documents/org-files/refile.org",
        org_todo_keywords = { "TODO(t)", "|", "DONE(d)" },
        org_capture_templates = {
          t = {
            description = "Todo",
            template = "* TODO %?\n%U",
            target = "~/Documents/org-files/todo.org",
          },
          j = {
            description = "Journal",
            template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
            target = "~/Documents/org-files/journal.org",
          },
          n = {
            description = "Notes",
            template = "* %?\n %u",
            target = "~/Documents/org-files/notes.org",
          },
        },
      })
    end,
  },
}

-- return {
--   'nvim-orgmode/orgmode',
--   dependencies = {
--     { 'nvim-treesitter/nvim-treesitter', lazy = true },
--   },
--   event = 'VeryLazy',
--   config = function()
--     -- Load treesitter grammar for org
--     require('orgmode').setup_ts_grammar()
-- 
--     -- Setup treesitter
--     require('nvim-treesitter.configs').setup({
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { 'org' },
--       },
--       ensure_installed = { 'org' },
--     })
-- 
--     -- Setup orgmode
--     require('orgmode').setup({
--       org_agenda_files = '~/orgfiles/**/*',
--       org_default_notes_file = '~/orgfiles/refile.org',
--     })
--   end,
-- }

--return {
--  "nvim-neorg/neorg",
--    build = ":Neorg sync-parsers",
--    dependencies = { "nvim-lua/plenary.nvim" },
--    config = function()
--      require("neorg").setup {
--        load = {
--          ["core.defaults"] = {}, -- Loads default behaviour
--          ["core.concealer"] = {}, -- Adds pretty icons to your documents
--          ["core.dirman"] = { -- Manages Neorg workspaces
--            config = {
--              workspaces = {
--                notes = "~/notes",
--              },
--            },
--          },
--        },
--      }
--    end,
--  }
