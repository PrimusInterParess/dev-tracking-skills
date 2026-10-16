---
name: dev-tracking
description: Router and shared reference for tracking a developer's work across Slack, GitHub, and Trello — folder layout, job statuses, standing rules, decision rules, message rules.
disable-model-invocation: true
---

# Dev tracking

Follow one developer's work, tell them what to do next, and keep every call on record. Slack is what they said. GitHub is what exists. Trello is what done means.

**Tracker root:** `C:/Users/user/Desktop/Dev-Tracking`. Developer folders live in `people/<Name>/` there, outside the repo, because they hold shared logins.

## Which skill

| You want to | Run |
| --- | --- |
| Start tracking someone new | `/track-start <Name>` |
| They posted in Slack, or opened or updated a PR, or you ask "what should they be doing" | `/track-check-in <Name>` |
| A merge call on one PR, without the rest of the check-in | `/track-review-pr <Name> <PR number>` |
| You are unsure what to tell them | `/track-decide <Name> <question>` |
| A job is accepted, hand over the next one | `/track-next-task <Name> <job number>` |
| Weekly summary | `/track-weekly <Name or all>` |
| One report across developers for a reader | `/track-report [all or Name] [for <reader>]` |
| Your own work: sync, start, note, done, week | `/track-me [mode]` |

`/track-me` keeps its own folder, `me/`, next to `people/`, and its own rules; see its `SKILL.md`. Every other skill reads the developer folder first: `AGENT.md`, `status.md`, `decisions.md`, then the job file that is **In progress** or **Not started**.

A check-in reviews a matching pull request before it drafts the message. `/track-review-pr` is that same review on one pull request.

## Developer folder

```
people/<Name>/
  AGENT.md        who, where, area, off limits, how to proceed
  status.md       job table and "where things stand"
  decisions.md    dated log of every call, newest first, never rewritten
  01-<job>.md     ticket, API shape, checklist, branch, done-when
  02-<job>.md
```

Blank files: [templates/](templates/).

## Job statuses

**Not started** · **In progress** · **Blocked** (blocker written in the job file) · **Waiting on job N** · **Done**.

Only **Done** needs proof: every checkbox in the job file ticked against the PR diff. The rest can come from Slack.

## Three rules

1. A Slack "done" does not change a status. The diff does.
2. Every call that changes what they do, what counts as done, or whether to merge or publish goes in `decisions.md`, dated, with the rule or interview answer behind it.
3. Messages are drafted, shown, and sent only on "send". Sent messages are logged with their permalink.

## Reference

- [PROCESS.md](PROCESS.md) — the review loop, moving to the next job, adding a job
- [SOURCES.md](SOURCES.md) — how to read Slack, GitHub, Trello, and what to do when they disagree
- [RULES.md](RULES.md) — standing rules applied without asking
- [DECISIONS.md](DECISIONS.md) — apply vs. interview, interview format, decision entry format
- [MESSAGING.md](MESSAGING.md) — message shape, where to send, logging, templates
