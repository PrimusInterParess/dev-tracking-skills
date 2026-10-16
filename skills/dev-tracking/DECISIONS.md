# Making decisions

Two kinds of call: standing rules applied alone, and open questions where the agent stops and interviews Yordan.

## Apply without asking

Covered by [RULES.md](RULES.md) or the job file:

- Hold a merge because a checkbox is not met.
- Refuse to publish.
- Keep **In progress** when Slack says done and the diff does not.
- Tell the developer to move next-job work off the current pull request.
- Accept an equivalent implementation that meets the behaviour the card describes (one range picker for "From and To", when the end date is included and the filter works on loaded rows).

Each still gets a `decisions.md` entry naming the rule.

## Stop and interview

Two readings would lead to different work:

- The card and the API disagree.
- The developer asks for a change to another team's code.
- The developer proposes a different design than the card.
- Work is finished and the next job is not written.
- They are blocked and the blocker is on our side.
- A status would move down.
- Someone other than Yordan gave them a task.
- The pull request touches an off-limits area.

## How the interview runs

Use the `/grilling` skill. One question at a time, wait for the answer. Each question carries a recommended answer and the reason. Anything the code, the pull request, the card, or Slack can answer, look up instead of asking. Ask the question that unblocks the most other questions first. Stop when the remaining questions would not change what the developer does.

Question shape:

> **Question.** What it is.
> **Why it matters.** Which job or rule hangs on it.
> **Recommended.** One answer, and why.
> **Evidence.** Slack permalink, pull request, card.

## Write the decision

One entry in `decisions.md` under today's date:

```
### <Short title, imperative>

<The call, one or two sentences.>

<Why. The rule, the card line, or the interview answer.>

Job <n> stays / moves to **<Status>**.
```

Then `status.md` and the job file match it. Then the message, if one is owed.

The log is the memory. "Why is this still open" must be answerable from `decisions.md`, not from a chat transcript.
