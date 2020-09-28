/*
Drop - Create

Pros: 
- Table is recreated at run time. So we don't have to deal with index update or upsert cases
- Less effected by data changes or query changes

Cons:
- No historical data or information
- Permissions should be granted
*/

drop table if exists main_table.answer_counts_by_time_period;

--Answer counts by time periods. 
select CASE 
      WHEN extract('hour' from a_time_new) between 0 and 6 THEN 'night'
      WHEN extract('hour' from a_time_new) between 7 and 12 THEN 'morning'
      WHEN extract('hour' from a_time_new) between 13 and 18 THEN 'noon'
      WHEN extract('hour' from a_time_new) between 19 and 23 THEN 'evening'
end time_groups , count(distinct answer_id) as answer_count
into main_table.answer_counts_by_time_period
from sof_2
group by 1;

drop table if exists main_table.aqq_counts_weekday;

--answer, question and question view counts of weekday and weekend. 
select case 
       when extract(isodow from q_time_new) in (1,2,3,4,5) then 'Weekday'
       when extract(isodow from q_time_new) in (6,7) then 'Weekend'
END weekday_groups, 
count(distinct answer_id) answer_count, 
count(distinct question_id) question_count,
Sum( distinct q_view_count) question_view_count
into main_table.aqq_counts_weekday
from sof_2 s 
group by 1; 

drop table if exists main_table.top_50_tags_question_cnt;

--the top 50 tags by question count
select tags,
count(distinct question_id ) as question_count
into main_table.top_50_tags_question_cnt
from sof_2 s2 
group by 1
order by 2 desc
limit 50;

drop table if exists main_table.top_50_tags_answer_cnt;

--the top 50 tags by answer count
select tags,
count(distinct answer_id ) as answer_count
into main_table.top_50_tags_answer_cnt
from sof_2 s2 
group by 1
order by 2 desc
limit 50;