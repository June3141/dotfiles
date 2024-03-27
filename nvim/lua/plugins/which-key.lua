-- help
-- utils
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function ()
    -- fix modes.nvim problem
    require('which-key').setup({
      triggers_blacklist = {
              n = { "d", "y" }
      }
    })
  end
}