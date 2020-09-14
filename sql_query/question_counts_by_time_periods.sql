--Question counts by time periods. 
with time_groups_table as( 
select question_id, q_time_new,
extract('hour' from q_time_new) q_time_period,
CASE 
      WHEN extract('hour' from q_time_new) between 0 and 6 THEN 'night'
      WHEN extract('hour' from q_time_new) between 7 and 12 THEN 'morning'
      WHEN extract('hour' from q_time_new) between 13 and 18 THEN 'noon'
      WHEN extract('hour' from q_time_new) between 19 and 24 THEN 'evening'
end time_groups
from sof_2 s)

select time_groups, count(distinct s.question_id) 
from sof_2 s 
inner join time_groups_table tg on (s.question_id= tg.question_id)
group by 1;