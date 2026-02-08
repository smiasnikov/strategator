# CLAUDE.md — Strategator Project Rules

## Project Identity

Strategator is an applied agent for weekly strategizing and planning sessions.
Domain: personal self-development methods (strategizing + planning).
Structure follows meta-agent pattern (bounded-context, capabilities, method, evidence, changes).

## Mandatory Skill

FPF skill (`/fpf`) is required for ALL work inside this project.
Every task must follow the FPF workflow: DECOMPOSE → EXECUTE → AUDIT.

## Core FPF Rules (Always Enforce)

### A.7 — Strict Distinction
- Capability ≠ Method: Capability = "can do X within WorkScope at WorkMeasures" (A.2.2). Method = "how to do X" (A.3).
- MethodDescription ≠ Work: method/ files are design-time recipes. Session outputs are run-time Work records.
- Strategy draft ≠ Strategy: drafts are hypotheses under review.
- Task ≠ Work formulation: task is what; work formulation specifies who, when, how long, what result.

### A.10 — Evidence Graph
- Every claim that affects capabilities must have an Evidence reference.
- Evidence naming: **ST.EV-NNN** prefix required for all Strategator evidence.
- Evidence chains must be traceable: Claim → Evidence → Source.

### B.3 / B.3.4 — Trust Calculus & Evidence Decay
- Every evidence record must have F-G-R scores.
- Evidence decays over time. DecayWindow: 6 months.

### A.2.1 — RoleAssignment
- Strategator#SessionFacilitator:strategator — guides session structure
- Strategator#PlanningAssistant:strategator — helps with planning
- User#HumanApprover:strategator — makes all strategic decisions

## Change Control (DRR per E.9)

- `changes/decision-log.md` follows canonical DRR format (E.9:4).
- Each DRR record: ID (ST.DRR-NNN), Date, Problem frame, Decision, Rationale, Consequences, Evidence/Refs, Status.
- Lightweight variant (CC-DRR.5) for non-semantic edits.

## Capability Schema (A.2.2)

Capabilities use A.2.2 schema: CapabilityId, Holder, Context, TaskFamily, WorkScope, WorkMeasures, Evidence, F-G-R, DecayWindow, Status.
Do NOT put Inputs/Outputs/Preconditions/Postconditions in capabilities — those belong in method/ files.

## Directory Structure

```
bounded-context/    Context scope, entities, distinctions
capabilities.md     Strategator capabilities (A.2.2 schema)
method/             MethodDescriptions (design-time recipes)
evidence/           Evidence records (ST.EV-NNN)
sources/            Domain source material (self-development methods)
changes/            Decision log (DRR per E.9)
tests/              Test cases for capability validation
```

## Domain-Specific Rules

- Source material: sections 08-strategizing and 09-planning from self-development-methods course.
- Mastery level target: "умение" (skill level).
- Weekly cycle: strategizing session → planning → daily scheduling.
- Agent assists human user; all strategic decisions require human approval.

## Git Commit Rules

### Commit granularity
- **One commit per ST.DRR** (or per logical unit of work if no DRR applies).
- A DRR that touches multiple files gets ONE commit with all affected files.
- Non-semantic edits (CC-DRR.5) may be batched into a single "housekeeping" commit.

### Commit message format
```
<type>(<scope>): <short summary>

<body — what changed and why, reference ST.DRR-ID>

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

**Types**: `feat` (new capability/method/structure), `fix` (correction), `refactor` (restructure without semantic change), `docs` (documentation-only), `chore` (housekeeping, tooling).

**Scope**: affected area — `capabilities`, `method`, `evidence`, `bounded-context`, `changes`, `tests`, or `meta` (cross-cutting).

### Rules
- Always reference ST.DRR-ID in commit body when a DRR exists for the change.
- Commit message language: English (project artifacts may be bilingual, but git log stays English).
- Do NOT commit partial DRR work — a DRR's changes must be atomic.
- Do NOT amend published commits unless explicitly asked.
- Stage specific files by name, not `git add -A` or `git add .`.

## Anti-Patterns (Do NOT)

- Do NOT put Inputs/Outputs in capability table
- Do NOT reference evidence without ST. prefix
- Do NOT upgrade capability status without evidence audit
- Do NOT mix strategizing artifacts with planning artifacts
- Do NOT skip DRR entry on structural changes
