#!/usr/bin/env zsh
# ──────────────────────────────────────────────
# Yoda Theme for Oh My Zsh — Powerlevel10k Style
# ──────────────────────────────────────────────

# Color definitions from yoda.nvim palette
local yoda_green="%F{46}"      # Bright green (#00ff99)
local yoda_accent="%F{35}"     # Accent green (#00dd88)
local yoda_dim="%F{65}"        # Dim green (#5a7a5a)
local yoda_subtle="%F{108}"    # Subtle green (#7a9a8a)
local yoda_yellow="%F{227}"    # Yellow (#ffee58)
local yoda_red="%F{203}"       # Red (#ff6666)
local yoda_cyan="%F{116}"      # Cyan (#7dd3c0)
local yoda_white="%F{255}"     # White (#e5e5e5)
local yoda_pink="%F{218}"      # Pink (#e6a3d0)
local yoda_blue="%F{74}"       # Blue interface (#4fa8d8)
local yoda_string_green="%F{194}"  # String green (#b9f6ca)
local yoda_brown="%F{180}"     # Brown (#d4a574)
local yoda_bg_dark="%K{232}"   # Dark background
local yoda_bg_light="%K{234}"  # Slightly lighter background
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
            os_symbol=" "  # macOS logo
            ;;
        Linux)
            if [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null; then
                os_symbol=" "  # Windows WSL
            elif [[ -f /etc/arch-release ]]; then
                os_symbol="󰣇 "  # Arch Linux
            elif [[ -f /etc/debian_version ]]; then
                os_symbol=" "  # Debian/Ubuntu
            elif [[ -f /etc/redhat-release ]]; then
                os_symbol=" "  # RedHat/Fedora/CentOS
            else
                os_symbol=" "  # Generic Linux
            fi
            ;;
        CYGWIN*|MINGW*|MSYS*)
            os_symbol=""  # Windows
            ;;
        *)
            os_symbol="⚡"  # Unknown
            ;;
    esac
    echo "%K{235}%F{46} ${os_symbol} %f%k%F{235}${segment_separator}%f"
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
        echo "%K{24}%F{255}  ${VIRTUAL_ENV:t} %f%k%F{24}${segment_separator}%f"
    fi
}

# Function to display Node version with background
function node_prompt_info() {
    if command -v node &> /dev/null && [[ -f package.json ]]; then
        echo "%K{22}%F{46}  $(node -v) %f%k%F{22}${segment_separator}%f"
    fi
}

# Function to get current directory (truncated) with background
function get_pwd() {
    echo "%K{237}%F{194}  %~  %f%k%F{237}${segment_separator}%f"
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
        echo "%K{239}%F{108}  ${branch}${git_status}  %f%k%F{239}${segment_separator}%f"
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
