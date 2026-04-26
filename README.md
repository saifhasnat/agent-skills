# agent-skills

Personal Claude Code skill library — reusable workflows, domain knowledge, and environment config for Claude Code sessions.

## Skills

| Skill | Purpose |
|---|---|
| `agent-skill-builder` | Build, validate, and structure new Claude skills |
| `firebase-standard-manager` | Firestore schemas, security rules, Auth patterns |
| `premium-ui-polisher` | Premium design system, accessibility standards |

## Setup on a new machine

```bash
git clone https://github.com/saifhasnat/agent-skills.git ~/Documents/Projects/agent-skills
cd ~/Documents/Projects/agent-skills
bash bootstrap.sh
```

This will:
- Symlink each skill into `~/.claude/skills/`
- Symlink `config/CLAUDE.md` to `~/.claude/CLAUDE.md`

## Structure

```
agent-skills/
├── agent-skill-builder/    # Skill: build and validate skills
├── firebase-standard-manager/ # Skill: Firebase patterns
├── premium-ui-polisher/    # Skill: premium UI design
├── config/
│   └── CLAUDE.md           # Global Claude instructions (symlinked to ~/.claude/CLAUDE.md)
└── bootstrap.sh            # One-command environment restore
```

## Adding a new skill

1. Run `/agent-skill-builder "create a [skill-name] skill"` in Claude Code
2. Follow the 5-step workflow
3. `git add . && git commit -m "feat: add [skill-name] skill"`
4. `git push`
