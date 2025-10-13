#!/bin/bash
# ci/lint.sh
# Linting and formatting checks for yoda.nvim

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Default options
CHECK_ONLY=false
VERBOSE=false
FIX=false

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Run linting and formatting checks for yoda.nvim

OPTIONS:
    --check-only        Only check formatting, don't fix (CI mode)
    --fix               Automatically fix formatting issues
    --verbose           Show verbose output
    --help              Show this help message

EXAMPLES:
    # Check everything (default)
    $0

    # CI mode - check only, fail if issues found
    $0 --check-only

    # Fix formatting issues automatically
    $0 --fix

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --check-only)
            CHECK_ONLY=true
            shift
            ;;
        --fix)
            FIX=true
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --help)
            show_usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            show_usage
            exit 1
            ;;
    esac
done

# Change to project directory
cd "$PROJECT_ROOT"

print_status "$BLUE" "🔍 yoda.nvim Linting and Formatting Checks"
echo "========================================="
echo ""

# Track overall status
OVERALL_STATUS=0

# Check if tools are installed
print_status "$BLUE" "📋 Checking required tools..."

if ! command -v stylua >/dev/null 2>&1; then
    print_status "$RED" "❌ stylua not found. Please install it:"
    echo "   cargo install stylua"
    echo "   Or: brew install stylua"
    exit 1
fi

if ! command -v luacheck >/dev/null 2>&1; then
    print_status "$RED" "❌ luacheck not found. Please install it:"
    echo "   luarocks install luacheck"
    echo "   Or: brew install luacheck"
    exit 1
fi

print_status "$GREEN" "✅ All required tools found"
echo ""

# Stylua formatting check
print_status "$BLUE" "🎨 Checking Lua formatting (stylua)..."

STYLUA_FILES=(
    "lua/"
    "colors/"
    "ci/*.lua"
)

if [[ "$CHECK_ONLY" == "true" ]]; then
    # CI mode - check only
    if stylua --check "${STYLUA_FILES[@]}" 2>/dev/null; then
        print_status "$GREEN" "✅ All files are properly formatted"
    else
        print_status "$RED" "❌ Formatting issues found!"
        echo ""
        echo "Files that need formatting:"
        stylua --check "${STYLUA_FILES[@]}" 2>&1 || true
        echo ""
        echo "To fix these issues, run:"
        echo "  ./ci/lint.sh --fix"
        OVERALL_STATUS=1
    fi
elif [[ "$FIX" == "true" ]]; then
    # Fix mode - auto format
    print_status "$YELLOW" "🔧 Fixing formatting issues..."
    stylua "${STYLUA_FILES[@]}"
    print_status "$GREEN" "✅ Formatting applied"
else
    # Default mode - check and show what would be fixed
    if stylua --check "${STYLUA_FILES[@]}" >/dev/null 2>&1; then
        print_status "$GREEN" "✅ All files are properly formatted"
    else
        print_status "$YELLOW" "⚠️  Formatting issues found (use --fix to fix them)"
        OVERALL_STATUS=1
    fi
fi

echo ""

# Luacheck linting
print_status "$BLUE" "🧹 Running Lua linter (luacheck)..."

LUACHECK_ARGS=(
    "--config" ".luacheckrc"
)

if [[ "$VERBOSE" == "true" ]]; then
    LUACHECK_ARGS+=("--verbose")
fi

if luacheck "${LUACHECK_ARGS[@]}" .; then
    print_status "$GREEN" "✅ No linting issues found"
else
    print_status "$RED" "❌ Linting issues found!"
    OVERALL_STATUS=1
fi

echo ""

# Additional checks
print_status "$BLUE" "🔍 Additional checks..."

# Check for trailing whitespace
if find . -name "*.lua" -exec grep -l "[[:space:]]$" {} \; 2>/dev/null | head -1 >/dev/null; then
    print_status "$RED" "❌ Files with trailing whitespace found:"
    find . -name "*.lua" -exec grep -l "[[:space:]]$" {} \; 2>/dev/null || true
    echo ""
    if [[ "$FIX" == "true" ]]; then
        print_status "$YELLOW" "🔧 Removing trailing whitespace..."
        find . -name "*.lua" -exec sed -i '' 's/[[:space:]]*$//' {} \;
        print_status "$GREEN" "✅ Trailing whitespace removed"
    else
        echo "To fix: ./ci/lint.sh --fix"
        OVERALL_STATUS=1
    fi
else
    print_status "$GREEN" "✅ No trailing whitespace"
fi

# Check for mixed line endings (LF vs CRLF)
if find . -name "*.lua" -exec file {} \; | grep -q "CRLF"; then
    print_status "$RED" "❌ Files with CRLF line endings found:"
    find . -name "*.lua" -exec file {} \; | grep "CRLF" || true
    OVERALL_STATUS=1
else
    print_status "$GREEN" "✅ All files use LF line endings"
fi

echo ""

# Summary
if [[ $OVERALL_STATUS -eq 0 ]]; then
    print_status "$GREEN" "🎉 All checks passed!"
else
    print_status "$RED" "💥 Some checks failed!"
    echo ""
    if [[ "$CHECK_ONLY" != "true" ]]; then
        echo "Run with --fix to automatically fix formatting issues:"
        echo "  ./ci/lint.sh --fix"
    fi
fi

echo ""
exit $OVERALL_STATUS