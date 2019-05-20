CREATE TRIGGER UserScore
AFTER UPDATE ON ParticipationDetails
FOR EACH ROW
BEGIN
    UPDATE User
    SET userScore = 
       (select sum(participationScore)
        from User NATURAL JOIN ParticipationDetails
        where ParticipationDetails.userID = NEW.userID)
    WHERE User.userID = NEW.userID;
END;
