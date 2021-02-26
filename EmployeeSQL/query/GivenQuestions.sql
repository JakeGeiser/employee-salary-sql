SELECT emp_no, COUNT(emp_no) AS NoD
	FROM dept_emp
	GROUP BY emp_no
	HAVING (NoD > 1);

--Check if managers are in more than one department
SELECT e.emp_no, COUNT(e.emp_no) AS "Number of Dept"
	FROM dept_emp AS e INNER JOIN dept_manager AS m
	ON (e.emp_no = m.emp_no)
	GROUP BY e.emp_no;

SELECT *
	FROM salaries;