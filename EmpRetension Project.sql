create database HR;
use HR;
select * from hr_1;
select * from hr_2;

-- Department wise Average Attrition Rate
select Department,
concat(round(sum(case Attrition when 'Yes' then 1 else 0 end) / count(*)* 100,0),'%') 
as 'Attrition Rate'
from hr_1
group by Department
order by Department;

-- Average Hourly rate of Male Research Scientist

select Gender,JobRole,concat(Round(avg(HourlyRate),0),'K') AS 'Hourly Rate'
from hr_1
where Gender = 'Male' 
and JobRole = 'Research Scientist';

-- Average working years for each Department

select hr_1.Department,
avg(hr_2.YearsAtCompany) as 'Working Years'
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
group by hr_1.Department;

-- Attrition rate Vs Monthly income stats
select hr_1.Department,
round(avg(MonthlyIncome)) as 'Avg_Monthly Income',
concat(round(sum(case Attrition when 'Yes' then 1 else 0 end) / count(*)* 100,0),'%') as 'Attrition Rate'
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
group by hr_1.Department;

-- Job Role Vs Work life balance

select distinct EmployeeID,JobRole,
case 
	when WorkLifeBalance=1 then 'Excellent'
	when WorkLifeBalance=2 then 'Good'
	when WorkLifeBalance=3 then 'Average'
	when WorkLifeBalance=4 then 'Poor'
	else 'null'
end as 'work life balance'
from hr_1
inner join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
order by EmployeeID;

-- Attrition rate Vs Year since last promotion relation

select distinct hr_2.YearsSinceLastPromotion,
concat(round(sum(case Attrition when 'Yes' then 1 else 0 end) / count(*)* 100,0),'%') as 'Attrition Rate'
from hr_1
inner join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
group by YearsSinceLastPromotion
order by YearsSinceLastPromotion;

