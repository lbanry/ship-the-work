# Maintenance and release guide

## Design constraints

- Keep `SKILL.md` generic enough for personal and workplace projects.
- Put trigger language early in the frontmatter description.
- Keep project-specific content out of this public repository.
- Prefer instructions over scripts unless deterministic automation adds clear value.
- Avoid dependencies for validation and installation scripts.
- Preserve the required response headings and evidence standard.

## Change process

1. Create a branch.
2. Update `SKILL.md` and any supporting assets or references.
3. Add behavioral prompts for the changed behavior.
4. Run:

   ```bash
   python3 scripts/validate_skill.py
   bash -n install.sh
   ```

5. Review the diff for proprietary or sensitive content.
6. Update `CHANGELOG.md`.
7. Open and review a pull request.
8. Merge to `main`.
9. Create a semantic version tag when the behavior changes materially.

## Version guidance

- **Patch:** wording, documentation, tests, or corrections without meaningful workflow change.
- **Minor:** backward-compatible new mode, template, or behavior.
- **Major:** changed core rules, expected outputs, file contract, or activation scope.

## Release checklist

- [ ] `scripts/validate_skill.py` passes
- [ ] Shell installer syntax passes
- [ ] PowerShell installer reviewed
- [ ] Trigger and non-trigger prompts reviewed
- [ ] No confidential, proprietary, customer, or company-specific content
- [ ] README installation commands match repository paths
- [ ] Changelog updated
- [ ] Version tag selected when appropriate
