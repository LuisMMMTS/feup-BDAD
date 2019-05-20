.mode       columns
.headers    on
.nullvalue  NULL

-- Get all the default exercises of a certain type
SELECT name
FROM DefaultExercise NATURAL JOIN Exercise
WHERE exerciseTypeID = (
  SELECT exerciseTypeID FROM ExerciseType WHERE name = 'Strength' -- MODIFY HERE THE TYPE YOU WANT TO KNOW THE EXERCISES OF
);
