#!/usr/bin/env bash
# Install the MQM coffee chat skills into Claude Code and/or Codex.
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/KimJerry114514/mqm-alumni-outreach-skills/main/install.sh | bash
# Options (pass after "bash -s --"): --claude, --codex, or --dir <path>. Default: every agent found.
set -euo pipefail

REPO="https://github.com/KimJerry114514/mqm-alumni-outreach-skills"
TARGETS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --claude) TARGETS+=("$HOME/.claude/skills") ;;
    --codex)  TARGETS+=("$HOME/.codex/skills") ;;
    --dir)    shift; TARGETS+=("$1") ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
  shift
done
if [ ${#TARGETS[@]} -eq 0 ]; then
  [ -d "$HOME/.claude" ] && TARGETS+=("$HOME/.claude/skills")
  [ -d "$HOME/.codex" ]  && TARGETS+=("$HOME/.codex/skills")
  [ ${#TARGETS[@]} -eq 0 ] && TARGETS+=("$HOME/.claude/skills")
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "Downloading skills from $REPO ..."
curl -fsSL "$REPO/archive/refs/heads/main.tar.gz" | tar -xz -C "$TMP"
SRC="$(find "$TMP" -maxdepth 2 -type d -name skills | head -1)"
[ -d "$SRC" ] || { echo "Could not find the skills folder in the download." >&2; exit 1; }

for T in "${TARGETS[@]}"; do
  mkdir -p "$T"
  for S in "$SRC"/*/; do
    NAME="$(basename "$S")"
    rm -rf "$T/$NAME"
    cp -R "$S" "$T/$NAME"
  done
  echo "Installed $(ls "$SRC" | wc -l | tr -d ' ') skills into $T"
done
echo "Done. Restart your agent to load the skills."
