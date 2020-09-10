--users of max scored questions
select q_user_id,tags, count(q_score) as question_score
from sof_2 s 
group by 1,2
order by 3 desc,1 asc;