--1. List the employee number, last name, first name, 
--sex, and salary of each employee
SELECT 
    s.emp_no, 
    e.last_name, 
    e.first_name, 
    e.sex, 
    s.salary
FROM 
    employees AS e
INNER JOIN 
    salaries AS s 
    ON s.emp_no = e.emp_no
ORDER BY 
    s.emp_no;

--2. List the first name, last name, and hire date for 
--the employees who were hired in 1986.
SELECT 
    emp_no, 
    last_name, 
    first_name, 
    hire_date 
FROM 
    employees 
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT DISTINCT ON (dm.dept_no) 
    dm.dept_no, 
    d.dept_name, 
    dm.emp_no, 
    e.last_name, 
    e.first_name 
FROM 
    dept_manager AS dm
INNER JOIN 
    departments AS d 
    ON dm.dept_no = d.dept_no
INNER JOIN 
    employees AS e 
    ON dm.emp_no = e.emp_no
ORDER BY 
    dm.dept_no;

--4. List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.
SELECT DISTINCT ON (e.emp_no) 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    de.dept_no, 
    d.dept_name
FROM 
    employees AS e
LEFT JOIN 
    dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN 
    departments AS d ON de.dept_no = d.dept_no
ORDER BY 
    e.emp_no;

--5. List first name, last name, and sex of each employee whose first name
--is Hercules and whose last name begins with the letter B.
SELECT 
    e.last_name, 
    e.first_name
FROM 
    employees AS e
WHERE 
    e.first_name = 'Hercules' 
    AND e.last_name ILIKE 'B%'
ORDER BY 
    e.last_name;

--6. List each employee in the Sales department, including their employee number,
--last name, and first name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    employees AS e,
	departments AS d
WHERE 
    LOWER(d.dept_name) = 'sales';

--7. List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM 
    employees AS e,
	departments AS d
WHERE 
    LOWER(d.dept_name) IN ('sales', 'development');

--8. List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).
SELECT 
    last_name, 
    COUNT(last_name) AS frequency 
FROM 
    employees 
GROUP BY 
    last_name 
ORDER BY 
    frequency DESC;