# 🔌 API Testing — JSONPlaceholder

**Base URL:** `https://jsonplaceholder.typicode.com`  
**Tool:** Postman v11  
**Tested by:** Fernando Reyes  
**Date:** 2025-01-25  

---

## 📋 Endpoints Tested

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/posts` | Get all posts |
| GET | `/posts/{id}` | Get single post |
| POST | `/posts` | Create a new post |
| PUT | `/posts/{id}` | Full update a post |
| PATCH | `/posts/{id}` | Partial update a post |
| DELETE | `/posts/{id}` | Delete a post |
| GET | `/comments` | Get all comments |
| GET | `/comments/{id}` | Get single comment |
| GET | `/comments?postId={id}` | Filter comments by post |

---

## GET /posts

**Request**
```
GET https://jsonplaceholder.typicode.com/posts
```

**Expected Response**
```json
Status: 200 OK

[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit..."
  }
]
```

**Validations**
- ✅ Status code is 200
- ✅ Response is an array
- ✅ Array contains 100 records
- ✅ Each record has `id`, `userId`, `title`, `body`
- ✅ Response time < 500ms

---

## GET /posts/{id}

**Request**
```
GET https://jsonplaceholder.typicode.com/posts/1
```

**Expected Response**
```json
Status: 200 OK

{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit..."
}
```

**Validations**
- ✅ Status code is 200
- ✅ Response is a single object
- ✅ `id` matches the requested ID
- ❌ Non-existent ID returns 200 instead of 404 → See [BUG-002](../Bug_Reports/BUG-002_API_404_Handling.md)

---

## POST /posts

**Request**
```
POST https://jsonplaceholder.typicode.com/posts
Content-Type: application/json

{
  "title": "QA Test Post",
  "body": "This is a test post created during API testing",
  "userId": 1
}
```

**Expected Response**
```json
Status: 201 Created

{
  "title": "QA Test Post",
  "body": "This is a test post created during API testing",
  "userId": 1,
  "id": 101
}
```

**Validations**
- ✅ Status code is 201
- ✅ Response includes generated `id`
- ✅ Response body matches sent data
- ❌ Empty body accepted without validation → See [BUG-003](../Bug_Reports/BUG-003_POST_Missing_Validation.md)

---

## PUT /posts/{id}

**Request**
```
PUT https://jsonplaceholder.typicode.com/posts/1
Content-Type: application/json

{
  "id": 1,
  "title": "Updated Title",
  "body": "Updated body content",
  "userId": 1
}
```

**Expected Response**
```json
Status: 200 OK

{
  "id": 1,
  "title": "Updated Title",
  "body": "Updated body content",
  "userId": 1
}
```

**Validations**
- ✅ Status code is 200
- ✅ Response reflects updated fields
- ❌ Partial body accepted without validation → See [BUG-004](../Bug_Reports/BUG-004_PUT_Partial_Update.md)

---

## PATCH /posts/{id}

**Request**
```
PATCH https://jsonplaceholder.typicode.com/posts/1
Content-Type: application/json

{
  "title": "Partially Updated Title"
}
```

**Expected Response**
```json
Status: 200 OK

{
  "userId": 1,
  "id": 1,
  "title": "Partially Updated Title",
  "body": "quia et suscipit..."
}
```

**Validations**
- ✅ Status code is 200
- ✅ Only `title` is updated, other fields remain unchanged

---

## DELETE /posts/{id}

**Request**
```
DELETE https://jsonplaceholder.typicode.com/posts/1
```

**Expected Response**
```json
Status: 200 OK
{}
```

**Validations**
- ✅ Status code is 200
- ✅ Response body is empty
- ❌ No authentication required for deletion → See [BUG-005](../Bug_Reports/BUG-005_DELETE_No_Auth.md)

---

## GET /comments

**Request**
```
GET https://jsonplaceholder.typicode.com/comments
```

**Expected Response**
```json
Status: 200 OK

[
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi..."
  }
]
```

**Validations**
- ✅ Status code is 200
- ✅ Each record has `id`, `postId`, `name`, `email`, `body`
- ✅ Email fields contain valid format
- ❌ Returns 500 records with no pagination → See [BUG-006](../Bug_Reports/BUG-006_Response_Time.md)

---

## GET /comments?postId={id}

**Request**
```
GET https://jsonplaceholder.typicode.com/comments?postId=1
```

**Expected Response**
```json
Status: 200 OK

[
  {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi..."
  }
]
```

**Validations**
- ✅ Status code is 200
- ✅ All returned records have `postId` matching the filter
- ✅ Non-existent postId returns empty array `[]`

---

## 📊 Results Summary

| Method | Endpoint | Result |
|--------|----------|--------|
| GET | `/posts` | ✅ Pass |
| GET | `/posts/1` | ✅ Pass |
| GET | `/posts/9999` | ❌ Fail |
| POST | `/posts` (valid) | ✅ Pass |
| POST | `/posts` (empty body) | ❌ Fail |
| PUT | `/posts/1` (full) | ✅ Pass |
| PUT | `/posts/1` (partial) | ❌ Fail |
| PATCH | `/posts/1` | ✅ Pass |
| DELETE | `/posts/1` (no auth) | ❌ Fail |
| GET | `/comments` | ✅ Pass |
| GET | `/comments?postId=1` | ✅ Pass |

> ❌ All failed cases are documented in [`Bug_Reports/`](../Bug_Reports/)
