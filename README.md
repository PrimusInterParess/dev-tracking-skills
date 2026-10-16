# dev-tracking-skills

This is for my day-to-day work at LifeBonder.

A Cursor skills library for following a developer's work across Slack, GitHub, and Trello: what they said, what code exists, what the ticket says done means. It keeps a folder per developer, ticks their job checklist against the pull request diff, logs every call with a date, and drafts the Slack reply for you to approve.

Built from tracking Saalim on the LifeBonder admin dashboard in October 2026.

## How it helps

It keeps the day in one loop: what someone said, what the code actually contains, and what the ticket says done means. You stay the person who decides, merges, and publishes. The skills do the reading, the comparison, and the draft.

Slack, GitHub, and Trello each tell a different story. A message that says "done" does not move a status. A pull request that GitHub calls mergeable only means there are no conflicts. The job file is the checklist, and a box gets ticked only when the diff shows that piece. Anything missing is written as one sentence: what they built, and what the card asked for.

On a normal day:

- Someone posts in Slack or opens a pull request. `/track-check-in` reads their folder, pulls the message, the open pull requests, and the Trello card, then compares the diff to the checklist.
- Before it tells them what to do, it calls the pull request Merge, Hold, or Ask. You merge. A merge does not publish the site. If they ask you to deploy, that is a hold, because only you run the publish action.
- If a standing rule already covers it — one job per branch, `LBAD-` branch names, stay inside their area, stay out of AI moderation and Reported Posts — it applies the rule and cites it. If the rule does not cover it, it stops and asks you one question at a time, with a recommended answer, then writes the call into `decisions.md`.
- It drafts the Slack reply from that review and shows it to you. It sends only when you say send, then logs the link.
- When every box is ticked, it marks the job done and drafts the hand-over for the next one.

Each developer has a folder you can reopen: who they are, what is in progress, and a dated log that is never rewritten. `/track-weekly` summarizes a person from that folder. `/track-report` writes one document across everyone: a short cheat sheet for you before a call, or a plain version for someone else that ends with the decisions they need to make.

`/track-me` points the same idea at your own work. It pulls your commits, pull requests, Slack posts, Trello cards, and the reviews you wrote, and keeps a log of what happened and a status of what is still in flight. Uncommitted work is noted as in progress. Done still needs a link.

## What is in here

```
dev-tracking-skills/
  README.md
  install.ps1                    copies skills/ into a Cursor skills folder
  skills/
    dev-tracking/                router + shared reference
      SKILL.md                   which skill to run, folder layout, statuses, three rules
      PROCESS.md                 the review loop, next job, adding a job
      SOURCES.md                 reading Slack, GitHub, Trello; when they disagree
      RULES.md                   standing rules applied without asking
      DECISIONS.md               apply vs. interview; interview and log format
      MESSAGING.md               message shape, where to send, templates
      templates/                 blank AGENT.md, status.md, decisions.md, job.md
    track-start/SKILL.md         set up a new developer folder
    track-check-in/SKILL.md      new Slack message or PR: run the loop
    track-review-pr/SKILL.md     one PR: Merge, Hold, or Ask
    track-decide/SKILL.md        interview one question at a time, then log the call
    track-next-task/SKILL.md     accepted job: hand over the next
    track-weekly/SKILL.md        weekly summary per developer
    track-report/                one report across developers, for a reader
      SKILL.md                   reader presets, seven fields, headline, where it goes
      templates/report.md        the two layouts
    track-me/                    your own work
      SKILL.md                   sync, start, note, done, week; statuses; rules
      SOURCES.md                 your commits, PRs, posts, cards, dev reviews
      templates/                 blank ME.md, status.md, log.md, item.md
```

Every skill is user-invoked (`disable-model-invocation: true`). The agent never fires them on its own. You type the name.

## Install

Skills load from `~/.cursor/skills/` (every workspace) or `<project>/.cursor/skills/` (one workspace).

```powershell
# personal, every workspace
.\install.ps1

# one project
.\install.ps1 -Target "C:\path\to\project\.cursor\skills"
```

The script copies `skills/*` into the target and overwrites older copies. Edit here, re-run install.

## Use

| Situation | Type |
| --- | --- |
| New developer joins | `/track-start <Name>` |
| They posted in Slack, or opened or updated a PR | `/track-check-in <Name>` |
| You want a merge call on one PR, without the rest of the check-in | `/track-review-pr <Name> <PR number>` |
| You are unsure what to tell them | `/track-decide <Name> <question>` |
| A job is accepted | `/track-next-task <Name> <job number>` |
| End of week | `/track-weekly <Name or all>` |
| You need to tell someone where everyone is | `/track-report all for Jesper` |
| You want a cheat sheet before a call | `/track-report` |
| What have I done, what is in flight | `/track-me` |
| You begin, annotate, or finish a piece of your own work | `/track-me start <item>`, `/track-me note <text>`, `/track-me done <item>` |
| Your own week | `/track-me week` |
| You forgot which one | `/dev-tracking` |

## How it works

One folder per developer, outside any repo:

```
<tracker root>/people/<Name>/
  AGENT.md        who, where, area, off limits, how to proceed
  status.md       job table and "where things stand"
  decisions.md    dated log of every call, newest first, never rewritten
  01-<job>.md     ticket, API shape, checklist, branch, done-when
```

The loop, every time they send something:

1. Read the folder.
2. Pull evidence: their Slack messages, their open PRs, the Trello card.
3. Tick the job checklist against the PR diff. A miss gets one sentence: what they built, what the card asks.
4. Check scope: next-job work in this PR, off-limits areas, requests to merge or publish.
5. Review a matching pull request: Merge, Hold, or Ask, before any instruction or message. Skip when no pull request matches.
6. Apply the standing rules. Anything not covered: stop and interview you, one question at a time, each with a recommended answer.
7. Write it down: job file, status table, dated decision entry.
8. Draft the reply from that review. Send only on "send". Log the permalink.

Three rules hold it together:

- A Slack "done" does not change a status. The diff does.
- Every call that changes what they do, what counts as done, or whether to merge or publish goes in `decisions.md`.
- Messages are drafted, shown, and sent only when you say so.

### Reporting

`/track-weekly` writes into each developer's folder. `/track-report` writes one document for a reader into `<tracker root>/reports/<date>-<reader>.md`: a headline, then seven fields per developer (who, where, what, standing, blocked, next, last contact). `for me` keeps statuses and rule names; `for <anyone else>` drops them, uses plain words, and ends with "Decisions needed from you". It refreshes the evidence first and reports from the folder, never ahead of it. The report is logged as a line in your own `me/log.md`.

### Your own work

`/track-me` is the same idea pointed at you. One folder, `<tracker root>/me/`:

```
me/
  ME.md           your ids on each source, local repo paths, owners, boards
  status.md       items table, "where things stand", weekly section on top
  log.md          dated history, newest first, never rewritten
  01-<item>.md    one per piece of work that spans more than a day
```

Each run pulls evidence since the last log date — your commits per repo, pull requests you opened, merged, or reviewed, Slack posts you sent, Trello cards on you, and the review entries you wrote into `people/*/decisions.md` — and writes it into `log.md` under today, grouped by item. `status.md` moves only when the evidence supports it; **Done** needs a link. Dirty worktrees are logged as work in flight and move nothing. Nobody else is messaged.

## Configuration

Two places hold project-specific values. Change them for another team:

- `skills/dev-tracking/SKILL.md` — **Tracker root**, the path where `people/` lives.
- `skills/dev-tracking/RULES.md` and `SOURCES.md` — repo names, branch prefix (`LBAD-`), the publish workflow, off-limits areas, MCP server names for Slack and Trello.
- `<tracker root>/me/ME.md` — your own ids, repo paths, owners, and boards. `/track-me` builds it from the template on first run.

Developer folders hold shared logins. Keep the tracker root out of any repository.

## Requirements

- Cursor with the Slack and Trello MCP servers connected.
- `gh` CLI signed in to the GitHub org.
- The `grilling` skill, for the interview step in `/track-decide`. If it is not installed, `/track-decide` still works: ask one question at a time, with a recommended answer each.
