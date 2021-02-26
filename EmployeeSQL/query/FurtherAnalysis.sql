--<1>Get list of employees that have been at least 2 departments
----First show how many departments each employee has been in
SELECT emp_no, COUNT(emp_no) AS NoD
	INTO #1TempTable
	FROM dept_emp
	GROUP BY emp_no;
----Second filter out single held positions
SELECT emp_no 
	INTO #1TT
	FROM #1TempTable
	WHERE NoD > 1;
SELECT * FROM #1TT;
SELECT COUNT(emp_no) AS "Count of Double Role Employees" FROM #1TT;
--</1>

--<2>Check if managers are in more than one department
SELECT e.emp_no, COUNT(e.emp_no) AS "Number of Dept"
	FROM dept_emp AS e INNER JOIN dept_manager AS m
	ON (e.emp_no = m.emp_no)
	GROUP BY e.emp_no;
--</2>

SELECT *
	FROM dept_emp;