---
name: track-next-task
description: Close an accepted job and hand over the next one — verify the checklist, flip statuses, confirm the API shape, draft the instruction, log it.
argument-hint: "<Name> <accepted job number>"
disable-model-invocation: true
---

# Hand over the next job

Shared reference: `/dev-tracking`.

## Steps

1. **Verify.** Every box in job <n>'s file ticked, with the pull request open or merged. One unticked → stop and name it. Do not hand over.
2. **Flip.** In `status.md`: job <n> → **Done**, job <n+1> → **Not started**.
3. **Re-read the next job.** Its file and its Trello card. If the card changed since the file was written, update the file and note it in `decisions.md`.
4. **Confirm the API.** If job <n+1> depends on an endpoint, confirm the response shape against the API repo or `api.md`. Do not promise a field or paging that does not exist.
5. **Draft.** Per [../dev-tracking/MESSAGING.md](../dev-tracking/MESSAGING.md), "accepted, next job" template: card, branch from `main`, API shape, states to handle (loading, empty, error), out of scope, no publishing. Show it. Do not send until Yordan says so.
6. **Log.** Dated entry in `decisions.md`: job <n> accepted, job <n+1> assigned, message sent or held.

## No next job written

Say so. Offer two or three candidate cards from their area with one line each. Interview Yordan per [../dev-tracking/DECISIONS.md](../dev-tracking/DECISIONS.md) to pick one, then write its job file from [../dev-tracking/templates/job.md](../dev-tracking/templates/job.md) and a new row in `status.md`.

Complete when: statuses are flipped, the next job file matches its card, the draft is shown, and the hand-over is logged.
