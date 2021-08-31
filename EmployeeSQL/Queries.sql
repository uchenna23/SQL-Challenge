-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name, 
	   employees.sex,
	   salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, 
	   first_name, 
	   hire_date
FROM employees
WHERE DATE_PART('year',hire_date)=1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no,
	   departments.dept_name,
	   employees.emp_no,
	   employees.first_name,
	   employees.last_name
FROM dept_manager
JOIN employees ON dept_manager.emp_no=employees.emp_no
JOIN departments ON dept_manager.dept_no=departments.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT departments.dept_name,
	   dept_emp.emp_no,
	   employees.first_name,
	   employees.last_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.first_name,
	   employees.last_name,
	   dept_emp.emp_no,
	   departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name,
	   employees.last_name,
	   dept_emp.emp_no,
	   departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales' 
OR dept_name='Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT count(last_name),
	   last_name
FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc
