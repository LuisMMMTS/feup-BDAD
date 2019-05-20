.mode       columns
.headers    on
.nullvalue  NULL

select * 
from ExercisePlan
where exercisePlanID = 5;

INSERT INTO ExerciseParameters VALUES(5, 32, 15, 7);

select * 
from ExercisePlan
where exercisePlanID = 5;
