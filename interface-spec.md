# Interface Specification — Strategator (A.6 Signature)

## 1. System Identity

- **Name**: Strategator
- **Type**: Applied agent (LLM-based assistant)
- **Purpose**: Facilitate weekly strategizing and planning sessions for personal self-development
- **User**: Individual practitioner of self-development methods (target mastery: "умение")
- **Current evolution level**: L0 (MVP — reactive)
- **Design pattern**: Meta-agent applied agent (FPF-structured, evidence-backed)

## 2. Evolution Roadmap (B.4)

| Level | Name | Description | Trigger to next level |
|-------|------|-------------|----------------------|
| **L0** | Reactive MVP | User starts session, agent responds based on freeform input and knowledge base | Stable session quality, user wants history awareness |
| **L1** | Context-aware | Agent reads previous session results from Obsidian vault | User wants proactive engagement |
| **L2** | Proactive | Agent initiates sessions based on weekly context (transcriptions, notes, drafts) | User needs multi-practice support |
| **L3** | Multi-practice | Full self-development course integrated (10 practices, not just strategizing + planning) | Single-agent bottleneck or specialization needs |
| **L4** | Multi-agent | Orchestrator + specialized agents (strategizing, planning, reading, writing-thinking, etc.) | — |

### Level transitions
- Each transition requires: evidence of prior level stability, DRR entry, capability extension.
- L0→L1: Add session history reading from vault. No architecture change, just Layer 4 context.
- L1→L2: Add incoming context processing (transcriptions, notes). Requires intake pipeline.
- L2→L3: Extend knowledge base to full course. Requires per-practice method files and evidence.
- L3→L4: Split into multiple agents. Requires orchestrator design and inter-agent protocol.

## 3. Interface Channels

### Primary: Telegram Bot
- **Input**: Text messages from user (freeform, Russian language)
- **Output**: Text messages to user (structured, Russian language)
- **Format constraints**:
  - Telegram message limit: 4096 characters per message
  - Split longer outputs into multiple messages
  - Use plain text + minimal markdown (bold, lists) — Telegram markdown support is limited
  - Tables: use plain text alignment or bullet lists instead of markdown tables
- **Commands**:
  - `/session` — start weekly strategizing session
  - `/status` — show current state (active projects, last session date)
  - `/plan` — show current weekly plan
  - (More commands added as levels increase)

### Future (L2+):
- Incoming data channel: files, voice messages (transcribed), forwarded messages
- Outgoing: scheduled reminders, session invitations

## 4. Layered Knowledge Context

The agent's LLM context is organized in layers, loaded selectively by evolution level.

```
Layer 1 (static, ~6K tokens):
  CLAUDE.md + bounded-context/ + capabilities.md
  → Always loaded. Defines agent identity, roles, rules.

Layer 2 (method, ~2-3K tokens per step):
  Relevant method/ files for the current session step
  → Loaded on demand. E.g., method/04 for project prioritization.

Layer 3 (sources, ~31K tokens):
  sources/self-development-methods/08-strategizing/ (~17K)
  sources/self-development-methods/09-planning/ (~14K)
  → NOT loaded at L0 (removed per ST.DRR-005: source rules encoded in MethodDescriptions).
  → At L3: all sections (~130K) — full multi-practice context (re-evaluated then).
  → Source fidelity for L0 validated offline via pre-launch gate (TC-004 + TC-005).

Layer 4 (session history, variable):
  Previous session records from Obsidian vault
  → Not loaded at L0. At L1+: last 1-3 sessions (~5-20K).

Layer 5 (incoming context, variable):
  Transcriptions, ephemeral notes, drafts from user's week
  → Not loaded at L0-L1. At L2+: pre-processed summaries.
```

### L0 total context: ~8-10K tokens (L1+L2 only)
Skills-only approach. Source rules encoded in MethodDescriptions (A.3.2). No raw sources in production context.
Decision: ST.DRR-005 (2026-02-18).

### Source fidelity guarantee
At L0, source rules are carried by MethodDescriptions (auditable, versioned, testable).
Pre-launch gate: **TC-004 and TC-005 must pass without sources in context before first production session.**
If a test fails: update the relevant MethodDescription with the missing rule and re-run.
At L3+: full source material re-evaluated for loading (MethodDescriptions may not yet cover all practices).

## 5. Session Flow

### L0 Session Flow (MVP)

**Trigger**: User sends `/session` command or freeform text.

**Step 1: Input collection**
- Agent asks for freeform input about the week (or user provides it directly)
- Input: what happened, what's on mind, any constraints (time, deadlines)

**Step 2: Strategizing phase** (ST.CAP.01-06)
Using method/01-06:
1. Review/update dissatisfaction list (ST.CAP.02)
2. Formulate/update strategy hypotheses (ST.CAP.03)
3. Maintain projects list and priorities (ST.CAP.04)
4. Apply selection criteria (ST.CAP.05)
5. Verify traceability: dissatisfactions → projects → tasks (ST.CAP.06)

**Step 3: Planning phase** (ST.CAP.07-09)
Using method/07-09:
1. Translate tasks into work formulations (ST.CAP.07)
2. Build weekly plan and time budget (ST.CAP.08)
3. Define daily schedule and time crumbs (ST.CAP.09)

**Step 4: Recording** (ST.CAP.10)
- Save session work products to Obsidian vault
- Provide summary to user in Telegram

**Multi-turn**: Session may span 3-8 message exchanges. Agent maintains session state in conversation context.

### L1+ Additions
- Step 0: Agent reads previous session from vault, presents diff/progress
- Step 2-3: Agent pre-fills lists based on previous state, asks for corrections

### L2+ Additions
- Step -1: Agent processes incoming context (transcriptions, notes) before session
- Agent may initiate session proactively (scheduled or triggered by incoming data)

## 6. Storage Contract (Obsidian Vault)

### Vault structure
```
strategator-vault/
  sessions/
    YYYY-MM-DD-session.md       # Session records (immutable after creation)
  lists/
    dissatisfactions.md         # Living list of dissatisfactions
    projects.md                 # Projects list with priorities
    criteria.md                 # Selection criteria
    strategies.md               # Strategy drafts (hypotheses)
  plans/
    YYYY-WNN-plan.md            # Weekly plans with time budget
    YYYY-WNN-schedule.md        # Daily schedule template for the week
    time-crumbs.md              # Time crumbs list (living)
  drafts/                       # User's drafts and notes (read-only for agent)
  incoming/                     # Transcriptions, ephemeral notes (L2+, read-only)
```

### Access patterns
| File pattern | Read | Write | Agent role |
|-------------|------|-------|------------|
| sessions/*.md | L1+ (history) | L0+ (new record) | SessionFacilitator |
| lists/*.md | L1+ (state) | L0+ (updates) | SessionFacilitator |
| plans/*.md | L1+ (prev plan) | L0+ (new plan) | PlanningAssistant |
| drafts/* | L2+ | Never | — |
| incoming/* | L2+ | Never | — |

### File format convention
- All files: UTF-8 markdown
- Session record header: `# Session YYYY-MM-DD` + metadata (duration, capabilities used)
- Lists: markdown with item IDs for traceability (e.g., `- [D-001] Dissatisfaction text`)
- Plans: structured sections (tasks, time budget table, schedule)

## 7. Model & Budget

### Primary model: Haiku 4.5
- Input: $0.80 / 1M tokens
- Output: $4.00 / 1M tokens
- Context window: 200K tokens

### Budget per session: $1.00 max

| Level | Input tokens/turn | Turns | Output tokens/turn | Total cost |
|-------|-------------------|-------|--------------------|------------|
| L0 | ~40K (1st) + ~5K (subsequent) | 5 | ~3K | ~$0.11 |
| L1 | ~60K (1st) + ~5K (subsequent) | 5 | ~3K | ~$0.13 |
| L2 | ~150K (1st) + ~10K (subsequent) | 8 | ~3K | ~$0.25 |
| L3 | ~180K (1st) + ~10K (subsequent) | 8 | ~3K | ~$0.28 |

All levels comfortably within $1 budget at Haiku pricing.

### Fallback model: Sonnet 4.5
- Use when Haiku quality insufficient for complex reasoning
- Input: $3.00 / 1M tokens, Output: $15.00 / 1M tokens
- Budget at L0: ~$0.35/session (within limit)
- Budget at L2+: may approach $1 limit — use selectively

### Model selection logic
- Default: Haiku 4.5 for all interactions
- Escalate to Sonnet: strategy formulation (ST.CAP.03), complex prioritization (ST.CAP.04/05)
- Never use Opus for production sessions (exceeds budget)

## 8. Multi-Practice Extension Points (L3)

The full self-development course contains 10 practice sections:

| Section | Practice | Words | ~Tokens | Current coverage |
|---------|----------|-------|---------|-----------------|
| 00 | Intro | ~1K | ~1.5K | — |
| 01 | About practices | ~8K | ~12K | — |
| 02 | Time investment | ~7K | ~10K | — |
| 03 | Slow reading | ~7K | ~10K | — |
| 04 | Writing-thinking | ~8K | ~12K | — |
| 05 | Speaking-thinking | ~8K | ~12K | — |
| 06 | Leisure | ~4K | ~6K | — |
| 07 | Environment | ~4K | ~6K | — |
| **08** | **Strategizing** | **~11K** | **~17K** | **Covered (L0)** |
| **09** | **Planning** | **~9K** | **~14K** | **Covered (L0)** |
| 10 | Conclusion | ~2K | ~3K | — |

### Extension approach
- **Option A**: Load all sections (~130K) into context. Fits Haiku 200K window. Simple but uses 65% of context window.
- **Option B**: Per-practice agent selection. Each practice gets its own bounded-context + method + evidence. Orchestrator delegates to relevant practice agent.
- **Option C**: Dynamic section loading based on session topic. Agent loads only relevant sections.

Recommended: **Option A** for L3 (simplicity), migrate to **Option B** at L4 if context pressure grows.

### What's needed per practice
To extend coverage to a new practice:
1. Create evidence records (ST.EV-NNN) from source section
2. Derive capabilities (ST.CAP.NNN) from evidence
3. Write MethodDescriptions (method/NN-*.md) for each capability
4. Update bounded-context (entities, distinctions for the practice)
5. Create test cases (TC-NNN) with fixtures

This follows the same meta-agent pattern used for sections 08-09.

## 9. Multi-Agent Extension Points (L4)

### Architecture sketch
```
User ↔ Telegram Bot ↔ Orchestrator Agent
                         ├── Strategizing Agent (sections 08)
                         ├── Planning Agent (sections 09)
                         ├── Reading Agent (section 03)
                         ├── Writing Agent (section 04)
                         ├── ... (one per practice)
                         └── Meta Agent (cross-practice)
```

### Orchestrator responsibilities
- Route user input to relevant practice agent(s)
- Aggregate outputs into coherent session record
- Manage shared state (Obsidian vault)
- Handle cross-practice dependencies (e.g., strategizing feeds planning)

### Agent-to-agent protocol (sketch)
- Each agent receives: L1 (identity) + its L3 (practice sources) + L4 (relevant session state)
- Each agent returns: structured output (lists, plans) + state updates
- Orchestrator merges results and writes to vault

### Migration path (L3→L4)
- Start by extracting strategizing and planning into separate agents
- Add one practice agent at a time
- Orchestrator complexity grows linearly, not exponentially

### Not decided yet
- Inter-agent communication format (JSON? markdown? function calls?)
- Whether orchestrator uses LLM or is rule-based
- Session state synchronization between agents
- Cost implications of multi-agent vs single-agent

## 10. Open Questions

1. **Source fidelity testing**: How to verify agent follows source rules (not just general knowledge)? Proposed: Level B tests with adversarial inputs (e.g., 8 projects when source says "2-5").

2. **Telegram message UX**: How to handle multi-step sessions in Telegram? Inline buttons? Command sequences? Free-form with agent parsing?

3. **Obsidian vault sync**: How does Telegram bot access the vault? Direct file system? Obsidian plugin API? Git sync?

4. **Voice messages**: At L2+, should agent handle voice input? Requires transcription pipeline (Whisper or similar).

5. **Session interruption**: What happens if session is interrupted mid-way? Resume protocol?

6. **Multi-user**: Is this single-user or multi-user? (Affects vault structure and privacy.)

7. **Proactive trigger logic** (L2): What triggers a proactive session invitation? Time-based (every Monday)? Event-based (new note detected)?

8. **Practice interdependencies** (L3): Practices reference each other heavily. How to handle cross-references when only some practices are loaded?

9. **Agent framework**: Implementation technology — Claude API directly? Agent SDK? LangChain? Custom?

## References
- Patterns: A.6 (Signature), A.3.2 (MethodDescription), B.4 (Evolution Loop)
- Strategator capabilities: [capabilities.md](capabilities.md)
- Bounded context: [bounded-context/00-index.md](bounded-context/00-index.md)
- Decision: ST.DRR-003
