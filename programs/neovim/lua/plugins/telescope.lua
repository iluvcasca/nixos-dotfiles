local actions = require ('telescope.actions');
require('telescope').setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	},
    defaults = {
       mappings = {
         i = {
           ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
         },
         n = {
           ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
         },
       },
     },
})

require('telescope').load_extension('fzf')

