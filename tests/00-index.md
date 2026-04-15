# Test Index — Strategator

## Purpose
Test cases for verifying capabilities against fixed inputs, accounting for real execution constraints (model, context, output format).

## Test execution constraints
- **Executor model**: Haiku 4.5 (primary), Sonnet 4.5 (fallback)
- **Context**: Layers 1-2 only (~8-10K tokens) — CLAUDE.md + bounded-context + relevant method skills. **NO raw sources** (ST.DRR-005: source rules encoded in MethodDescriptions).
- **Output format**: Telegram-compatible (plain text + bold + lists, no markdown tables, <= 4096 chars per message)
- **Tester role**: MetaAgent#EvidenceAuditor:meta-agent (NOT the same system as executor)
- **Language**: Russian (input and output in Russian)

## Pre-launch gate (ST.DRR-005)
**TC-004 AND TC-005 (Level B) must both pass before first production session.**
These tests verify that MethodDescriptions encode source rules sufficiently without raw sources in context.
If either fails → update relevant MethodDescription → re-run. Do not proceed to production until both pass.

## Test levels
- **Level A (functional)**: Checks output format and content. Are required elements present? Is the format correct?
- **Level B (source fidelity)**: Checks that the agent follows rules from sources, not general LLM knowledge. Adversarial inputs.

## Cases

### Level A — Functional
- TC-001 — Projects and Priorities (ST.CAP.04)
- TC-002 — Tasks, Work Plan, Time Budget (ST.CAP.07/08)
- TC-003 — Calendar, Daily Routine, Time Crumbs (ST.CAP.09/10)

### Level B — Source Fidelity
- TC-004 — Project count limit (ST.CAP.04, source rule: 2-5)
- TC-005 — Work formulation (ST.CAP.07, source rule: role+time+resources+product)

## Fixtures
- fixtures/freeform-2026-02-03.md — baseline freeform input (4 projects, 30h, deadlines)
- fixtures/current-plans.md — empty initial state
- fixtures/overloaded-projects.md — adversarial: 8 projects (Level B)
- fixtures/vague-tasks.md — adversarial: tasks without details (Level B)
