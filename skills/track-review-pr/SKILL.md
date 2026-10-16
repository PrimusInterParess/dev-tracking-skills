---
name: track-review-pr
description: Review one pull request against its job file and give a merge call — Merge, Hold, or Ask — with the checkbox or rule behind it.
argument-hint: "<Name> <PR number> [repo]"
disable-model-invocation: true
---

# Review a pull request against its job

Shared reference: `/dev-tracking`. Yordan merges. This skill does not.

## Steps

1. **Match.** `gh pr view` for the branch name. Find the job file whose branch matches. No match → stop and ask Yordan which job this is.
2. **Read.** `gh pr diff`. The Trello card on the job file. [../dev-tracking/SOURCES.md](../dev-tracking/SOURCES.md) has the commands and what to look for.
3. **Checklist.** For every box in the job file: ticked only if the diff shows the exact behaviour; quote the diff line that proves it. For each miss: what is there, what the card asks, one sentence each.
4. **Scope.** Files outside the job's area. Work that belongs to a later job. Off-limits touches per `AGENT.md`.
5. **Call.** One of three:
   - **Merge.** Every box ticked, nothing out of scope.
   - **Hold.** Name the boxes or scope items that block it.
   - **Ask.** The card and the code can both be read two ways. Interview Yordan per [../dev-tracking/DECISIONS.md](../dev-tracking/DECISIONS.md).
6. **Write.** Job file header and checkboxes. Dated entry in `decisions.md` with the call and the rule from [../dev-tracking/RULES.md](../dev-tracking/RULES.md) or the checkbox behind it. `status.md` if the status changes.
7. **Draft.** Per [../dev-tracking/MESSAGING.md](../dev-tracking/MESSAGING.md), "hold" or "accepted" template. Show it. Do not send until Yordan says so.

Complete when: every box has a tick with proof or a miss with two sentences, the call is logged, and the draft is shown.
