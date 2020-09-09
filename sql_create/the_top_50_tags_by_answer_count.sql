--the top 50 tags by answer count
select tags,
count(distinct answer_id ) as answer_count
from sof_2 s2 
group by 1
order by 2 desc
limit 50;

 
