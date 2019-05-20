.mode       columns
.headers    on
.nullvalue  NULL

SELECT exerciseID, Exercise.name, count(*)*numRepetitions*numSets as ExercisePopularity, nickname as Creator
FROM Execution
NATURAL JOIN Challenge
NATURAL JOIN ExercisePlan
NATURAL JOIN ExerciseParameters
JOIN Exercise USING(ExerciseID)
NATURAL JOIN CustomExercise
NATURAL JOIN User
GROUP BY exerciseID
ORDER BY ExercisePopularity DESC;
