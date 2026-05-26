[BUG-003_POST_Missing_Validation.md](https://github.com/user-attachments/files/28253931/BUG-003_POST_Missing_Validation.md)
# 🐛 BUG-003 — POST /posts accepts request with empty body

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-003 |
| **Title** | POST /posts creates resource with empty body |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-22 |
| **App / URL** | https://jsonplaceholder.typicode.com/posts |
| **Environment** | Postman v11 / Windows 11 |
| **Severity** | High |
| **Priority** | High |
| **Status** | Open |

---

## 📝 Description

When sending a POST request to `/posts` with an empty body `{}`, the API returns `201 Created` and generates a new resource ID. No required field validation is applied. Fields like `title`, `body`, and `userId` are silently accepted as null/undefined, which can lead to corrupt data in production environments.

---

## 🔁 Steps to Reproduce

1. Open **Postman**
2. Create a new **POST** request
3. Enter URL: `https://jsonplaceholder.typicode.com/posts`
4. Set **Body** → `raw` → `JSON`
5. Enter: `{}`
6. Click **Send**

---

## ✅ Expected Result

```
HTTP/1.1 400 Bad Request
{
  "message": "Fields 'title', 'body' and 'userId' are required"
}
```

## ❌ Actual Result

```
HTTP/1.1 201 Created
{
  "id": 101
}
```

---

## 📊 Severity & Impact

| Criteria | Assessment |
|----------|------------|
| **Severity** | High — allows creation of empty/corrupt records |
| **Priority** | High — affects data integrity |
| **Frequency** | 100% reproducible |
| **Workaround** | Validate required fields on the consumer side |

---

## 🧪 Additional Test Data

| Body Sent | Status Received | Expected Status |
|-----------|----------------|-----------------|
| `{ "title": "Test", "body": "Content", "userId": 1 }` | 201 Created ✅ | 201 Created |
| `{ "title": "Test" }` | 201 Created ❌ | 400 Bad Request |
| `{}` | 201 Created ❌ | 400 Bad Request |
| `null` | 201 Created ❌ | 400 Bad Request |

---

## 📎 Evidence

> 📸 Screenshot 1: POST request with empty body `{}`
> 📸 Screenshot 2: Response showing `201 Created` with only `id` field
> *(Screenshots would be attached in a real project via Jira)*

---

## 💡 Notes

- REST APIs should validate required fields and return `400 Bad Request` for missing data
- Recommended fix: Add server-side validation for required fields before persisting the resource
- Related test case: `TC_API_Posts.md`
