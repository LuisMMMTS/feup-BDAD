.mode       columns
.headers    on
.nullvalue  NULL

SELECT userID, nickname, userScore, COUNT(*) as nChallenges
FROM User NATURAL JOIN ParticipationDetails
GROUP BY userID
ORDER BY userScore DESC, nChallenges DESC
LIMIT 3;
