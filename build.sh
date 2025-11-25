#!/bin/bash

# =============================================================================
# Flutter Release Script
# Automates git commit, push, and tag creation for releases
# =============================================================================

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Function to show usage
show_usage() {
    echo ""
    echo "Usage: sh build.sh [commit_message] [tag_version]"
    echo ""
    echo "Examples:"
    echo "  sh build.sh \"Fix analyze issues\" v1.0.0"
    echo "  sh build.sh \"Add new feature\" v1.1.0"
    echo "  sh build.sh \"Bug fixes\" v1.0.1"
    echo ""
    echo "Tag format: v{MAJOR}.{MINOR}.{PATCH}"
    echo "  - v1.0.0 = First release"
    echo "  - v1.0.1 = Bug fix"
    echo "  - v1.1.0 = New feature"
    echo "  - v2.0.0 = Major update"
    echo ""
    exit 1
}

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    print_error "Error: Missing arguments!"
    show_usage
fi

# Get parameters
COMMIT_MSG="$1"
TAG_VERSION="$2"

# Validate tag format (should start with 'v')
if [[ ! $TAG_VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    print_error "Invalid tag format!"
    echo "Tag must be in format: v{MAJOR}.{MINOR}.{PATCH}"
    echo "Example: v1.0.0"
    exit 1
fi

echo ""
echo "=========================================="
echo "🚀 Flutter Release Automation"
echo "=========================================="
echo ""
print_info "Commit message: $COMMIT_MSG"
print_info "Tag version: $TAG_VERSION"
echo ""

# Step 1: Check git status
print_info "Step 1: Checking git status..."
git status
echo ""

# Step 2: Add all changes
print_info "Step 2: Adding all changes..."
git add .
if [ $? -eq 0 ]; then
    print_success "Changes added successfully"
else
    print_error "Failed to add changes"
    exit 1
fi
echo ""

# Step 3: Commit changes
print_info "Step 3: Committing changes..."
git commit -m "$COMMIT_MSG"
if [ $? -eq 0 ]; then
    print_success "Changes committed successfully"
else
    print_warning "No changes to commit or commit failed"
fi
echo ""

# Step 4: Push to main branch
print_info "Step 4: Pushing to main branch..."
git push origin main
if [ $? -eq 0 ]; then
    print_success "Pushed to main successfully"
else
    print_error "Failed to push to main"
    exit 1
fi
echo ""

# Step 5: Check if tag already exists
print_info "Step 5: Checking if tag already exists..."
if git rev-parse "$TAG_VERSION" >/dev/null 2>&1; then
    print_warning "Tag $TAG_VERSION already exists!"
    echo ""
    read -p "Do you want to delete and recreate it? (y/n): " choice
    
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        print_info "Deleting local tag..."
        git tag -d "$TAG_VERSION"
        
        print_info "Deleting remote tag..."
        git push origin --delete "$TAG_VERSION"
        
        print_success "Old tag deleted"
    else
        print_error "Aborted. Tag already exists."
        exit 1
    fi
fi
echo ""

# Step 6: Create new tag
print_info "Step 6: Creating tag $TAG_VERSION..."
git tag "$TAG_VERSION"
if [ $? -eq 0 ]; then
    print_success "Tag created successfully"
else
    print_error "Failed to create tag"
    exit 1
fi
echo ""

# Step 7: Push tag to remote
print_info "Step 7: Pushing tag to GitHub..."
git push origin "$TAG_VERSION"
if [ $? -eq 0 ]; then
    print_success "Tag pushed successfully"
else
    print_error "Failed to push tag"
    exit 1
fi
echo ""

# Success message
echo "=========================================="
print_success "🎉 Release workflow completed!"
echo "=========================================="
echo ""
print_info "Next steps:"
echo "  1. Go to: https://github.com/YOUR-USERNAME/weather-app/actions"
echo "  2. Wait for CI to build (3-5 minutes)"
echo "  3. Check: https://github.com/YOUR-USERNAME/weather-app/releases"
echo "  4. Download your APK files"
echo ""
print_success "Done! 🚀"
echo ""