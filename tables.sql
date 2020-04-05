DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_managers;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY, 
	dept_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender CHAR(1),
	hire_date DATE
);

CREATE TABLE dept_managers (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR(5),
	emp_no INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR(5),
	emp_no INT,
	from_date DATE,
	to_date DATE	
);

CREATE TABLE salaries (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_managers;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;