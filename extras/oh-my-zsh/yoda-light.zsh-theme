#!/usr/bin/env zsh
# ──────────────────────────────────────────────
# Yoda Theme for Oh My Zsh — Light Variant
# Colors approximated to xterm-256 for wide support
# ──────────────────────────────────────────────

# Color definitions from yoda.nvim light palette
# (hex in comments are references; 256-color indexes used)
local yoda_green="%F{78}"         # Accent green (#3bb07a)
local yoda_accent="%F{78}"        # Accent green (#3bb07a)
local yoda_dim="%F{242}"          # Dim gray (#56606b)
local yoda_subtle="%F{245}"       # Subtle gray (#6b7280)
local yoda_yellow="%F{222}"       # Yellow/orange (#f0c98a/#efbe71)
local yoda_red="%F{174}"          # Red (#e38a8a)
local yoda_cyan="%F{110}"         # Cyan (#5fb4da)
local yoda_white="%F{16}"         # Dark text on light bg (#1a1d1f)
local yoda_pink="%F{168}"         # Pink (#b0307a)
local yoda_blue="%F{111}"         # Blue (#6aa8ef)
local yoda_string_green="%F{34}"  # String green (#2e7d32)
local yoda_brown="%F{179}"        # Brown/functions (#b88347)
local reset_color="%f"

# Symbols
local prompt_symbol="❯"
local git_dirty_symbol="✗"
local git_clean_symbol="✓"
local git_added_symbol="+"
local git_modified_symbol="!"
local git_deleted_symbol="−"
local git_renamed_symbol="»"
local git_unmerged_symbol="‡"
local git_ahead_symbol="⇡"
local git_behind_symbol="⇣"

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="${yoda_subtle}(${yoda_subtle}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${yoda_subtle})${reset_color} "
ZSH_THEME_GIT_PROMPT_DIRTY=" ${yoda_brown}${git_dirty_symbol}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${yoda_green}${git_clean_symbol}"

# Git status
ZSH_THEME_GIT_PROMPT_ADDED="${yoda_green}${git_added_symbol}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${yoda_yellow}${git_modified_symbol}"
ZSH_THEME_GIT_PROMPT_DELETED="${yoda_red}${git_deleted_symbol}"
ZSH_THEME_GIT_PROMPT_RENAMED="${yoda_blue}${git_renamed_symbol}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${yoda_red}${git_unmerged_symbol}"
ZSH_THEME_GIT_PROMPT_AHEAD="${yoda_cyan}${git_ahead_symbol}"
ZSH_THEME_GIT_PROMPT_BEHIND="${yoda_cyan}${git_behind_symbol}"

# Virtual environment
ZSH_THEME_VIRTUALENV_PREFIX="${yoda_dim}("
ZSH_THEME_VIRTUALENV_SUFFIX=") ${reset_color}"

# Function to display Python virtual environment
function virtualenv_prompt_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "${ZSH_THEME_VIRTUALENV_PREFIX}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX}"
    fi
}

# Function to get current directory (truncated)
function get_pwd() {
    echo "${yoda_string_green}%~${reset_color}"
}

# Function to get user and host for SSH sessions
function user_host() {
    if [[ -n "$SSH_CONNECTION" ]]; then
        echo "${yoda_pink}%n${yoda_dim}@${yoda_pink}%m${reset_color} "
    fi
}

# Main prompt
PROMPT='\n$(user_host)$(get_pwd) $(git_prompt_info)$(virtualenv_prompt_info)\n${yoda_accent}${prompt_symbol}${reset_color} '

# Right prompt (optional - shows time)
RPROMPT='${yoda_dim}%T${reset_color}'

# Secondary prompt
PS2='${yoda_dim}%_${yoda_accent} ${prompt_symbol}${reset_color} '

# Selection prompt
PS3='${yoda_accent}?# ${reset_color}'

# Execution trace prompt
PS4='${yoda_dim}+%N:%i${yoda_accent} ${prompt_symbol}${reset_color} '

