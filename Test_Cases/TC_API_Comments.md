[TC_API_Comments.md](https://github.com/user-attachments/files/28254627/TC_API_Comments.md)
# 🧪 Test Cases — API /comments (JSONPlaceholder)

**Base URL:** `https://jsonplaceholder.typicode.com`  
**Tested by:** Fernando Reyes  
**Date:** 2025-01-25  
**Tool:** Postman v11  

---

## GET /comments

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-CMT-001 | Get all comments returns 200 OK | API available | 1. Send GET to `/comments` | Status 200, array of comments | High | ✅ Pass |
| TC-CMT-002 | Response includes all required fields | API available | 1. Send GET to `/comments` 2. Inspect first record | Each comment has `id`, `postId`, `name`, `email`, `body` | High | ✅ Pass |
| TC-CMT-003 | Email field has valid format | API available | 1. Send GET to `/comments` 2. Check `email` field on all records | All emails match valid format (x@x.x) | High | ✅ Pass |
| TC-CMT-004 | Response time is acceptable | API available | 1. Send GET to `/comments` 2. Check response time | Response time < 500ms | Medium | ❌ Fail |
| TC-CMT-005 | Pagination is supported | API available | 1. Send GET to `/comments?_page=1&_limit=20` | Returns max 20 records with pagination metadata | Medium | ❌ Fail |

---

## GET /comments?postId={id}

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-CMT-006 | Filter comments by valid postId | API available | 1. Send GET to `/comments?postId=1` | Status 200, only comments with postId=1 returned | High | ✅ Pass |
| TC-CMT-007 | Filter by non-existent postId returns empty | API available | 1. Send GET to `/comments?postId=9999` | Status 200, empty array `[]` | Medium | ✅ Pass |
| TC-CMT-008 | Filter by invalid postId type | API available | 1. Send GET to `/comments?postId=abc` | Status 400 Bad Request | Medium | ❌ Fail |

---

## GET /comments/{id}

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-CMT-009 | Get single comment by valid ID | API available | 1. Send GET to `/comments/1` | Status 200, single comment object | High | ✅ Pass |
| TC-CMT-010 | Get comment by non-existent ID | API available | 1. Send GET to `/comments/9999` | Status 404 Not Found | High | ❌ Fail |

---

## 📊 Summary

| Total | ✅ Pass | ❌ Fail | ⏳ Pending |
|-------|---------|---------|-----------|
| 10 | 5 | 5 | 0 |

> ❌ Failed test cases are documented in [`Bug_Reports/`](../Bug_Reports/)
