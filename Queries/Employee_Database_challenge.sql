----------------
--DELIVERABLE #1
----------------
--Table1.1 RETIREMENT TITLES
SELECT e.emp_no, e.first_name, e.last_name, 
		t.title, t.from_date, t.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
 

--Table 1.2  UNIQUE TITLES
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no Asc, rt.to_date DESC;

--Table 1.3 RETIRING TITLES 
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

----------------
--DELIVERABLE #2
----------------
--Table 2.1 MENTORSHIP_ELIBILITY
SELECT DISTINCT ON (e.emp_no)
	e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	t.title
INTO mentorship_eligibility 
FROM employees as e
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date  = '9999-01-01')  
ORDER BY e.emp_no ASC, to_date DESC;  



----------------
--DELIVERABLE #3
----------------
-- retiring positions grouped by department and title
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no, rt.first_name, rt.last_name, rt.title,
de.dept_no,
d.dept_name
INTO unique_title_department
FROM retirement_titles as rt	
INNER JOIN dept_emp as de ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d  ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- roles needed to be filled by department and title
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO positions_to_fill
FROM unique_titles_department as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

--staff qualified to mentor next replacement of retirees
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO available_staff
FROM unique_titles_department as ut
WHERE ut.title IN ('Manager', 'Senior Staff', 'Technique Leader','Senior Engineer')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;
