# Decision Log (DRR per E.9) — Strategator

## Format (E.9:4)

Each record contains four mandatory components:

- **ID**: unique identifier (ST.DRR-NNN)
- **Date**: decision date
- **Problem frame**: why are we talking about this?
- **Decision**: what will we do? (normative text)
- **Rationale**: why is this the right thing? (Pillar/Taxonomy refs)
- **Consequences**: what happens next? (impact, trade-offs, affected artifacts)
- **Evidence/Refs**: supporting evidence
- **Status**: provisional / accepted / revised

Lightweight variant (CC-DRR.5): for non-semantic edits, Problem frame + Decision only, with note "no semantic change".

---

## ST.DRR-001

**Date**: 2026-02-01
**Problem frame**: Strategator needs initial capability formalization to start work. Capabilities were extracted from source material (sections 08-strategizing, 09-planning) but lack formal structure.
**Decision**: Create Level 1 capability formalization (table with fields) covering 10 capabilities (ST.CAP.01..10) for strategizing and planning.
**Rationale**: Start minimal but FPF-consistent (P-1 Cognitive Elegance, P-10 Open-Ended Evolution). Level 1 is sufficient for bootstrapping. Pillar check: P-7 Pragmatic Utility — a provisional table is immediately useful.
**Consequences**: All 10 capabilities provisional. Evidence records (EV-001..004) created. Level 2/3 deferred. Affected: capabilities.md, evidence/.
**Evidence/Refs**: Source sections 08-strategizing, 09-planning; human-in-the-loop session 2026-02-01.
**Status**: accepted

---

## ST.DRR-002

**Date**: 2026-02-08
**Problem frame**: Strategator structure was created before meta-agent review. Validation found multiple FPF violations: (1) capability table contains Inputs/Outputs/Pre/Postconditions (A.7 violation: Capability ≠ Method); (2) no bounded-context; (3) no MethodDescriptions; (4) no decision log; (5) evidence files lack ST. prefix (naming collision risk); (6) no CLAUDE.md operational rules.
**Decision**: Full structural alignment with meta-agent pattern: rebuild capabilities table to A.2.2 schema; create bounded-context/ (4 files); create method/ (10 MethodDescriptions); rename evidence files with ST. prefix; create decision log; create CLAUDE.md.
**Rationale**: A.2.2 requires capabilities to have Holder, Context, TaskFamily, WorkScope, WorkMeasures — not Inputs/Outputs. A.7 Strict Distinction: Capability ≠ Method. A.3.2 requires MethodDescriptions for TaskFamily links. A.10 requires evidence traceability with context prefixes. Pillar check: P-3 Cross-Scale Consistency — applied agents must follow same structural patterns as meta-agent; P-8 Evidence-Based — all claims need auditable evidence chains.
**Consequences**: Strategator structure now isomorphic to meta-agent: bounded-context/, capabilities.md, method/, evidence/, changes/, CLAUDE.md. All TaskFamily links point to real MethodDescription files. Evidence files renamed ST.EV-001..004. Tests need minor updates (evidence references). Ready for EXP-002 testing. Affected: all files in strategator/.
**Evidence/Refs**: Meta-agent structure review 2026-02-08; FPF patterns A.2.2, A.3.2, A.7, A.10.
**Status**: accepted

---

## ST.DRR-003

**Date**: 2026-02-08
**Problem frame**: Before implementing or testing Strategator, we need to define how the agent interfaces with the external world: what context it receives, what model it uses, what storage it accesses, and how these change as the agent evolves. Without this, tests cannot account for real constraints (model, budget, context size) and implementation lacks a contract to build against.
**Decision**: Create Interface Specification (A.6 Signature) defining: system identity, evolution roadmap (L0-L4), Telegram interface, layered knowledge context (5 layers), session flow, Obsidian vault storage contract, model & budget (Haiku 4.5 primary, $1/session), multi-practice and multi-agent extension points. Start at L0 (reactive MVP) with full-context approach (~40K tokens, $0.07/session).
**Rationale**: A.6 Signature Stack requires explicit interface definition before implementation. B.4 Canonical Evolution Loop requires explicit evolution stages with transition criteria. P-7 Pragmatic Utility — interface-first approach enables both test design and implementation to proceed from a shared contract. P-10 Open-Ended Evolution — layered context architecture supports growth from L0 to L4 without fundamental redesign. Economic analysis shows full-context with Haiku fits $1 budget at all levels.
**Consequences**: interface-spec.md created with 10 sections. Testing can now be designed with real constraints (model=Haiku, context=40K, Telegram output limits). Implementation has a contract for Telegram bot + Obsidian vault integration. Evolution path documented from reactive MVP to multi-agent. 9 open questions recorded for future DRRs. Affected: interface-spec.md (new), test design (unblocked).
**Evidence/Refs**: Token count analysis of sources (87,958 words total course, 20,700 words sections 08+09); Haiku 4.5 pricing; FPF patterns A.6, B.4.
**Status**: accepted

---

## ST.DRR-004

**Date**: 2026-02-18
**Problem frame**: Strategator needs a technology stack for L0 implementation. Research (2026-02-18) evaluated OpenClaw as candidate runtime and found it unsuitable: CVE-2026-25253 (CVSS 8.8, one-click RCE), 230+ malicious skills in ClawHub, prompt injection via messaging channels, supply chain risk (26% of skills contain vulnerabilities). Cisco and Trend Micro findings confirm systemic security immaturity. A minimal custom runtime is preferred. Technology language needs to be chosen for Anthropic API integration and Telegram bot interface.
**Decision**: Use **TypeScript** for all implementation. Stack:
- LLM integration: `@anthropic-ai/sdk` (official Anthropic TypeScript SDK)
- Telegram bot: `grammy` (TypeScript-first, lightweight, 0 core dependencies)
- Runtime: Node.js with TypeScript (or Bun)
- File I/O (Obsidian vault): Node.js `fs/promises` (no extra library for L0)
- No third-party agent framework (no OpenClaw, no LangChain, no LlamaIndex)

Architecture: thin custom orchestrator with 3 core modules — `context-assembler.ts`, `anthropic-client.ts`, `telegram-bot.ts`. Estimated: ~400-600 lines of TypeScript for L0.
**Rationale**:
- A.11 Ontological Parsimony: minimum stack adequate for L0 requirements. Custom orchestrator avoids framework overhead.
- Security: no external skills registry, no remote code execution surface, no supply chain via agent framework. Full control over what executes.
- TypeScript: strong typing enables safe context assembly; `@anthropic-ai/sdk` is official and maintained by Anthropic; `grammy` is TS-first with well-documented Telegram Bot API coverage.
- Full context control: implements layered context architecture (A.6 Signature) exactly as designed in ST.DRR-003 — no framework constraints on context assembly.
- Pillar check: P-7 Pragmatic Utility — grammy + Anthropic SDK provide sufficient capability for L0 without imposing architectural constraints that would complicate L1-L4 evolution.
**Consequences**:
- Deferred: OpenClaw, LangChain, agent framework selection (re-evaluate at L3→L4 transition).
- New: implementation directory `strategator-bot/` with `src/context-assembler.ts`, `src/anthropic-client.ts`, `src/telegram-bot.ts`, `src/vault.ts` (Obsidian file I/O).
- interface-spec.md section 9 open question "Agent framework" → resolved.
- Affected: implementation/ (new), interface-spec.md.
**Evidence/Refs**: OpenClaw security research 2026-02-18; CVE-2026-25253; Cisco ClawHub analysis (26% vulnerable skills); Trend Micro agentic AI report; grammy.dev; @anthropic-ai/sdk on npm.
**Status**: accepted

---

## ST.DRR-005

**Date**: 2026-02-18
**Problem frame**: Interface-spec (ST.DRR-003) specified Layer 3 context = raw source material from sections 08-strategizing and 09-planning (~31K tokens), yielding ~40K total context per session at L0. This ensures source fidelity: agent can reference exact source text. However, MethodDescriptions (method/01-10) already encode key source rules as explicit operational constraints (e.g., method/04: "2-5 active projects recommended"; method/07: "work formulations specify role, time, resources, products"). Loading 31K tokens of raw source material on every session call may be unnecessary: (1) it constitutes 75% of context on source content alone; (2) it obscures session-specific signal with static background; (3) it costs ~$0.09/session of the $1 budget just for source tokens. Source fidelity must still be guaranteed before production.
**Decision**: Remove raw sources from production runtime context at L0. Production context = Layer 1 (CLAUDE.md + bounded-context, ~6K tokens) + Layer 2 (relevant method skills loaded per session step, ~2-3K per step). Estimated L0 total: ~8-10K tokens per session (vs ~40K prior). Source rules are maintained through MethodDescriptions as auditable carriers (A.3.2). Source fidelity is validated via a mandatory pre-launch gate: **TC-004 and TC-005 (Level B source fidelity tests) must both pass without sources in context before first production session**. If a test fails: identify the missing rule, update the relevant MethodDescription to make the rule explicit, then re-run. Do not revert to raw sources as production default.
**Rationale**:
- A.11 Ontological Parsimony: do not load what is not needed if rules are already encoded in accessible carriers.
- A.3.2 MethodDescription: the design-time purpose of MethodDescriptions is precisely to encode process knowledge from sources into agent-actionable form. If MethodDescriptions fail to capture source rules, they are incomplete — the fix is to complete them, not to bypass them with raw sources.
- A.10 Evidence Graph: LLM training data ("internal knowledge") is not auditable. MethodDescriptions ARE auditable — they are versioned, testable, and traceable to specific sources. This is the correct FPF-aligned carrier for source rules.
- B.5 Canonical Reasoning Cycle: TC-004/TC-005 are the inductive test (B.5). If they pass (skills-only context), the hypothesis "MethodDescriptions are sufficient carriers" is confirmed. If they fail, we refine the MethodDescriptions and retest.
- Budget: ~$0.02/session vs ~$0.11/session — 5x cost reduction at L0.
- Context quality: fewer tokens means greater relative attention weight for session-specific content (user's week, current state).
**Consequences**:
- Layer 3 (sources) removed from L0 production context. Sources are offline design-time reference only (used to write/update MethodDescriptions).
- Pre-launch gate: TC-004 AND TC-005 must pass before first production session. Gate is non-negotiable.
- If TC-004 fails (agent does not warn/correct on 8 projects): method/04 lacks sufficient rule emphasis. Fix: add explicit rule statement to method/04, re-run TC-004.
- If TC-005 fails (agent produces vague work formulations without role/time/resources/product): method/07 insufficient. Fix: strengthen method/07, re-run TC-005.
- tests/00-index.md updated: all test execution context = Layers 1+2 only (no sources). Level B tests are the pre-launch gate.
- interface-spec.md section 4 updated: Layer 3 removed from L0 context; note added about source fidelity gate.
- At L3 (multi-practice): full sources (~130K) are loaded in context — the sources strategy is revisited for L3 where MethodDescriptions may not yet cover all 10 practices.
**Evidence/Refs**: method/04 (encodes 2-5 rule), method/07 (encodes role+time+resources+product rule); TC-004, TC-005 (tests/TC-004.md, tests/TC-005.md, to be created); interface-spec.md ST.DRR-003; FPF patterns A.3.2, A.10, A.11, B.5.
**Status**: accepted
