# Where my work shows up

| Source | Proves | Does not prove |
| --- | --- | --- |
| Local git | Commits I made, on which branch, in which repo | That anything is reviewed or live |
| GitHub | Pull requests I opened, merged, or reviewed. Issues on me | That the work is finished for the user |
| Slack | What I told people, what I asked, what I promised | That I did it |
| Trello | Cards on me, which list they sit in | That the card moved because of me |
| `people/*/decisions.md` | Reviews and calls I made on other developers | — |

Identifiers, repo paths, owners, and boards are in `ME.md`. Read it first.

## Local git

Per repo path in `ME.md`:

```
git -C <path> log --all --author="<author>" --since="<date>" --format="%h %ad %D %s" --date=short
git -C <path> branch --show-current
git -C <path> status --short
```

- A commit whose subject starts `Merge pull request #n` merges someone else's work. Log it as a review of that pull request, not as my change.
- `status --short` with output is a dirty worktree. Log "uncommitted on `<branch>`: N files" under the item that branch belongs to. It moves nothing.

Record: repo, short hash, branch, subject.

## GitHub

Per owner in `ME.md`. `@me` resolves to the signed-in `gh` user.

```
gh search prs --author=@me --owner <owner> --updated ">=<date>" --json number,title,repository,url,state,updatedAt
gh search prs --author=@me --owner <owner> --merged --merged-at ">=<date>" --json number,title,repository,url
gh search prs --reviewed-by=@me --owner <owner> --updated ">=<date>" --json number,title,repository,url,author
gh search issues --assignee=@me --owner <owner> --state open --json number,title,repository,url
gh pr view <n> --repo <owner>/<repo> --json headRefName,state,mergedAt,reviewDecision,statusCheckRollup
```

- Branch name matches a pull request to an item.
- Open more than two weeks → an open call in the status show. Merge it, close it, or **Park** the item.

Record: `repo#number`, title, state, URL.

## Slack

Tools: the `project-0-LifeBonder-slack` MCP server. My user id is in `ME.md`.

```
slack_search_public_and_private  query: from:<@USERID> after:<yyyy-mm-dd>   sort by timestamp, newest first
```

Keep a post when it tells someone what to do, answers a question, or commits me to something. Skip the rest.

A post that commits me to something ("I will …", "I'll check …") with no item behind it → open call. `start` it or `note` it.

Record: channel or DM, one-line paraphrase, permalink. Do not paste the message.

## Trello

Tools: the `project-0-LifeBonder-trello` MCP server.

```
get_my_cards
```

A card that changed list since the last sync is evidence. A card sitting still is not. Record: card, board, list, URL.

## Dev reviews

For every `people/<Name>/decisions.md`, read the `## <date>` sections dated on or after the sync date. Each `###` entry is one log line under the item **Dev reviews**:

```
- Review: <Name> — <entry title>. [decisions.md](../people/<Name>/decisions.md)
```

A "Slack reply sent" entry there is also a message of mine; its permalink is the link.

## When sources disagree

- Commit, no pull request → **In progress**. Not **Done**.
- Pull request merged, item has a publish step → **Waiting on publish**. The run is the proof.
- Slack says I will do it, nothing else shows → open call, not an item, until I `start` it.
- Card moved to Done, nothing of mine shows → log the card move under **Other**; the item does not move.
