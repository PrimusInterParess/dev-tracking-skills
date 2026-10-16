# The process

## The loop

Runs when the developer posts in Slack, opens or updates a pull request, or Yordan asks what they should be doing.

1. **Read the folder.** `AGENT.md`, `status.md`, `decisions.md`, the current job file.
2. **Collect evidence.** Per [SOURCES.md](SOURCES.md): their latest Slack messages and the DM, their open pull requests, the Trello card on the current job.
3. **Compare the pull request to the job file.** Tick a checkbox only if the diff shows it. Under each unticked box, one sentence: what they built, what the card asked for.
4. **Check scope.** Next-job work inside this pull request. Off-limits areas. Requests to merge or publish.
5. **Review the merge request.** When a pull request matches a job, make the call — Merge, Hold, or Ask — per [../track-review-pr/SKILL.md](../track-review-pr/SKILL.md), before any instruction or message. Skip when no pull request matches.
6. **Decide.** Per [DECISIONS.md](DECISIONS.md). Anything not covered by a standing rule or the job file: stop and interview Yordan before writing it down.
7. **Write it down.** Job file checkboxes, status table, dated entry in `decisions.md`.
8. **Draft the message.** Per [MESSAGING.md](MESSAGING.md). When a pull request was reviewed, the instruction and the message come only from that review. Show it. Send only on "send". Log the permalink.

Complete when: the job file, `status.md`, and `decisions.md` agree with the evidence, and the draft is shown.

## Moving to the next job

When every box in the current job file is ticked:

- Current job → **Done**. Next job → **Not started**.
- Draft the next instruction from its job file. Show it. Send on approval.
- Record the hand-over in `decisions.md`.

## Adding a job

New work goes in a new numbered file after the last one, and a new row in `status.md`. Record the assignment in `decisions.md`. Do not insert it earlier unless Yordan says so.

## Cadence

- Every ping: the loop.
- Weekly: `/track-weekly`. From the folder and fresh evidence, not from memory.
