# Too complicated and maintenance heavy. 
#!/bin/bash

# Configuration variables
REPO_URL="https://github.com/vamseeachanta/pyproject-starter"
SUBFOLDER=".ai"
LOCAL_PATH=".ai-guidelines"
BRANCH="main"

# Function to display usage
usage() {
    echo "Usage: $0 -r <repo_url> -s <subfolder> -p <local_path> [-b <branch>]"
    echo ""
    echo "Options:"
    echo "  -r, --repo      Git repository URL"
    echo "  -s, --subfolder Subfolder path in the remote repository"
    echo "  -p, --path      Local path where submodule will be placed"
    echo "  -b, --branch    Branch to checkout (default: main)"
    echo "  -h, --help      Display this help message"
    echo ""
    echo "Example:"
    echo "  $0 -r https://github.com/yourorg/main-repo.git -s ai-guidelines -p guidelines"
    echo "  $0 -r git@github.com:yourorg/main-repo.git -s docs/ai-guidelines -p external-guidelines -b develop"
    exit 1
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--repo)
            REPO_URL="$2"
            shift 2
            ;;
        -s|--subfolder)
            SUBFOLDER="$2"
            shift 2
            ;;
        -p|--path)
            LOCAL_PATH="$2"
            shift 2
            ;;
        -b|--branch)
            BRANCH="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

# Validate required parameters
if [[ -z "$REPO_URL" || -z "$SUBFOLDER" || -z "$LOCAL_PATH" ]]; then
    echo "Error: Repository URL, subfolder, and local path are required."
    usage
fi

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if git is installed
if ! command_exists git; then
    echo "Error: Git is not installed or not in PATH"
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Check if submodule path already exists
if [[ -d "$LOCAL_PATH" ]]; then
    echo "Error: Directory '$LOCAL_PATH' already exists"
    exit 1
fi

# Check if submodule is already configured
if git config --file .gitmodules --get "submodule.$LOCAL_PATH.url" > /dev/null 2>&1; then
    echo "Error: Submodule '$LOCAL_PATH' already exists in .gitmodules"
    exit 1
fi

echo "Adding submodule with sparse checkout..."
echo "Repository: $REPO_URL"
echo "Subfolder: $SUBFOLDER"
echo "Local path: $LOCAL_PATH"
echo "Branch: $BRANCH"
echo ""

# Add the submodule
echo "Step 1: Adding submodule..."
if ! git submodule add -b "$BRANCH" "$REPO_URL" "$LOCAL_PATH"; then
    echo "Error: Failed to add submodule"
    exit 1
fi

# Navigate to the submodule directory
echo "Step 2: Configuring sparse checkout..."
cd "$LOCAL_PATH" || {
    echo "Error: Failed to enter submodule directory"
    exit 1
}

# Enable sparse checkout
if ! git config core.sparseCheckout true; then
    echo "Error: Failed to enable sparse checkout"
    exit 1
fi

# Create sparse-checkout file with the subfolder pattern
echo "$SUBFOLDER/*" > .git/info/sparse-checkout

# Apply the sparse checkout
echo "Step 3: Applying sparse checkout..."
if ! git read-tree -m -u HEAD; then
    echo "Error: Failed to apply sparse checkout"
    exit 1
fi

# Go back to the main repository
cd ..

# Add and commit the submodule
echo "Step 4: Committing submodule..."
if ! git add .gitmodules "$LOCAL_PATH"; then
    echo "Error: Failed to stage submodule files"
    exit 1
fi

if ! git commit -m "Add $SUBFOLDER from $REPO_URL as submodule at $LOCAL_PATH"; then
    echo "Error: Failed to commit submodule"
    exit 1
fi

echo ""
echo "✅ Success! Submodule added successfully."
echo ""
echo "To update the submodule in the future, run:"
echo "  cd $LOCAL_PATH"
echo "  git pull origin $BRANCH"
echo "  cd .."
echo "  git add $LOCAL_PATH"
echo "  git commit -m 'Update $LOCAL_PATH submodule'"
echo ""
echo "To clone this repository with submodules:"
echo "  git clone --recursive <your-repo-url>"
echo ""
echo "To initialize submodules in existing clone:"
echo "  git submodule update --init --recursive"