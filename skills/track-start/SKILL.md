---
name: track-start
description: Set up a tracking folder for a new developer — Slack id, GitHub login, job order from Trello, job files, status, first decision entry.
argument-hint: "<Name> and anything known: Slack handle, area, off limits, repo, board, onboarding permalink"
disable-model-invocation: true
---

# Start tracking a developer

Shared reference: `/dev-tracking`. Tracker root and folder layout are in its `SKILL.md`.

Read [../dev-tracking/RULES.md](../dev-tracking/RULES.md) before writing `AGENT.md`.

## Steps

1. **Identify them.** Slack user id via `slack_search_users`. GitHub login from any pull request they opened on the repo; if none, ask Yordan. Timezone from the Slack profile.
2. **Create the folder.** `people/<Name>/` under the tracker root, from [../dev-tracking/templates/](../dev-tracking/templates/). Fill every angle bracket in `AGENT.md`. Leave none.
3. **Find their cards.** Trello board from the arguments or `AGENT.md`. Cards in their area, not in off-limits lists. For each candidate: title, list, members, one line of what it asks.
4. **Propose a job order.** Two to four jobs. Dependencies first, then the weakest screen in their area. Show the order with one reason each. If two orders are defensible, interview Yordan per [../dev-tracking/DECISIONS.md](../dev-tracking/DECISIONS.md) before going on.
5. **Write the job files.** One per job from `templates/job.md`: card link, API shape (check the API repo or `api.md`, do not guess), checklist copied from the card's acceptance criteria one behaviour per box, out of scope, branch `LBAD-<purpose>`, done-when. Where a card is vague, interview Yordan before filling the checklist.
6. **Fill `status.md`.** First job **Not started**, the rest **Waiting on job N**.
7. **Start `decisions.md`.** One entry: the job order and why. Any standing call made now (for example, build with today's API shape).
8. **Onboarding message.** If not sent, draft it per [../dev-tracking/MESSAGING.md](../dev-tracking/MESSAGING.md): repo, local setup, docs to read, job order, branch rules, no publishing. Show it. Do not send. If already sent, store the permalink in `AGENT.md` and `status.md`.

Complete when: the folder has `AGENT.md`, `status.md`, `decisions.md`, and one file per job, with no angle brackets left, and `people/README.md` lists them.
