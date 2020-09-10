--users of max scored answers
select a_user_id,tags, count(a_score ) as answer_score
from sof_2 s 
group by 1,2
order by 3 desc,1 asc;