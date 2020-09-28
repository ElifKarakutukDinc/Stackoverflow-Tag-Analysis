drop table if exists main_table.sof_2;

SELECT *
into main_table.sof_2
FROM main_table.sof t, unnest(string_to_array(t.tag, ',')) s(tags);

select *,to_timestamp(q_time) as q_time_new ,to_timestamp(a_time) as a_time_new 
into main_table.sof_3
from main_table.sof_2;

alter table main_table.sof_2 rename to sof_2_old;

alter table main_table.sof_3 rename to sof_2;

drop table if exists main_table.sof_2_old;

--- A new row comes to sof table. We should update the sof_2 table with the new row

-- We are inserting the new row to sof
select *
into main_table.staging_sof
from main_table.sof
limit 1;

insert into main_table.sof
select *
from main_table.staging_sof;

-- If we don't want to update sof table but only to insert sof_2 table
--- Append or Insert only option
drop table if exists main_table.sof_2_swap;

SELECT *
into main_table.sof_2_swap
FROM main_table.staging_sof t, unnest(string_to_array(t.tag, ',')) s(tags);

select *,to_timestamp(q_time) as q_time_new ,to_timestamp(a_time) as a_time_new 
into main_table.sof_3_swap
from main_table.sof_2_swap;

alter table main_table.sof_2_swap rename to sof_2_swap_old;

alter table main_table.sof_3_swap rename to sof_2_swap;

drop table if exists main_table.sof_2_swap_old;

insert into main_table.sof_2
select *
from main_table.sof_2_swap;

---- Creating distinct table from inserted table
drop table if exists main_table.sof_2_distinct;

select distinct *
into main_table.sof_2_distinct 
from main_table.sof_2;

alter table main_table.sof_2 rename to sof_2_old;

alter table main_table.sof_2_distinct rename to sof_2;

drop table if exists main_table.sof_2_old;

--- Upsert **** First choice
--- We always need primary key column(s). 
drop table if exists main_table.sof_2_swap;

SELECT *
into main_table.sof_2_swap
FROM main_table.staging_sof t, unnest(string_to_array(t.tag, ',')) s(tags);

select *,to_timestamp(q_time) as q_time_new ,to_timestamp(a_time) as a_time_new 
into main_table.sof_3_swap
from main_table.sof_2_swap;

alter table main_table.sof_2_swap rename to sof_2_swap_old;

alter table main_table.sof_3_swap rename to sof_2_swap;

drop table if exists main_table.sof_2_swap_old;

/*
 Checking which id will be inserted
 
 select *
from main_table.sof_2_swap
 */

delete from main_table.sof_2 b
using  main_table.sof_2_swap c
where b.id = c.id;

/*
 Checking which id will be inserted
 
 select *
from main_table.sof_2
where id = '1'
 */

insert into main_table.sof_2
select *
from main_table.sof_2_swap;

