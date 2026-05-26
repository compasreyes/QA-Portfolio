[BUG-001_Login_Validation.md](https://github.com/user-attachments/files/28253600/BUG-001_Login_Validation.md)
# 🐛 BUG-001 — Login form submits with empty email field

## 📋 Summary

| Field | Detail |
|-------|--------|
| **ID** | BUG-001 |
| **Title** | Login form submits without email validation |
| **Reported by** | Fernando Reyes |
| **Date** | 2025-01-15 |
| **App / URL** | https://the-internet.herokuapp.com/login |
| **Environment** | Chrome 124.0 / Windows 11 |
| **Severity** | Medium |
| **Priority** | High |
| **Status** | Open |

---

## 📝 Description

The login form allows submission when the email field is left empty. No client-side validation is triggered, and the form sends a request to the server without the required field. This could lead to unnecessary server load and a poor user experience.

---

## 🔁 Steps to Reproduce

1. Navigate to `https://the-internet.herokuapp.com/login`
2. Leave the **Username** field empty
3. Enter any value in the **Password** field
4. Click the **Login** button

---

## ✅ Expected Result

A validation message should appear:  
`"Username is required"` — and the form should **not** be submitted.

## ❌ Actual Result

The form submits without any validation message. The page reloads and displays a generic error from the server instead of client-side validation.

---

## 📊 Severity & Impact

| Criteria | Assessment |
|----------|------------|
| **Severity** | Medium — UI validation missing, server handles it instead |
| **Priority** | High — affects every user on the login flow |
| **Frequency** | 100% reproducible |
| **Workaround** | None |

---

## 📎 Evidence

> 📸 Screenshot 1: Empty username field before submission  
> 📸 Screenshot 2: Server error displayed after submission  
> *(Screenshots would be attached in a real project via Jira or test management tool)*

---

## 💡 Notes

- Validation should be handled **client-side** before reaching the server
- Recommended fix: Add `required` attribute to the username input field and display inline error message

