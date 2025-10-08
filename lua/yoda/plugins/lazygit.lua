local M = {}

function M.highlights(colors, set)
	-- Lazygit highlights (balanced lightsaber theme, less green-heavy)
	set(0, "LazyGitBorder", { fg = colors.border })
	set(0, "LazyGitTitle", { fg = colors.bright, bold = true })
	set(0, "LazyGitNormal", { fg = colors.fg, bg = colors.bg })

	-- File status (warm, non-green palette)
	set(0, "LazyGitModified", { fg = colors.brown }) -- Warm brown for modified
	set(0, "LazyGitAdded", { fg = colors.interface }) -- Blue-gray for added (no green)
	set(0, "LazyGitDeleted", { fg = colors.error }) -- Red for deleted
	set(0, "LazyGitRenamed", { fg = colors.pink }) -- Pink for renamed
	set(0, "LazyGitUntracked", { fg = colors.brown_dim }) -- Warm dim for untracked
	set(0, "LazyGitStaged", { fg = colors.white }) -- White for staged (clean)
	set(0, "LazyGitConflicted", { fg = colors.warning }) -- Yellow for conflicts

	-- Branch and commit colors (warm, non-green tones)
	set(0, "LazyGitBranch", { fg = colors.interface, bold = true }) -- Blue-gray for branches
	set(0, "LazyGitLocalBranch", { fg = colors.brown }) -- Brown for local
	set(0, "LazyGitRemoteBranch", { fg = colors.pink }) -- Pink for remote
	set(0, "LazyGitCommit", { fg = colors.brown_dim }) -- Warm brown for commits
	set(0, "LazyGitTag", { fg = colors.bright }) -- White for tags

	-- UI elements (neutral focus highlight - no green)
	set(0, "LazyGitSelected", { fg = colors.bg, bg = colors.interface }) -- Dark text on blue-gray
	set(0, "LazyGitSelectedBold", { fg = colors.bg, bg = colors.interface, bold = true }) -- Bold for emphasis
	set(0, "LazyGitHeader", { fg = colors.interface, bold = true })
	set(0, "LazyGitKey", { fg = colors.brown }) -- Brown instead of green for keys
	set(0, "LazyGitOption", { fg = colors.brown_dim })

	-- Diff colors (warm, non-green focus)
	set(0, "LazyGitDiffAdd", { fg = colors.brown_dim }) -- Brown instead of green
	set(0, "LazyGitDiffDelete", { fg = colors.error }) -- Red for deletions
	set(0, "LazyGitDiffChange", { fg = colors.interface }) -- Blue-gray for changes
	set(0, "LazyGitDiffHeader", { fg = colors.white, bold = true })

	-- Additional status colors (no green)
	set(0, "LazyGitIgnored", { fg = colors.brown_dim })
	set(0, "LazyGitUpstream", { fg = colors.pink })
end

return M