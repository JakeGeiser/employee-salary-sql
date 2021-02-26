
--<1>List Employee Num, Last Name, First Name, Sex, and Salary
SELECT e.emp_no, e.last_name, e.first_name ,e.sex, s.salary
	FROM employees AS e INNER JOIN salaries as s
	ON e.emp_no = s.emp_no;
--</1>

--<2>List First Name, Last Name, and hire date for 1986 employees
SELECT first_name, last_name, hire_date
	FROM employees
	WHERE YEAR(hire_date) = 1986;
--</2>

--<3>List deptartment number, dept name, employee num, emp first and last name
SELECT a.dept_name, a.dept_name, b.emp_no, c.last_name, c.first_name
	FROM departments AS a
	INNER JOIN dept_manager AS b
		ON a.dept_no = b.dept_no
	INNER JOIN employees AS c
		ON b.emp_no = c.emp_no;
--</3>