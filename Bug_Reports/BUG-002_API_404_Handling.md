[BUG-002_API_404_Handling.md](https://github.com/user-attachments/files/28253741/BUG-002_API_404_Handling.md)
# 🐛 BUG-002 — API returns 200 OK for non-existent resource

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-002 |
| **Title** | GET /posts/{id} returns 200 OK for non-existent post ID |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-20 |
| **App / URL** | https://jsonplaceholder.typicode.com |
| **Environment** | Postman v11 / Windows 11 |
| **Severity** | High |
| **Priority** | High |
| **Status** | Open |

---

## 📝 Description

When sending a GET request to `/posts/{id}` using a non-existent post ID (e.g. `id=9999`), the API returns an HTTP `200 OK` status with an empty response body `{}` instead of the expected `404 Not Found`. This incorrect status code can cause consuming applications to incorrectly assume the request succeeded, leading to data integrity issues.

---

## 🔁 Steps to Reproduce

1. Open **Postman**
2. Create a new **GET** request
3. Enter URL: `https://jsonplaceholder.typicode.com/posts/9999`
4. Click **Send**

---

## ✅ Expected Result

```
HTTP/1.1 404 Not Found
{
  "message": "Resource not found"
}
```

## ❌ Actual Result

```
HTTP/1.1 200 OK
{}
```

---

## 📊 Severity & Impact

| Criteria | Assessment |
|----------|------------|
| **Severity** | High — incorrect status code misleads API consumers |
| **Priority** | High — affects all integrations that rely on this endpoint |
| **Frequency** | 100% reproducible with any non-existent ID |
| **Workaround** | Consuming apps must validate if response body is empty |

---

## 🧪 Additional Test Data

| ID Tested | Status Received | Expected Status |
|-----------|----------------|-----------------|
| `/posts/1` | 200 OK ✅ | 200 OK |
| `/posts/100` | 200 OK ✅ | 200 OK |
| `/posts/101` | 200 OK ❌ | 404 Not Found |
| `/posts/9999` | 200 OK ❌ | 404 Not Found |

---

## 📎 Evidence

> 📸 Screenshot 1: Postman request to `/posts/9999`  
> 📸 Screenshot 2: Response body showing empty `{}`  
> 📸 Screenshot 3: Status code showing `200 OK`  
> *(Screenshots would be attached in a real project via Jira or test management tool)*

---

## 💡 Notes

- This is a **REST API best practice violation** — 404 should be returned for missing resources
- Recommended fix: Validate resource existence before returning 200; return `404 Not Found` with descriptive error message
- Reference: [RFC 9110 — HTTP Semantics](https://www.rfc-editor.org/rfc/rfc9110#section-15.5.5)
