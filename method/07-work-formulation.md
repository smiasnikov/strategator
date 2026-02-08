# Work Formulation (MethodDescription, A.3.2)

## Purpose
Design-time recipe for translating tasks into work formulations with role, time, resources, and work products.
Linked capability: ST.CAP.07.

## Interface (inputs/outputs)
- **Inputs**: Task list per priority project
- **Outputs**: Work formulations (each specifying: what, who/role, when, how long, what resources, what work product)
- **Resources**: Modeler, Pomodoro tracker

## Preconditions
- Task list for priority projects available (from ST.CAP.06)
- Session is in planning phase

## Postconditions / Effects
- Each task translated into at least one work formulation
- Work formulations specify: action, role, time slot, duration, resources needed, expected work product
- Formulations written in actionable language ("I will do X on Y day for Z time to produce W")

## Non-functional constraints
- Work formulation is more specific than a task: it answers who, when, how long, what result
- Use first person: "Я в понедельник утром выделю 1 час на..."
- Granularity: one work formulation = one Pomodoro session or a few hours

## Role requirements (A.2.1)
- Strategator#PlanningAssistant:strategator — helps structure formulations
- User#HumanApprover:strategator — validates formulations, commits to time

## Capability thresholds (A.2.2)
- Performer must have ST.CAP.07 at status >= provisional

## Failure semantics
- If task too vague for formulation: break down further or defer to next session
- If resources unknown: record as constraint, estimate conservatively

## Steps
1. Take task list for priority projects
2. For each task: formulate specific work description
3. Specify: role/executor, day/time, duration (pomodoros), resources needed
4. Define expected work product for each formulation
5. Classify: important/current, permanent/temporary
6. Record work formulations in Pomodoro tracker

## References
- Capability: ST.CAP.07
- Evidence: ST.EV-003 (what is planning — task→work translation)
- Source: sources/self-development-methods/09-planning/10-modeling-work-formulation.md
- Patterns: A.3.2, A.15.1 (Work structure)
