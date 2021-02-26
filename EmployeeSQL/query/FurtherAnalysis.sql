--Get list of employees that have been at least 2 departments
----First group by
SELECT emp_no, COUNT(emp_no) AS NoD
	INTO #TempTable1
	FROM dept_emp
	GROUP BY emp_no;

SELECT * 
	FROM #TempTable1
	WHERE NoD > 1;
--Check if managers are in more than one department
SELECT e.emp_no, COUNT(e.emp_no) AS "Number of Dept"
	FROM dept_emp AS e INNER JOIN dept_manager AS m
	ON (e.emp_no = m.emp_no)
	GROUP BY e.emp_no;

SELECT *
	FROM dept_emp;