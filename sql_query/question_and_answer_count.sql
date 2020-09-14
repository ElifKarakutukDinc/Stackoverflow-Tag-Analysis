--question and answer count
select count(distinct question_id) as question_count, count(distinct answer_id) as answer_count
from sof_2 s;

