.mode       columns
.headers    on
.nullvalue  NULL

CREATE VIEW [nExByPlan] as
    SELECT exercisePlanID, count(*) as totalEx
    FROM ExerciseParameters
    JOIN Exercise USING(ExerciseID)
    GROUP BY exercisePlanID;

CREATE VIEW [nExByTypeFromPlan] as
    SELECT exercisePlanID, count(*) as totalType
    FROM ExerciseParameters
    JOIN Exercise USING(ExerciseID)
    WHERE ExerciseTypeID = (SELECT exerciseTypeID FROM ExerciseType WHERE name = 'Strength')
    GROUP BY exercisePlanID;

SELECT ExercisePlanId, B.totalType*100/A.totalEx as PercentageTypeTotal
    FROM [nExByPlan] A
    NATURAL JOIN [nExByTypeFromPlan] B
    WHERE (B.totalType > A.totalEx/2)
    ORDER BY PercentageTypeTotal DESC;
    
DROP VIEW IF EXISTS [nExByPlan];
DROP VIEW IF EXISTS [nExByTypeFromPlan];
