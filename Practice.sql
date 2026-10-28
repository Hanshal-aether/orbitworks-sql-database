SELECT full_name , salary
FROM employees 
WHERE salary >150000 ;

SELECT *
FROM employees 
WHERE YEAR( hire_date ) = '2023';

-- alternative and accurate of above employee joined at 2023

SELECT *
FROM employees
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';


SELECT * 
FROM projects 
WHERE (status = 'Planning' OR 'On-Hold') ORDER BY budget DESC;


SELECT  designation
FROM employees 
WHERE department_id IN (1,2,3,4)  AND designation ='Senior';
-- department_id !=5 

SELECT *
FROM employees
WHERE designation LIKE '%Senior%'
AND department_id <> 5;





SELECT e.full_name,
       d.department_name,
       p.project_name,
       ep.role
FROM employee_projects ep
JOIN employees e
ON ep.employee_id = e.employee_id
JOIN projects p
ON ep.project_id = p.project_id
JOIN departments d
ON p.department_id = d.department_id;


SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;



SELECT * FROM employee_projects WHERE released_date IS NULL;   -- correct
SELECT * FROM employee_projects WHERE released_date = NULL;    -- always returns 0 rows, wrong

SELECT project_name,
       CASE
            WHEN status='Completed' THEN 'Finished'
            WHEN status='In Progress' THEN 'Ongoing'
            WHEN status='Planning' THEN 'Not Started'
            ELSE 'Other'
       END AS project_stage
FROM projects;



SELECT
CASE
    WHEN salary > 150000 THEN 'High'
    WHEN salary > 80000 THEN 'Mid'
    ELSE 'Entry'
END AS salary_band,
COUNT(*) AS total
FROM employees
GROUP BY salary_band;


UPDATE employees SET salary = salary * 1.10 WHERE department_id = 1;

SELECT * FROM orbitworks.employee_projects;



SELECT * FROM orbitworks.departments;


-- SELECT department_id, COUNT(*) AS emp_count
-- FROM employees
-- WHERE is_active = 1          -- filters rows first (fast, happens before grouping)
-- GROUP BY department_id       -- buckets remaining rows by department
-- HAVING COUNT(*) > 3;         -- filters buckets after counting (can't happen any earlier)



SELECT e.department_id,
       COUNT(*) AS emp_count
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.is_active = 1
GROUP BY e.department_id
HAVING COUNT(*) > 3;


SELECT department_id, COUNT(*) AS emp_count
FROM employees
WHERE salary >= 100000         -- filters rows first (fast, happens before grouping)
GROUP BY department_id       -- buckets remaining rows by department
HAVING COUNT(*) > 3;         -- filters buckets after counting (can't happen any earlier)










SELECT * FROM orbitworks.projects;

SELECT project_name, budget FROM projects ORDER BY budget DESC, project_name ASC;










SELECT * FROM orbitworks.employees;

-- SELECT full_name, salary
-- FROM employees
-- WHERE salary > 150000 ORDER BY full_name ASC;)
-- this is found so we can get names in order abcd... 

SELECT e.full_name,
       e.salary,
       d.budget
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.salary DESC, d.budget ASC;



