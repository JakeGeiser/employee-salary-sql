
--Add DataBase Selector
USE vizEmployee;

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

--<4>List emp number, last and first name, and department name
SELECT b.emp_no, c.last_name, c.first_name, a.dept_name
	FROM departments AS a
	INNER JOIN dept_emp AS b
		ON a.dept_no = b.dept_no
	INNER JOIN employees AS c
		ON b.emp_no = c.emp_no;
--</4>

--<5>List first/last name, sex, where name is Hercules B*
SELECT first_name, last_name, sex
	FROM employees
	WHERE (
		first_name = 'Hercules' AND
		last_name LIKE 'B%'
		);
--</5>

--<6>List Sales Dept Employees(eployee number, last/first name, and department name)
SELECT b.emp_no, c.last_name, c.first_name, a.dept_name
	FROM departments AS a
	INNER JOIN dept_emp AS b
		ON a.dept_no = b.dept_no
	INNER JOIN employees AS c
		ON b.emp_no = c.emp_no
	WHERE dept_name = 'Sales';
--</6>

--<7>List Sales and Dev Dept Employees(eployee number, last/first name, and department name)
SELECT b.emp_no, c.last_name, c.first_name, a.dept_name
	FROM departments AS a
	INNER JOIN dept_emp AS b
		ON a.dept_no = b.dept_no
	INNER JOIN employees AS c
		ON b.emp_no = c.emp_no
	WHERE (
		dept_name = 'Sales' OR
		dept_name = 'Development'
		);
--</7>

--<8>List frequency of last names
SELECT last_name, COUNT(last_name) AS 'Count'
	FROM employees
	GROUP BY last_name
	ORDER BY 'Count';
--</8>

--<extra>
----<fool>Look at Foolsday
SELECT first_name, last_name
	FROM employees
	WHERE last_name = 'Foolsday';
----</fool>

----<ID>look at your employee number
SELECT e.emp_no, e.last_name, e.first_name ,e.sex, s.salary
	FROM employees AS e INNER JOIN salaries as s
	ON e.emp_no = s.emp_no
	WHERE e.emp_no = 499942;
----</ID>
--</extra>
