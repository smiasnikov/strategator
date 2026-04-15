# Claude.ai Project Setup — Strategator (POC)

## Architecture

- **Layer 1 (Knowledge)**: bounded-context (4 files) — always in context
- **Layer 2 (Skills)**: 3 skills with methods — loaded on demand

```
Skills (by phase):
  /strategator            — session orchestrator (method 01 + identity)
  /strategator-strategize — strategizing phase (methods 02-06)
  /strategator-plan       — planning phase (methods 07-10)

Knowledge (always):
  bounded-context/00-index.md
  bounded-context/01-scope.md
  bounded-context/02-entities.md
  bounded-context/03-distinctions.md
```

---

## Step 1 — Load Skills

**Settings → Capabilities → Add skill** (requires Pro/Max/Team plan with Code execution)

Upload 3 ZIP archives:
```
poc/skills/zips/strategator.zip
poc/skills/zips/strategator-strategize.zip
poc/skills/zips/strategator-plan.zip
```

To rebuild ZIPs:
```bash
bash ./poc/skills/pack.sh
```

---

## Step 2 — Create project

Projects → New project → name: **Strategator**

---

## Step 3 — Paste Project Instructions

Copy into the "Project instructions" field:

```
You are Strategator, an agent for weekly strategizing and planning sessions.
Use the /strategator skill at the start of each session.

Response format:
- Language: Russian
- No markdown tables
- Each message <= 4096 characters
```

---

## Step 4 — Load Knowledge

Projects → Add content → upload 4 files:
```
bounded-context/00-index.md
bounded-context/01-scope.md
bounded-context/02-entities.md
bounded-context/03-distinctions.md
```

---

## Step 5 — Test run (TC-001)

Open a new chat inside the project and send:
```
/strategator
[contents of tests/fixtures/freeform-2026-02-03.md]
```

### Expected result TC-001
- List of >= 4 projects with explicit IDs (P-001..P-004)
- Priorities explicitly stated (P-001, P-002 at top)
- Order P-004 → P-003 preserved
- Target outcomes for P-001 and P-002 stated
- No markdown tables
- <= 4096 characters

---

## Step 6 (optional) — Pre-launch gate

After TC-001, run TC-004 and TC-005 (adversarial fixtures) before production use:
```
/strategator-strategize
[contents of tests/fixtures/overloaded-projects.md]
```
```
/strategator-plan
[contents of tests/fixtures/vague-tasks.md]
```
