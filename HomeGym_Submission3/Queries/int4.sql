.mode       columns
.headers    on
.nullvalue  NULL

CREATE VIEW [getExerciseTypeFrequency]
AS SELECT exerciseTypeID, count(*) as ExerciseTypeFrequency
  FROM Execution
  NATURAL JOIN Challenge
  NATURAL JOIN ExerciseParameters
  JOIN Exercise USING(ExerciseID)
  WHERE userID = 1000000000000009
  GROUP BY exerciseTypeID;

--QUERY ITSELF
SELECT * FROM
    (SELECT name as ExerciseName, ExerciseTypeID, count(*)*numRepetitions*numSets as ExerciseFrequency
    FROM Execution
    NATURAL JOIN Challenge
    NATURAL JOIN ExercisePlan
    NATURAL JOIN ExerciseParameters
    JOIN Exercise USING(ExerciseID)
    WHERE userID = 1000000000000009
    GROUP BY exerciseID)
NATURAL JOIN [getExerciseTypeFrequency]

UNION

SELECT name as ExerciseName, exerciseTypeID, 0, ExerciseTypeFrequency FROM
    Exercise NATURAL JOIN [getExerciseTypeFrequency]
    WHERE exerciseID NOT IN 
       (SELECT exerciseID
        FROM Execution
        NATURAL JOIN Challenge
        NATURAL JOIN ExercisePlan
        NATURAL JOIN ExerciseParameters
        JOIN Exercise USING(ExerciseID)
        WHERE userID = 1000000000000009
        GROUP BY exerciseID)

ORDER BY ExerciseFrequency DESC, ExerciseTypeFrequency DESC;

DROP VIEW IF EXISTS [getExerciseTypeFrequency];
