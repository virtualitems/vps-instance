#!/usr/bin/env bash
# config.sh
# Purpose: Apply Git configuration for LF line endings in a Windows ↔ WSL workflow.
# Run this script from the root of the repository.
# Global settings affect all repositories; repository settings only affect the current repo.

set -euo pipefail

echo "Applying global Git settings..."

# Keep LF in the repository and avoid converting LF to CRLF on checkout.
git config --global core.autocrlf input

# Preserve UNIX symbolic links when checking out in Windows.
git config --global core.symlinks true

# Allow file paths longer than 260 characters in Windows.
git config --global core.longpaths true

# Reject commits that introduce unsafe line-ending conversions.
git config --global core.safecrlf true

echo "Applying repository-specific Git settings..."

# Do not convert line endings automatically in this repo.
git config core.autocrlf false

# Prefer LF in the working tree.
git config core.eol lf

# Ignore changes to the executable bit.
git config core.fileMode false

# Make Git treat file names as case-sensitive.
git config core.ignorecase false

# Cache untracked file list to speed up 'git status'.
git config core.untrackedCache true

echo "Creating .gitattributes for LF normalization..."

cat > .gitattributes <<'EOF'
* text=auto eol=lf
EOF

echo "Renormalizing tracked files..."
git add --renormalize .

echo "Configuration complete."
echo "Review changes with: git status"
echo "Commit with: git commit -m \"Normalize line endings to LF\""
