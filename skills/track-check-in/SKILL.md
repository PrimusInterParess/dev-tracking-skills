---
name: track-check-in
description: Run the review loop on one developer — read their folder, pull Slack, GitHub, and Trello evidence, tick the job checklist against the diff, apply the rules, log the calls, draft the reply.
argument-hint: "<Name>"
disable-model-invocation: true
---

# Check in on a developer

Shared reference: `/dev-tracking`. The loop is [../dev-tracking/PROCESS.md](../dev-tracking/PROCESS.md).

## Steps

1. **Read the folder.** `AGENT.md`, `status.md`, `decisions.md`, then the job file that is **In progress** or **Not started**. Note the last decision date; everything after it is new.
2. **Evidence.** Per [../dev-tracking/SOURCES.md](../dev-tracking/SOURCES.md):
   - Their Slack messages since the last decision date, and the DM.
   - Their open pull requests on the repo in `AGENT.md`.
   - The Trello card on the current job, in case it changed.
3. **Checklist against the diff.** For each open pull request that matches a job by branch name: `gh pr diff`. Tick a box only when the diff shows the behaviour. Under each unticked box write one sentence: what they built, what the card asks.
4. **Scope.** List: next-job work inside this pull request, files outside their area, off-limits touches, requests to merge or publish.
5. **Calls.** Apply [../dev-tracking/RULES.md](../dev-tracking/RULES.md). For anything on the "stop and interview" list in [../dev-tracking/DECISIONS.md](../dev-tracking/DECISIONS.md), stop here and interview Yordan one question at a time before writing.
6. **Merge review.** When an open pull request matches a job, write the review before any instruction or message. The call is Merge, Hold, or Ask, as in [../track-review-pr/SKILL.md](../track-review-pr/SKILL.md), with the checkbox or rule behind it. No matching pull request: skip.
7. **Write.** Job file header (PR link, state, dated note), checkboxes, `status.md` table and "where things stand", a dated entry in `decisions.md` per call with the rule behind it.
8. **Draft.** Per [../dev-tracking/MESSAGING.md](../dev-tracking/MESSAGING.md). When step 6 ran, the instruction and the message come only from that review. Show it. Do not send until Yordan says "send". On send: `slack_send_message` where they wrote, then log the permalink in `decisions.md`.

## Report

Five parts, in this order: what they asked; what the evidence shows (PR, branch, ticks and misses); the merge call when a pull request matched; each other call and its rule; the draft.

Complete when: the folder agrees with the evidence and the draft is shown, or an interview is open.
