[BUG-005_DELETE_No_Auth.md](https://github.com/user-attachments/files/28254283/BUG-005_DELETE_No_Auth.md)
# 🐛 BUG-005 — DELETE /posts/{id} succeeds without authentication

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-005 |
| **Title** | DELETE /posts/{id} allows deletion without authentication token |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-24 |
| **App / URL** | https://jsonplaceholder.typicode.com/posts/1 |
| **Environment** | Postman v11 / Windows 11 |
| **Severity** | Critical |
| **Priority** | High |
| **Status** | Open |

---

## 📝 Description

The DELETE endpoint allows any anonymous request to delete a resource without requiring an authentication token or any form of authorization. In a production API, destructive operations like DELETE must be protected. This represents a critical security vulnerability that could allow unauthorized users to delete any resource.

---

## 🔁 Steps to Reproduce

1. Open **Postman**
2. Create a new **DELETE** request
3. Enter URL: `https://jsonplaceholder.typicode.com/posts/1`
4. Leave the **Authorization** header **empty**
5. Click **Send**

---

## ✅ Expected Result

```
HTTP/1.1 401 Unauthorized
{
  "message": "Authentication required to perform this action"
}
```

## ❌ Actual Result

```
HTTP/1.1 200 OK
{}
```

Resource is deleted without any authentication check.

---

## 📊 Severity & Impact

| Criteria | Assessment |
|----------|------------|
| **Severity** | Critical — unauthenticated destructive operation |
| **Priority** | High — immediate security risk |
| **Frequency** | 100% reproducible |
| **Workaround** | None — requires server-side fix |

---

## 🔐 Security Checklist

| Check | Result |
|-------|--------|
| Requires Bearer token | ❌ No |
| Requires API key | ❌ No |
| Validates resource ownership | ❌ No |
| Returns 401 when unauthenticated | ❌ No |
| Logs deletion activity | ❓ Unknown |

---

## 📎 Evidence

> 📸 Screenshot 1: DELETE request with no Authorization header
> 📸 Screenshot 2: Response showing 200 OK and empty body
> *(Screenshots would be attached in a real project via Jira)*

---

## 💡 Notes

- All destructive operations (DELETE, PUT) must require authentication
- Recommended fix: Implement Bearer token validation on all write/delete endpoints
- Reference: [OWASP API Security Top 10 — API2: Broken Authentication](https://owasp.org/www-project-api-security/)
