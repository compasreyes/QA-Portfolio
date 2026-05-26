# 🗂️ Test Plan — JSONPlaceholder REST API

**Version:** 1.0  
**Author:** Fernando Reyes  
**Date:** 2025-01-25  
**Status:** Completed  

---

## 1. 🎯 Objective

Validate the functional behavior, data integrity, error handling, and performance of the JSONPlaceholder REST API endpoints `/posts` and `/comments`, ensuring they comply with REST standards and return correct responses for all valid and invalid inputs.

---

## 2. 📋 Scope

### In Scope
- Endpoints: `/posts`, `/posts/{id}`, `/comments`, `/comments/{id}`
- HTTP Methods: GET, POST, PUT, PATCH, DELETE
- Validations: status codes, response body, data types, error handling, response time

### Out of Scope
- Authentication and authorization flows (JSONPlaceholder is a mock API)
- Load and stress testing
- Endpoints: `/users`, `/todos`, `/albums`, `/photos`

---

## 3. 🧪 Test Types

| Type | Description |
|------|-------------|
| **Functional** | Verify each endpoint returns correct data and status codes |
| **Negative** | Validate error handling for invalid inputs and non-existent resources |
| **Data Validation** | Verify response fields, data types and required fields |
| **Performance** | Verify response time is under 500ms |
| **Security** | Verify destructive operations require authentication |

---

## 4. 🛠️ Tools & Environment

| Item | Detail |
|------|--------|
| **Tool** | Postman v11 |
| **OS** | Windows 11 |
| **Base URL** | https://jsonplaceholder.typicode.com |
| **API Type** | REST / JSON |
| **Auth** | None (mock API) |

---

## 5. ✅ Entry Criteria

- API is accessible and returns responses
- Postman is installed and configured
- Test cases are documented and reviewed

## 6. 🏁 Exit Criteria

- All High priority test cases executed
- All Critical and High bugs reported
- Test report completed and shared

---

## 7. 📊 Test Cases Summary

| Module | Total | High | Medium | Low |
|--------|-------|------|--------|-----|
| /posts | 17 | 11 | 5 | 1 |
| /comments | 10 | 5 | 4 | 1 |
| **Total** | **27** | **16** | **9** | **2** |

---

## 8. 🐛 Bug Summary

| ID | Severity | Title |
|----|----------|-------|
| BUG-002 | High | GET /posts/{id} returns 200 for non-existent resource |
| BUG-003 | High | POST /posts accepts empty body |
| BUG-004 | Medium | PUT /posts/{id} accepts partial body |
| BUG-005 | Critical | DELETE /posts/{id} allows deletion without authentication |
| BUG-006 | Medium | GET /comments returns 500 records with no pagination |

---

## 9. ⚠️ Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Mock API behavior differs from real APIs | Medium | Document findings as best practice violations |
| No authentication available to test | High | Flag as security risk in bug reports |
| API rate limiting | Low | Space out requests during execution |

---

## 10. 📦 Deliverables

- [x] Test Plan (this document)
- [x] Test Cases → [`Test_Cases/TC_API_Posts.md`](../Test_Cases/TC_API_Posts.md)
- [x] Test Cases → [`Test_Cases/TC_API_Comments.md`](../Test_Cases/TC_API_Comments.md)
- [x] Bug Reports → [`Bug_Reports/`](../Bug_Reports/)
- [ ] Test Report → [`Test_Reports/`](../Test_Reports/)

---

## 11. 📅 Timeline

| Activity | Date |
|----------|------|
| Test Plan created | 2025-01-25 |
| Test Cases written | 2025-01-25 |
| Test Execution | 2025-01-25 |
| Bug Reports filed | 2025-01-25 |
| Test Report completed | 2025-01-26 |
