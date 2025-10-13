#!/bin/bash
# ci/preview.sh
# Generate theme preview locally

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Change to project directory
cd "$PROJECT_ROOT"

print_status "$BLUE" "🌿 Generating yoda.nvim Theme Preview"
echo "======================================="
echo ""

# Generate preview
print_status "$BLUE" "🎨 Generating HTML preview..."
nvim --headless -l ci/preview.lua

if [[ -f "theme_preview.html" ]]; then
    print_status "$GREEN" "✅ Preview generated: theme_preview.html"
    
    # Open in browser if possible
    if command -v open >/dev/null 2>&1; then
        print_status "$BLUE" "🌐 Opening preview in browser..."
        open theme_preview.html
    elif command -v xdg-open >/dev/null 2>&1; then
        print_status "$BLUE" "🌐 Opening preview in browser..."
        xdg-open theme_preview.html
    else
        echo ""
        echo "Preview saved to: $(pwd)/theme_preview.html"
        echo "Open this file in your browser to view the preview."
    fi
else
    echo "❌ Failed to generate preview"
    exit 1
fi

if [[ -f "theme_colors.json" ]]; then
    print_status "$GREEN" "✅ Colors extracted: theme_colors.json"
    echo ""
    echo "Theme colors:"
    if command -v jq >/dev/null 2>&1; then
        jq -r 'to_entries[] | "  \(.key): \(.value)"' theme_colors.json
    else
        cat theme_colors.json
    fi
fi

echo ""
print_status "$GREEN" "🎉 Preview generation complete!"
echo ""