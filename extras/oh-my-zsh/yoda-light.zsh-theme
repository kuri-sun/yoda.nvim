#!/usr/bin/env zsh
# ──────────────────────────────────────────────
# Yoda Theme for Oh My Zsh — Light Variant (Powerlevel10k Style)
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
local yoda_bg_light="%K{255}"     # Light background
local reset_color="%f"
local reset_bg="%k"

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
local segment_separator=""
local segment_separator_reverse=""

# Function to detect OS and return appropriate icon
function os_icon() {
    local os_symbol=""
    case "$(uname -s)" in
        Darwin)
            os_symbol=""  # macOS logo
            ;;
        Linux)
            if [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null; then
                os_symbol=""  # Windows WSL
            elif [[ -f /etc/arch-release ]]; then
                os_symbol=""  # Arch Linux
            elif [[ -f /etc/debian_version ]]; then
                os_symbol=""  # Debian/Ubuntu
            elif [[ -f /etc/redhat-release ]]; then
                os_symbol=""  # RedHat/Fedora/CentOS
            else
                os_symbol=""  # Generic Linux
            fi
            ;;
        CYGWIN*|MINGW*|MSYS*)
            os_symbol=""  # Windows
            ;;
        *)
            os_symbol="⚡"  # Unknown
            ;;
    esac
    echo "%K{252}%F{78} ${os_symbol} %f%k%F{252}${segment_separator}%f"
}

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="${yoda_subtle}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset_color}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${yoda_yellow}${git_dirty_symbol}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${yoda_green}${git_clean_symbol}"

# Git status
ZSH_THEME_GIT_PROMPT_ADDED="${yoda_green}${git_added_symbol}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${yoda_yellow}${git_modified_symbol}"
ZSH_THEME_GIT_PROMPT_DELETED="${yoda_red}${git_deleted_symbol}"
ZSH_THEME_GIT_PROMPT_RENAMED="${yoda_blue}${git_renamed_symbol}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${yoda_red}${git_unmerged_symbol}"
ZSH_THEME_GIT_PROMPT_AHEAD="${yoda_cyan}${git_ahead_symbol}"
ZSH_THEME_GIT_PROMPT_BEHIND="${yoda_cyan}${git_behind_symbol}"

# Function to display Python virtual environment with background
function virtualenv_prompt_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "%K{111}%F{16}  ${VIRTUAL_ENV:t} %f%k%F{111}${segment_separator}%f"
    fi
}

# Function to display Node version with background
function node_prompt_info() {
    if command -v node &> /dev/null && [[ -f package.json ]]; then
        echo "%K{78}%F{16}  $(node -v) %f%k%F{78}${segment_separator}%f"
    fi
}

# Function to get current directory (truncated) with background
function get_pwd() {
    echo "%K{254}%F{34}  %~  %f%k%F{254}${segment_separator}%f"
}

# Function to get user and host
function user_host() {
    local user_host_string=""
    if [[ -n "$SSH_CONNECTION" ]]; then
        # Show full user@host for SSH
        user_host_string="${yoda_pink}%n${yoda_dim}@${yoda_pink}%m ${reset_color}"
    else
        # Don't show username for local sessions (minimal)
        user_host_string=""
    fi
    echo "$user_host_string"
}

# Function to display git info if in a git repo with background
function git_prompt_segment() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local git_status=""
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            git_status=" ${yoda_yellow}${git_dirty_symbol}"
        else
            git_status=" ${yoda_green}${git_clean_symbol}"
        fi
        echo "%K{250}%F{245}  ${branch}${git_status}  %f%k%F{250}${segment_separator}%f"
    fi
}

# Function to get status code indicator
function status_indicator() {
    echo "%(?.${yoda_green}.${yoda_red})${prompt_symbol}${reset_color}"
}

# Main prompt (multi-line with backgrounds)
PROMPT='
$(os_icon)$(get_pwd)$(git_prompt_segment)$(virtualenv_prompt_info)$(node_prompt_info)
$(status_indicator) '

# Right prompt (disabled for minimal aesthetic)
RPROMPT=''

# Secondary prompt
PS2='${yoda_dim}%_${yoda_accent} ${prompt_symbol}${reset_color} '

# Selection prompt
PS3='${yoda_accent}?# ${reset_color}'

# Execution trace prompt
PS4='${yoda_dim}+%N:%i${yoda_accent} ${prompt_symbol}${reset_color} '

