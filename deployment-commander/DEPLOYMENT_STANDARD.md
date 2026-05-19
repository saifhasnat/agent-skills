## The Deployment Standard

### Pre-conditions (must be true before any deployment starts)
- You are on the correct branch (`main` for production, a feature branch for staging)
- The local working tree is clean (`git status` is empty — no uncommitted changes)
- The .env file matches the target environment (prod vs staging keys)
- The active Firebase project alias matches the target (`firebase use` confirms `easy-transcribe-d1179` for prod)

---

### Phase 1 — Pre-flight Checks (always run, in this order)

1. **TypeScript compile check** — `npx tsc --noEmit`. Zero errors required. Do not proceed if this fails.
2. **Lint check** — `npx eslint src --max-warnings 0`. Zero warnings allowed for a production deploy.
3. **Test run** — `npm test -- --run`. All tests must pass.
4. **Firestore rules sanity** — if any Firestore collection or document structure changed in this work, verify firestore.rules was updated to match. This is a manual check, not automated.
5. **Environment variable audit** — confirm every key referenced in firebase.ts and config exists in .env. Missing keys = silent runtime failures.

---

### Phase 2 — Build Verification

6. **Production build** — `npm run build`. Must complete with zero errors.
7. **Bundle size check** — warn (do not block) if any chunk exceeds 500 kB uncompressed. The current `index-Bh_y0bzX.js` at 1.7 MB is already a known exception.
8. **Functions compile check** — `cd functions && npm run build`. Must succeed before deploying functions.

---

### Phase 3 — Deployment (split by risk level)

**Hosting only** (lowest risk — safe to deploy at any time):
```bash
firebase deploy --only hosting
```

**Functions only** (medium risk — touches live backend):
```bash
firebase deploy --only functions
```
After this: spot-check at least one Cloud Function in the Firebase console to confirm it deployed without errors.

**Rules only** (high risk — a bad rule instantly locks out all users):
```bash
firebase deploy --only firestore:rules,storage:rules
```
After this: manually test a read and write from the live app within 2 minutes.

**Full deploy** (highest risk — only when all three need to go together):
```bash
firebase deploy --only hosting,functions,firestore:rules,storage:rules
```

**Never run `firebase deploy` with no flags.** It deploys everything including database rules and indexes, which can cause downtime.

---

### Phase 4 — Post-deployment Verification

9. **Hosting check** — open `https://easy-transcribe-d1179.web.app` and confirm the app loads and auth works.
10. **Functions check** — trigger one real function call from the live app (e.g. a transcription request) and verify it appears in the Firebase Functions logs with no errors.
11. **Rules check** (if rules were deployed) — confirm a regular user can read/write their own data and cannot read another user's data.
12. **Git tag** — after a successful production deploy, create a tag: `git tag v<version> && git push origin v<version>`. The version comes from package.json.

---

### Rollback Procedure

- **Hosting rollback**: Firebase console → Hosting → Release history → click "Rollback" on the previous release. Takes ~30 seconds.
- **Functions rollback**: Redeploy the previous Git commit's functions. There is no one-click rollback for functions.
- **Rules rollback**: Redeploy the previous firestore.rules immediately. Keep a copy of the last known-good rules in a comment at the top of the file.

---

### What the skill should refuse to do
- Never deploy directly from a dirty working tree
- Never deploy `firestore:indexes` unless explicitly requested (index builds are irreversible and can take minutes)
- Never modify .env during a deployment — env changes require a separate, deliberate step
- Never skip Phase 1 checks even if "it's just a UI change"

---

### The one-liner decision tree
```
Is it frontend-only?  → deploy --only hosting
Is it backend logic?  → deploy --only functions  (then verify logs)
Is it security rules? → deploy --only firestore:rules,storage:rules  (then test live immediately)
Is it all three?      → full deploy, in this order: rules → functions → hosting
```
