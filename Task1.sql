with Discus_Medalists as (
  select distinct
    Year,
    Athlete
  from Summer_Medals
  where Medal = 'Gold'
    and Event = 'Discus Throw'
    and Gender = 'Women')

select
--For each year we fetch the current and future medalists
  year,
  Athlete,
  lead(Athlete,3) over (order by year asc) as Future_Champion
from Discus_Medalists
order by Year asc;
