---
name: sandbox-architect
description: Use when you need to create an isolated, safe, and reproducible local testing environment (sandbox) for the application. This skill handles spinning up Firebase emulators, seeding mock data, and mocking third-party services.
---

# Sandbox Architect

This skill provides the automated workflow for establishing an isolated "Sandbox" testing environment. Testing against production or shared staging environments can pollute data and trigger real-world consequences. This skill guarantees a clean, ephemeral workspace for unit, integration, and E2E testing.

## Workflow

1.  **Environment Isolation**: Divert all application paths from production/staging configs to local endpoints.
2.  **Emulator Setup**: Configure and spin up the Firebase Emulator Suite (Firestore, Auth, Functions, Storage).
3.  **Data Seeding**: Inject a robust set of mock data into the emulators so the application is not tested empty.
4.  **Third-Party Mocking**: Intercept API requests (like Stripe, mailers, analytics) using Mock Service Workers or local overrides.
5.  **Tear Down Guidelines**: Ensure the environment can be cleanly wiped and reset.

## Resources

- [FIREBASE_EMULATORS.md](FIREBASE_EMULATORS.md): Guidelines for robustly configuring and running local Firebase services.
- [MOCKING_AND_SEEDING.md](MOCKING_AND_SEEDING.md): Strategies for generating mock users, documents, and mocking external APIs.
