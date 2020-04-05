--  1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	employees.emp_no AS employee, 
	last_name, 
	first_name, 
	gender, 
	salary 
FROM employees LEFT JOIN employees_last_salary 
ON employees.emp_no = employees_last_salary.emp_no
ORDER BY last_name, first_name, employee;

-- 2. List employees who were hired in 1986.

SELECT 
	emp_no, 
	last_name, 
	first_name, 
	hire_date 
FROM employees 
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date ASC;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT 
	c.dept_no, 
	d.dept_name, 
	c.emp_no, 
	c.from_date, 
	c.to_date, 
	c.last_name, 
	c.first_name
FROM departments AS d LEFT JOIN current_managers AS c 
	 ON d.dept_no = c.dept_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	c.emp_no, 
	c.last_name, 
	c.first_name, 
	d.dept_name 
FROM 
	current_employees as c LEFT JOIN departments AS d 
		ON c.dept_no = d.dept_no 
ORDER BY 
	dept_name, 
	last_name, 
	first_name
;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	emp_no, 
	last_name, 
	first_name
FROM current_employees 
WHERE 
	first_name = 'Hercules' AND 
	last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	c.emp_no, 
	c.last_name, 
	c.first_name, 
	d.dept_name
FROM current_employees AS c LEFT JOIN departments AS d
	ON c.dept_no = d.dept_no 
WHERE dept_name = 'Sales'
ORDER BY last_name, first_name
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	c.emp_no, 
	c.last_name, 
	c.first_name, 
	d.dept_name
FROM current_employees AS c LEFT JOIN departments AS d
	ON c.dept_no = d.dept_no 
WHERE 
	dept_name = 'Sales' OR 
	dept_name = 'Development'
ORDER BY last_name, first_name
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
	last_name, 
	COUNT(emp_no) AS employees_with_name
FROM employees 
GROUP BY last_name
ORDER BY employees_with_name DESC 
;