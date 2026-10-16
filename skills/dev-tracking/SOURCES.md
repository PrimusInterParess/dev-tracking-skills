# Sources and what each one proves

| Source | Answers | Does not prove |
| --- | --- | --- |
| Slack | What they said, asked, claimed. What they were told | That code exists |
| GitHub | What code exists, on which branch, mergeable or not | That it matches the ticket |
| Trello | What the ticket asks. What done means | That anyone started |

## Slack

Tools: the `project-0-LifeBonder-slack` MCP server.

- Find the user id once (`slack_search_users`). Keep it in `AGENT.md`.
- Latest messages: `slack_search_public_and_private` with `from:<@USERID>`, sort by timestamp, newest first.
- Full DM: `slack_read_channel` with the DM channel id.
- Reply where they wrote. DM → DM. Thread → thread reply with `thread_ts`.

Record: timestamp, permalink, one-line paraphrase. Do not paste whole messages.

Claims that need GitHub before a status moves: "done", "PR raised", "fixed", "pushed".

Requests that need a decision, never an automatic yes: "merge it", "run the action", "deploy", "what's next".

## GitHub

Repos: `LifeBonder/admin_dashboard` for dashboard UI, `LifeBonder/Lifebonder-API-Service` for the API. Always pass `--repo`.

```
gh pr list --repo LifeBonder/<repo> --state open --json number,title,author,headRefName,url,updatedAt
gh pr view <n> --repo LifeBonder/<repo> --json title,body,state,mergeable,reviewDecision,statusCheckRollup,changedFiles,commits
gh pr diff <n> --repo LifeBonder/<repo>
```

Reading a pull request against a job:

1. Branch name. `LBAD-<purpose>` from `main`. The name matches the pull request to a job.
2. Files changed. Anything outside the job's area is a scope question.
3. The diff, checkbox by checkbox. Look for the exact element the card named: placeholder text, filter type, empty-state wording, error branch.
4. `mergeable` and checks. "Mergeable, no checks" means nothing ran. Not a pass.

Record: number, URL, branch, state, which checkboxes it ticks.

## Trello

Tools: the `project-0-LifeBonder-trello` MCP server. Card short id is in the URL (`trello.com/c/<id>`).

- `get_card` with the short id, `includeMarkdown: true`. The description is the contract.
- Members: who it is assigned to. List: where the team thinks it is.
- Acceptance criteria and out-of-scope lines go into the job file checklist as written.

Record: card URL in the job file header. If the card changes, update the job file and note it in `decisions.md`.

## When sources disagree

- Slack says done, no pull request → status unchanged. Ask for the pull request.
- Pull request exists, card is in another list → trust the pull request for status. Move the card or ask who owns the board.
- Pull request does more than the card → the extra does not count toward this job, nor toward the next unless it meets that job's file. Say so.
- Card asks for what the API cannot give → a decision. Interview Yordan. Do not let the developer wait on a backend change without a written call.
