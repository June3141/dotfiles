-- fuzzy finder
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		-- for coc
		'fannheyward/telescope-coc.nvim'
	},
	keys = {
		{ '<C-j>i', ':Telescope coc implementations<CR>' },
		{ '<C-j>h', ':Telescope coc references<CR>' }
	},
	config = function ()
		require('telescope').setup {
			extensions = {
				coc = {
					prefer_locations = false,
				},
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				}
			}
		}
		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require('telescope').load_extension('coc')
		require('telescope').load_extension('fzf')
	end
}
