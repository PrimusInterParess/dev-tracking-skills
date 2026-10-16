# <n>. <Job name>

**Status:** Not started  
**Trello:** <card link>  
**PR:** <none yet | link (branch, state, mergeable, checks)>

<One line: the user story from the card.>

<Dated notes on what they reported or shipped. One line each. Newest last.>

## API

`<METHOD /api/...>`

<Response shape. Fields. Paging or none. What empty looks like. What the API does not send.>

## Do

- [ ] <Check from the card's acceptance criteria. One behaviour per box.>
- [ ] <...>
- [ ] Loading state
- [ ] Empty state: <exact wording or condition>
- [ ] Error state: <failure is not the same as empty>
- [ ] PR from `LBAD-<purpose>` on `LifeBonder/<repo>`

When a box is not met, write under it what they built and what the card asks, one sentence each.

## When to change the API call

<If the API may change: what the response must look like before the UI switches. If not: "Not expected to change for this job.">

## Out of scope

- <From the card>
- Publishing the live site

## Branch

`LBAD-<purpose>` from `main`.

## Done when

<One sentence. The checks above are met on the test API, and the pull request is open.>
