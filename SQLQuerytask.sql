create database task;
use task;
create table department(dep_id int primary key,dep_name varchar(20),dep_location varchar(15))
create table salary_grade(grade int primary key,min_salary int,max_salary int)
create table employees(emp_id int not null,emp_name varchar(15),job_name varchar(10),manager_id int,hire_date date,salary dec(10,2),commission dec(7,2),dep_id int,primary key(emp_id))
insert into employees values(68319,'KAYLING','PRESIDENT',NULL,'19911118',6000.00,NULL,1001)
select * from employees
insert into employees
values
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
select * from employees
--2. From the table, write a SQL query to find the salaries of all employees. Return salary. 
select salary from employees
--3. From the table, write a SQL query to find the unique designations of the employees. Return job name. 
select distinct job_name from employees;
--4. From the following table, write a SQL query to list the employees’ names, increase their salary by 15%, and express the number of Dollars.
select emp_name, format((salary*1.15),'C') as "salary" from employees;
--5. From the following table, write a SQL query to list the employee's name and job name as a format of "Employee & Job".
select emp_name+'      '+job_name as"Employee & job"from employees;
--6. From the following table, write a SQL query to find those employees with a hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date. 
