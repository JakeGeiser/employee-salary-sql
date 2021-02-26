
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