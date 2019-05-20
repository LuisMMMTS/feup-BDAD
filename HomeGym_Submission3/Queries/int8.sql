.mode       columns
.headers    on
.nullvalue  NULL

SELECT DISTINCT exercisePlanID
FROM ExerciseParameters NATURAL JOIN Exercise
WHERE name LIKE '%Jump%';
