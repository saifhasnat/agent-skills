#!/usr/bin/env bash
# bootstrap.sh — Restore the full Claude Code environment on any machine.
# Run once after cloning: bash bootstrap.sh
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"
CLAUDE_CONFIG="$HOME/.claude/CLAUDE.md"

echo "Setting up Claude environment from: $REPO_DIR"

# ── Skills ────────────────────────────────────────────────────────────────────
mkdir -p "$SKILLS_DIR"

for skill in agent-skill-builder firebase-standard-manager premium-ui-polisher sandbox-architect deployment-commander project-mounter; do
  target="$SKILLS_DIR/$skill"
  if [ -e "$target" ]; then
    echo "  [skip] $skill already exists at $target"
  else
    ln -s "$REPO_DIR/$skill" "$target"
    echo "  [linked] $skill"
  fi
done

# ── CLAUDE.md ─────────────────────────────────────────────────────────────────
mkdir -p "$HOME/.claude"

if [ -f "$CLAUDE_CONFIG" ] && [ ! -L "$CLAUDE_CONFIG" ]; then
  echo "  [backup] Existing CLAUDE.md → CLAUDE.md.bak"
  mv "$CLAUDE_CONFIG" "${CLAUDE_CONFIG}.bak"
fi

if [ ! -e "$CLAUDE_CONFIG" ]; then
  ln -s "$REPO_DIR/config/CLAUDE.md" "$CLAUDE_CONFIG"
  echo "  [linked] CLAUDE.md"
else
  echo "  [skip] CLAUDE.md symlink already in place"
fi

# ── Note about humanizer ──────────────────────────────────────────────────────
if [ ! -d "$SKILLS_DIR/humanizer" ]; then
  echo ""
  echo "  [note] humanizer skill not found. Install it manually from:"
  echo "         https://github.com/anthropics/claude-code-skills (or your source)"
fi

echo ""
echo "Done. Open a new Claude Code session to verify."
