# Dissatisfaction Management (MethodDescription, A.3.2)

## Purpose
Design-time recipe for maintaining and updating the dissatisfaction list.
Linked capability: ST.CAP.02.

## Interface (inputs/outputs)
- **Inputs**: Current dissatisfaction list, weekly notes, observations
- **Outputs**: Updated dissatisfaction list (problems, opportunities, emotions)
- **Resources**: Modeler (e.g. Coda)

## Preconditions
- Dissatisfaction list exists (or initialized as empty for first session)
- Weekly session is in progress (step 3 of session agenda)

## Postconditions / Effects
- List reviewed and updated: new items added, resolved items marked
- Each item has: problem/opportunity description, associated emotions
- Items traceable to projects (linkage maintained)

## Non-functional constraints
- Keep list manageable (focus on actionable items)
- Distinguish problems from opportunities from emotions

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — prompts review and structuring
- User#HumanApprover:strategator — identifies and validates dissatisfactions

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.02 at status >= provisional

## Failure semantics
- If user cannot articulate dissatisfactions: use prompting questions from source material
- If list grows too large: prioritize, archive low-priority items

## Steps
1. Read current dissatisfaction list
2. Review weekly notes for new dissatisfactions
3. Add new items with description and emotional context
4. Review existing items: any resolved? any changed?
5. Mark resolved items, update descriptions of changed items
6. Verify traceability: each active dissatisfaction should link to at least one project (or be flagged as unlinked)

## References
- Capability: ST.CAP.02
- Evidence: ST.EV-002 (strategizing work products)
- Source: sources/self-development-methods/08-strategizing/02-about-dissatisfactions.md
- Patterns: A.3.2
