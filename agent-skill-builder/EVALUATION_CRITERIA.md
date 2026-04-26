# Skill Evaluation Criteria

Use these criteria to judge whether a new skill is ready to ship.

## Discoverability
- [ ] The `description` contains trigger phrases a user would naturally type.
- [ ] "Use when..." phrasing is present in the description.
- [ ] The skill name is unique and does not conflict with existing skills.

## Correctness
- [ ] The workflow steps are ordered logically with no missing steps.
- [ ] All referenced files (SKILL.md links) actually exist.
- [ ] Scripts in `scripts/` are tested manually before publishing.

## Conciseness
- [ ] SKILL.md is short enough to load quickly (under ~50 lines).
- [ ] Detailed guidance is offloaded to linked `.md` files, not inlined.
- [ ] No redundant instructions that Claude already handles by default.

## Representative Test Queries
Run these in a Claude session to verify the skill activates correctly:

| Query | Expected Behavior |
|---|---|
| `/agent-skill-builder "create a git-workflow skill"` | Full 5-step workflow executes |
| "I need to build a new skill for X" | Skill is invoked automatically |
| "Validate this SKILL.md against best practices" | Security checklist is referenced |

## Quality Bar
- A skill passes if Claude produces consistent, high-quality output **without additional user prompting**.
- A skill fails if the user needs to correct Claude more than once per session.
