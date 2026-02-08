# Capabilities: Strategator (Level 1 — Provisional)

All capabilities are provisional and must be validated by evidence (A.10 / B.3 / B.3.4).

## Level 1 schema (A.2.2 alignment)

Fields per U.Capability (A.2.2 conceptual descriptors):
- **CapabilityId** — unique identifier
- **Description** — what the system can do (positive, measurable terms)
- **Holder** — which U.System has this capability
- **Context** — U.BoundedContext where measures are established (A.1.1)
- **TaskFamily** — reference to MethodDescription(s) the system can execute (A.3.2)
- **WorkScope** — conditions/assumptions under which capability holds (A.2.6 USM)
- **WorkMeasures** — measurable targets (CHR-style, A.17)
- **Evidence** — links to evidence records (A.10)
- **F-G-R** — trust scores: Formality, ClaimScope, Reliability (B.3)
- **DecayWindow** — evidence freshness window (B.3.4)
- **Status** — provisional / smoke-validated / validated

Note: Inputs, Outputs, Preconditions, Postconditions belong in MethodDescriptions (method/ files), NOT in capability declarations (A.7 Strict Distinction: Capability ≠ Method).

## Context
- Applied agent for weekly strategizing/planning sessions.
- Mastery level target: "умение" (skill).
- Sources: sections 08 (strategizing) and 09 (planning).

## Capability table

| CapabilityId | Description | Holder | Context | TaskFamily | WorkScope | WorkMeasures | Evidence | F-G-R | DecayWindow | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| ST.CAP.01 | Run weekly strategizing session | Strategator | strategator | [method/01](method/01-strategizing-session.md) | Weekly; time-boxed session | Session completed with agenda items covered | ST.EV-001 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.02 | Maintain dissatisfaction list | Strategator | strategator | [method/02](method/02-dissatisfaction-management.md) | Weekly; ongoing list | List updated; items traceable to projects | ST.EV-002 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.03 | Formulate/update strategy as hypotheses | Strategator | strategator | [method/03](method/03-strategy-formulation.md) | Ongoing; hypothesis-driven | Strategy drafts updated per session | ST.EV-002 | F1/G:self-dev/R:medium | 6 months | provisional |
| ST.CAP.04 | Maintain projects and priorities | Strategator | strategator | [method/04](method/04-project-prioritization.md) | Weekly; project-list scope | Projects listed; priorities explicit | ST.EV-002 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.05 | Define selection criteria | Strategator | strategator | [method/05](method/05-selection-criteria.md) | Quarterly or as needed | Criteria list recorded; linked to values | ST.EV-002 | F1/G:self-dev-quarterly/R:medium | 6 months | provisional |
| ST.CAP.06 | Trace dissatisfactions → projects → tasks | Strategator | strategator | [method/06](method/06-traceability.md) | Weekly; full-chain tracing | Trace links updated; no orphan items | ST.EV-002 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.07 | Translate tasks into work formulations | Strategator | strategator | [method/07](method/07-work-formulation.md) | Weekly; task-to-work conversion | Work formulations specify role, time, resources, products | ST.EV-003 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.08 | Build weekly plan and time budget | Strategator | strategator | [method/08](method/08-weekly-planning.md) | Weekly; plan + budget | Plan created; budget ≈ 30h (±1h) | ST.EV-003, ST.EV-004 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |
| ST.CAP.09 | Maintain daily schedule and time crumbs list | Strategator | strategator | [method/09](method/09-daily-scheduling.md) | Daily/Weekly; schedule scope | Schedule + crumbs list produced | ST.EV-004 | F1/G:self-dev-daily/R:medium | 6 months | provisional |
| ST.CAP.10 | Record session work products | Strategator | strategator | [method/10](method/10-session-recording.md) | Weekly; session outputs | Work products list completed per session | ST.EV-002, ST.EV-004 | F1/G:self-dev-weekly/R:medium | 6 months | provisional |

## Roadmap (future formalization)
- **Level 2** (pending): Add RoleAssignment (A.2.1) per capability. TaskFamily now links to MethodDescription files.
- **Level 3**: Represent capabilities as U.Capability objects with EvidenceGraph IDs and formal WorkMeasures (A.17/A.18 CSLC).

## References
- BoundedContext → [bounded-context/00-index.md](bounded-context/00-index.md)
- Sources → [sources/00-index.md](sources/00-index.md)
- U.Capability pattern → A.2.2
