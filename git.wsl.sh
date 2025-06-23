#!/usr/bin/env bash
# config.sh
# Purpose: Apply recommended Git configurations for a Windows ↔ WSL workflow.
# Run this script from the root of the repository whose local settings you want to adjust.
# Global settings affect all repositories; repository settings only affect the current repo.

set -e # Exit on error

echo "Applying global Git settings..."
git config --global core.autocrlf input   # Commit LF to the repository; keep CRLF on checkout in Windows
git config --global core.symlinks true    # Preserve UNIX symbolic links when checking out in Windows
git config --global core.longpaths true   # Allow file paths longer than 260 characters in Windows
git config --global core.safecrlf true    # Reject commits that introduce CRLF inconsistencies

echo "Applying repository-specific Git settings..."
git config core.fileMode false            # Ignore changes to the executable bit
git config core.eol lf                    # Store files with LF line endings in the working tree
git config core.ignorecase false          # Make Git treat file names as case-sensitive
git config core.untrackedCache true       # Cache untracked file list to speed up 'git status'

echo "Creating .gitattributes for line-ending normalization..."
cat > .gitattributes <<'EOF'
* text=auto eol=lf
EOF

echo "Configuration complete."
