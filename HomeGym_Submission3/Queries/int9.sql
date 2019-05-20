.mode       columns
.headers    on
.nullvalue  NULL

SELECT exercisePlanID, (nCustoms*100)/nExercises as CustomizationPercentage
FROM

  (SELECT exercisePlanID, count(*) as nCustoms
  FROM
      (SELECT exercisePlanID
        FROM CustomPlan WHERE creator = '1000000000000003')
      NATURAL JOIN ExerciseParameters
      NATURAL JOIN CustomExercise
      GROUP BY exercisePlanID)

  JOIN

  (SELECT exercisePlanID, count(*) as nExercises
  FROM
      (SELECT exercisePlanID
        FROM CustomPlan WHERE creator = '1000000000000003')
      NATURAL JOIN ExerciseParameters
      GROUP BY exercisePlanID)

  USING(exercisePlanID)
  ORDER BY CustomizationPercentage DESC;
