[BUG-006_Response_Time.md](https://github.com/user-attachments/files/28254314/BUG-006_Response_Time.md)
# 🐛 BUG-006 — GET /comments response time exceeds acceptable threshold

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-006 |
| **Title** | GET /comments returns all 500 records with no pagination, causing slow response |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-25 |
| **App / URL** | https://jsonplaceholder.typicode.com/comments |
| **Environment** | Postman v11 / Windows 11 |
| **Severity** | Medium |
| **Priority** | Medium |
| **Status** | Open |

---

## 📝 Description

The GET `/comments` endpoint returns all 500 records in a single response with no pagination support. This results in large payloads and slow response times that degrade performance for consuming applications. APIs should implement pagination to limit data transfer and improve scalability.

---

## 🔁 Steps to Reproduce

1. Open **Postman**
2. Create a new **GET** request
3. Enter URL: `https://jsonplaceholder.typicode.com/comments`
4. Click **Send**
5. Observe response time and total records returned

---

## ✅ Expected Result

```
HTTP/1.1 200 OK
- Maximum 20 records per page
- Pagination headers or metadata included:
  { "page": 1, "total": 500, "per_page": 20 }
```

## ❌ Actual Result

```
HTTP/1.1 200 OK
- 500 records returned in a single response
- No pagination metadata
- Response time: ~850ms
- Payload size: ~175KB
```

---

## 📊 Performance Data

| Endpoint | Records Returned | Response Time | Payload Size |
|----------|-----------------|---------------|--------------|
| `/posts` | 100 | ~320ms | ~27KB |
| `/comments` | 500 | ~850ms ❌ | ~175KB ❌ |
| `/users` | 10 | ~180ms ✅ | ~5KB |
| `/todos` | 200 | ~410ms | ~50KB |

> ⚠️ Acceptable threshold: < 500ms / < 50KB per response

---

## 📎 Evidence

> 📸 Screenshot 1: Postman response showing 500 records
> 📸 Screenshot 2: Response time indicator in Postman
> 📸 Screenshot 3: Payload size in Postman console
> *(Screenshots would be attached in a real project via Jira)*

---

## 💡 Notes

- Recommended fix: Implement pagination with `?page=` and `?limit=` query parameters
- Industry standard: Return max 20-50 records per page with total count in headers or body
- Related: Consider adding `?_limit=` query param support (already partially supported by JSONPlaceholder)
