
--<1>List Employee Num, Last Name, First Name, Sex, and Salary
SELECT e.emp_no, e.last_name, e.first_name, s.salary
	FROM employees AS e INNER JOIN salaries as s
	ON e.emp_no = s.emp_no;
--</1>