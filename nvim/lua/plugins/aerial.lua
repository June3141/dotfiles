return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {},
    config = function ()
        -- for telescope
        require("telescope").load_extension("aerial")
    end
}