# Yoda tmux theme — Light Variant

# Colors from yoda.nvim light palette
YODA_BG="#f3f5f4"
YODA_FG="#1a1d1f"
YODA_ACCENT="#3bb07a"
YODA_STRING_GREEN="#2e7d32"
YODA_INTERFACE="#6aa8ef"
YODA_DIM="#56606b"
YODA_BORDER="#b7bfc7"
YODA_BG_LIGHT="#fbfdfc"

# Status bar
set-option -g status-style "bg=${YODA_BG},fg=${YODA_FG}"
# Backward compatibility with older tmux
set-option -g status-bg "${YODA_BG}"
set-option -g status-fg "${YODA_FG}"

set-option -g status-left-length 100
set-option -g status-right-length 100

# Ensure left/right segments use the same background explicitly
set-option -g status-left "#[bg=${YODA_BG},fg=${YODA_STRING_GREEN},bold] (#S) #[default]"
set-option -g status-left-style "bg=${YODA_BG},fg=${YODA_STRING_GREEN}"
set-option -g status-right "#[bg=${YODA_BG},fg=${YODA_STRING_GREEN}] %Y-%m-%d %H:%M #h #[default]"
set-option -g status-right-style "bg=${YODA_BG},fg=${YODA_STRING_GREEN}"

# Windows
set-option -g window-status-style "fg=${YODA_DIM}"
set-option -g window-status-current-style "fg=${YODA_ACCENT},bold"
set-option -g window-status-activity-style "fg=${YODA_ACCENT}"
set-option -g window-status-format "#[bg=${YODA_BG},fg=${YODA_DIM}] #I:#W #[default]"
set-option -g window-status-current-format "#[bg=${YODA_BG},fg=${YODA_ACCENT},bold] #I:#W #[default]"
set-option -g window-status-separator ""

# Panes
set-option -g pane-border-style "fg=${YODA_BORDER}"
set-option -g pane-active-border-style "fg=${YODA_ACCENT}"

# Messages
set-option -g message-style "bg=${YODA_BG_LIGHT},fg=${YODA_FG}"
set-option -g message-command-style "bg=${YODA_BG_LIGHT},fg=${YODA_INTERFACE}"

# Copy mode and session menu
set-option -g mode-style "fg=${YODA_ACCENT},bold"

# Misc
set-option -g clock-mode-colour "${YODA_ACCENT}"
set-option -g monitor-activity on
set-option -g visual-activity off
set-option -g display-time 2000
