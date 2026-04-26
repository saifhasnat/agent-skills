# Security Review Checklist

Before approving any new skill, verify it against this checklist.

## Network & External Calls
- [ ] No hardcoded URLs (unless strictly necessary and vetted).
- [ ] No usage of `curl`, `fetch`, `requests`, or `urllib` in scripts without explicit disclosure.
- [ ] No exfiltration of user data via hidden network calls.

## Credentials & Secrets
- [ ] Verify NO API keys, tokens, or passwords are hardcoded in any file.
- [ ] Check scripts for environment variable usage for secrets.

## Adversarial Instructions
- [ ] Ensure no instructions tell Claude to ignore safety protocols.
- [ ] Ensure no instructions tell Claude to hide its actions from the user.
- [ ] Ensure no instructions tell Claude to alter its core identity.

## File Operations
- [ ] Verify bash commands for potential path traversal (`../`).
- [ ] Ensure the skill only operates within its intended directory or the user's workspace.
- [ ] Check for destructive commands like `rm -rf /`.

## Source Trust
- [ ] Identify if the source is internal or a third party.
- [ ] Audit all bundled scripts before the first execution.
