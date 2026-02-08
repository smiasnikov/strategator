# Project Prioritization (MethodDescription, A.3.2)

## Purpose
Design-time recipe for maintaining projects list and setting priorities.
Linked capability: ST.CAP.04.

## Interface (inputs/outputs)
- **Inputs**: Current projects list, dissatisfaction list, selection criteria
- **Outputs**: Updated projects list with explicit priorities, target outcomes per project
- **Resources**: Modeler (e.g. Coda), selection criteria table

## Preconditions
- Dissatisfaction list reviewed (step 3 of session)
- Selection criteria defined (ST.CAP.05) or at least implicit

## Postconditions / Effects
- Projects list updated: new projects added, completed/cancelled removed
- Priority projects explicitly marked (recommended: 2-5 active)
- Each priority project has: target outcome, estimated time investment
- Priority order explicit (which project comes first)

## Non-functional constraints
- Keep active project count manageable (2-5 recommended)
- If more projects needed, consider grouping
- Investment projects distinguished from maintenance projects
- Time horizon: typically 3-6 months per project (50-500 hours)

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — structures project review
- User#HumanApprover:strategator — decides on priorities

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.04 at status >= provisional

## Failure semantics
- If too many projects: prompt user to group or deprioritize
- If no selection criteria: use implicit preferences, flag for ST.CAP.05

## Steps
1. Review current projects list
2. Add new projects derived from dissatisfactions and strategy
3. For each project: verify target outcome and estimated investment
4. Apply selection criteria to rank projects
5. Mark priority projects (2-5 recommended)
6. Set explicit priority order among priority projects
7. Record updated list with priorities

## References
- Capability: ST.CAP.04
- Evidence: ST.EV-002 (strategizing work products — project lists)
- Source: sources/self-development-methods/08-strategizing/15-modeling-projects-list.md, 06-modeling-strategy-projects.md
- Patterns: A.3.2
