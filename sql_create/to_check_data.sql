--To find distance
select count(distinct id), count(id)
from sof;

--To change values for contradiction at sof table. First query is for distinct values in the new table. Second query is to drop an old table.  And then the third query is for changing tables. The final query is for dropping the second table. 
select distinct *
into sof_2
from sof;

truncate table sof;

insert into sof
select * 
from sof_2;

drop table sof_2;

--To check null columns
select count(*)
from sof 
where  id is null or question_id is null or q_user_id is null or q_score is null or q_time is null or tag is null or q_view_count is null or
q_answer_count is null or answer_id is null or a_user_id is null or a_score is null or a_time is null; 
--Count of "q_user_id is null" is 276, count of "a_user_id is null" is 140










