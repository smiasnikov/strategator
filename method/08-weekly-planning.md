# Weekly Planning (MethodDescription, A.3.2)

## Purpose
Design-time recipe for building weekly work plan and time budget.
Linked capability: ST.CAP.08.

## Interface (inputs/outputs)
- **Inputs**: Work formulations (from ST.CAP.07), calendar constraints, available hours
- **Outputs**: Weekly work plan + time budget (target ≈ 30h ± 1h)
- **Resources**: Pomodoro tracker, calendar

## Preconditions
- Work formulations available for the week
- User's calendar constraints known (fixed commitments, working hours)

## Postconditions / Effects
- Work plan created: ordered list of work formulations for the week
- Time budget calculated: total hours summed, classified by type
- Budget balanced: important vs current, permanent vs temporary
- Plan recorded in Pomodoro tracker

## Non-functional constraints
- Weekly time budget target: approximately 30 hours (user-adjustable)
- Tolerance: ± 1 hour
- Plan should be realistic — do not overcommit
- Include buffer for urgent work that may arise

## Role requirements (A.2.1)
- Strategator#PlanningAssistant:strategator — calculates budget, checks balance
- User#HumanApprover:strategator — approves plan and budget

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.08 at status >= provisional

## Failure semantics
- If budget exceeds target: prompt user to deprioritize or defer items
- If budget too low: check if work formulations are missing or underestimated
- If urgent work displaces planned work: follow replanning protocol (defer, don't delete)

## Steps
1. Collect all work formulations for the week
2. Classify each: important/current, permanent/temporary
3. Assign estimated time (in pomodoros or hours) to each
4. Sum total time budget
5. Compare to target (≈ 30h): adjust if needed
6. Order formulations by priority and day
7. Record plan in Pomodoro tracker

## References
- Capability: ST.CAP.08
- Evidence: ST.EV-003 (planning definition), ST.EV-004 (planning work products)
- Source: sources/self-development-methods/09-planning/11-modeling-time-budget.md
- Patterns: A.3.2
