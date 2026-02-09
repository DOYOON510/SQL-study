with

raw1 as (
    select car_id, a.car_type,1-discount_rate/100,
        round(daily_fee*30*((1-discount_rate/100))) as fee
    from CAR_RENTAL_COMPANY_CAR a 
        left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN b on a.car_type=b.car_type
    where a.car_type in ('세단', 'SUV') 
        and duration_type = '30일 이상'
), 

raw2 as (
    select distinct car_id
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY
    where start_date < '2022-12-01' and end_date > '2022-11-01'
)

select car_id, car_type, fee
from raw1
where car_id not in (select * from raw2)
    and fee >= 500000
    and fee < 2000000
order by 3 desc, 2 asc , 1 desc