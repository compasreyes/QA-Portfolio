[Report_API_JSONPlaceholder.md](https://github.com/user-attachments/files/28256025/Report_API_JSONPlaceholder.md)
# 📊 Test Report — JSONPlaceholder REST API

**Version:** 1.0  
**Author:** Fernando Reyes  
**Date:** 2025-01-26  
**Status:** Completed  

---

## 1. 📋 Summary

| Field | Detail |
|-------|--------|
| **Project** | JSONPlaceholder REST API |
| **Scope** | `/posts`, `/comments` endpoints |
| **Execution Date** | 2025-01-25 |
| **Tool** | Postman v11 |
| **Environment** | Windows 11 / Chrome 124 |
| **Tester** | Fernando Reyes |

---

## 2. 📊 Execution Results

### Overall

| Total Cases | ✅ Pass | ❌ Fail | ⏳ Blocked | Pass Rate |
|-------------|---------|---------|-----------|-----------|
| 27 | 14 | 13 | 0 | **51.8%** |

### By Module

| Module | Total | ✅ Pass | ❌ Fail | Pass Rate |
|--------|-------|---------|---------|-----------|
| GET /posts | 5 | 4 | 1 | 80% |
| POST /posts | 4 | 2 | 2 | 50% |
| PUT /posts | 3 | 1 | 2 | 33% |
| PATCH /posts | 2 | 1 | 1 | 50% |
| DELETE /posts | 3 | 1 | 2 | 33% |
| GET /comments | 10 | 5 | 5 | 50% |
| **Total** | **27** | **14** | **13** | **51.8%** |

### By Priority

| Priority | Total | ✅ Pass | ❌ Fail | Pass Rate |
|----------|-------|---------|---------|-----------|
| High | 16 | 7 | 9 | 43.7% |
| Medium | 9 | 6 | 3 | 66.6% |
| Low | 2 | 1 | 1 | 50% |

---

## 3. 🐛 Bugs Found

| ID | Title | Severity | Priority | Status |
|----|-------|----------|----------|--------|
| [BUG-002](../Bug_Reports/BUG-002_API_404_Handling.md) | GET /posts/{id} returns 200 for non-existent resource | High | High | Open |
| [BUG-003](../Bug_Reports/BUG-003_POST_Missing_Validation.md) | POST /posts accepts empty body | High | High | Open |
| [BUG-004](../Bug_Reports/BUG-004_PUT_Partial_Update.md) | PUT /posts/{id} accepts partial body | Medium | Medium | Open |
| [BUG-005](../Bug_Reports/BUG-005_DELETE_No_Auth.md) | DELETE /posts/{id} allows deletion without authentication | Critical | High | Open |
| [BUG-006](../Bug_Reports/BUG-006_Response_Time.md) | GET /comments returns 500 records with no pagination | Medium | Medium | Open |

### Bugs by Severity

| Severity | Total |
|----------|-------|
| Critical | 1 |
| High | 2 |
| Medium | 2 |
| Low | 0 |
| **Total** | **5** |

---

## 4. 📈 Key Findings

### ✅ What works correctly
- All GET requests for valid resources return correct data types and structure
- PATCH correctly handles partial updates
- Response times for `/posts` and `/users` are within acceptable range (< 500ms)
- All required fields are present in successful responses

### ❌ Critical Issues Found
- **Security risk:** DELETE endpoint allows unauthenticated requests — immediate fix required
- **Data integrity:** POST and PUT endpoints accept incomplete or empty bodies without validation
- **REST violations:** Non-existent resources return `200 OK` instead of `404 Not Found`

### ⚠️ Performance Issues
- `/comments` endpoint returns all 500 records in a single response (~850ms, ~175KB)
- Pagination is not supported, which impacts scalability

---

## 5. 📋 Recommendations

1. **Implement authentication** on all write and delete operations (POST, PUT, PATCH, DELETE)
2. **Add required field validation** on POST and PUT — return `400 Bad Request` for missing fields
3. **Fix status codes** — return `404 Not Found` for non-existent resources
4. **Implement pagination** on `/comments` with `?page=` and `?limit=` parameters
5. **Follow REST standards** for PUT vs PATCH behavior

---

## 6. 📦 Deliverables

- [x] Test Plan → [`Test_Plans/TP_API_JSONPlaceholder.md`](../Test_Plans/TP_API_JSONPlaceholder.md)
- [x] Test Cases → [`Test_Cases/TC_API_Posts.md`](../Test_Cases/TC_API_Posts.md)
- [x] Test Cases → [`Test_Cases/TC_API_Comments.md`](../Test_Cases/TC_API_Comments.md)
- [x] Bug Reports → [`Bug_Reports/`](../Bug_Reports/)
- [x] Test Report (this document)

---

## 7. ✅ Sign-off

| Role | Name | Status |
|------|------|--------|
| QA Analyst | Fernando Reyes | ✅ Approved |
| QA Lead | — | ⏳ Pending |
| Product Owner | — | ⏳ Pending |
