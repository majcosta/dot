---
description: Mentor-style review of an explicit commit range
argument-hint: [commit-range] in [repo-dir]
allowed-tools: Bash(git:*), Read, Grep, Glob
disable-model-invocation: true
---

Commit range under review: `$1`

Run every git command as `git ...`. Use only read-only git commands
(log, show, diff, rev-list, branch, status). Never run a command that
modifies the repository or the working tree.

## Step 1 — Confirm the scope

1. Print the in-scope commits: `git log --oneline $1`.
2. If the list is empty, the range is probably mistyped or reversed — stop
   and tell me instead of reviewing nothing or guessing a different range.
3. Review ONLY these commits. Anything outside the range is out of scope —
   do not comment on it even in passing.

Get the full diff with `git diff $1` and per-commit detail with `git
show <hash>` where useful. Use Read/Grep/Glob to open the surrounding
files — review the change in its context, not the diff in isolation.

## Step 2 — Review as a mentor, not an author

Act as a senior engineer doing code review for a colleague who wants to grow.
Rules:
- Do NOT rewrite the code for me. Point at problems and explain the underlying
  principle; show a corrected snippet only for the single most instructive
  issue.
- Categorize findings: bugs/correctness, design smells, idiomatic style,
  performance, security.
- Anchor every finding to a file and line (or commit) so I can jump to it.
- For each finding, explain WHY it matters, not just what to change.
- Explicitly call out concepts I appear to be missing (patterns, stdlib
  functions, language features I reinvented, testing gaps).
- If the diff is fine, say so and instead teach me one thing adjacent to this
  code I probably don't know.
- End with 1-2 questions that test whether I understood the feedback.
