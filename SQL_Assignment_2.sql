create database hospital;

use hospital;

/*total rows in tables*/
-- 3567
 select count(Provider_ID) as total_rows from hosp1;
 
/*show hospital data of those which have maximum rating*/
 select * from hosp1 where Hospital_overall_rating=
(select max(Hospital_overall_rating) from hosp1);

-- using regular method
select * from hosp1 where Hospital_overall_rating=5;

select * from hosp1 where City in
(select distinct(City) from hosp1);

-- give data of hospital that are in 'DAYTON' city
select * from hosp1 where city in 
(select distinct(city) from hosp1 where city like 'DAYTON');

select Hospital_Ownership,avg(Hospital_overall_rating) from hosp1
group by Hospital_Ownership;

/*find the hpspitals that have emrgency service and rating grater than 3*/

select Hospital_Name,Emergency_Services,Hospital_overall_rating
from hosp1
where Emergency_Services='yes' and Hospital_overall_rating>3;


/*The total number of hospital who have Mortality_national_comparison id is
'Above the national average'and
 Hospital_Ownership is'Voluntary non-profit - Private'*/
 -- count
 select Mortality_national_comparison,Hospital_Ownership,count(Hospital_Name) 
 as total_hosp from hosp1 
 where Mortality_national_comparison='Above the national average'
 and Hospital_Ownership='Voluntary non-profit - Private';
 
 /*how many number of hospitals provide the Emergency_Services*/
 
 select Emergency_Services,count(*) as t_hosp from hosp1
 where Emergency_Services='yes';
 
  /*how many number of hospitals does not provide the Emergency_Services*/

 select Emergency_Services,count(*) from hosp1
 where Emergency_Services='no';
 
 /*find the lowest,average,highest rating of hospitals*/
 
 select min(Hospital_overall_rating) as Lowest_rating,
 avg(Hospital_overall_rating) as Average_rating,
max(Hospital_overall_rating) as Highest_rating from hosp1;

/*find the lower,average and higher rating for hospital by City Hospital*/

select City,min(Hospital_overall_rating) as Lowest_rating,
avg(Hospital_overall_rating) as Average_rating,
max(Hospital_overall_rating) as Highest_rating from hosp1
group by City;

/*find the lower,average and higher rating for hospital and
 Hospital Ownership is'Voluntary non-profit - Private' also 
Emergency_Services should be avilable'*/

select Hospital_Name,Hospital_Ownership,Emergency_Services,
min(Hospital_overall_rating) as Lowest_rating,
avg(Hospital_overall_rating) as Average_rating,
max(Hospital_overall_rating) as Highest_rating from hosp1
where Hospital_Ownership='Voluntary non-profit - Private' and 
Emergency_Services='yes'
group by Hospital_Name;


/*write an sql query to print first 3 characters of Hospital_Name*/

select substring(Hospital_Name,1,3) from hosp1;

/*sql query to replace Hospital_Name 'A' with 'a'*/

select replace(Hospital_Name,'A','a') from hosp1;

/*sql query to find the details of hospital having
 hosptal names start with 'a'*/

select * from hosp1 where (Hospital_Name like 'a%');

/*write an sql query to find hospitals data whose rating between 
3 to 4*/
select * from hosp1 where Hospital_overall_rating between 3 and 4;

/*write an sql query to find the Provider_ID,Hospital_Name and the average rating
having average rating grater than 3 sort data in desending order*/

 select Provider_ID,Hospital_Name,avg(Hospital_overall_rating) as avg_rating
 from hosp1
group by Provider_ID,Hospital_Name having avg_rating> 3
order by Provider_ID desc;

/*write sql query to find the lower,avrage,higher hospital rating using case study  */
select Hospital_Name,
case
    when Hospital_overall_rating=1 then 'low '
    when Hospital_overall_rating>=2 and Hospital_overall_rating<=3 then 'average'
    when Hospital_overall_rating>=4 then 'high'
    else
      'no data'
      end as rating_category
      from hosp1;
    
    

    
