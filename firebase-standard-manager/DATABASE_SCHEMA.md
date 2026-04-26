# Firestore Database Schema

Standard collection naming conventions and document structure patterns.

## Collection Naming
- Use **plural nouns** in camelCase: `users`, `blogPosts`, `orderItems`.
- Subcollections mirror the parent entity: `users/{uid}/sessions`, `users/{uid}/notifications`.
- Avoid generic names: prefer `auditLogs` over `logs`.

## Standard Document Fields
Every document should include these base fields:

```
{
  "createdAt": Timestamp,
  "updatedAt": Timestamp,
  "createdBy": string (uid),
  "isDeleted": boolean  // soft-delete pattern
}
```

## Common Collection Patterns

### Users
```
/users/{uid}
  - displayName: string
  - email: string
  - role: "admin" | "member" | "viewer"
  - createdAt: Timestamp
  - updatedAt: Timestamp
```

### Content / Posts
```
/posts/{postId}
  - title: string
  - body: string
  - authorId: string (ref to /users)
  - status: "draft" | "published" | "archived"
  - tags: string[]
  - createdAt: Timestamp
  - updatedAt: Timestamp
```

### Subcollection Pattern
Use subcollections for 1-to-many relationships owned by a user:
```
/users/{uid}/orders/{orderId}
/users/{uid}/notifications/{notifId}
```

## Rules of Thumb
- Keep documents under 1MB. Move large blobs to Cloud Storage.
- Avoid deeply nested subcollections (max 2 levels).
- Denormalize read-heavy data — duplicate fields rather than doing joins.
- Index fields that appear in `where()` or `orderBy()` queries.
