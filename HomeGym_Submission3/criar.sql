PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Challenge
DROP TABLE IF EXISTS Challenge;

CREATE TABLE Challenge (
    challengeID           INT     PRIMARY KEY,
    startTime    DATE    NOT NULL ON CONFLICT ABORT,
    endTime      DATE    NOT NULL ON CONFLICT ABORT,
    exercisePlanID INT     REFERENCES ExercisePlan (exercisePlanID) ON DELETE SET NULL
                                                      ON UPDATE CASCADE
                         NOT NULL ON CONFLICT ABORT,
    isPublic     BOOLEAN NOT NULL ON CONFLICT ABORT
                         DEFAULT (1),
    CHECK (endTime >= startTime)
);


-- Table: ChallengeDay
DROP TABLE IF EXISTS ChallengeDay;

CREATE TABLE ChallengeDay (
    challengeID INT REFERENCES Challenge (challengeID) ON DELETE SET NULL
                                            ON UPDATE CASCADE
                  NOT NULL ON CONFLICT ABORT,
    weekDayID  INT NOT NULL ON CONFLICT ABORT
                  REFERENCES WeekDay (weekDayID) ON DELETE SET NULL
                                          ON UPDATE CASCADE,
    PRIMARY KEY (
        challengeID,
        weekDayID
    )
);


-- Table: CustomExercise
DROP TABLE IF EXISTS CustomExercise;

CREATE TABLE CustomExercise (
    exerciseID       INT     PRIMARY KEY
                     NOT NULL ON CONFLICT ABORT
                     REFERENCES Exercise (exerciseID) ON DELETE SET NULL
                                              ON UPDATE CASCADE,
    isPublic BOOLEAN NOT NULL ON CONFLICT ABORT
                     DEFAULT true,
    creator  BIGINT  REFERENCES User (userID) ON DELETE SET NULL
                                                  ON UPDATE CASCADE
                     NOT NULL ON CONFLICT ABORT
);


-- Table: CustomPlan
DROP TABLE IF EXISTS CustomPlan;

CREATE TABLE CustomPlan (
    exercisePlanID           INT     PRIMARY KEY
                         REFERENCES ExercisePlan (exercisePlanID) ON DELETE SET NULL
                                                      ON UPDATE CASCADE
                         NOT NULL ON CONFLICT ABORT,
    lastTimeUsed DATE    DEFAULT NULL,
    isPublic     BOOLEAN NOT NULL ON CONFLICT ABORT
                         DEFAULT true,
    creator      BIGINT  REFERENCES User (userID) ON DELETE SET NULL
                                                      ON UPDATE CASCADE
                         NOT NULL ON CONFLICT ABORT
);


-- Table: DefaultExercise
DROP TABLE IF EXISTS DefaultExercise;

CREATE TABLE DefaultExercise (
    exerciseID INT PRIMARY KEY
         REFERENCES Exercise (exerciseID) ON DELETE SET NULL
                                  ON UPDATE CASCADE
         NOT NULL ON CONFLICT ABORT
);


-- Table: DefaultPlan
DROP TABLE IF EXISTS DefaultPlan;

CREATE TABLE DefaultPlan (
    exercisePlanID INT PRIMARY KEY
         REFERENCES ExercisePlan (exercisePlanID) ON DELETE SET NULL
                                      ON UPDATE CASCADE
         NOT NULL ON CONFLICT ABORT
);


-- Table: Execution
DROP TABLE IF EXISTS Execution;

CREATE TABLE Execution (
    executionID        INT    PRIMARY KEY,
    date      DATE   NOT NULL ON CONFLICT ABORT,
    duration  INT    NOT NULL ON CONFLICT ABORT
                     CHECK (duration >= 1),
    userID  BIGINT REFERENCES User (userID) ON DELETE SET NULL
                                                  ON UPDATE CASCADE
                     NOT NULL ON CONFLICT ABORT,
    challengeID INT    REFERENCES Challenge (challengeID) ON DELETE SET NULL
                                               ON UPDATE CASCADE
                     NOT NULL ON CONFLICT ABORT
);


-- Table: Exercise
DROP TABLE IF EXISTS Exercise;

CREATE TABLE Exercise (
    exerciseID  INT  PRIMARY KEY,
    name        TEXT NOT NULL ON CONFLICT ABORT,
    videoLink   TEXT DEFAULT NULL,
    description TEXT NOT NULL ON CONFLICT ABORT
                     DEFAULT ('No description available.'),
    imageURL    TEXT DEFAULT NULL,
    difficulty  INT  CHECK (difficulty >= 1 AND
                            difficulty <= 5)
                     DEFAULT (3)
                     NOT NULL ON CONFLICT ABORT,
    exerciseTypeID   INT  REFERENCES ExerciseType (exerciseTypeID) ON DELETE SET NULL
                                                  ON UPDATE CASCADE
                     NOT NULL ON CONFLICT ABORT
);


-- Table: ExerciseParameters
DROP TABLE IF EXISTS ExerciseParameters;

CREATE TABLE ExerciseParameters (
    exercisePlanID INT REFERENCES ExercisePlan (exercisePlanID) ON DELETE SET NULL
                                                    ON UPDATE CASCADE
                       NOT NULL ON CONFLICT ABORT,
    exerciseID       INT REFERENCES Exercise (exerciseID) ON DELETE SET NULL
                                                ON UPDATE CASCADE
                       NOT NULL ON CONFLICT ABORT,
    numRepetitions INT CHECK (numRepetitions >= 1)
                       NOT NULL ON CONFLICT ABORT,
    numSets        INT CHECK (numSets >= 1)
                       NOT NULL ON CONFLICT ABORT,
    PRIMARY KEY (
        exercisePlanID,
        exerciseID
    )
);


-- Table: ExercisePlan
DROP TABLE IF EXISTS ExercisePlan;

CREATE TABLE ExercisePlan (
    exercisePlanID     INT PRIMARY KEY,
    recomendedCooldown INT CHECK (recomendedCooldown > 0),
    difficulty         INT NOT NULL ON CONFLICT ABORT
);


-- Table: ExerciseType
DROP TABLE IF EXISTS ExerciseType;

CREATE TABLE ExerciseType (
    exerciseTypeID   INT    PRIMARY KEY,
    name TEXT UNIQUE
              NOT NULL ON CONFLICT ABORT
);


-- Table: ParticipationDetails
DROP TABLE IF EXISTS ParticipationDetails;

CREATE TABLE ParticipationDetails (
    userID      BIGINT NOT NULL ON CONFLICT ABORT
                           REFERENCES User (userID) ON DELETE SET NULL
                                                        ON UPDATE CASCADE,
    challengeID       INT    REFERENCES Challenge (challengeID) ON DELETE SET NULL
                                                     ON UPDATE CASCADE
                           NOT NULL ON CONFLICT ABORT,
    participationScore           INT    NOT NULL ON CONFLICT ABORT
                           CHECK (participationScore >= 0)
                           DEFAULT (0),
    finalPlanRating INT    DEFAULT NULL
                           CHECK (finalPlanRating >= 1 AND
                                  finalPlanRating <= 10),
    PRIMARY KEY (
        userID,
        challengeID
    )
);


-- Table: User
DROP TABLE IF EXISTS User;

CREATE TABLE User (
    userID     BIGINT       PRIMARY KEY,
    nickname   TEXT (6, 48) NOT NULL ON CONFLICT ABORT,
    userScore      INT      NOT NULL ON CONFLICT ABORT
                            DEFAULT (0)
);


-- Table: WeekDay
DROP TABLE IF EXISTS WeekDay;

CREATE TABLE WeekDay (
    weekDayID    INT  PRIMARY KEY,
    dayName TEXT NOT NULL ON CONFLICT ABORT
                 CHECK (dayName == 'Monday' OR
                        dayName == 'Tuesday' OR
                        dayName == 'Wednesday' OR
                        dayName == 'Thursday' OR
                        dayName == 'Friday' OR
                        dayName == 'Saturday' OR
                        dayName == 'Sunday')
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
