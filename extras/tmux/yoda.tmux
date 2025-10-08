# Yoda tmux theme

# Colors
YODA_BG="#050705"
YODA_FG="#d4d4d4"
YODA_ACCENT="#00dd88"
YODA_STRING_GREEN="#b9f6ca"
YODA_INTERFACE="#4fa8d8"
YODA_DIM="#5a7a5a"
YODA_BORDER="#2a3a2a"
YODA_BG_LIGHT="#0a0d0a"

# Status bar
set-option -g status-style "bg=${YODA_BG},fg=${YODA_FG}"
set-option -g status-left-length 100
set-option -g status-right-length 100
set-option -g status-left "#[fg=${YODA_STRING_GREEN},bold] (#S) "
set-option -g status-right "#[fg=${YODA_STRING_GREEN}] %Y-%m-%d %H:%M #h "

# Windows
set-option -g window-status-style "fg=${YODA_DIM}"
set-option -g window-status-current-style "fg=${YODA_ACCENT},bold"
set-option -g window-status-activity-style "fg=${YODA_ACCENT}"
set-option -g window-status-format " #I:#W "
set-option -g window-status-current-format " #I:#W "

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