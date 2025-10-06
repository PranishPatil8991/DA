create database employee;
use employee;

-- count how many rows are in emp_table..??
select count(*) from emp;

-- how many entitys are avilable in *BusinessTravel* column..??
select distinct(BusinessTravel) from emp;

-- how many Department are avilable in emp table..??

select distinct(Department) as dep_name from emp;

/*find coulums whose Department is 'Sales' and age 
is garter than 30*/
select * from emp
where Department='sales' and age>=30
order by age asc;
 
/*give employees data that work in 'Research & Development'
 department*/
 select * from emp
where Department='Research & Development';

/*how many eployees work in 'Research & Development' department*/

select Department,count(EmployeeNumber) as emp_count from emp
where Department='Research & Development';

/*how many unmarried employess work in company*/
select count(MaritalStatus)as unmarried_emp from emp
where MaritalStatus='Single';

/*give all married enployees data whose salary grater than eqal
 ten thousand */
select * from emp 
where MaritalStatus='Married' and MonthlyIncome>=10000;

/*give salary of employees works for company over last 20 years and 
PerformanceRating grater than 3*/

select MonthlyIncome from emp
where YearsAtCompany>=20 and PerformanceRating>3;

/*give employees data except EducationField is 'Life Sciences',
'Marketing','Human Resources'*/
select * from emp
where EducationField not in ('Life Sciences','Marketing',
'Human Resources');

/*how many employees having  Education rating is 5*/
select Education,count(*) as num_of_employees from emp
where Education=5;


/*find avrage salary of employees*/
select avg(MonthlyIncome) as avg_salary from emp;

/*find lowest and highest monthly salary of employee*/
select max(MonthlyIncome) as max_salary,min(MonthlyIncome) as 
min_salary from emp;

/*find each department lowest and highest monthly salary of employees*/
select Department,min(MonthlyIncome) as min_salary,max(MonthlyIncome) as 
max_salary from emp
group by Department;


/*find 2nd largest duration in year of employee working for company*/
select TotalWorkingYears from emp
order by TotalWorkingYears desc limit 2,1;

/*find top 5 max rating of employees for company*/
select RelationshipSatisfaction from emp
order by RelationshipSatisfaction desc limit 5;

/*sort employees by BusinessTravel alphabtically and then on basis of DailyRate in 
decending order*/
select * from emp
order by BusinessTravel asc,DailyRate desc;

/*employess with grater than 50 HourlyRate,jobinvolvement is above 3*/
select * from emp
where HourlyRate>=50 and jobinvolvement>3;

/*group employees by Department and find the highest YearsAtCompany 
working and having age grater than 50 of married employee */

select Department,max(YearsAtCompany) from emp
where age>=50 and MaritalStatus='Married'
group by Department;

/*how many employees are over 25*/
select count(*) as number_of_emp from emp
where age>=25;

/*each department wise how many employees are over 25*/
select department,count(*) num_of_emp from emp
where age>=25
group by department;

/*how many male or female employees that age grater than 30 works
in company*/
select gender,count(*) as num_of_emp from emp
where age>=30
group by gender;

/*get employees highest EnvironmentSatisfaction level,lowest JobInvolvement 
average PerformanceRating, average RelationshipSatisfaction */
select max(environmentSatisfaction),min(JobInvolvement),avg(PerformanceRating),
avg(RelationshipSatisfaction) from emp;

/*get un-married employees highest EnvironmentSatisfaction level,lowest JobInvolvement 
average PerformanceRating, average RelationshipSatisfaction and working year with 
current manager is grater than 15 years*/
select MaritalStatus,max(environmentSatisfaction),min(JobInvolvement),avg(PerformanceRating),
avg(RelationshipSatisfaction) from emp
where MaritalStatus='Single' and YearsWithCurrManager>=15
group by MaritalStatus;

/*average salary of employees group employees department wise*/
select Department,avg(MonthlyIncome) from emp
group by department;

/*average salary of employees group employees department wise and have salary
grater than 5000*/
select department,avg(MonthlyIncome) as avg_salary from emp
group by department
having avg(MonthlyIncome)>5000;



