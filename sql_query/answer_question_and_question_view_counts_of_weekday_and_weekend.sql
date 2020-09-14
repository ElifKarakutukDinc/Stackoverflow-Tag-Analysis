--answer, question and question view counts of weekday and weekend. 
select case 
       when extract(isodow from q_time_new) in (1,2,3,4,5) then 'Weekday'
       when extract(isodow from q_time_new) in (6,7) then 'Weekend'
END weekday_groups, 
count(distinct answer_id) answer_count, 
count(distinct question_id) question_count,
Sum( distinct q_view_count) question_view_count
from sof_2 s 
group by 1; 