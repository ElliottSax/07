SELECT
employees.emp_no,
first_name,
last_name,
title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
JOIN titles
DISTINCT employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Use Dictinct with Orderby to remove duplicate rows
SELECT COUNT(*)
FROM
(SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(*)
FROM unique_titles;

SELECT COUNT (title) as COUNT,
title
INTO retiring_tiles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

----

SELECT
DISTINCT ON(employees.emp_no)
employees.emp_no,
first_name,
last_name,
birth_date,
de.from_date,
de.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
JOIN titles
ON (employees.emp_no = titles.emp_no)
JOIN dept_emp as de
ON (employees.emp_no = de.emp_no)
WHERE de.to_date = '9999-01-01'
AND birth_date BETWEEN '1965-01-01' AND '12-31-1965'
AND titles.to_date = '9999-01-01'

;
-- getting ages 
SELECT e.emp_no, e.birth_date,
DATE_PART('year', current_date::date) - DATE_PART('year', e.birth_date::date) AS AGE
INTO ages
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE de.to_date ='9999-01-01';

 
 -- getting average age
SELECT avg (age)
FROM ages

 
 -- getting mode
 
SELECT age, count(*)
FROM ages
GROUP BY age
ORDER BY count(*) DESC
 
 --getting age ranges
 
 SELECT age
 FROM ages
 WHERE age between 18 and 35;
 
 SELECT age
 FROM ages
 WHERE age between 35 and 50;
 
 SELECT age
 FROM ages
 WHERE age between 50 and 60;
 
 SELECT age
 FROM ages
 WHERE age between 60 and 70;
 
 SELECT age
 FROM ages
 WHERE age between 70 and 80;
 
 SELECT age
 FROM ages
 WHERE age between 80 and 90;







