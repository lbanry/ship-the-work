#!/usr/bin/env python3
"""Dependency-free structural validation for the Ship the Work skill."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILL_PATH = ROOT / "SKILL.md"
EXPECTED_NAME = "ship-the-work"
REQUIRED_PATHS = [
    "SKILL.md",
    "README.md",
    "agents/openai.yaml",
    "assets/SHIP_PLAN.template.md",
    "assets/PROGRESS.template.md",
    "assets/PARKING_LOT.template.md",
    "assets/RETROSPECTIVE.template.md",
    "references/principles.md",
    "references/operating-modes.md",
    "references/artifact-quality-bars.md",
    "references/maintenance.md",
    "references/test-prompts.md",
    "install.sh",
    "install.ps1",
]


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    raise SystemExit(1)


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        fail("SKILL.md must begin with YAML frontmatter")

    try:
        _, raw, _ = text.split("---", 2)
    except ValueError:
        fail("SKILL.md frontmatter is not closed")

    values: dict[str, str] = {}
    for raw_line in raw.strip().splitlines():
        if not raw_line.strip() or raw_line.lstrip().startswith("#"):
            continue
        if ":" not in raw_line:
            fail(f"Unsupported frontmatter line: {raw_line!r}")
        key, value = raw_line.split(":", 1)
        values[key.strip()] = value.strip().strip('"').strip("'")
    return values


def main() -> int:
    missing = [path for path in REQUIRED_PATHS if not (ROOT / path).is_file()]
    if missing:
        fail("Missing required files: " + ", ".join(missing))

    skill_text = SKILL_PATH.read_text(encoding="utf-8")
    metadata = parse_frontmatter(skill_text)

    name = metadata.get("name", "")
    description = metadata.get("description", "")

    if name != EXPECTED_NAME:
        fail(f"Skill name must be {EXPECTED_NAME!r}; found {name!r}")
    if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name):
        fail("Skill name must use lowercase letters, digits, and single hyphens")
    if not description:
        fail("Skill description is required")
    if len(description) > 1024:
        fail("Skill description must be 1024 characters or fewer")

    agent_text = (ROOT / "agents/openai.yaml").read_text(encoding="utf-8")
    for required in ("display_name:", "short_description:", "default_prompt:"):
        if required not in agent_text:
            fail(f"agents/openai.yaml is missing {required}")

    required_headings = [
        "## Definition of shipped",
        "## Protect the work boundary",
        "## Research gate",
        "## Recovery protocol",
        "## Required response format",
    ]
    for heading in required_headings:
        if heading not in skill_text:
            fail(f"SKILL.md is missing required heading: {heading}")

    print(f"Validated {EXPECTED_NAME} successfully.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
