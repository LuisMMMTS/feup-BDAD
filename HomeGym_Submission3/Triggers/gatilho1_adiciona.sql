CREATE TRIGGER ExercisePlanDifficulty
AFTER INSERT ON ExerciseParameters
FOR EACH ROW
BEGIN
    UPDATE ExercisePlan
    SET difficulty = (
        SELECT AVG(difficulty)
        FROM (Exercise NATURAL JOIN ExerciseParameters) as EP
        WHERE EP.exercisePlanID = NEW.exercisePlanID
        GROUP BY ExerciseParameters.exercisePlanID
    )
    WHERE ExercisePlan.exercisePlanID = NEW.exercisePlanID;
END;
