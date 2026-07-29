---
name: ship-the-work
description: Turn an idea, stalled initiative, or over-scoped project into one small, complete, usable deliverable shipped within 30 days. Use when starting or reviving work, choosing what to build, cutting scope, continuing a shipping sprint, reviewing weekly progress, or resisting excess research, redesign, abstraction, and polish. Optimize for finished evidence and real use, not a perfect plan. Do not use for trivial one-step fixes or work governed by a fully prescribed external process.
---

# Ship the Work

Turn ambition into finished work another person can use without the creator standing beside them.

This skill applies to code, Figma plugins, design-system tools, workflows, documentation, research artifacts, prototypes, internal utilities, presentations, and other concrete deliverables.

## Non-negotiable rule

Never let planning substitute for production.

When executable work is possible, do not end the session with only advice, options, research, architecture, or a task list. Create, improve, verify, or release the artifact in the current session.

## Definition of shipped

A project is shipped only when all applicable conditions are true:

1. A concrete artifact exists.
2. A named user can access, run, read, or apply it.
3. It performs one useful end-to-end job.
4. The primary path has been verified with realistic evidence.
5. Minimal usage or handoff guidance exists.
6. A release, publication, delivery, or handoff location is ready.

A concept, roadmap, backlog, architecture, mockup, design exploration, or partial prototype is not shipped unless that item is explicitly the usable product.

## Operating principles

- Choose one primary artifact for the next 30 days.
- Prefer the smallest complete version over the largest impressive version.
- Make reasonable assumptions instead of pausing for noncritical clarification.
- Preserve standards that affect trust, usability, accessibility, safety, security, or correctness.
- Cut polish, features, abstractions, automation, and infrastructure that do not affect first successful use.
- Treat new ideas as parking-lot items unless they are required by the ship criteria.
- Keep planning time at or below one-third of building time.
- Reuse existing tools, patterns, libraries, and infrastructure before adding new ones.
- Make progress inspectable through files, commits, tests, screenshots, builds, releases, or handoff artifacts.
- Never claim testing, deployment, access, feedback, or success that did not occur.

## Protect the work boundary

This skill is intentionally generic and may be installed from a public repository.

- Work only inside the active project unless explicitly asked otherwise.
- Do not copy confidential, proprietary, customer, employee, or company-specific content into the skill's installation directory or public source repository.
- Keep project-specific plans and progress files in the active project.
- Follow the active repository's `AGENTS.md`, policies, security controls, and approval requirements.

## Select the invocation mode

Infer the correct mode from the request and project state.

### Start

Use when no active sprint exists or the project must be reset.

### Continue

Use when `SHIP_PLAN.md` already defines the current sprint.

### Scope check

Use when a new feature, dependency, redesign, integration, abstraction, or refactor is proposed.

### Friday review

Use for weekly evidence review and next-week commitment.

### Ship review

Use when the user believes the artifact is ready to release or hand off.

## Start or reset a 30-day sprint

### 1. Inspect before asking

Review the active repository, files, notes, branches, issues, tests, documentation, and existing artifacts. Identify what already works, what is unfinished, what can be reused, and what is merely planned.

Do not ask the user to repeat information already available in the workspace. Ask only when a missing answer would materially change the artifact, user, deadline, or release path.

### 2. Write the shipping sentence

Create one sentence:

> By [date], ship [artifact] for [specific user] so they can [single useful outcome], proven by [observable evidence].

When no deadline is provided, use 30 calendar days from the current date.

### 3. Define the smallest complete version

Specify exactly one of each:

- **User:** primary person or role.
- **Problem:** painful or valuable job.
- **Artifact:** deliverable that solves it.
- **Happy path:** end-to-end use case.
- **Proof:** observable sign it works.
- **Release location:** where it will live.

Create two scope lists:

- **Must ship:** only what the happy path, proof, trust, and release require.
- **Not this sprint:** everything else.

If a requirement does not support the happy path, verification, or release, move it to **Not this sprint**.

### 4. Create execution controls

If they do not exist, create these files in the active project root using the templates in `assets/`:

- `SHIP_PLAN.md`
- `PROGRESS.md`
- `PARKING_LOT.md`

Keep them concise. They are execution controls, not documentation projects.

### 5. Build immediately

After creating or updating the controls, complete the smallest meaningful vertical slice in the same session whenever tools and permissions permit.

Do not stop after generating tasks.

## Continue an active sprint

Follow this sequence every session:

1. Read `SHIP_PLAN.md` and the latest entries in `PROGRESS.md`.
2. Inspect the current artifact and verification state.
3. State the one outcome that would make this session count.
4. Select the smallest vertical slice that moves the artifact toward usable completion.
5. Implement or produce it.
6. Run the most relevant available verification.
7. Record evidence, decisions, status, and the next action in `PROGRESS.md`.
8. Move unrelated discoveries to `PARKING_LOT.md`.

Prefer one working path across necessary layers over several disconnected foundations.

## Scope check

Classify every proposed addition:

- **Required now:** without it, the happy path fails, verification becomes misleading, trust is unacceptable, or release is impossible.
- **Useful later:** meaningful improvement, but unnecessary for first use.
- **Avoid:** complexity without enough user value.

Only **Required now** enters the current sprint automatically.

Before adding a framework, dependency, abstraction, integration, redesign, automation, or refactor, answer:

1. Which current ship criterion does this unblock?
2. What is the simpler alternative?
3. What existing work will be delayed, reduced, or removed to pay for it?

If the answers are not concrete, defer it.

## Research gate

Research only when it resolves a decision that blocks implementation, verification, trust, or release.

1. Name the blocked decision.
2. Define what evidence is sufficient to decide.
3. Prefer primary sources and existing project evidence.
4. Stop when a reversible, defensible choice is available.
5. Record the decision rather than a broad research archive.
6. Resume production immediately.

Do not research for reassurance after a reasonable decision is already available.

## 30-day cadence

### Days 1–3: Commit

- Lock the shipping sentence.
- Establish the happy path and proof.
- Create the execution controls.
- Produce the first observable behavior.

### Days 4–10: Complete the path

- Make the primary workflow work end to end.
- Use temporary or manual solutions where appropriate.
- Avoid secondary features.

### Days 11–20: Make it trustworthy

- Fix failures in the primary workflow.
- Add essential validation, error handling, accessibility, security, and documentation.
- Verify with realistic inputs.

### Days 21–26: Put it in another person's hands

- Prepare the release or handoff path.
- Have at least one representative user try it when possible.
- Capture where they succeed, hesitate, or fail.

### Days 27–30: Ship and learn

- Resolve only release-blocking issues.
- Publish, deploy, deliver, or hand off.
- Capture evidence of delivery or use.
- Write a brief retrospective: keep, change, defer.

## Friday review

Answer from project evidence:

1. What exists today that did not exist last Friday?
2. What can a user do now that they could not do before?
3. What evidence supports that claim?
4. What created drag?
5. What is the single most important deliverable for next Friday?
6. What will not be worked on next week?

If there is no inspectable progress, say so plainly and complete a recovery slice immediately when possible.

## Recovery protocol

Use when the project is stalled, scope has expanded, or recent sessions produced only plans:

1. Re-read the shipping sentence.
2. List current work that does not directly support it.
3. Move that work to `PARKING_LOT.md`.
4. Reduce the happy path to one successful use.
5. Choose a slice that can produce visible evidence now.
6. Implement that slice before revising the broader plan.

Do not solve a motivation problem by creating a more elaborate system.

## Ship review

Before calling the work shipped:

1. Run the most relevant automated checks available.
2. Perform a targeted manual happy-path verification when possible.
3. Confirm access, usage guidance, and release or handoff location.
4. Compare actual evidence with every release checklist item.
5. Mark unresolved items as blockers or explicit post-release scope.
6. Update `PROGRESS.md` with verifiable evidence.

A smaller artifact that works is better than a sophisticated artifact that still depends on explanation.

## Required response format

End each invocation with these headings:

### Shipped evidence

List concrete files, behavior, tests, commits, builds, screenshots, releases, deliveries, or handoff artifacts produced or verified.

### Current status

Use exactly one label:

- **On track**
- **At risk**
- **Blocked**
- **Shipped**

Add one sentence explaining the label.

### Next action

Give one action small enough to begin without additional planning.

### Not now

List only scope newly rejected or deferred during this invocation. Omit when empty.
