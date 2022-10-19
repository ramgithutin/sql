create database task;
use task;
create table department(dep_id int primary key,dep_name varchar(20),dep_location varchar(15))
create table salary_grade(grade int primary key,min_salary int,max_salary int)
create table employees(emp_id int not null,emp_name varchar(15),job_name varchar(10),manager_id int,hire_date date,salary dec(10,2),commission dec(7,2),dep_id int,primary key(emp_id))
select * from employees;

insert into employees
values(68319,'KAYLING','PRESIDENT',NULL,'19911118',6000.00,NULL,1001),
(66928,'BLAZE','MANAGER',68319,'19910501',2750.00,null,3001),
(67832,'CLARE','MANAGER',68319,'19910609',2550.00,null,1001),
(65646,'JONAS','MANAGER',68319,'19910402',2957.00,null,2001),
(67858,'SCARLET','ANALYST',65646,'19970419',3100.00,null,2001),
(69062,'FRANK','ANALYST',65646,'19911203',3100.00,null,2001),
(63679,'SANDRINE','CLERK',69062,'19901203',900.00,null,2001),
(64989,'ADELYN','SALESMAN',66928,'19910220',1700.00,400.00,3001),
(65271,'WADE','SALESMAN',66928,'19910222',1350.00,600.00,3001),
(66564,'MADDEN','SALESMAN',66928,'19910928',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'19910908',1600.00,0.00,3001),
(68736,'ADNRES','CLERK',67858,'19970523',1200.00,null,2001),
(69000,'JULIUS','CLERK',66928,'19911203',1050.00,null,3001),
(69324,'MARKER','CLERK',67832,'19920123',1400.00,null,1001);
--1. From the above table return complete information about the employees.
select * from employees;
--2. From the table, write a SQL query to find the salaries of all employees. Return salary. 
select salary from employees
--3. From the table, write a SQL query to find the unique designations of the employees. Return job name. 
select distinct job_name from employees;
--4. From the following table, write a SQL query to list the employees’ names, increase their salary by 15%, and express the number of Dollars.
select emp_name, format((salary*1.15),'C') as "salary" from employees;
--5. From the following table, write a SQL query to list the employee's name and job name as a format of "Employee & Job".
select emp_name+'      '+job_name as"Employee & job"from employees;
--6. From the following table, write a SQL query to find those employees with a hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date. 
select emp_id, emp_name, salary,FORMAT(hire_date,'MMMM dd yyyy') as "to_char" from employees;
--7. From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select len(emp_name) as "length" from employees;
--8. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees. 
select emp_id, salary,commission from employees;
--9. From the following table, write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. (Using NOT IN)
select *from employees
where dep_id not in (2001);
--10. From the following table, write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
select *from employees
where YEAR(hire_date) < 1991;
--11. From the following table, write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.
select AVG(salary) as "avg" from employees
where job_name = 'ANALYST';
--12. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.
select * from employees
where emp_name = 'BLAZE';
--13. From the following table, write a SQL query to find those employees whose salary exceeds 3000 after giving a 25% increment. Return complete information about the employees.  
select * from employees
where (salary*1.25)>3000;
--14. From the following table, write a SQL query to find those employees who joined in the month January. Return complete information about the employees.
select *from employees
where MONTH(hire_date) = '01';
--15. From the following table, write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary. 
select emp_id,emp_name,hire_date,salary from employees
where hire_date < '19910401';
--16. From the following table, write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)
insert into salary_grade
values
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,999);
select*from salary_grade;
update salary_grade
set max_salary=9999
where grade=5;
select emp.emp_name, emp.salary  from employees emp, salary_grade sal 
where emp.emp_name='FRANK' and emp.salary between sal.min_salary and sal.max_salary and emp.salary = sal.max_salary;
--17. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries. Return complete information about the employees.  (Using Order By)
select *from employees
where job_name not in ('PRESIDENT','MANAGER')
order by emp_id asc;
--18. From the following table, write a SQL query to find the highest salary. Return the highest salary.
select MAX(salary) as "max" from employees;
--19. From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration. (Using GROUP BY)
select job_name,avg(salary) as "avg" ,avg(salary+ commission) as "avg" from employees group by job_name;
--20. From the following table, write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)
insert into department
values
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');
select * from department;
select emp.emp_id, emp.emp_name,dep.dep_id, dep.dep_location, dep.dep_name  from employees emp, department dep 
where emp.dep_id=dep.dep_id and emp.dep_id in ('1001','2001');
--21. From the table, write a SQL query to list the managers and number of employees work under them. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)
select manager_id, count(*) as "count" from employees group by manager_id order by manager_id asc;
--22. From the table, write a SQL query to find those departments where at least two employees work. Return department id, number of employees.(GROUP BY & HAVING)
select dep_id,count(*) as "count" from employees group by dep_id having count(*)>=2;
--23. From the table, write a SQL query to find those employees whose names contain the character set 'AR' together. Return complete information about the employees. (using ‘like’)
select * from employees
where emp_name like '%AR%';
--24. Add a column for “Gender” in the employee table and update each row accordingly.
alter table employees
add gender varchar(20);
update employees set gender = 'MALE' where emp_id in ('68319','66928','65646','69062','68454','69324'); 
update employees set gender = 'FEMALE' where emp_id NOT IN ('68319','66928','65646','69062','68454','69324');
select * from employees;
--25. From the above table we need to retrieve all employees except ‘Manager’ & ’President’ Job name. 
select * from employees
where job_name not in ('MANAGER','PRESIDENT');
--26. From the above table we need to display ‘Management Level’ - labelname for ‘President’,’Manager’,’Analyst’ jobs and ‘Employee Level’ - label name for ‘Salesman’,’Clerk’ job names.
select distinct(job_name),
	case
		 when  job_name in ('PRESIDENT','MANAGER','ANALYST') then 'Management Level'
		 when  job_name in ('SALESMAN','CLERK') then 'Employee Level'end as 'label' from employees;
--27. Update commission field to 650.00 for job name titled as  “analyst” in “employee” table using “Exist” clauses.
update employees set commission=650.00 from employees where job_name='ANALYST' and exists(select job_name from employees where job_name='ANALYST'); 
select * from employees;