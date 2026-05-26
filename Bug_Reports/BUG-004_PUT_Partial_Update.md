[BUG-004_PUT_Partial_Update.md](https://github.com/user-attachments/files/28254265/BUG-004_PUT_Partial_Update.md)
# 🐛 BUG-004 — PUT /posts/{id} accepts partial body without error

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-004 |
| **Title** | PUT /posts/{id} does not require all fields for full update |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-23 |
| **App / URL** | https://jsonplaceholder.typicode.com/posts/1 |
| **Environment** | Postman v11 / Windows 11 |
| **Severity** | Medium |
| **Priority** | Medium |
| **Status** | Open |

---

## 📝 Description

A PUT request is meant to fully replace a resource and should require all fields. However, when sending a PUT request to `/posts/{id}` with only one field in the body, the API returns `200 OK` without validating the missing fields. This violates REST conventions where PUT implies a complete replacement of the resource.

---

## 🔁 Steps to Reproduce

1. Open **Postman**
2. Create a new **PUT** request
3. Enter URL: `https://jsonplaceholder.typicode.com/posts/1`
4. Set **Body** → `raw` → `JSON`
5. Enter: `{ "title": "Only title" }`
6. Click **Send**

---

## ✅ Expected Result

```
HTTP/1.1 400 Bad Request
{
  "message": "PUT requires all fields: title, body, userId"
}
```

## ❌ Actual Result

```
HTTP/1.1 200 OK
{
  "title": "Only title",
  "id": 1
}
```

Fields `body` and `userId` are silently dropped from the response.

---

## 📊 Severity & Impact

| Criteria | Assessment |
|----------|------------|
| **Severity** | Medium — violates REST semantics |
| **Priority** | Medium — can cause data loss in integrated systems |
| **Frequency** | 100% reproducible |
| **Workaround** | Use PATCH for partial updates instead of PUT |

---

## 🧪 Additional Test Data

| Method | Body Sent | Status | Expected |
|--------|-----------|--------|----------|
| PUT | All fields complete | 200 OK ✅ | 200 OK |
| PUT | Only `title` | 200 OK ❌ | 400 Bad Request |
| PUT | Only `userId` | 200 OK ❌ | 400 Bad Request |
| PATCH | Only `title` | 200 OK ✅ | 200 OK |

---

## 📎 Evidence

> 📸 Screenshot 1: PUT request with partial body
> 📸 Screenshot 2: Response showing 200 OK with missing fields
> *(Screenshots would be attached in a real project via Jira)*

---

## 💡 Notes

- Per REST standards: PUT = full replace, PATCH = partial update
- Recommended fix: Validate all required fields on PUT requests
- Reference: [RFC 9110 — PUT Method](https://www.rfc-editor.org/rfc/rfc9110#section-9.3.4)
