---
description: Write a handoff document summarizing this session's progress so a fresh session (after /clear) can pick up where you left off.
---

Write a handoff document to `.claude/HANDOFF.md` (create the file if it doesn't exist, overwrite it if it does) that captures everything a brand-new Claude Code session — with no memory of this conversation — would need to continue this work without re-deriving it.

Use clear markdown headings, in this order:

1. **Goal** — the overall task/objective, 1-3 sentences.
2. **Status** — what's done vs. still in progress. Be concrete: files changed, commands run, current branch, test/build state.
3. **Key decisions** — choices made and *why*, especially anything non-obvious a fresh session might otherwise redo, question, or reverse.
4. **Next steps** — an ordered, actionable list of what to do next.
5. **Open questions / blockers** — anything unresolved that needs user input or further investigation.
6. **Relevant files** — the paths most central to the work, each with a one-line note on why it matters.

Keep it dense and factual — no filler, no restating things a fresh session can see directly from the code or git log. The whole document gets injected as context in one shot on the next session start, so keep it well under 10,000 characters.

After writing the file, tell the user in one sentence that the handoff is saved and it's safe to run `/clear`.
