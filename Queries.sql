
--- Query 1---Use a sub-select to retrieve all employees records whose salary is lower than the average salary.	

select EMP_ID, F_NAME, L_NAME, SALARY 
from employees 
where SALARY < 
	(select AVG(SALARY) 
	from employees);
	

--- Query 2 ---Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;



--- Query 3 ---Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * 
from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL ;

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------


--- Query 1A --- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * 
from employees 
where JOB_ID IN (select JOB_IDENT from jobs)
;	

--- Query 1B ---Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * 
from employees 
where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer')
;
--- Query 1C ---Retrieve JOB information and list of employees who earn more than $70,000.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 )
;	


--- Query 1D ---Retrieve JOB information and list of employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 )
;

--- Query 1E ---Retrieve JOB information and list of female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' )
;

--- Query 2A ---Performing an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs
;

--- Query 2B ---Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * 
from employees, jobs
where employees.JOB_ID = jobs.JOB_IDENT
;

--- Query 2C ---Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table(using aliases)
select * 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT
;

--- Query 2D ---Retrieve only the Employee ID, Employee Name and Job Title.(from above query)
select EMP_ID,F_NAME,L_NAME, JOB_TITLE 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT
;

--- Query 2E ---specify the fully qualified column names with aliases in the SELECT clause from above query
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT
;