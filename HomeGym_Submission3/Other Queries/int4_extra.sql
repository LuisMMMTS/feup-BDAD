.mode       columns
.headers    on
.nullvalue  NULL

-- Get all the exercises with difficulty in the range [2,4], ordered by difficulty in an ascending way
SELECT ExerciseID, difficulty FROM Exercise
WHERE difficulty >= 2 AND difficulty <= 4
ORDER BY difficulty ASC
