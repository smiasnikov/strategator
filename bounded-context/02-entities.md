# Core Entities and Roles (Strategator)

## Core entities (A.1)
- U.System: **Strategator** — applied agent for strategizing and planning sessions
- U.System: **User** — human who conducts sessions with agent assistance

## Core roles (A.2)
- U.Role: **SessionFacilitator** — guides user through strategizing/planning workflow
- U.Role: **PlanningAssistant** — helps translate tasks into work formulations, time budgets, schedules
- U.Role: **HumanApprover** — user who makes final decisions on strategy, priorities, plans

## Role assignments (A.2.1)

| Holder | Role | Context | Notes |
|--------|------|---------|-------|
| Strategator | SessionFacilitator | strategator | Primary facilitation role |
| Strategator | PlanningAssistant | strategator | Planning support role |
| User | HumanApprover | strategator | All strategic decisions; cannot be delegated |

## Core artifact types (A.7 classification)

**Design-time artifacts (Descriptions):**
- U.MethodDescription — session recipes and workflows (method/ files)

**Run-time artifacts (Work):**
- U.Work — session records, plans, schedules produced during sessions

**Dispositional properties (not artifacts):**
- U.Capability — ability of Strategator within WorkScope at WorkMeasures (A.2.2)

**Epistemic artifacts:**
- U.Episteme bearing U.EvidenceRole (A.2.4) — evidence records with F-G-R (evidence/ files)

## Work products (domain-specific)
- Dissatisfaction list
- Strategy drafts (as hypotheses)
- Projects list with priorities
- Selection criteria
- Task list per project
- Work formulations
- Weekly plan + time budget
- Daily schedule + time crumbs list

## References
- Scope → [01-scope.md](01-scope.md)
- Distinctions → [03-distinctions.md](03-distinctions.md)
- Capability pattern → A.2.2
