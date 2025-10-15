#!/bin/bash

# Git Learning Project - Setup Demo Script
echo "🚀 Setting up Git Learning Project Demo..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Create demo directory
DEMO_DIR="git-learning-demo"
if [ -d "$DEMO_DIR" ]; then
    print_warning "Demo directory already exists. Removing..."
    rm -rf "$DEMO_DIR"
fi

mkdir "$DEMO_DIR"
cd "$DEMO_DIR"

print_status "Created demo directory: $DEMO_DIR"

# Initialize Git repository
print_status "Initializing Git repository..."
git init

# Case Study 1: Create initial files
print_status "Case Study 1: Setting up initial project structure..."

cat > README.md << 'EOF'
# Git Learning Demo

This is a demo project for learning Git.
EOF

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Git Learning Demo</title>
</head>
<body>
    <h1>Welcome to Git Learning!</h1>
    <p>This is our initial version.</p>
</body>
</html>
EOF

# Initial commit
git add .
git commit -m "Initial commit: Project setup"

print_status "✅ Case Study 1 completed: Repository initialized"

# Case Study 2: Make changes
print_status "Case Study 2: Tracking file changes..."

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Git Learning Demo</title>
</head>
<body>
    <h1>Welcome to Git Learning!</h1>
    <h2>About This Project</h2>
    <p>This is our initial version.</p>
</body>
</html>
EOF

git add index.html
git commit -m "Add About section to homepage"

print_status "✅ Case Study 2 completed: File changes tracked"

# Case Study 3: Create .gitignore
print_status "Case Study 3: Setting up .gitignore..."

cat > .gitignore << 'EOF'
# Log files
*.log

# Temporary files
temp/
tmp/
*.tmp

# OS files
.DS_Store
Thumbs.db
EOF

# Create some files that should be ignored
mkdir temp
touch debug.log
touch temp/cache.tmp

git add .gitignore
git commit -m "Add .gitignore file"

print_status "✅ Case Study 3 completed: .gitignore configured"

# Case Study 4: Demonstrate undo (we'll simulate this)
print_status "Case Study 4: Undoing changes demonstration..."
echo "<!-- Wrong content -->" > index.html
git status
git checkout -- index.html
print_status "✅ Case Study 4 completed: Changes undone"

# Case Study 5: Branching and merging
print_status "Case Study 5: Branching and merging..."

# Create feature branch
git checkout -b contact-feature

cat > contact.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
</head>
<body>
    <h1>Contact Form</h1>
    <p>This is a new contact page.</p>
</body>
</html>
EOF

git add contact.html
git commit -m "Add contact page"

# Switch back to main and merge
git checkout main
git merge contact-feature

print_status "✅ Case Study 5 completed: Branching and merging practiced"

# Case Study 6: View history
print_status "Case Study 6: Viewing commit history..."
echo "Commit history:"
git log --oneline --graph

print_status "✅ Case Study 6 completed: Commit history viewed"

# Create exercises directory with case study instructions
mkdir -p exercises

# Create individual case study markdown files
for i in {1..10}; do
    cat > exercises/case-study-$i.md << EOF
# Case Study $i

## Learning Objectives
- Objective 1
- Objective 2

## Steps to Complete
1. Step one
2. Step two

## Verification
- Check 1
- Check 2

## Tips
- Tip 1
- Tip 2
EOF
done

print_status "✅ Created exercise files for all case studies"

# Final status
print_status "🎉 Demo setup completed successfully!"
echo ""
echo "📁 Project structure created in: $DEMO_DIR"
echo "📚 Exercise files available in: exercises/"
echo "🚀 Ready to learn Git!"
echo ""
echo "Next steps:"
echo "1. Explore the project structure"
echo "2. Review the commit history: git log --oneline"
echo "3. Check the branch structure: git log --graph --all"
echo "4. Practice with the exercise files"
