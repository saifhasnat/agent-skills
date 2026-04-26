# Firebase Auth Patterns

Guidelines for Auth provider configuration, custom claims, and session management.

## Provider Selection
| Provider | Use When |
|---|---|
| Email/Password | Consumer apps with account management |
| Google Sign-In | Apps targeting Google Workspace users |
| Phone / SMS | High-security or emerging-market apps |
| Anonymous | Guest access before account creation |
| Custom Token | Server-side auth, migration from legacy systems |

## Custom Claims
Use custom claims for role-based access control. Set them server-side only:

```javascript
// Cloud Function (server-side)
await admin.auth().setCustomUserClaims(uid, {
  role: 'admin',      // "admin" | "member" | "viewer"
  orgId: 'org_123'    // for multi-tenant apps
});
```

**Rules:**
- Never set claims from the client.
- Claims are limited to 1000 bytes total.
- Claims are embedded in the ID token — no extra Firestore read needed.
- Always validate claims in Firestore Security Rules: `request.auth.token.role == 'admin'`.

## Session Management
- ID tokens expire after **1 hour** — use `onIdTokenChanged` (not `onAuthStateChanged`) to catch refresh events.
- For long-lived sessions, enable **session cookies** via Admin SDK (web apps).
- For sensitive actions (password change, deletion), require **recent sign-in** using `reauthenticateWithCredential`.

## SMS / Phone Auth
- Enable App Check to prevent SMS abuse.
- Set SMS quota limits in the Firebase Console.
- Never display raw phone numbers in the UI — mask them: `+1 *** *** 4567`.

## Security Rules Integration
```
// Only the authenticated user can read their own profile
match /users/{uid} {
  allow read, write: if request.auth != null && request.auth.uid == uid;
}

// Admin-only collection
match /adminSettings/{docId} {
  allow read, write: if request.auth.token.role == 'admin';
}
```
