.mode       columns
.headers    on
.nullvalue  NULL

SELECT * FROM
  (SELECT userID, nickname, userScore, COUNT(*) as nChallenges
  FROM User NATURAL JOIN ParticipationDetails NATURAL JOIN Challenge
  WHERE startTime <= '2018-06-11' AND endTime >= '2018-03-11' -- MODIFY HERE THE DATE WHERE YOU WANT THE ACTIVE CHALLENGES
  GROUP BY userID)
WHERE nChallenges > 0
ORDER BY nChallenges DESC;
