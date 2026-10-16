---
name: track-report
description: One report across the developers you track — who, where, what they are on, where it stands, blockers, next — written for a named reader, from the folders plus fresh evidence.
argument-hint: "[all | <Name>] [for <me | Name of reader>]  — defaults: all, for me"
disable-model-invocation: true
---

# Report on the developers

Shared reference: `/dev-tracking`. Tracker root is in its `SKILL.md`. Reports go to `reports/` there, beside `people/` and `me/`. Developer folders are read, not written, except to reconcile.

`/track-weekly` is bookkeeping inside each folder. This is the document you hand to someone.

## Reader

The second argument names who reads it. Two presets:

- **me** (default). Compact. Statuses as the tracker has them, rule citations, every open call. Your cheat sheet before a call.
- **anyone else** (`for Jesper`). The reader knows who the developers are. No introductions, no roles, no repo or branch names, no job numbers, no internal statuses, no rule names. Each developer opens on the state of the work, then what is still open, blockers, questions, next. Ends with **Decisions needed from you**.

Never in a report, for any reader: a password or the shared login, a pasted Slack message, a status the tracker does not show, a promise about another team's work that is not in `decisions.md`.

## Steps

1. **Scope.** `all` = every folder under `people/` plus any listed in `people/README.md`. A name = that one.
2. **Refresh.** Per `/dev-tracking` `SOURCES.md`, for each developer: Slack messages since their last decision date, open and recently merged pull requests, the current Trello card. If the evidence does not match the folder, reconcile the folder first and log it in their `decisions.md`. Report from the folder, never ahead of it.
3. **Fields per developer**, from `AGENT.md`, `status.md`, `decisions.md`, and the job file that is **In progress** or **Not started**:
   - **What** — the current job, one sentence from the card's user story
   - **State** — how far it is: what is accepted, in plain words. For `me`, the tracker status too.
   - **Still open** — what the card asks that is not there yet, one line each: the element, what it does now, what it should do
   - **Blocked** — on whose side, or "nothing"
   - **Questions** — anything waiting on an answer, split by who owes it: the developer, us, the reader
   - **Next** — the next job by name, and what has to happen first
   - **Last contact** — date, direction (they wrote / you wrote), permalink
   - **Who** and **Where** (role, area, repo, branch) — `me` layout only. The outside reader gets the pull request and card links and nothing else about location.
4. **Headline.** Two or three sentences for the whole set: what shipped, what is held, what needs a decision from the reader. Written last, placed first.
5. **Write** `reports/<yyyy-mm-dd>-<reader>.md` from [templates/report.md](templates/report.md). Show it in full.
6. **Slack**, only if the reader is on Slack and you ask for it: draft per `/dev-tracking` `MESSAGING.md`, show it, send on "send", log the permalink at the bottom of the report file.
7. **Log** one line in `me/log.md` under **Dev reviews**: `Report for <reader> — [<file>](../reports/<file>)`.

Complete when: every developer in scope has every field of the chosen layout filled, every question has an owner, the headline is on top, the file is written and shown, and `me/log.md` has the line.

## Reference

- [templates/report.md](templates/report.md) — the two layouts, one per reader preset
