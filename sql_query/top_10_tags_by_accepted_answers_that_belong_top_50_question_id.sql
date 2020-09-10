--top 10 tags by accepted answers that belong top 50 question_id
with accepted as (
select distinct question_id, q_answer_count as accepted_answer
from sof_2 s 
order by 2 desc
limit 50),

q_tag as(
select distinct a.question_id, s2.tags, accepted_answer
from accepted a
inner join sof_2 s2 on (s2.question_id = a.question_id)) 

select tags, sum(distinct accepted_answer)
from q_tag
group by 1
order by 2 desc
limit 10;



