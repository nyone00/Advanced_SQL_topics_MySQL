/*
the index of a table functions like the index of a book
- data is taken from a column of the table and is stored in a certain
order in a distinct place, called an index

SYNTAX

CREATE INDEX index_name
ON table_name (column1, column2 ....);

*/

SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

# SELECT all employees bearing the name "Georgi Facello"

SELECT *
FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX i_composite ON employees(first_name, last_name);
SHOW INDEX FROM employees FROM employees;

#EXERCISE
ALTER TABLE employees
DROP INDEX i_hire_date;


SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary ON salaries(salary);


