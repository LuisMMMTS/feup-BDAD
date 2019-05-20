.mode       columns
.headers    on
.nullvalue  NULL

select * 
from User
where nickname = 'RuiVieiraLDA';

UPDATE ParticipationDetails
SET participationScore = 0
WHERE userID = 1000000000000011 AND
      challengeID = 9;

select * 
from User
where nickname = 'RuiVieiraLDA';
