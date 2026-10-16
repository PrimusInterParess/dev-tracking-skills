# Messages to the developer

Drafted, shown, sent only on "send", then logged.

## Shape

First sentence answers what they asked. Asked to merge → whether you will. Asked what is next → the job name.

Then, in order:

1. **Accepted.** Name the parts that meet the card so they stop touching them.
2. **Change.** One item per line: the element, what it does now, what it should do. Quote the card's exact strings (`Search User ID`).
3. **Leave out.** Next-job work in this pull request, and where it goes instead.
4. **Next job.** Only if the current one is fully accepted. Branch, card link, API shape, states to handle, out of scope.

Close with links: pull request, card.

## Tone

Plain sentences. No praise padding, no apology. "Do not" with the reason in the same sentence. "Fine" for accepted parts.

## Never in a message

- A password or token.
- A status the tracker does not show.
- A promise about another team's work that is not decided.
- A second task while the first is open, unless a decision says to parallelise.

## Where

- DM if they wrote in DM.
- Thread reply if they wrote in a thread: same channel, `thread_ts` of the parent.
- Channel post only when the whole channel needs it (an API request to another developer).

Send with `slack_send_message`. Set `unfurl_app_links: true` when the message carries GitHub or Trello links.

## After sending

```
### Slack reply sent

Posted in <DM / #channel thread>: <permalink>

<One line on what it tells them.> Job <n> stays / moves to **<Status>**.
```

## Templates

### Hold the merge, fix one thing

> Hi <Name> — I will not merge pull request <n> yet. <Why, one sentence.>
>
> <Job> is still your job. <Accepted parts> are fine. Change <element>: <what it does now> → <what the card asks>.
>
> Take <next-job work> off this pull request. It is the next job, on branch `<branch>`: <card>.

### Job accepted, next job

> Hi <Name> — pull request <n> matches the card. I will merge it. Do not run the GitHub Action; publishing is a separate step I run.
>
> Next: <Job>. Card: <link>. Branch `<branch>` from `main`.
>
> `<METHOD /path>` returns <shape>. Show <fields>. Handle loading, empty (<what empty looks like>), and error. Out of scope: <list>.

### Need one thing from them

> Hi <Name> — before I can <merge / answer>, I need <one thing>. <Why.> Reply here.

### Blocked on our side

> Hi <Name> — <blocker> is on us. Do not wait on it. <What to build meanwhile, from the job file's "when to switch".> I will tell you here when it changes.
