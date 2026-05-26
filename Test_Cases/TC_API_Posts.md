[TC_API_Posts.md](https://github.com/user-attachments/files/28254554/TC_API_Posts.md)
# 🧪 Test Cases — API /posts (JSONPlaceholder)

**Base URL:** `https://jsonplaceholder.typicode.com`  
**Tested by:** Fernando Reyes  
**Date:** 2025-01-25  
**Tool:** Postman v11  

---

## GET /posts

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-API-001 | Get all posts returns 200 OK | API available | 1. Send GET to `/posts` | Status 200, array of 100 posts | High | ✅ Pass |
| TC-API-002 | Get all posts returns correct data types | API available | 1. Send GET to `/posts` 2. Inspect response body | Each post has `id` (int), `title` (string), `body` (string), `userId` (int) | High | ✅ Pass |
| TC-API-003 | Get single post by valid ID | API available | 1. Send GET to `/posts/1` | Status 200, single post object with id=1 | High | ✅ Pass |
| TC-API-004 | Get post by non-existent ID | API available | 1. Send GET to `/posts/9999` | Status 404 Not Found | High | ❌ Fail |
| TC-API-005 | Response time under 500ms | API available | 1. Send GET to `/posts` 2. Check response time | Response time < 500ms | Medium | ✅ Pass |

---

## POST /posts

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-API-006 | Create post with all valid fields | API available | 1. Send POST to `/posts` with `title`, `body`, `userId` | Status 201, response includes new `id` | High | ✅ Pass |
| TC-API-007 | Create post with empty body | API available | 1. Send POST to `/posts` with `{}` | Status 400 Bad Request | High | ❌ Fail |
| TC-API-008 | Create post with missing required fields | API available | 1. Send POST with only `title` | Status 400 Bad Request | High | ❌ Fail |
| TC-API-009 | Response includes generated ID | API available | 1. Send valid POST to `/posts` | Response body contains `"id": 101` | Medium | ✅ Pass |

---

## PUT /posts/{id}

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-API-010 | Full update with all fields | API available | 1. Send PUT to `/posts/1` with all fields | Status 200, updated resource returned | High | ✅ Pass |
| TC-API-011 | PUT with partial body is rejected | API available | 1. Send PUT to `/posts/1` with only `title` | Status 400 Bad Request | High | ❌ Fail |
| TC-API-012 | PUT on non-existent resource | API available | 1. Send PUT to `/posts/9999` | Status 404 Not Found | Medium | ❌ Fail |

---

## PATCH /posts/{id}

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-API-013 | Partial update with one field | API available | 1. Send PATCH to `/posts/1` with `{ "title": "Updated" }` | Status 200, only `title` updated | High | ✅ Pass |
| TC-API-014 | PATCH on non-existent resource | API available | 1. Send PATCH to `/posts/9999` | Status 404 Not Found | Medium | ❌ Fail |

---

## DELETE /posts/{id}

| ID | Title | Preconditions | Steps | Expected Result | Priority | Result |
|----|-------|---------------|-------|-----------------|----------|--------|
| TC-API-015 | Delete without authentication | API available | 1. Send DELETE to `/posts/1` with no auth token | Status 401 Unauthorized | High | ❌ Fail |
| TC-API-016 | Delete existing resource | API available | 1. Send DELETE to `/posts/1` | Status 200 OK, empty body | High | ✅ Pass |
| TC-API-017 | Delete non-existent resource | API available | 1. Send DELETE to `/posts/9999` | Status 404 Not Found | Medium | ❌ Fail |

---

## 📊 Summary

| Total | ✅ Pass | ❌ Fail | ⏳ Pending |
|-------|---------|---------|-----------|
| 17 | 9 | 8 | 0 |

> ❌ Failed test cases are documented in [`Bug_Reports/`](../Bug_Reports/)
