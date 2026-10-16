---
name: track-me
description: Track your own work — pull your commits, pull requests, Slack posts, Trello cards, and dev reviews into a dated log, keep a status table of what is in flight, summarise the week.
argument-hint: "[start <item> | note <text> | done <item> | week] — no argument runs the sync"
disable-model-invocation: true
---

# Track my own work

Shared reference: `/dev-tracking`. Tracker root is in its `SKILL.md`. My work lives in `me/` there, beside `people/`.

Two files carry it. `log.md` is history: what happened, by day, with links. `status.md` is now: what is in flight and where it stands. Item files hold anything that outlives a day.

## Folder

```
me/
  ME.md           who I am on each source, which repos, which boards
  status.md       items table, "where things stand", weekly section on top
  log.md          dated history, newest first, never rewritten
  01-<item>.md    one per piece of work that spans more than a day
```

Blank files: [templates/](templates/). No `me/` yet → build it from the templates, fill `ME.md` from `git config user.email`, `gh api user`, `slack_search_users`, and the git repos under the workspace, then run the sync.

## Modes

| Argument | Does |
| --- | --- |
| none | Sync: pull evidence since the last log date, write it down, show status |
| `start <item>` | New item file from `templates/item.md`, new row in `status.md`, logged |
| `note <text>` | One dated line in `log.md`, by hand. Under the item it names, else under **Other** |
| `done <item>` | Check the proof, flip to **Done**, log it with the link |
| `week` | `## Week of <Monday>` at the top of `status.md`, replacing last week's |

Every mode runs the sync first, except `note`.

## Sync

1. **Read.** `ME.md`, `status.md`, the top date in `log.md`. Everything after that date is new. No date → the last seven days.
2. **Evidence.** Per [SOURCES.md](SOURCES.md): my commits per repo, my pull requests, my Slack posts, my Trello cards, entries I wrote today in `people/*/decisions.md`. Dirty worktrees too.
3. **Match.** Each piece of evidence to one item by branch, pull request, card, or wording. No match → **Other**.
4. **Write `log.md`.** One `## <date>` section per day, items as `### <item>` headings, one line per piece of evidence with its link. Only today's section may grow; older sections are closed.
5. **Reconcile `status.md`.** Move an item only when the evidence supports it, per the rules below. Rewrite "Where things stand".
6. **Show.** The items table, today's log section, then open calls: an item with no evidence in five working days, a pull request of mine open more than two weeks, anything **Blocked**, a Slack promise with no item.

Complete when: every piece of new evidence is in `log.md` once, `status.md` agrees with it, and the open calls are listed.

## Statuses

**Not started** · **In progress** · **Blocked** (blocker in the item file) · **Waiting on <who or what>** · **Parked** (why, in the item file) · **Done**.

## Rules

1. Evidence first, memory second. The log is built from commits, pull requests, posts, and cards. A `note` fills a gap; it does not replace the pull.
2. **Done** needs proof: a merged pull request, a workflow run, a sent message, a file. One link in the item file. A merge does not publish; an item with a publish step waits on the run.
3. Log lines are never rewritten. A correction is a new line under today.
4. Dirty worktree is work in flight, not evidence. Log it as "uncommitted on `<branch>`: N files"; it moves nothing.
5. `ME.md` holds ids and paths only. No passwords or tokens anywhere in `me/`.

## Reference

- [SOURCES.md](SOURCES.md) — the commands and queries per source, what each proves, when they disagree
- [templates/](templates/) — blank `ME.md`, `status.md`, `log.md`, `item.md`
