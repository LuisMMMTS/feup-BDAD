.mode       columns
.headers    on
.nullvalue  NULL

select * 
from ParticipationDetails
where userID = 1000000000000013 and
      challengeID = 4;

INSERT INTO Execution(date,duration,userID,challengeID) VALUES('2019-05-12', 5, 1000000000000013, 4);

select * 
from ParticipationDetails
where userID = 1000000000000013 and
      challengeID = 4;
