drop table if exists main_table.sof;
create table main_table.sof( 
id VARCHAR(30000),
question_id	INTEGER,
q_user_id INTEGER,
q_score	INTEGER,
q_time INTEGER,
tag	VARCHAR(30000),
q_view_count INTEGER, 
q_answer_count INTEGER,
answer_id INTEGER,
a_user_id INTEGER,
a_score	INTEGER,
a_time INTEGER); 

