# Strategizing Session (MethodDescription, A.3.2)

## Purpose
Design-time recipe for running a weekly strategizing session.
Linked capability: ST.CAP.01.

## Interface (inputs/outputs)
- **Inputs**: Session agenda (standard template + custom items), notes from the week, previous session materials
- **Outputs**: Updated strategizing artifacts (dissatisfaction list, projects, priorities, strategy drafts, task list)
- **Resources**: Modeler (e.g. Coda), Pomodoro tracker, previous session records

## Preconditions
- Agenda prepared (standard template available)
- Previous session artifacts accessible
- Time-boxed slot allocated (1-2 pomodoros for beginners)

## Postconditions / Effects
- All agenda items reviewed (or time-box exhausted with items deferred to next session)
- Updated lists: dissatisfactions, projects, priorities
- Tasks for priority projects reviewed
- Work plan and time budget drafted (feeds into planning capabilities)

## Non-functional constraints
- Time-boxing: do not exceed allocated time, especially in early sessions
- Regularity is more important than completeness
- Review all previously created strategic materials at minimum (maintain focus)

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — guides session structure
- User#HumanApprover:strategator — makes all strategic decisions

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.01 at status >= provisional

## Failure semantics
- If agenda not prepared: use minimal default agenda
- If previous materials unavailable: proceed with available data, note gap
- If time exhausted before all items: defer remaining to next session (not a failure)

## Steps
1. Open session: review agenda, set timer
2. Process notes and review priority drafts
3. Read and update dissatisfaction list (ST.CAP.02)
4. Update project list and priorities (ST.CAP.04)
5. Review/update strategy drafts (ST.CAP.03)
6. Analyze last week's execution and plan compliance
7. Review task list for priority projects (ST.CAP.06)
8. Build weekly work plan and time budget (ST.CAP.07, ST.CAP.08)
9. Define time crumbs list (ST.CAP.09)
10. Close session: record work products (ST.CAP.10)

## References
- Capability: ST.CAP.01
- Evidence: ST.EV-001 (session agenda structure)
- Source: sources/self-development-methods/08-strategizing/13-strategic-session-agenda.md
- Patterns: A.3.2, A.15.1, B.5
