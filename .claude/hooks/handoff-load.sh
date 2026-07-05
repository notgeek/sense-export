#!/bin/bash
set -euo pipefail

HANDOFF_FILE="$CLAUDE_PROJECT_DIR/.claude/HANDOFF.md"

if [ ! -f "$HANDOFF_FILE" ]; then
  exit 0
fi

CONTENT=$(cat "$HANDOFF_FILE")

# Archive it so a later /clear (with no fresh /handoff since) doesn't replay stale context.
mv "$HANDOFF_FILE" "$CLAUDE_PROJECT_DIR/.claude/HANDOFF.last.md"

jq -n --arg content "$CONTENT" '{
  hookSpecificOutput: {
    hookEventName: "SessionStart",
    additionalContext: ("You are resuming a previous session. Here is the handoff document left for you:\n\n" + $content)
  }
}'
