
-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
ON emp.emp_no = sal.emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE extract (YEAR from hire_date)='1986'
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dep.dept_no, dep.dept_name, dm.emp_no, emp.last_name, emp.first_name 
FROM departments as dep
JOIN dept_manager as dm
ON dep.dept_no = dm.dept_no
JOIN employees as emp
ON dm.emp_no = emp.emp_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees as emp
JOIN dept_emp as d_emp
ON emp.emp_no = d_emp.emp_no
JOIN departments as dep
ON dep.dept_no = d_emp.dept_no
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE 
first_name = 'Hercules' 
AND
last_name LIKE '%B%'
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees as emp
JOIN dept_emp as d_emp
ON emp.emp_no = d_emp.emp_no
JOIN departments as dep
ON dep.dept_no = d_emp.dept_no
WHERE 
dep.dept_name = 'Sales'
OR
dep.dept_name = 'Development'
;


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as "Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Last Name" DESC;
