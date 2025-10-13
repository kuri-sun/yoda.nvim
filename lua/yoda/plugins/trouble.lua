local M = {}

function M.highlights(colors, set)
    -- Main window
    set(0, "TroubleNormal", { fg = colors.fg, bg = colors.bg })
    set(0, "TroubleNormalNC", { fg = colors.fg, bg = colors.bg_dark })

    -- Counts
    set(0, "TroubleCount", { fg = colors.accent, bg = colors.bg_highlight })

    -- Icons and text
    set(0, "TroubleIconArray", { fg = colors.interface })
    set(0, "TroubleIconBoolean", { fg = colors.string })
    set(0, "TroubleIconClass", { fg = colors.interface })
    set(0, "TroubleIconConstant", { fg = colors.number })
    set(0, "TroubleIconConstructor", { fg = colors.brown })
    set(0, "TroubleIconDirectory", { fg = colors.dim })
    set(0, "TroubleIconEnum", { fg = colors.interface })
    set(0, "TroubleIconEnumMember", { fg = colors.number })
    set(0, "TroubleIconEvent", { fg = colors.interface })
    set(0, "TroubleIconField", { fg = colors.fg })
    set(0, "TroubleIconFile", { fg = colors.fg })
    set(0, "TroubleIconFunction", { fg = colors.brown })
    set(0, "TroubleIconInterface", { fg = colors.interface })
    set(0, "TroubleIconKey", { fg = colors.pink })
    set(0, "TroubleIconMethod", { fg = colors.brown })
    set(0, "TroubleIconModule", { fg = colors.interface })
    set(0, "TroubleIconNamespace", { fg = colors.interface })
    set(0, "TroubleIconNull", { fg = colors.dim })
    set(0, "TroubleIconNumber", { fg = colors.number })
    set(0, "TroubleIconObject", { fg = colors.interface })
    set(0, "TroubleIconOperator", { fg = colors.subtle })
    set(0, "TroubleIconPackage", { fg = colors.interface })
    set(0, "TroubleIconProperty", { fg = colors.fg })
    set(0, "TroubleIconString", { fg = colors.string_green })
    set(0, "TroubleIconStruct", { fg = colors.interface })
    set(0, "TroubleIconTypeParameter", { fg = colors.interface })
    set(0, "TroubleIconVariable", { fg = colors.fg })

    -- Indentation
    set(0, "TroubleIndent", { fg = colors.bg_highlight })
    set(0, "TroubleIndentFoldClosed", { fg = colors.dim })
    set(0, "TroubleIndentFoldOpen", { fg = colors.dim })
    set(0, "TroubleIndentLast", { fg = colors.bg_highlight })
    set(0, "TroubleIndentMiddle", { fg = colors.bg_highlight })
    set(0, "TroubleIndentTop", { fg = colors.bg_highlight })
    set(0, "TroubleIndentWs", { fg = colors.bg_highlight })

    -- Position
    set(0, "TroublePos", { fg = colors.dim })

    -- Preview
    set(0, "TroublePreview", { bg = colors.selection })

    -- Source
    set(0, "TroubleSource", { fg = colors.dim })

    -- Text elements
    set(0, "TroubleText", { fg = colors.fg })
    set(0, "TroubleTextError", { fg = colors.error })
    set(0, "TroubleTextHint", { fg = colors.interface })
    set(0, "TroubleTextInformation", { fg = colors.interface })
    set(0, "TroubleTextWarning", { fg = colors.warning })

    -- Filenames
    set(0, "TroubleFilename", { fg = colors.fg })
    set(0, "TroubleDirectory", { fg = colors.dim })

    -- Code
    set(0, "TroubleCode", { fg = colors.dim })

    -- Location
    set(0, "TroubleLocation", { fg = colors.dim })

    -- Fold icons
    set(0, "TroubleFoldIcon", { fg = colors.dim })

    -- Signs
    set(0, "TroubleSignError", { fg = colors.error })
    set(0, "TroubleSignHint", { fg = colors.interface })
    set(0, "TroubleSignInformation", { fg = colors.interface })
    set(0, "TroubleSignOther", { fg = colors.dim })
    set(0, "TroubleSignWarning", { fg = colors.warning })
end

return M
