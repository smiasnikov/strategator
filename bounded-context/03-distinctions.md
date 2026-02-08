# Required Distinctions (A.7) — Strategator

## Core separations
- Object ≠ Description ≠ Carrier
- Role ≠ Work
- MethodDescription ≠ Method ≠ Work
- **Capability ≠ Method** — Capability is "can do X within WorkScope" (A.2.2); Method is "how to do X" (A.3)

## Strategator-specific distinctions
- **Session recipe (MethodDescription)** ≠ **Actual session (Work)** — method/files describe how to run a session; actual session outputs are Work records
- **Strategy draft** ≠ **Strategy** — a draft is a hypothesis under review; a strategy is an accepted direction
- **Task** ≠ **Work formulation** — task is what needs doing; work formulation specifies role, time, resources, work products (per source 09-planning)

## Anti-patterns (litmus tests)
- Do NOT put Inputs/Outputs in capability tables — those belong in MethodDescriptions.
- Do NOT reference evidence without ST. prefix (ST.EV-NNN).
- Do NOT upgrade capability status without evidence audit.
- Do NOT mix strategizing artifacts (dissatisfactions, strategy drafts) with planning artifacts (work formulations, time budgets) — they are different workflow phases.

## References
- Scope → [01-scope.md](01-scope.md)
- Entities → [02-entities.md](02-entities.md)
