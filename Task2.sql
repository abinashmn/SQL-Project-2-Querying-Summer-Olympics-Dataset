with Athlete_Medals as (
  select
    Country,
    Athlete,
    count(*) AS Medals
  from Summer_Medals
  where
    Country in ('JPN', 'KOR')
    and Year >= 2000
  group by Country, Athlete
  having count(*) > 1)

select
  Country,
--Using dense_rank to rank athletes in each country by the number of medals they've won
  athlete,
  dense_rank() over (partition by country
                order by Medals DESC) AS Rank_N
from Athlete_Medals
order by Country ASC, RANK_N ASC;
