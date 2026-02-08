# Selection Criteria Definition (MethodDescription, A.3.2)

## Purpose
Design-time recipe for defining and maintaining personal selection criteria for strategic decisions.
Linked capability: ST.CAP.05.

## Interface (inputs/outputs)
- **Inputs**: Personal values, constraints, resource limitations, experience
- **Outputs**: Selection criteria table with rating scales
- **Resources**: Modeler (e.g. Coda), criteria template

## Preconditions
- User has at least some strategic context (dissatisfactions, projects)
- Quarterly review cycle or first-time setup

## Postconditions / Effects
- Criteria list recorded with rating scales (excellent/good/satisfactory/unsatisfactory)
- Criteria linked to values and constraints
- Criteria usable for project prioritization (ST.CAP.04)

## Non-functional constraints
- Criteria are personal — reflect user's values, not external standards
- Include both positive criteria (what I want) and constraints (what I avoid)
- Review quarterly or when major life changes occur

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — provides criteria template and prompts
- User#HumanApprover:strategator — defines criteria and scales

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.05 at status >= provisional

## Failure semantics
- If user cannot articulate criteria: use example criteria from source as starting point
- If criteria conflict: record and flag for resolution

## Steps
1. Review existing criteria (if any)
2. Consider current values, constraints, resource limitations
3. Define criteria dimensions (e.g., time to result, cost, alignment with values, emotional strength)
4. For each criterion: define rating scale (excellent/good/satisfactory/unsatisfactory)
5. Validate criteria against known projects — do they differentiate meaningfully?
6. Record criteria table

## References
- Capability: ST.CAP.05
- Evidence: ST.EV-002 (strategizing work products — criteria)
- Source: sources/self-development-methods/08-strategizing/12-modeling-selection-criteria.md
- Patterns: A.3.2
