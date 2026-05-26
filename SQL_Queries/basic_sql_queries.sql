-- ============================================
-- File: basic_sql_queries.sql
-- Description: Basic SQL queries for QA data validation
-- Author: Fernando Reyes
-- Database: MySQL / Oracle SQL
-- ============================================


-- ============================================
-- SELECT
-- ============================================

-- 1. Get all records from a table
SELECT * FROM users;

-- 2. Get specific columns
SELECT id, username, email FROM users;

-- 3. Filter with WHERE
SELECT * FROM users WHERE status = 'active';

-- 4. Filter with multiple conditions
SELECT * FROM users 
WHERE status = 'active' AND created_at >= '2024-01-01';

-- 5. Sort results
SELECT * FROM users ORDER BY created_at DESC;

-- 6. Limit results
SELECT * FROM users LIMIT 10;                  -- MySQL
SELECT * FROM users WHERE ROWNUM <= 10;        -- Oracle


-- ============================================
-- COUNT & AGGREGATIONS
-- ============================================

-- 7. Count total records
SELECT COUNT(*) AS total FROM users;

-- 8. Count with condition
SELECT COUNT(*) AS active_users 
FROM users 
WHERE status = 'active';

-- 9. Sum, Average, Min, Max
SELECT 
    SUM(amount)   AS total_amount,
    AVG(amount)   AS avg_amount,
    MIN(amount)   AS min_amount,
    MAX(amount)   AS max_amount
FROM claims;

-- 10. Group by with count
SELECT 
    status,
    COUNT(*) AS total
FROM users
GROUP BY status;


-- ============================================
-- JOINS
-- ============================================

-- 11. INNER JOIN — only matching records
SELECT 
    u.id,
    u.username,
    o.order_id,
    o.total
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- 12. LEFT JOIN — all users, even without orders
SELECT 
    u.id,
    u.username,
    o.order_id
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;

-- 13. Find users with NO orders (orphaned records)
SELECT 
    u.id,
    u.username
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.order_id IS NULL;


-- ============================================
-- FILTERING & SEARCH
-- ============================================

-- 14. Search by partial text
SELECT * FROM users WHERE email LIKE '%@gmail.com';

-- 15. Filter by list of values
SELECT * FROM users WHERE status IN ('active', 'pending');

-- 16. Filter by range
SELECT * FROM claims 
WHERE claim_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 17. Filter NULL values
SELECT * FROM users WHERE phone IS NULL;

-- 18. Filter NOT NULL
SELECT * FROM users WHERE phone IS NOT NULL;


-- ============================================
-- USEFUL FOR QA VALIDATION
-- ============================================

-- 19. Compare record count between two tables
SELECT 
    (SELECT COUNT(*) FROM users) AS total_users,
    (SELECT COUNT(*) FROM orders) AS total_orders;

-- 20. Find records created today
SELECT * FROM users 
WHERE DATE(created_at) = CURDATE();              -- MySQL

SELECT * FROM users 
WHERE TRUNC(created_date) = TRUNC(SYSDATE);     -- Oracle

-- 21. Find records from the last 7 days
SELECT * FROM users 
WHERE created_at >= NOW() - INTERVAL 7 DAY;     -- MySQL

SELECT * FROM users 
WHERE created_date >= SYSDATE - 7;              -- Oracle

-- 22. Check if a specific value exists
SELECT COUNT(*) AS exists_flag 
FROM users 
WHERE email = 'test@example.com';
