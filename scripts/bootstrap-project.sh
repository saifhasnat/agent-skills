#!/bin/bash
set -e

# --- AI-AGENT PROJECT BOOTSTRAPPER ---
# Usage: ./bootstrap-project.sh [ProjectName] [Type: Apps|Codex|Tools]

PROJECT_NAME=$1
PROJECT_TYPE=${2:-Apps} # Default to Apps

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: ./bootstrap-project.sh [ProjectName] [Type: Apps|Codex|Tools]"
    exit 1
fi

# Resolve Root Directory dynamically (portable)
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TARGET_DIR="$ROOT_DIR/$PROJECT_TYPE/$PROJECT_NAME"
TOOLS_DIR="$ROOT_DIR/agent-skills"

echo "🚀 Bootstrapping project: $PROJECT_NAME in $PROJECT_TYPE..."

# 1. Create Directory
mkdir -p "$TARGET_DIR/.claude/skills"
cd "$TARGET_DIR"

# 2. Initialize PROJECT.md
if [ ! -f "PROJECT.md" ]; then
    cat <<EOF > PROJECT.md
# Project: $PROJECT_NAME
Created: $(date)

## Overview
(Describe what this project does)

## Tech Stack
- Frontend: 
- Backend: 
- Database: 

## Active Goals
- Initial setup and architectural design.
EOF
    echo "📝 Created PROJECT.md"
fi

# 3. Link Shared Agent Skills
echo "🔗 Linking Core Agent Skills..."
ln -sf "$TOOLS_DIR/premium-ui-polisher" ".claude/skills/"
ln -sf "$TOOLS_DIR/firebase-standard-manager" ".claude/skills/"
ln -sf "$TOOLS_DIR/sandbox-architect" ".claude/skills/"
ln -sf "$TOOLS_DIR/deployment-commander" ".claude/skills/"

# 4. Initialize Git (Optional)
if [ ! -d ".git" ]; then
    git init -q
    echo "📦 Initialized Git repository"
fi

echo "✅ Success! $PROJECT_NAME is ready for AI development."
echo "👉 Path: $TARGET_DIR"
echo "👉 Command: Say 'Claude, mount project $PROJECT_NAME' to begin."
