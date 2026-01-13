with

raw1 as (
  select
    (select sum(code) from skillcodes where category = 'Front End') as FE,
    (select sum(code) from skillcodes where name = 'Python') as P,
    (select sum(code) from skillcodes where name = 'C#') as C
)

, raw2 as (
    select 
        case
            when (skill_code & FE > 0) and (skill_code & P > 0) then 'A'
            when skill_code & C > 0 then 'B'
            when skill_code & FE > 0 then 'C'
        end as grade,
        id, email
    from developers, raw1 
)

select *
from raw2
where grade is not null
order by 1, 2