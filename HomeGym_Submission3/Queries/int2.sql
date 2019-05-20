.mode       columns
.headers    on
.nullvalue  NULL

SELECT challengeID, participationScore, startTime, endTime, isPublic, nParticipants
FROM User NATURAL JOIN Challenge NATURAL JOIN
      (SELECT *, count(*) as nParticipants
      FROM ParticipationDetails
      GROUP BY challengeID
      )
WHERE userID = '4400230660011923'; -- MODIFY HERE THE ID FOR THE USER YOU WANT TO KNOW THE CHALLENGES OF
