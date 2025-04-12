local c = function()
	-- Bubbles config for lualine
	-- Author: lokesh-krishna
	-- MIT license, see LICENSE for more details.

	-- stylua: ignore
	local colors = {
		blue   = '#80a0ff',
		cyan   = '#79dac8',
		black  = '#080808',
		white  = '#c6c6c6',
		yellow = '#ECBE7B',
		green    = '#98be65',
		orange   = '#FF8800',
		red    = '#ff5189',
		violet = '#d183e8',
		grey   = '#303030',
	}

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.white },
		},

		insert = { a = { fg = colors.black, bg = colors.blue } },
		visual = { a = { fg = colors.black, bg = colors.cyan } },
		replace = { a = { fg = colors.black, bg = colors.red } },

		inactive = {
			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.white },
		},
	}

	require('lualine').setup {
		options = {
			theme = bubbles_theme,
			component_separators = '',
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = {{
				'mode',
				color = function()
					-- auto change color according to neovims mode
					local mode_color = {
						n = colors.red,
						i = colors.green,
						v = colors.blue,
						[''] = colors.blue,
						V = colors.blue,
						c = colors.magenta,
						no = colors.red,
						s = colors.orange,
						S = colors.orange,
						[''] = colors.orange,
						ic = colors.yellow,
						R = colors.violet,
						Rv = colors.violet,
						cv = colors.red,
						ce = colors.red,
						r = colors.cyan,
						rm = colors.cyan,
						['r?'] = colors.cyan,
						['!'] = colors.red,
						t = colors.magenta,
					}
					return { bg = mode_color[vim.fn.mode()] }
			end,
				separator = { left = '' }, right_padding = 2
			}},
			lualine_b = { 'filename',
				{'branch', icon = '', color = { fg = colors.cyan, gui = 'bold' } }
			},
			lualine_c = {{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				symbols = { error = ' ', warn = ' ', info = ' ' },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			}},
			lualine_x = {{
				'diff',
				-- Is it me or the symbol for modified us really weird
				symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				-- cond = conditions.hide_in_width,
			}},
			lualine_y = { 'filetype', 'progress' },
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { 'filename' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'location' },
		},
		tabline = {},
		extensions = {
			'oil',
			'toggleterm',
			'quickfix',
		},
	}
end

return c
