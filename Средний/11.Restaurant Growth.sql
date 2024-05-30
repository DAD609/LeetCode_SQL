select visited_on, amount, round(1. * amount / c, 2) average_amount
from (
    select
        visited_on,
        sum(amount) over (order by visited_on range between '6 day' preceding and current row) amount,
        count(1) over (order by visited_on range between '6 day' preceding and current row) c
    from (select visited_on, sum(amount) amount from customer group by visited_on)
) c
where c = 7
order by visited_on
