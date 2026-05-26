-- ============================================
-- File: cross_table_validation.sql
-- Description: Validate data consistency across related tables
-- Author: Fernando Reyes
-- Database: Oracle SQL
-- ============================================


-- 1. Find claims with no matching patient
SELECT 
    c.claim_number,
    c.patient_id,
    c.claim_date
FROM claims c
LEFT JOIN patients p ON c.patient_id = p.id
WHERE p.id IS NULL;


-- 2. Find appointments with no matching doctor
SELECT 
    a.id AS appointment_id,
    a.doctor_id,
    a.appointment_date
FROM appointments a
LEFT JOIN doctors d ON a.doctor_id = d.id
WHERE d.id IS NULL;


-- 3. Validate claim amounts match expected totals
SELECT 
    c.claim_number,
    c.total_amount AS claim_total,
    SUM(cd.line_amount) AS calculated_total,
    c.total_amount - SUM(cd.line_amount) AS difference
FROM claims c
JOIN claim_details cd ON c.id = cd.claim_id
GROUP BY c.claim_number, c.total_amount
HAVING c.total_amount != SUM(cd.line_amount);


-- 4. Check records inserted in current sprint (last 2 weeks)
SELECT 
    'claims' AS table_name,
    COUNT(*) AS records_created
FROM claims
WHERE created_date >= SYSDATE - 14
UNION ALL
SELECT 
    'patients',
    COUNT(*)
FROM patients
WHERE created_date >= SYSDATE - 14
UNION ALL
SELECT 
    'appointments',
    COUNT(*)
FROM appointments
WHERE created_date >= SYSDATE - 14;


-- 5. Validate referential integrity — orphaned records
SELECT 
    'claims without patient' AS issue,
    COUNT(*) AS total
FROM claims c
WHERE NOT EXISTS (
    SELECT 1 FROM patients p WHERE p.id = c.patient_id
)
UNION ALL
SELECT 
    'appointments without patient',
    COUNT(*)
FROM appointments a
WHERE NOT EXISTS (
    SELECT 1 FROM patients p WHERE p.id = a.patient_id
)
UNION ALL
SELECT 
    'appointments without doctor',
    COUNT(*)
FROM appointments a
WHERE NOT EXISTS (
    SELECT 1 FROM doctors d WHERE d.id = a.doctor_id
);
