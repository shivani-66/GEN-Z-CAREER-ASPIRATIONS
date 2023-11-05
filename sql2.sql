select * from learning_aspirations;
select * from manager_aspirations;
select * from mission_aspirations;
select * from personalized_info;

/*1.query*/
select PreferredWorkingEnvironment,count(PreferredWorkingEnvironment) as total , count(PreferredWorkingEnvironment)*100.0/(select count(*) from learning_aspirations) as total_percentage 
from  learning_aspirations 
where PreferredWorkingEnvironment = 'Every Day Office Environment'
Group by PreferredWorkingEnvironment;

/*queery 2*/
select CareerInfluenceFactor,count(CareerInfluenceFactor) as total , count(CareerInfluenceFactor)*100.0/(select count(*) from learning_aspirations) as total_percentage 
from  learning_aspirations 
where CareerInfluenceFactor = 'My Parents'
Group by CareerInfluenceFactor;

/*query3*/
select l.HigherEducationAbroad,count(l.HigherEducationAbroad) as total , count(l.HigherEducationAbroad)*100.0/(select count(*) from learning_aspirations) as total_percentage , p.Gender
from  learning_aspirations l
join personalized_info p
on l.ResponseID = p.ResponseID
where l.HigherEducationAbroad = 'Yes, I wil'
Group by l.HigherEducationAbroad,p.Gender;

/*query*/
select m.MisalignedMissionLikelihood,count(m.MisalignedMissionLikelihood) as total , count(m.MisalignedMissionLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage , p.Gender
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
Group by m.MisalignedMissionLikelihood,p.Gender;

/*query5  ans:Fully remote with options to travel as and when needed*/
select l.PreferredWorkingEnvironment,count(l.PreferredWorkingEnvironment) as total , count(l.PreferredWorkingEnvironment)*100.0/(select count(*) from learning_aspirations) as total_percentage ,p.Gender
from  learning_aspirations l
join personalized_info p
on l.ResponseID = p.ResponseID
Group by l.PreferredWorkingEnvironment,p.Gender;

/*query6*/
select count(l.ClosestAspirationalCareer)
from  learning_aspirations l
join personalized_info p
join mission_aspirations m
on l.ResponseID = p.ResponseID = m.ResponseID
where  m.NoSocialImpactLikelihood > 4
Group by l.closestAspirationalCareer,p.Gender;

/*query7*/
select count(p.ResponseID) AS total,p.Gender 
from personalized_info p
join learning_aspirations l 
on p.ResponseID = l.ResponseID
where l.HigherEducationAbroad ='Yes,I wil' and  l.CareerInfluenceFactor ='My Parents' 
group by p.Gender;

/*query8*/
select m.NoSocialImpactLikelihood,count(NoSocialImpactLikelihood) as total , count(NoSocialImpactLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage,p.Gender
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
where m.NoSocialImpactLikelihood < 8
Group by m.NoSocialImpactLikelihood,p.Gender;


/*query9*/
select m.PreferredWorkSetup,count(m.PreferredWorkSetup) as total , count(m.PreferredWorkSetup)*100.0/(select count(*) from manager_aspirations) as total_percentage , p.Gender
from  manager_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
where m.PreferredWorkSetup ='Work with 5 to 6 in my team'
group by p.Gender;

/*query10*/
select m.WorkLikelihood3Years ,p.Gender from manager_aspirations m 
join personalized_info p
on m.ResponseID =p.ResponseID
group by m.WorkLikelihood3Years,p.Gender;


/*query11*/
select m.WorkLikelihood3Years ,p.CurrentCountry from manager_aspirations m 
join personalized_info p
on m.ResponseID =p.ResponseID
group by m.WorkLikelihood3Years,p.CurrentCountry;

/*query12*/
select avg(m.ExpectedSalary3Years),p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender;

/*query13*/
select avg(m.ExpectedSalary5Years),p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender;

/*query14*/
select avg(m.ExpectedSalary3Years) as average,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
order by average desc;

/*query15*/
select avg(m.ExpectedSalary5Years) as average,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
order by average desc;

/*query16*/
select avg(m.ExpectedSalary3Years),p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry;

/*query17*/
select avg(m.ExpectedSalary5Years),p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry;

/*query18*/
select avg(m.ExpectedSalary3Years) as average,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry
order by average desc;

/*query19*/
select avg(m.ExpectedSalary5Years) as average,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry
order by average desc;

/*query20*/
select m.MisalignedMissionLikelihood,count(m.MisalignedMissionLikelihood) as total , count(m.MisalignedMissionLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage , p.Gender , p.CurrentCountry
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
where m.MisalignedMissionLikelihood = 'Will work for them' 
Group by m.MisalignedMissionLikelihood,p.Gender,p.CurrentCountry;