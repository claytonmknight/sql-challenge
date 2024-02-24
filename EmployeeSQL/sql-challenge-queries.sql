-- employee no, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- first and last name for all employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- maganger for each department, w/department number, department name, employee number, last name, and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- department number for each employee w/employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- first name, last name, and sex of each employee first name 'Hercules' and last name starts with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- all employees in the 'Sales' department w/employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- all employees in the 'Sales' and 'Devlopment' departments w/employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- count of how many employees share each last name
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;