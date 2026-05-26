-- ============================================
-- File: check_duplicate_entries.sql
-- Description: Detect duplicate records across key tables
-- Author: Fernando Reyes
-- Database: Oracle SQL
-- ============================================


-- 1. Find duplicate patients by SSN (Healthcare context)
SELECT 
    ssn,
    COUNT(*) AS total
FROM patients
GROUP BY ssn
HAVING COUNT(*) > 1
ORDER BY total DESC;


-- 2. Find duplicate claims by claim number
SELECT 
    claim_number,
    COUNT(*) AS total
FROM claims
GROUP BY claim_number
HAVING COUNT(*) > 1;


-- 3. Identify duplicate records with full row details
SELECT *
FROM (
    SELECT 
        p.*,
        ROW_NUMBER() OVER (
            PARTITION BY ssn 
            ORDER BY created_date DESC
        ) AS row_num
    FROM patients p
)
WHERE row_num > 1;


-- 4. Find duplicate appointments (same patient, same date, same doctor)
SELECT 
    patient_id,
    doctor_id,
    appointment_date,
    COUNT(*) AS total
FROM appointments
GROUP BY 
    patient_id,
    doctor_id,
    appointment_date
HAVING COUNT(*) > 1;


-- 5. Summary of duplicates per table
SELECT 'patients' AS table_name, COUNT(*) AS duplicate_groups
FROM (
    SELECT ssn FROM patients GROUP BY ssn HAVING COUNT(*) > 1
)
UNION ALL
SELECT 'claims', COUNT(*)
FROM (
    SELECT claim_number FROM claims GROUP BY claim_number HAVING COUNT(*) > 1
)
UNION ALL
SELECT 'appointments', COUNT(*)
FROM (
    SELECT patient_id, doctor_id, appointment_date 
    FROM appointments 
    GROUP BY patient_id, doctor_id, appointment_date 
    HAVING COUNT(*) > 1
);
