/*

SYNTAX

SELECT
	column_name(s)
    CASE condition_field
		WHEN condition_field_value_1 THEN result_1
        WHEN condition_field_value_2 THEN result_2...
        
        ELSE
	END AS
FROM 
	table_name;

*/

SELECT 
	emp_no,
    first_name,
    last_name,
    CASE
		WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM
	employees;
    
    
SELECT 
	emp_no,
    first_name,
    last_name,
    CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM
	employees;
    
    
    SELECT
		e.emp_no,
        e.first_name,
        e.last_name,
        CASE 
			WHEN dm.emp_no IS NOT NULL THEN 'Manager'
            ELSE 'Employee'
		END AS is_manager
	FROM
		employees e
			LEFT JOIN
		dept_manager dm ON dm.emp_no = e.emp_no
	WHERE
		e.emp_no > 109990;
        
        
SELECT
	emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;
    
# Case can compare multiple values, but IF can only one. 

#EXERCISE
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employees'
	END AS is_manager
FROM 
	employee e
    LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;


SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    (MAX(s.salary) - MIN(s.salary)) AS Salary_diff,
    CASE 
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary raise was higher than $30,000'
        ELSE 'salary raise is not higer than #30,000'
	END AS Salary_increase
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;


SELECT
	d.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN MAX(d.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
	END AS work_status
FROM dept_emp d
JOIN employees e ON d.emp_no = e.emp_no
GROUP BY e.emp_no
LIMIT 100;

