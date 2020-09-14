--the top 50 tags by view count
select tags,
count(distinct q_view_count ) as view_count
from sof_2 s2 
group by 1
order by 2 desc
limit 50; 

