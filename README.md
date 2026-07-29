# Ship the Work

A reusable Codex skill that turns ideas, stalled initiatives, and over-scoped projects into one small, complete, usable deliverable within 30 days.

**Core behavior:** plan only enough to build, verify, and ship tangible work another person can use.

## What it does

- Defines one user, problem, artifact, happy path, proof, and release location.
- Separates **Must ship** from **Not this sprint**.
- Creates lightweight `SHIP_PLAN.md`, `PROGRESS.md`, and `PARKING_LOT.md` controls inside the active project.
- Requires tangible production in the current session whenever tools and permissions allow.
- Gates research, dependencies, redesigns, abstractions, and refactors behind the shipping criteria.
- Runs weekly evidence reviews around: **What exists today that did not exist last Friday?**
- Supports code, design, documentation, workflows, internal tools, plugins, prototypes, and other concrete artifacts.

## Install globally

The most maintainable installation is a direct Git clone. This keeps the installed skill connected to this repository.

### macOS, Linux, or WSL

```bash
git clone https://github.com/lbanry/ship-the-work.git ~/.agents/skills/ship-the-work
```

### Windows PowerShell

```powershell
git clone https://github.com/lbanry/ship-the-work.git "$HOME\.agents\skills\ship-the-work"
```

Restart Codex if the skill does not appear immediately.

## Install or update with one command

### macOS, Linux, or WSL

```bash
curl -fsSL https://raw.githubusercontent.com/lbanry/ship-the-work/main/install.sh | bash
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/lbanry/ship-the-work/main/install.ps1 | iex
```

Review remote scripts before executing them when required by your security policy. The scripts clone the repository when absent and fast-forward it when already installed.

## Update

```bash
git -C ~/.agents/skills/ship-the-work pull --ff-only
```

Windows PowerShell:

```powershell
git -C "$HOME\.agents\skills\ship-the-work" pull --ff-only
```

The installer commands above also perform an update.

## Install for one repository

To share the skill only within one project, add it as a Git submodule:

```bash
mkdir -p .agents/skills
git submodule add https://github.com/lbanry/ship-the-work.git .agents/skills/ship-the-work
```

Update later with:

```bash
git submodule update --remote --merge .agents/skills/ship-the-work
```

## Invoke

In Codex CLI or the IDE extension, use `/skills`, or mention the skill directly:

```text
$ship-the-work Inspect this project and start a 30-day shipping sprint. Choose the smallest complete artifact another person can use, create the execution controls, and complete the first meaningful implementation slice today.
```

Other useful prompts:

```text
$ship-the-work Continue the current sprint and produce the most valuable verified slice today.
```

```text
$ship-the-work Run the Friday review from repository evidence, then complete the smallest recovery slice if progress is not inspectable.
```

```text
$ship-the-work Decide whether this proposed feature is required now, useful later, or should be avoided.
```

## Public skill, private work

This repository contains only generic workflow instructions. Project-specific plans and progress stay in the project where the skill is invoked. Do not commit confidential or proprietary work content back to this public repository.

## Repository structure

```text
.
├── SKILL.md
├── agents/
│   └── openai.yaml
├── assets/
│   ├── SHIP_PLAN.template.md
│   ├── PROGRESS.template.md
│   ├── PARKING_LOT.template.md
│   └── RETROSPECTIVE.template.md
├── references/
│   ├── principles.md
│   ├── operating-modes.md
│   ├── artifact-quality-bars.md
│   ├── maintenance.md
│   └── test-prompts.md
├── scripts/
│   └── validate_skill.py
├── install.sh
├── install.ps1
└── .github/workflows/validate.yml
```

## Validate locally

```bash
python3 scripts/validate_skill.py
bash -n install.sh
```

## Versioning and maintenance

- Use semantic version tags such as `v1.0.0`.
- Record user-visible changes in `CHANGELOG.md`.
- Keep the skill generic; add project-specific knowledge to the project, not this repository.
- Test trigger and non-trigger prompts before releases.
- See `references/maintenance.md` for the release checklist.

## License

MIT. See `LICENSE`.
