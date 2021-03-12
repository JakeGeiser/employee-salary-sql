--Add database selector
USE vizEmployee;

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

--<3>Create temporary master table so I don't need to join each time
DROP TABLE IF EXISTS #masterTemp;
SELECT b.emp_no, c.last_name, c.first_name, c.sex, a.dept_name, e.title, d.salary, c.hire_date
	INTO #masterTemp
	FROM departments AS a
	INNER JOIN dept_emp AS b
		ON a.dept_no = b.dept_no
	INNER JOIN employees AS c
		ON b.emp_no = c.emp_no
	INNER JOIN salaries AS d
		ON b.emp_no = d.emp_no
	INNER JOIN titles AS e
		ON c.emp_title_id = e.title_id;
SELECT * FROM #masterTemp;
--</3>

--<4>Show total hire salary for each department each year
SELECT YEAR(hire_date) AS "Hire Year", dept_name, SUM(salary) AS "Salary Total"
	FROM #masterTemp
	GROUP BY YEAR(hire_date), dept_name;
--</4>

SELECT YEAR(hire_date) AS "Hire Year", SUM(salary) AS "Salary Total"
	FROM #masterTemp
	GROUP BY YEAR(hire_date)
	ORDER BY "Hire Year";