.mode       columns
.headers    on
.nullvalue  NULL

SELECT challengeID, avg(finalPlanRating) as Rating, count(*) as nVotes
FROM Challenge NATURAL JOIN ParticipationDetails
GROUP BY challengeID
ORDER BY Rating DESC, nVotes DESC;
