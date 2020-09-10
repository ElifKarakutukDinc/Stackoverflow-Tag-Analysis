/*Which tags give fast-slow answers? 
avg answer time is 1,5 day, max answer time is 107 days. 
We used NTILE operator to find groups. Groups show answer times like below;
ntile = 1 is fast answer group
ntile = 5 is slow answer group
ntile = 2,3,4 are avg speed answer groups
!!First 4 groups' values same each other: zero. Only fifth group has different values. it shows tags in first four groups are answered quicly. 
*/

with answer_time_groups as(
SELECT answer_id, 
NTILE(5) OVER (ORDER BY (date_part('day',a_time_new ::timestamp- q_time_new ::timestamp)) asc) as answer_time_groups
from sof_2 s
where (date_part('day',a_time_new ::timestamp- q_time_new ::timestamp))>=0)

select avg(date_part('day',a_time_new ::timestamp- q_time_new ::timestamp)) as avg_asnwer_time ,
min(date_part('day',a_time_new ::timestamp- q_time_new ::timestamp)) as min_asnwer_time,
max(date_part('day',a_time_new ::timestamp- q_time_new ::timestamp)) as max_asnwer_time,
stddev(date_part('day',a_time_new ::timestamp- q_time_new ::timestamp)) as std_asnwer_time
from sof_2 s2 
inner join answer_time_groups atg on (s2.answer_id=atg.answer_id) 
where atg.answer_time_groups= 5; 

