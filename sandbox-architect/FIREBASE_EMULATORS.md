# Firebase Emulators Setup Guidelines

The Sandbox Architect is responsible for ensuring the Firebase Local Emulator Suite runs flawlessly to isolate testing from real cloud environments.

## 1. Diverting Connections
Before starting emulators, ensure the frontend application is specifically configured to point to `localhost` when in testing/sandbox mode.

**Frontend Checklist:**
- Ensure `connectFirestoreEmulator`, `connectAuthEmulator`, and `connectFunctionsEmulator` are triggered when `process.env.NODE_ENV === 'test'` or via a custom flag like `NEXT_PUBLIC_USE_EMULATOR=true`.
- Double-check that no live API keys are inadvertently used to establish real backend connections during a sandbox run.

## 2. Emulator Configuration (`firebase.json`)
Ensure the project's `firebase.json` has defined ports for the emulators. Standardize them:
- **Auth:** 9099
- **Functions:** 5001
- **Firestore:** 8080
- **Hosting:** 5000
- **Storage:** 9199
- **Emulator UI:** 4000

## 3. Exporting & Importing Data
A true sandbox allows tests to run from the exact same starting line every time.

**Starting the Emulator with Seed Data:**
Instruct the user or an automation script to run:
```bash
firebase emulators:start --import=./emulator-data
```

**Exporting State for Next Time:**
If the user crafts a perfect database state manually, tell them to save it:
```bash
firebase emulators:export ./emulator-data
```

## 4. Rule Validation
Emulators should be started with the *exact same* security rules (`firestore.rules`, `storage.rules`) as production to ensure tests genuinely reflect authorization boundaries.
