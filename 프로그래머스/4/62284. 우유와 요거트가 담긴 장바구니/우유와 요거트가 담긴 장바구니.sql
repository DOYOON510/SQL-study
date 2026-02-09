select cart_id
from (
    select cart_id,
        case when count(distinct name) = 2 then 1 else 0 end as product
    from CART_PRODUCTS
    where name in ('Milk', 'Yogurt')
    group by 1) as b
where product = 1
order by 1