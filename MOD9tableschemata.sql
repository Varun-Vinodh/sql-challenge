CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    hire_date DATE
);

CREATE TABLE employee_salary (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT 
);

CREATE TABLE job_titles (
  title_id VARCHAR(10) NOT NULL PRIMARY KEY,
  title VARCHAR(50)
);

CREATE TABLE employee_departments (
    emp_no INT,
    dept_no VARCHAR(10) NOT NULL
);

CREATE TABLE department_managers (
    dept_no VARCHAR(10),
    emp_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE department_types (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR NOT NULL PRIMARY KEY
);


select * from employees
select * from employee_salary
select * from job_titles
select * from employee_departments
select * from department_managers

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, employee_salary.salary
FROM employees
INNER JOIN employee_salary
ON employees.emp_no = employee_salary.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT department_managers.dept_no, department_types.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM department_managers, employee_departments, department_types, employees
WHERE department_managers.dept_no = employee_departments.dept_no
  AND department_managers.emp_no = employee_departments.emp_no
  AND employee_departments.dept_no = department_types.dept_no
  AND department_managers.emp_no = employees.emp_no;
  
SELECT employees.emp_no, employees.last_name, employees.first_name, employee_departments.dept_no, department_types.dept_name
FROM employees
JOIN employee_departments ON employees.emp_no = employee_departments.emp_no
JOIN department_types ON employee_departments.dept_no = department_types.dept_no;

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN employee_departments ON employees.emp_no = employee_departments.emp_no
JOIN department_types ON employee_departments.dept_no = department_types.dept_no
WHERE department_types.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, department_types.dept_name
FROM employees
JOIN employee_departments ON employees.emp_no = employee_departments.emp_no
JOIN department_types ON employee_departments.dept_no = department_types.dept_no
WHERE department_types.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;