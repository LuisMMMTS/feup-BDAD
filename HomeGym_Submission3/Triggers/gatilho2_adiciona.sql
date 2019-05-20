CREATE TRIGGER ParticipationScore
AFTER INSERT ON Execution
FOR EACH ROW
BEGIN
    UPDATE ParticipationDetails
    SET participationScore = participationScore
                            + (SELECT count(*) FROM ExerciseParameters
                            WHERE exercisePlanID = (SELECT exercisePlanID FROM Challenge WHERE challengeID = NEW.challengeID))
                            * (SELECT difficulty FROM ExercisePlan
                              WHERE exercisePlanID = (SELECT exercisePlanID FROM Challenge WHERE challengeID = NEW.challengeID))
    WHERE ParticipationDetails.userID = NEW.userID AND
          ParticipationDetails.challengeID = NEW.challengeID;
END;
