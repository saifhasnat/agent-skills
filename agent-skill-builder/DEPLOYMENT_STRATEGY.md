# Cross-Project Skill Deployment Strategy

To use your skills across all your projects effectively, you should adopt a "Tiered Distribution" model. This ensures that universal tools (like UI polishing) are always available, while project-specific rules (like Firebase schemas) only appear when needed.

## 1. Skill Tiers

### A. Global Skills (Available Everywhere)
**Path:** `~/.claude/skills/`
Best for:
- `premium-ui-polisher`: Universal design standards.
- `agent-skill-builder`: Tooling to create more skills.
- `doc-generator`: Standardized README or Wiki generation.

### B. Project-Local Skills (Specific context)
**Path:** `[your-project]/.claude/skills/`
Best for:
- `firebase-standard-manager`: Specific schema and security rules for *this* app.
- `api-ref`: Documentation for the specific endpoints of this project.
- `test-runner`: Custom test wrappers for this project's unique stack.

---

## 2. Managing the "Skills Repository"

Instead of scattering skill files, keep your master copies in your current central folder:
`/Users/saifhasnat/Documents/Projects/agent-skills/`

### The Symlink Pattern (Recommended)
You can "publish" a skill to all projects by symlinking it to your global directory.

**To install a skill globally:**
```bash
ln -s /Users/saifhasnat/Documents/Projects/agent-skills/premium-ui-polisher ~/.claude/skills/premium-ui-polisher
```

**To install a skill for one project only:**
```bash
mkdir -p .claude/skills/
ln -s /Users/saifhasnat/Documents/Projects/agent-skills/firebase-standard-manager .claude/skills/firebase-standard-manager
```

---

## 3. Dynamic "Context-Aware" Skills

Use `!command` in your `SKILL.md` to make a skill adapt to its environment.

**Example: A "Branch-Aware" Skill**
```markdown
---
name: code-reviewer
description: Reviews changes in the current branch.
---
# Instructions
Review the diff between the current branch and main:
!`git diff main...HEAD`
```
Claude will automatically pull the branch data for whichever project you are currently in.

---

## 4. Scaling with `agent-skill-builder`

Use the `agent-skill-builder` to maintain this structure. When you start a new project:
1. Call `/agent-skill-builder`.
2. Tell it: "Establish project-local skills for [Project Name]."
3. It will scan your repository and recommend which "Shared" skills to link and what "Custom" ones to create.
