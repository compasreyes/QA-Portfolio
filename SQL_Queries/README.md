[README_SQL_Queries.md](https://github.com/user-attachments/files/28125045/README_SQL_Queries.md)
# 💾 SQL Queries

This folder contains SQL queries used for data validation and backend verification.  
Based on real patterns used in Healthcare IT data validation (Oracle SQL & MySQL).

---

## 📋 Index

| File | Database | Purpose |
|------|----------|---------|
| `validate_user_records.sql` | MySQL | Verify user data integrity |
| `check_duplicate_entries.sql` | Oracle | Detect duplicate records |
| `cross_table_validation.sql` | Oracle | Validate data consistency across tables |

---

## 🧪 Query Types Included

- ✅ **Data integrity checks** — NULL values, missing fields
- ✅ **Duplicate detection** — GROUP BY + HAVING
- ✅ **Cross-table validation** — JOINs to verify relational consistency
- ✅ **Count comparisons** — Expected vs actual record counts
- ✅ **Date range filters** — Validating records within sprint/release cycles

> 💡 All queries use anonymized or fictional data. No real patient or client data is included.
