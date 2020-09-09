--Converting unix epoch time to timestamps. 
select *,to_timestamp(q_time) as q_time_new ,to_timestamp(a_time) as a_time_new 
into sof_3
from sof_2;

drop table sof_2;
alter table sof_3 rename to sof_2;

/*to check new column and count of table
select * 
from sof_2
limit 100;

select count(*) 
from sof_2;
*/


