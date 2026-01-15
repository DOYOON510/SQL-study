with recursive gen_table as (
    select id, parent_id, 1 as generation
    from ECOLI_DATA a
    where parent_id is null
    
    union all
    
    select b.id, b.parent_id, generation + 1
    from gen_table a 
        inner join ECOLI_DATA b on a.id = b.parent_id

)

select count(*) as count, generation
from gen_table a 
    left join ECOLI_DATA b on b.parent_id = a.id
where b.id is null
group by generation