--Data Analysis
--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.employee_number, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on e.employee_number = s.employee_number;

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date like '%/1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select d.department_number, d.department_name, dm.employee_number, e.last_name, e.first_name
from departments as d
inner join department_manager_junction as dm
on d.department_number = dm.department_number
inner join employees as e
on dm.employee_number = e.employee_number;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select e.employee_number, e.last_name, e.first_name, d.department_name
from departments as d
inner join department_employee_junction as de
on d.department_number = de.department_number
inner join employees as e
on de.employee_number = e.employee_number;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select e.employee_number, e.last_name, e.first_name, d.department_name
from employees as e
inner join department_employee_junction as de
on e.employee_number = de.employee_number
inner join departments as d
on de.department_number = d.department_number
where d.department_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.employee_number, e.last_name, e.first_name, d.department_name
from employees as e
inner join department_employee_junction as de
on e.employee_number = de.employee_number
inner join departments as d
on de.department_number = d.department_number
where d.department_name = 'Sales' or d.department_name ='Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name) as "frequency"
from employees
group by last_name
order by "frequency" desc;
