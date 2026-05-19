# Mocking and Seeding Strategies

To make the sandbox useful, it needs data that mimics production characteristics, and it must never accidentally trigger real third-party events (like charging credit cards).

## 1. Seeding Data
The `sandbox-architect` should facilitate or generate scripts (e.g., `seed.js`) that automatically populate the local emulators when they spin up.

**Best Practices for Seeding:**
- **Deterministic Data**: Use libraries like `faker` but set a specific seed (e.g., `faker.seed(123)`) so the generated users and posts are identical on every run.
- **Relational Integrity**: If seeding a user, ensure any corresponding data (e.g., a profile picture in Storage, an auth record in Firebase Auth, and a user document in Firestore) are all created simultaneously.

## 2. Mocking Third-Party External APIs
The sandbox must not make outbound external calls to APIs like Stripe, SendGrid, or external CMS systems.

**Interception Approaches:**
- **Mock Service Worker (MSW)**: Recommending MSW to intercept `fetch` or `axios` calls at the network level and return standard JSON responses.
- **Environment Overrides**: Overriding API Base URLs in the `.env.test` file to point to a local proxy or a mock server.

## 3. Mock Authentication
To speed up e2e tests (like Cypress or Playwright), avoid forcing the test browser to physically type in an email and password via the UI for every test.
- Recommend injecting Firebase custom tokens or directly assigning UI state for authenticated testing routes.
- Seed the `emulator-data` with test accounts: `admin@test.com`, `user@test.com`, `unauthorized@test.com` to test all Security Rule boundaries.
