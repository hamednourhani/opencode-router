#!/usr/bin/env bash
set -euo pipefail

echo "==> Restoring OpenCode router config..."

SRC="$(cd "$(dirname "$0")" && pwd)"

# Back up existing config if present
if [ -d "$HOME/.config/opencode" ]; then
  echo "  backing up existing ~/.config/opencode -> ~/.config/opencode.bak.$(date +%s)"
  cp -r "$HOME/.config/opencode" "$HOME/.config/opencode.bak.$(date +%s)"
fi
if [ -d "$HOME/.agents" ]; then
  echo "  backing up existing ~/.agents -> ~/.agents.bak.$(date +%s)"
  cp -r "$HOME/.agents" "$HOME/.agents.bak.$(date +%s)"
fi

# Copy config
mkdir -p "$HOME/.config/opencode/agents"
cp "$SRC/.config/opencode/AGENTS.md"     "$HOME/.config/opencode/"
cp "$SRC/.config/opencode/opencode.json"  "$HOME/.config/opencode/"
cp "$SRC/.config/opencode/opencode.jsonc" "$HOME/.config/opencode/"
cp "$SRC/.config/opencode/agents/"*.md    "$HOME/.config/opencode/agents/"

# Copy skills
mkdir -p "$HOME/.agents/skills"
cp -r "$SRC/.agents/skills/"* "$HOME/.agents/skills/"
cp "$SRC/.agents/.skill-lock.json" "$HOME/.agents/"

echo "==> Done. Remember to:"
echo "  1. Edit ~/.config/opencode/opencode.json — update paths"
echo "  2. Set env vars: OPENCODE_API_KEY, DEEPSEEK_API_KEY"
