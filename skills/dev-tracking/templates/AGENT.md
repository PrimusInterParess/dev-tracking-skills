# Agent handoff — <Name>

Read this file first. Then `status.md`. Then `decisions.md`. Then the job file whose status is **Not started** or **In progress**.

Process: the `/dev-tracking` skill. Its `RULES.md` applies here unless this file says otherwise.

Yordan Borisov (Slack `U0AR2DG4THD`) is tracking this developer. This folder is the source of truth for what they were told to do.

## Who

- Name: <Name>. Also called: <aliases>
- Slack: <handle> (`<user id>`), `<email>`
- GitHub: `<login>`
- Timezone: <tz>
- Role: <e.g. Angular developer on the admin dashboard>

## Where

- Channel: `#<channel>` (`<channel id>`)
- DM: `<dm channel id>`
- Repo: https://github.com/LifeBonder/<repo>
- Trello board: <link>
- Live site: <url>
- Shared login: `<user>` / `<password>` — never paste this into Slack, Trello, or GitHub

## Area

Owns: <e.g. user traffic, then user reporting>

Off limits: <e.g. AI moderation, the Trello Moderation list, Reported Posts>

## What already happened

<Date>: <who onboarded them, where, permalink>. Parent ts `<ts>`, reply ts `<ts>`.

That message gave them: <repo, live URL, login, local setup, docs to read, job order>.

Job order:

1. <Job> — `01-<job>.md`
2. <Job> — `02-<job>.md`
3. <Job> — `03-<job>.md`

## How to proceed

1. Check what they have actually done before changing a status: Slack, the Trello card on the job file, pull requests and `LBAD-*` branches.
2. Write the result into `status.md` and the job file. Statuses: **Not started**, **In progress**, **Blocked**, **Waiting on job N**, **Done**. If blocked, write the blocker in the job file.
3. Every call that changes what they do, what counts as done, or whether to merge or publish goes at the top of `decisions.md`, dated. Never rewrite older entries.
4. Keep the order. Job 2 starts when job 1 is **Done**.
5. When a job is done, draft the next instruction from the following job file and show it to Yordan. Post to Slack only after he says to send. Reply where they wrote. Log the permalink in `decisions.md`.
6. They must not run **Azure Static Web Apps CI/CD**. A merge does not publish. Publishing stays with Yordan.
7. New work goes in a new numbered file and a new row in `status.md`, after the last job, unless Yordan says to insert it earlier. Record it in `decisions.md`.

## Do not

- Re-send the onboarding message.
- Assign off-limits work.
- Commit the shared password anywhere.
- Publish the live dashboard.
- Mark a job done from a Slack message. Done means the checks in the job file are met against the diff.
