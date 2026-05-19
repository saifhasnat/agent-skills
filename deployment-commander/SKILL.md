---
name: deployment-commander
description: Use when you need to safely prepare, verify, and release code to production. This skill enforces strict pre-flight checks, verifies staging compliance, and executes precisely targeted Firebase deployments to ensure zero-downtime releases.
---

# Deployment Commander

This skill implements the precise, project-specific deployment standard for Pressuite and similar applications. It guarantees that no unsafe deployments occur, relying on strict pre-flight lint checks, environmental verifications, and targeted Firebase flags to prevent accidental database indexing or rule overwriting.

## Workflow Status

Whenever invoked, the Deployment Commander must follow the checklist exactly as written in the standard. *Never skip Phase 1 checks.*

1.  **Check Pre-conditions**: Branch, working tree, `.env`, and Firebase alias.
2.  **Phase 1 — Pre-flight Checks**: TS Compile, Lint, Test, Rules sanity, Env audit.
3.  **Phase 2 — Build Verification**: Frontend build size checks and backend functions compile check.
4.  **Phase 3 — Deployment**: targeted flags `firebase deploy --only <target>`.
5.  **Phase 4 — Post-deployment**: Verifying hosting, triggering functions, making a Git tag.

## Refusal Parameters

The Commander MUST REFUSE to:
- Deploy directly from a dirty working tree (`git status` is not empty).
- Deploy `firestore:indexes` unless explicitly overridden.
- Modify `.env` during a deployment.
- Run `firebase deploy` with no flags.

## Resources

- [DEPLOYMENT_STANDARD.md](DEPLOYMENT_STANDARD.md): The absolute checklist and standard operating procedure for every deployment. Read this file thoroughly before acting.
