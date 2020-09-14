--View counts by time groups for question 
select
CASE 
      WHEN extract('hour' from q_time_new) between 0 and 6 THEN 'night'
      WHEN extract('hour' from q_time_new) between 7 and 12 THEN 'morning'
      WHEN extract('hour' from q_time_new) between 13 and 18 THEN 'noon'
      WHEN extract('hour' from q_time_new) between 19 and 23 THEN 'evening'
end time_groups_answer , Sum( distinct q_view_count) question_view_count
from sof_2
group by 1;

