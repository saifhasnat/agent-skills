---
name: agent-skill-builder
description: Use when you need to create, update, or validate an "Agent Skill". This skill helps maintain consistency, security, and quality across all modular capabilities added to Claude.
disable-model-invocation: true
---

# Agent Skill Builder

Build a high-quality Agent Skill for: $ARGUMENTS

This skill provides a framework for building high-quality Agent Skills. It ensures that every new capability added is well-documented, secure, and follows established naming and structural conventions.

## Workflow

1.  **Ideation**: Define the specific workflow or task the skill will automate.
2.  **Structure**: Create the directory and the required `SKILL.md` file.
3.  **Documentation**: Add specialized Markdown files for guidance (read [GUIDELINES.md](GUIDELINES.md) for structure rules).
4.  **Security Review**: Validate against [SECURITY_CHECKLIST.md](SECURITY_CHECKLIST.md).
5.  **Evaluation**: Define representative queries using [EVALUATION_CRITERIA.md](EVALUATION_CRITERIA.md).

## Resources

- [GUIDELINES.md](GUIDELINES.md): Naming, structure, and content rules.
- [SECURITY_CHECKLIST.md](SECURITY_CHECKLIST.md): Security and safety validation steps.
- [EVALUATION_CRITERIA.md](EVALUATION_CRITERIA.md): How to measure skill quality.
- [DEPLOYMENT_STRATEGY.md](DEPLOYMENT_STRATEGY.md): How to use skills across all projects.
