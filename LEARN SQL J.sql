SELECT *
FROM student_demographics
WHERE first_name IS NULL OR last_name IS NULL OR gender IS NULL;

SELECT * FROM student_fee;

-- COUNT MISSING VALUES 
SELECT COUNT(*) AS missing_count
FROM student_demographics
WHERE first_name;


-- HOW TO HANDLE DUPLICATES
-- IDENTIFY DUPLICTAES, YOU CAN USE THE GROUP BY AND HAVING CLAUSES TO FIND ROWS WITH THE SAME VALUES.
SELECT first_name, last_name, COUNT(*)
FROM student_demographics
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- USING DELETE WITH ROW_NUMBER() (RETAIN THE FIRST OCCURENCE)

CREATE TEMPORARY TABLE temp_table AS
SELECT *
FROM  student_demographics
WHERE first_name IN (
SELECT MIN(first_name)
FROM student_demographics
GROUP BY first_name
);

SELECT * 
FROM temp_table; 


DELETE FROM student_demographics;
INSERT INTO student_demographics SELECT * FROM temp_table;
DROP TEMPORARY TABLE temp_table;

