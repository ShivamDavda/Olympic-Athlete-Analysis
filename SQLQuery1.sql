select Top 10*
from Olympic..OlympicDb;

select COUNT(*)
from Olympic..OlympicDb



select COUNT(distinct Name)
from Olympic..OlympicDb

select min(year) , max(year)
from Olympic..OlympicDb

select Count(Medal)
from Olympic..OlympicDb
where Medal is not null

select Count(distinct Sport)
from Olympic..OlympicDb

select Top 10 Sport ,count (Medal)
from Olympic..OlympicDb
where Medal is not null
group by Sport
order by 2 desc 

select Top 10 Noc , count(medal)
from Olympic..OlympicDb
where medal is not null
group by noc 
order by 2 desc

select Name , avg(age) as avgage, case when medal ='Na' then 'Not winner' else Medal end as result
from Olympic..OlympicDb
where Medal  is not null    
group by name, Medal

SELECT AVG(Age) AS Avg_Age
FROM Olympic..OlympicDb
WHERE Medal IS NOT NULL;

select  case when sex = 'M' then COUNT(Sex) end as Males
, case when sex = 'F' then COUNT(Sex) end as Females 
from Olympic..OlympicDb
group by sex

select COUNT(case when sex = 'm' then  1 end),
COUNT(case when sex = 'f' then 1 end)
from Olympic..OlympicDb

select Top 5 city ,count(case when Season = 'summer' then 1 else 0 end) as SummerSeason
from Olympic..OlympicDb
group by City
order by 2 desc

select *
from Olympic..OlympicDb

select name ,COUNT(case when medal= 'NA' then 0 else 1 end) 
from Olympic..OlympicDb
--where medal is not null
group by name
order by 2 desc

--Calculate the average height and weight of medal-winning athletes grouped by Sport.

select Sport,Medal,Round(avg(Height),0),Round(avg(Weight),0)
from Olympic..OlympicDb
where medal is not null
group by Sport, Medal
order by 2 desc

select Top 5 Event,Count(case when Medal= 'NA' then 0 else 1 end) 
from Olympic..OlympicDb
where medal is not null
group by Event
order by 2 desc

--Find the number of medals won by each country (NOC) for each medal type (Gold, Silver, Bronze).

SELECT NOC, Medal, COUNT(*) AS MedalCount
FROM Olympic..OlympicDb
WHERE Medal IS NOT NULL
GROUP BY NOC, Medal
ORDER BY 1,2

--Show the top 10 athletes who have won the most Gold medals.

select Top 10 Name , count(case when medal ='gold' then 1 end) as MedalCount
from Olympic..OlympicDb
where medal is not null
group by name
order by 2 desc

--Show the total number of medals won by each gender

select sex, Count(Medal) as MedalCount
from Olympic..OlympicDb
where medal is not null
group by sex
order by 2 desc


-- Find the athlete(s) who have participated in the most number of Olympic games (count distinct Years).

select *
from Olympic..OlympicDb

select top 5 Name , Count(distinct Sport)
from Olympic..OlympicDb
group by name
order by 2 desc

select name, count(distinct year)
from Olympic..OlympicDb
group by name
order by 2 desc

-- Find the average age of medal winners by each Olympic year

select year, round(avg(age),0)
from Olympic..OlympicDb
where medal is not null
group by year
order by 1

--Find the top 5 countries (NOC) with the highest total medal count overall.

select Top 5 noc , count(Medal)
from Olympic..OlympicDb
where medal is not null
group by noc
order by 2 desc

--Find the number of athletes who won at least one medal by each sport.

select *
from Olympic..OlympicDb

select sport,Count( distinct name)
from Olympic..OlympicDb
where medal is not null
group by Sport
order by 2 desc
 
 -- For each medal type, calculate the average height and average weight of athletes.

 select distinct Medal,round(avg(Height),0) avgheight,round(avg(Weight),0) avgweight
 from Olympic..OlympicDb
 where medal is not null
 group by Medal
 
 -- Find the top 5 athletes who have won the most number of Gold medals.

 Select Top 5 name,Sum(case when Medal = 'Gold' then 1 end) as Medals 
 from Olympic..OlympicDb
 where medal is not null
 group by name
 order by 2 desc

 --Show the number of medals won by each country (NOC) in each Olympic year.

 select noc,year,sum(case when medal = 'NA' then 0 else 1 end) as Medal
 from Olympic..OlympicDb
 where medal is not null
 group by noc,Year
 order by 3 desc

 SELECT 
  Year, 
  NOC, 
  COUNT(*) AS Total_Medals
FROM Olympic..OlympicDb
WHERE Medal IS NOT NULL
GROUP BY Year, NOC
ORDER BY Year, Total_Medals DESC;

--Find all athletes who have won medals in more than one sport.

select name ,Count (distinct Sport) as Sports_Count
from Olympic..OlympicDb
where medal is not null
group by name
having Count (distinct Sport) > 1
order by 2 desc
