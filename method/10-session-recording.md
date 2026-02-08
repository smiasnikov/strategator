# Session Recording (MethodDescription, A.3.2)

## Purpose
Design-time recipe for recording session work products at the end of a strategizing/planning session.
Linked capability: ST.CAP.10.

## Interface (inputs/outputs)
- **Inputs**: All session outputs (updated lists, plans, schedules, drafts)
- **Outputs**: Work products summary record for the session
- **Resources**: Modeler (e.g. Coda), session template

## Preconditions
- Session completed (or time-box exhausted)
- All in-session work products finalized

## Postconditions / Effects
- Work products list for the session recorded
- Each product identified: what was created/updated, where stored
- Session date and duration recorded
- Ready for next-session review

## Non-functional constraints
- Keep recording brief — focus on what was produced, not process
- Use consistent format across sessions for traceability

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — prompts recording, provides template
- User#HumanApprover:strategator — confirms completeness

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.10 at status >= provisional

## Failure semantics
- If session was interrupted: record what was completed, note interruption reason
- If no new products: record "maintenance session — review only"

## Steps
1. List all artifacts created or updated during session
2. For each: note what changed and where it is stored
3. Record session metadata: date, duration (pomodoros), agenda items covered
4. Note any deferred items for next session
5. Save session record

## References
- Capability: ST.CAP.10
- Evidence: ST.EV-002 (strategizing work products), ST.EV-004 (planning work products)
- Source: sources/self-development-methods/08-strategizing/14-work-products.md, 09-planning/13-work-products.md
- Patterns: A.3.2, A.15.1 (Work — immutable run-time record)
