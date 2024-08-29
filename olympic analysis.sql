
use weekdays3;
select * from athlete;
-- Q1. Show how many medal counts present for entire data.
select count(medal) from athlete;

-- Q2. Show count of unique Sports are present in olympics.
select count(distinct sport) from athlete ;

-- Q3. Show how many different medals won by Team India in data.
select count(distinct medal)from athlete where team = 'india';

/* Q4. Show event wise medals won by india show from highest to lowest medals won
 in order.*/
 select event, sum(medal='gold')as GoldMedal,sum(medal='silver')as SilverMedal,sum(medal='bronze')as BronzeMedal, team from athlete  where team='india' group by event order by count('medals count') desc;

 -- Q5. Show event and yearwise medals won by india in order of year.
 select event ,year,sum(medal='gold')as GoldMedal,sum(medal='silver')as SilverMedal,sum(medal='bronze')as BronzeMedal from athlete where team = 'india'  group by year,event order by year; 
 
-- Q6. Show the country with maximum medals won gold, silver, bronze.
select medal, max(team)  from athlete group by medal;
select noc,sum(medal='gold')+sum(medal='silver')+sum(medal='bronze') as totalmedal from athlete group by noc order by totalmedal desc limit 1;

-- Q7. Show the top 10 countries with respect to gold medals.
select count(medal),team from athlete  where medal='gold' group by team  order by count(medal) desc limit 10 ;

-- Q8. Show in which year did United States won most medals.
select count(medal) as maxmedal,noc,year from athlete  where noc='usa'group by year having count(medal) order by count(medal) desc limit 1 ;

select * from athlete;
-- Q9. In which sports United States has most medals.
select count(medal)as 'max medal',sport,noc from athlete where noc='usa' group by sport having count(medal)  order by count(medal) desc limit 1;

-- Q10. Find top 3 players who have won most medals along with their sports and country.
select count(medal)as 'max medal',  Name,sport,noc from athlete  where medal='gold' or medal='silver' or medal='bronze'group by name ,noc,sport order by count(medal)desc limit 3; 

-- Q11. Find player with most gold medals in cycling along with his country.
select name,noc,max(medal='gold')as maxmedal from athlete where sport='cycling' Group by name,noc order by maxmedal desc limit 1;

-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
select name,noc,sum(medal='gold'+'silver'+'bronze')as totalmedal from athlete where sport='basketball' Group by name,noc order by totalmedal desc limit 1;

-- Q13. Find out the count of different medals of the top basketball player.
SELECT NAME, SUM(CASE WHEN medal='gold' THEN 1 ELSE 0 END)as GoldCount,SUM(CASE WHEN medal='SILVER' THEN 1 ELSE 0 END)as SilverCount,SUM(CASE WHEN medal='BRONZE' THEN 1 ELSE 0 END)as BronzeCount FROM ATHLETE WHERE SPORT='BASKETBALL' GROUP BY NAME ORDER BY GoldCount DESC,SilverCount DESC,BronzeCount DESC LIMIT 1;
