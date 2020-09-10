--top 10 tags by accepted answers
with accepted as (
select distinct tags, question_id, q_answer_count
from sof_2 s)

select tags, sum(distinct q_answer_count)
from accepted
group by 1
order by 2 desc
limit 10;