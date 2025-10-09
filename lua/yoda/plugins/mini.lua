local M = {}

function M.highlights(colors, set)
	-- Mini.nvim has many modules, so we'll support the most common ones

	-- mini.statusline
	set(0, "MiniStatuslineModeNormal", { fg = colors.bg, bg = colors.accent })
	set(0, "MiniStatuslineModeInsert", { fg = colors.bg, bg = colors.interface })
	set(0, "MiniStatuslineModeVisual", { fg = colors.bg, bg = colors.pink })
	set(0, "MiniStatuslineModeReplace", { fg = colors.bg, bg = colors.error })
	set(0, "MiniStatuslineModeCommand", { fg = colors.bg, bg = colors.brown })
	set(0, "MiniStatuslineModeOther", { fg = colors.bg, bg = colors.dim })
	set(0, "MiniStatuslineDevinfo", { fg = colors.fg, bg = colors.bg_light })
	set(0, "MiniStatuslineFilename", { fg = colors.fg, bg = colors.bg_light })
	set(0, "MiniStatuslineFileinfo", { fg = colors.dim, bg = colors.bg_light })
	set(0, "MiniStatuslineInactive", { fg = colors.dim, bg = colors.bg_dark })

	-- mini.tabline
	set(0, "MiniTablineCurrent", { fg = colors.fg, bg = colors.bg_highlight, bold = true })
	set(0, "MiniTablineVisible", { fg = colors.fg, bg = colors.bg_light })
	set(0, "MiniTablineHidden", { fg = colors.dim, bg = colors.bg_dark })
	set(0, "MiniTablineModifiedCurrent", { fg = colors.warning, bg = colors.bg_highlight, bold = true })
	set(0, "MiniTablineModifiedVisible", { fg = colors.warning, bg = colors.bg_light })
	set(0, "MiniTablineModifiedHidden", { fg = colors.warning, bg = colors.bg_dark })
	set(0, "MiniTablineFill", { bg = colors.bg })

	-- mini.starter
	set(0, "MiniStarterCurrent", { fg = colors.accent })
	set(0, "MiniStarterFooter", { fg = colors.dim, italic = true })
	set(0, "MiniStarterHeader", { fg = colors.accent, bold = true })
	set(0, "MiniStarterInactive", { fg = colors.dim })
	set(0, "MiniStarterItem", { fg = colors.fg })
	set(0, "MiniStarterItemBullet", { fg = colors.dim })
	set(0, "MiniStarterItemPrefix", { fg = colors.warning })
	set(0, "MiniStarterSection", { fg = colors.pink, bold = true })
	set(0, "MiniStarterQuery", { fg = colors.interface })

	-- mini.indentscope
	set(0, "MiniIndentscopeSymbol", { fg = colors.dim })
	set(0, "MiniIndentscopeSymbolOff", { fg = colors.bg_highlight })

	-- mini.jump
	set(0, "MiniJump", { fg = colors.bg, bg = colors.accent, bold = true })

	-- mini.jump2d
	set(0, "MiniJump2dSpot", { fg = colors.accent, bold = true, nocombine = true })

	-- mini.map
	set(0, "MiniMapNormal", { fg = colors.dim, bg = colors.bg_dark })
	set(0, "MiniMapSymbolCount", { fg = colors.accent })
	set(0, "MiniMapSymbolLine", { fg = colors.interface })
	set(0, "MiniMapSymbolView", { fg = colors.pink })

	-- mini.notify
	set(0, "MiniNotifyBorder", { fg = colors.border })
	set(0, "MiniNotifyNormal", { fg = colors.fg, bg = colors.bg_light })
	set(0, "MiniNotifyTitle", { fg = colors.accent, bold = true })

	-- mini.pick
	set(0, "MiniPickBorder", { fg = colors.border })
	set(0, "MiniPickBorderBusy", { fg = colors.accent })
	set(0, "MiniPickBorderText", { fg = colors.accent, bold = true })
	set(0, "MiniPickHeader", { fg = colors.accent, bold = true })
	set(0, "MiniPickIconDirectory", { fg = colors.interface })
	set(0, "MiniPickIconFile", { fg = colors.fg })
	set(0, "MiniPickMatchCurrent", { fg = colors.accent, bg = colors.bg_highlight })
	set(0, "MiniPickMatchMarked", { fg = colors.warning, bg = colors.bg_light })
	set(0, "MiniPickMatchRanges", { fg = colors.accent, bold = true })
	set(0, "MiniPickNormal", { fg = colors.fg })
	set(0, "MiniPickPreviewLine", { bg = colors.selection })
	set(0, "MiniPickPreviewRegion", { bg = colors.selection })
	set(0, "MiniPickPrompt", { fg = colors.accent })

	-- mini.surround
	set(0, "MiniSurround", { fg = colors.bg, bg = colors.accent })

	-- mini.test
	set(0, "MiniTestEmphasis", { bold = true })
	set(0, "MiniTestFail", { fg = colors.error, bold = true })
	set(0, "MiniTestPass", { fg = colors.accent, bold = true })

	-- mini.trailspace
	set(0, "MiniTrailspace", { bg = colors.error })
end

return M