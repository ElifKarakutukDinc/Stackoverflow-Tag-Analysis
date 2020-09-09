--Created new table for separating tag column. 
create table sof_2 as(
SELECT *
FROM   sof t, unnest(string_to_array(t.tag, ',')) s(tags));