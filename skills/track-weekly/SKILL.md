---
name: track-weekly
description: Weekly summary per developer from their folder plus fresh Slack, GitHub, and Trello evidence — status changes, PRs, messages, open calls, Monday's task.
argument-hint: "<Name> or all"
disable-model-invocation: true
---

# Weekly summary

Shared reference: `/dev-tracking`. Use the folder and fresh evidence. Not memory of earlier chats.

## Steps

For each developer in scope (`all` = every folder under `people/` plus any listed in `people/README.md`):

1. **Refresh.** Their Slack messages this week, pull requests opened, updated, or merged this week, the current Trello card. Per [../dev-tracking/SOURCES.md](../dev-tracking/SOURCES.md).
2. **Reconcile.** If the evidence does not match the folder, update the folder first and log it in `decisions.md`. Then summarise.
3. **Write** under `## Week of <Monday date>` at the top of `status.md`, replacing last week's:
   - Job table, with any status change this week and the `decisions.md` entry behind it.
   - Pull requests this week, with links.
   - Messages sent to them this week, with permalinks.
   - Open calls: anything **Blocked**, or marked for Yordan in `decisions.md` or a job file.
   - What they should be doing on Monday, one sentence.

One screen per developer. Links, not pasted content.

Complete when: every developer in scope has a current `## Week of` section and the folders agree with the evidence.
