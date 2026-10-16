---
name: track-decide
description: Resolve an open call about a developer's work — check rules and the log first, gather evidence, then interview Yordan one question at a time and write the decision down.
argument-hint: "<Name> <the question in one sentence>"
disable-model-invocation: true
---

# Help me decide

Shared reference: `/dev-tracking`. Rules of the interview: [../dev-tracking/DECISIONS.md](../dev-tracking/DECISIONS.md).

## Steps

1. **Already answered?** Check [../dev-tracking/RULES.md](../dev-tracking/RULES.md), the current job file, and every entry in `decisions.md`. If one answers it, say so with the source and stop.
2. **Evidence first.** Before asking anything, gather what the code, the pull request diff, the Trello card, and Slack answer on their own. List what is settled and what is open.
3. **Interview.** Run `/grilling` on the open points. One question at a time. Each question: what it is, why it matters, your recommended answer and why, evidence links. Wait for the answer. Ask the question that unblocks the most others first. Stop when the rest would not change what the developer does.
4. **Write.** One entry in `decisions.md` under today's date in the format from DECISIONS.md: the call, why, which status it leaves. Update `status.md` and the job file to match. If the card should change, say so; do not edit Trello without Yordan's word.
5. **Draft.** If a message is owed, draft it per [../dev-tracking/MESSAGING.md](../dev-tracking/MESSAGING.md). Show it. Do not send until Yordan says so.

Complete when: the decision is in `decisions.md`, the folder matches it, and any owed draft is shown.
