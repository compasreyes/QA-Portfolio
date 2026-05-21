[README_API_Testing.md](https://github.com/user-attachments/files/28125013/README_API_Testing.md)
# 🔌 API Testing

This folder contains Postman collections and request validations for public REST APIs.  
All collections can be imported directly into Postman.

---

## 📋 Index

| File | API | Methods | Description |
|------|-----|---------|-------------|
| `JSONPlaceholder_Collection.json` | JSONPlaceholder | GET, POST, PUT, DELETE | Full CRUD validation |
| `PokéAPI_Collection.json` | PokéAPI | GET | Response structure and data validation |

---

## 🧪 What is validated

- ✅ Status codes (200, 201, 404, 500)
- ✅ Response time < 500ms
- ✅ Response body structure and data types
- ✅ Required fields presence
- ✅ Error handling for invalid inputs

---

## 📥 How to import in Postman

1. Open **Postman**
2. Click **Import**
3. Select the `.json` file from this folder
4. Run the collection
