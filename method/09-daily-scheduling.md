# Daily Scheduling (MethodDescription, A.3.2)

## Purpose
Design-time recipe for maintaining daily schedule, calendar slots, and time crumbs list.
Linked capability: ST.CAP.09.

## Interface (inputs/outputs)
- **Inputs**: Weekly work plan (from ST.CAP.08), calendar, daily routine template
- **Outputs**: Daily schedule, calendar with time slots, time crumbs list
- **Resources**: Calendar app, Pomodoro tracker

## Preconditions
- Weekly work plan exists
- Daily routine template available (or to be created)

## Postconditions / Effects
- Calendar slots assigned for important work (protected time)
- Daily schedule template defined (life routine + work slots)
- Time crumbs list populated (small tasks for 5-15 minute gaps)

## Non-functional constraints
- Protect time slots for important work first
- Daily schedule = routine template (repeated weekly) + variable daily items
- Time crumbs = tasks completable in 5-15 minutes, no deep focus required
- Schedule should be realistic and include rest/transitions

## Role requirements (A.2.1)
- Strategator#PlanningAssistant:strategator — suggests slot allocation, maintains crumbs list
- User#HumanApprover:strategator — approves schedule, defines routine

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.09 at status >= provisional

## Failure semantics
- If no protected slots available: flag overcommitment, suggest renegotiation
- If time crumbs list empty: not a failure — will populate as small tasks emerge

## Steps
1. Review weekly plan and identify items requiring deep focus
2. Assign calendar slots for deep-focus items (protect these)
3. Review/update daily routine template (wakeup, meals, exercise, work blocks)
4. Map remaining work items to available daily slots
5. Collect small tasks into time crumbs list (5-15 min each)
6. Record schedule and crumbs list

## References
- Capability: ST.CAP.09
- Evidence: ST.EV-004 (planning work products — schedule, crumbs)
- Source: sources/self-development-methods/09-planning/12-modeling-daily-schedule.md, 14-modeling-time-crumbs.md
- Patterns: A.3.2
