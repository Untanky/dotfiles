local builtin = require("telescope.builtin")
local wk = require('which-key')

local mapping = {
  -- make editing nicer
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "n",     "nzzzv",   desc = "Next search result and center" },
  { "N",     "Nzzzv",   desc = "Previous search result and center" },
  -- { "Q"      "<nop>",   desc = "Disable Ex mode" },

  -- find
  { "<leader>f",  group = "Find" },
}


wk.add(mapping)
