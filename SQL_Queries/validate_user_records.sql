-- ============================================
-- File: validate_user_records.sql
-- Description: Validate user data integrity
-- Author: Fernando Reyes
-- Database: MySQL
-- ============================================


-- 1. Check for NULL values in required fields
SELECT 
    id,
    username,
    email,
    created_at
FROM users
WHERE 
    username IS NULL
    OR email IS NULL
    OR created_at IS NULL;


-- 2. Check for empty strings in required fields
SELECT 
    id,
    username,
    email
FROM users
WHERE 
    TRIM(username) = ''
    OR TRIM(email) = '';


-- 3. Validate email format
SELECT 
    id,
    email
FROM users
WHERE 
    email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';


-- 4. Check for duplicate emails
SELECT 
    email,
    COUNT(*) AS total
FROM users
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY total DESC;


-- 5. Check for duplicate usernames
SELECT 
    username,
    COUNT(*) AS total
FROM users
GROUP BY username
HAVING COUNT(*) > 1
ORDER BY total DESC;


-- 6. Validate created_at is not a future date
SELECT 
    id,
    username,
    created_at
FROM users
WHERE created_at > NOW();


-- 7. Count total users vs active users
SELECT 
    COUNT(*) AS total_users,
    SUM(CASE WHEN status = 'active' THEN 1 ELSE 0 END) AS active_users,
    SUM(CASE WHEN status = 'inactive' THEN 1 ELSE 0 END) AS inactive_users,
    SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS null_status
FROM users;
