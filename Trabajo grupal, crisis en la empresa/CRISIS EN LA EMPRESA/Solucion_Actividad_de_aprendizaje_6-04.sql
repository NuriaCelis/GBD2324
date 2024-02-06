-- 1
select * from employees 
inner join departments on employees.department_id=departments.department_id 
inner join locations on departments.location_id=locations.location_id 
where city='Seattle' and salary=(select salary from employees 
								inner join departments on employees.department_id=departments.department_id 
                                inner join locations on departments.location_id=locations.location_id 
                                where city='Seattle' order by salary desc limit 1);
-- 2
select avg(salary),city from employees 
inner join departments on employees.department_id=departments.department_id 
inner join locations on departments.location_id=locations.location_id 
group by city order by avg(salary) desc limit 1;
-- 3
insert into employees (employee_id,last_name,email,hire_date,job_id,salary) 
values (207,'Sainz','sainz@corporation.com','2020-01-01',5,25000),
(208,'Robertson','robertson@corporation.com','2020-01-02',3,2500);

-- 4
insert into departments values (120,'Treasury',1700) on duplicate key update location_id=1700; 
-- 5
update employees set phone_number='515.124.4370', hire_date=subdate(hire_date, INTERVAL 2 day) where employee_id=111;

-- 6
update employees set salary=if(salary>5000,round(salary*0.9),round(salary*0.95)) where first_name='alexander';

-- 7
delete from employees where dayofweek(hire_date)=2;

-- 8
select locations.city, count(*) from employees 
inner join departments using (department_id)
 inner join locations using(location_id) group by city having count(*)>5;

-- 9
Create view Peticion9 as select locations.city,employees.* from employees 
inner join departments using (department_id)
inner join locations using(location_id) where city ='Seattle';




