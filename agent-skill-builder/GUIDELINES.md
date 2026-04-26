# Skill Authoring Guidelines

Follow these standards to ensure Claude can discover and use your skill effectively.

## Naming Conventions
- **Skill Name**: Lowercase letters, numbers, and hyphens ONLY.
- **Max Length**: 64 characters.
- **Style**: Use gerunds (e.g., `formatting-reports`) or descriptive nouns (`git-workflow`).
- **Forbidden**: Do not use "anthropic" or "claude" in the name.

## SKILL.md Requirements
- Must have YAML frontmatter with `name` and `description`.
- **Description**: 
  - Max 1024 characters.
  - Written in third person (e.g., "Use when...").
  - Do NOT include placeholders like "[Insert text]".

## Directory Structure
- `SKILL.md` at the root.
- Related documentation in `.md` files at the root.
- Executable scripts in `scripts/`.
- Static resources in `resources/`.

## Progressive Disclosure
- Keep `SKILL.md` concise. It is loaded early to decide if the skill is relevant.
- Move detailed technical guidance into separate files linked from `SKILL.md`.
