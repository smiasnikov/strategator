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
