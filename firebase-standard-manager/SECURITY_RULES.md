# Firebase Security Rules Patterns

Follow these patterns to ensure your data is protected.

## Firestore
- **Default Deny**: Always start with `allow read, write: if false;`.
- **Owner Access**: Use `if request.auth != null && request.auth.uid == userId;`.
- **Role-Based**: Check custom claims: `if request.auth.token.admin == true;`.
- **Validation**: Use `request.resource.data` to validate incoming data fields.

## Storage
- **Public Read (Specific)**: Allow public read only on specific paths (e.g., `/public/`).
- **Private User Uploads**: Ensure users can only write to their own directory: `match /users/{userId}/{allPaths=**}`.

## Deployment Workflow
- Always use `firebase_validate_security_rules` before deploying.
- Store rules in `.rules` files for better version control.
