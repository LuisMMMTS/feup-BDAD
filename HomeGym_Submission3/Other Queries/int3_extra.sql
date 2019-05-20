.mode       columns
.headers    on
.nullvalue  NULL

-- Get all the Challenges current winners
SELECT challengeID, nickname, max(participationScore)
FROM User NATURAL JOIN ParticipationDetails
GROUP BY challengeID;
