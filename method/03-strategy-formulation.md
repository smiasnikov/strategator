# Strategy Formulation (MethodDescription, A.3.2)

## Purpose
Design-time recipe for formulating and updating strategy as hypotheses.
Linked capability: ST.CAP.03.

## Interface (inputs/outputs)
- **Inputs**: Dissatisfaction list, notes/ideas, previous strategy drafts
- **Outputs**: Updated strategy drafts (hypotheses about methods to achieve goals)
- **Resources**: Modeler, writing-thinking tool (drafts/posts)

## Preconditions
- Dissatisfaction list available (at least partially populated)
- Notes or ideas accumulated during the week

## Postconditions / Effects
- Strategy drafts updated or new drafts created
- Each draft contains hypotheses about methods for achieving goals
- Drafts linked to dissatisfactions and projects

## Non-functional constraints
- Strategy = collection of hypotheses, not a monolithic document
- Can be realized as drafts, posts, table entries
- Focus on methods (how to achieve goals), not just goals
- Regular review more important than document completeness

## Role requirements (A.2.1)
- Strategator#SessionFacilitator:strategator — structures hypothesis formulation
- User#HumanApprover:strategator — generates and validates hypotheses

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.03 at status >= provisional

## Failure semantics
- If no new ideas: re-read existing drafts (maintains focus, per source)
- If hypotheses conflict: record both, defer resolution to next session

## Steps
1. Review existing strategy drafts and priority drafts list
2. Consider new notes/ideas from the week
3. Formulate or update hypotheses about methods for addressing dissatisfactions
4. Link hypotheses to specific dissatisfactions and projects
5. Prioritize drafts for further writing-thinking work during the week
6. Record updated drafts

## References
- Capability: ST.CAP.03
- Evidence: ST.EV-002 (strategizing work products)
- Source: sources/self-development-methods/08-strategizing/05-what-is-strategizing.md, 11-what-is-strategy.md
- Patterns: A.3.2, B.5.2 (abductive loop — hypothesis generation)
