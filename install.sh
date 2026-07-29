#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${SHIP_THE_WORK_REPO_URL:-https://github.com/lbanry/ship-the-work.git}"
TARGET="${SHIP_THE_WORK_TARGET:-${HOME}/.agents/skills/ship-the-work}"

command -v git >/dev/null 2>&1 || {
  echo "Error: git is required." >&2
  exit 1
}

mkdir -p "$(dirname "$TARGET")"

if [[ -d "$TARGET/.git" ]]; then
  echo "Updating Ship the Work at $TARGET"
  git -C "$TARGET" fetch --prune origin
  git -C "$TARGET" pull --ff-only
elif [[ -e "$TARGET" ]]; then
  BACKUP="${TARGET}.backup.$(date +%Y%m%d%H%M%S)"
  echo "Existing non-Git installation found. Moving it to $BACKUP"
  mv "$TARGET" "$BACKUP"
  git clone --depth 1 "$REPO_URL" "$TARGET"
else
  echo "Installing Ship the Work at $TARGET"
  git clone --depth 1 "$REPO_URL" "$TARGET"
fi

if [[ ! -f "$TARGET/SKILL.md" ]]; then
  echo "Error: installation completed without SKILL.md" >&2
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  python3 "$TARGET/scripts/validate_skill.py"
fi

echo "Ship the Work is installed. Restart Codex if it does not appear immediately."
