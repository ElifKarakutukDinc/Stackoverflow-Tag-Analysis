--Answer counts by time periods. 
select CASE 
      WHEN extract('hour' from a_time_new) between 0 and 6 THEN 'night'
      WHEN extract('hour' from a_time_new) between 7 and 12 THEN 'morning'
      WHEN extract('hour' from a_time_new) between 13 and 18 THEN 'noon'
      WHEN extract('hour' from a_time_new) between 19 and 23 THEN 'evening'
end time_groups , count(distinct answer_id)
from sof_2
group by 1;