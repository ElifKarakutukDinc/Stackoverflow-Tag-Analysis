--the top 50 tags by question count
select tags,
count(distinct question_id ) as question_count,
from sof_2 s2 
group by 1
order by 2 desc
limit 50;

