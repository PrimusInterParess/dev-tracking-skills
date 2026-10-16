# Standing rules

Applied to every developer unless their `AGENT.md` says otherwise. No need to ask. Cite the rule in `decisions.md`.

## Shipping

- Branch from `main`. Name `LBAD-<short-purpose>`. Fixes: `LBAD-<short-purpose>-bugfix`.
- One job per branch and per pull request. Next-job work goes on its own branch.
- Pull requests open on the repo named in the job file.
- A job that needs an API change is raised before the UI is coded. Flag it to Yordan.

## Publishing

- A merge does not update the live site.
- Publishing is the manual GitHub Action Azure Static Web Apps CI/CD on `main`. Only Yordan runs it.
- "Run the action" or "deploy" from a developer is a request to hold, not to do.

## Merging

- Yordan merges. The agent does not.
- Merge only when the job file is fully ticked against the diff.
- GitHub "mergeable" means no conflicts. It says nothing about the ticket.

## Scope

- Each developer has an area and an off-limits list in `AGENT.md`. Work outside the area is a decision for Yordan.
- Admin dashboard off limits today: AI moderation, the Trello Moderation list, Reported Posts.
- The developer does not wait on another team's change unless a decision says to. Build with what the API returns today; write down when to switch.

## Status

- Done means the checklist, not a message.
- A status moves down (Done → In progress) only with a written reason in `decisions.md`.

## Communication

- Drafts are shown before they are sent.
- Reply where they wrote.
- Do not re-send onboarding.
- Passwords and tokens never go into Slack, Trello, GitHub, or the repo. Shared logins live in `AGENT.md` only, outside the repo.

## Records

- Every call in `decisions.md`, dated, newest first, never rewritten.
- Every sent message in `decisions.md` with its permalink.
- The job file is updated the same day the evidence is read.
