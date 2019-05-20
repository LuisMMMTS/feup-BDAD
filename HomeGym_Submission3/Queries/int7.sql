.mode       columns
.headers    on
.nullvalue  NULL

SELECT userID, sum(nReps) as Repetitions FROM
(
  SELECT userId, (numRepetitions*numSets) AS nReps 
  FROM User
  NATURAL JOIN ParticipationDetails
  NATURAL JOIN Challenge
  NATURAL JOIN ExercisePlan
  NATURAL JOIN ExerciseParameters
  NATURAL JOIN
    (SELECT exerciseId 
     FROM Exercise
     WHERE name = 'Jumps')
)
GROUP BY UserID
ORDER BY Repetitions DESC;
