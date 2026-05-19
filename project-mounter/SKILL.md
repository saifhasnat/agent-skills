---
name: project-mounter
description: Use this to "switch" Claude's context to a specific project. It will read the PROJECT.md and update the environment.
---

# Project Mounter

When the user says "Switch to [Project Name]" or "Mount [Project Name]":

1.  **Identify the Project**:
    - Pressuite: `/Users/saifhasnat/Documents/Projects/Codex/project-pressuite/`
    - Madrasah: `/Users/saifhasnat/Documents/Projects/Apps/madrasah-manager/`
    - Skills: `/Users/saifhasnat/Documents/Projects/agent-skills/`

2.  **Load Context**:
    - Read the `PROJECT.md` file in the project's root.
    - Read the `.claude/skills/` directory if it exists.

3.  **Update Environment**:
    - If it's a Firebase project, run:
      !`firebase use <project-id>`

4.  **Confirm**:
    - "Mounted [Project Name]. Tech stack: [Stack]. Current environment: [Firebase Project]."
