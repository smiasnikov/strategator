# Traceability: Dissatisfactions → Projects → Tasks (MethodDescription, A.3.2)

## Purpose
Design-time recipe for maintaining full-chain traceability from dissatisfactions through projects to tasks.
Linked capability: ST.CAP.06.

## Interface (inputs/outputs)
- **Inputs**: Dissatisfaction list, projects list, task list
- **Outputs**: Updated trace links (dissatisfaction → project → tasks)
- **Resources**: Modeler (e.g. Coda)

## Preconditions
- Dissatisfaction list updated (ST.CAP.02)
- Projects list updated (ST.CAP.04)
- Session is in progress (step 7 of session agenda)

## Postconditions / Effects
- Every active dissatisfaction linked to at least one project
- Every priority project has at least one task
- Orphan items flagged (dissatisfactions without projects, projects without tasks)
- Task list per priority project updated

## Non-functional constraints
- Traceability is a quality check, not a creative step
- Focus on priority projects first
- Orphan items are acceptable temporarily but should be resolved within 2-3 sessions

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — checks linkages, flags orphans
- User#HumanApprover:strategator — creates missing links, decides on orphan resolution

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.06 at status >= provisional

## Failure semantics
- If linkage gaps found: record as explicit gaps for next session
- If dissatisfaction has no viable project: flag for strategy review (ST.CAP.03)

## Steps
1. Review dissatisfaction list: for each active item, verify project link
2. Review priority projects: for each, verify task list exists
3. Flag orphan dissatisfactions (no project link)
4. Flag orphan projects (no tasks or no dissatisfaction link)
5. Create missing links where obvious
6. Record flagged items for future resolution

## References
- Capability: ST.CAP.06
- Evidence: ST.EV-002 (strategizing work products)
- Source: sources/self-development-methods/08-strategizing/21-modeling-project-tasks.md
- Patterns: A.3.2, A.10 (traceability principle)
