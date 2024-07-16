with Athlete_Medals AS (
  select
    Athlete,
    count(*) AS Medals
  from Summer_Medals
  where
    Country = 'USA' AND Medal = 'Gold' AND Year >= 2000
  group by Athlete)

select
  athlete,
  medals,
--Since aggregate function run only from top to bottom within a window function, summation happens only after each row is passed by.
  sum(medals) over (order by athlete ASC) AS Max_Medals
from Athlete_Medals
order by Athlete ASC;
