SELECT e.emp_no,
	   	e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
into retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

select * from retirement_titles





-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) 
r.emp_no,
r.first_name,
r.last_name,
r.title

INTO unique_titles
FROM retirement_titles as r
WHERE r.to_date = ('9999-01-01')
ORDER BY r.emp_no, r.to_date DESC;

select * from unique_titles;

select count(emp_no), title 
INTO retiring_titles
from unique_titles
group by title
ORDER BY count desc;

select * from retiring_titles;

SELECT Distinct on (e.emp_no) e.emp_no,
	   	e.first_name,
		e.last_name,
		e.birth_date,
		dp.from_date,
		dp.to_date,
		t.title
into mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS dp
ON (e.emp_no = dp.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE dp.to_date = ('9999-01-01')
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

select * from mentorship_eligibility;
