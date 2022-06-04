CREATE DATABASE SwimmingCompetitionsGroup2		--������� ��

GO

CREATE SCHEMA People							-- ������� ����� ��� �����

GO

CREATE TABLE People.Coach (						--������ ������� � ������
CoachID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
FirstName nvarchar(50),
LastName nvarchar(50),
PassportNumber nvarchar(30),
Citizenship nvarchar(10),
Rank nvarchar(50),
Type nvarchar(50)
);

GO

CREATE TABLE People.Swimmer (
SwimmerID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
CoachID int FOREIGN KEY REFERENCES People.Coach(CoachID),
FirstName nvarchar(50),
LastName nvarchar(50),
Birthday date,
Gender char(1), -- M or F
PassportNumber nvarchar(30),
Citizenship nvarchar(10),
PersonalRecord time,
Rank nvarchar(50)
);

GO

CREATE TABLE People.Judge (
JudgeID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
FirstName nvarchar(50),
LastName nvarchar(50),
PassportNumber nvarchar(30),
Citizenship nvarchar(10),
Rank nvarchar(50),
);

GO

CREATE SCHEMA Competitions						--������ ����� ��� ������������

GO

CREATE TABLE Competitions.Pool (				--������ ������� ��� ������������
PoolID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
Address nvarchar(50),
Name nvarchar(50),
Numberoftracks tinyint
);

GO

CREATE TABLE Competitions.Competition (
CompetitionID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
PoolID int FOREIGN KEY REFERENCES Competitions.Pool(PoolID),
Name nvarchar(50),
Date_time datetime
);

GO

CREATE TABLE Competitions.Result (
ResultID int IDENTITY PRIMARY KEY NOT NULL,
CompetitionID int FOREIGN KEY REFERENCES Competitions.Competition(CompetitionID),
JudgeID int FOREIGN KEY REFERENCES People.Judge(JudgeID),
SwimmerID int FOREIGN KEY REFERENCES People.Swimmer(SwimmerID),
Time time,
Style nvarchar(30),
Distance int
);

GO
												--����������� �� �������� ��� �������
ALTER TABLE People.Swimmer
ADD CONSTRAINT DefaultGenders CHECK (Gender in ('M','F'));

GO

ALTER TABLE People.Swimmer						--����������� ��� �������-����� �����
ALTER COLUMN FirstName nvarchar(50) NOT NULL;

GO

ALTER TABLE People.Swimmer
ALTER COLUMN LastName nvarchar(50) NOT NULL;

GO

ALTER TABLE People.Coach
ALTER COLUMN FirstName nvarchar(50) NOT NULL;

GO

ALTER TABLE People.Coach
ALTER COLUMN LastName nvarchar(50) NOT NULL;

GO

ALTER TABLE People.Judge
ALTER COLUMN FirstName nvarchar(50) NOT NULL;

GO

ALTER TABLE People.Judge
ALTER COLUMN LastName nvarchar(50) NOT NULL;

GO
						
ALTER TABLE Competitions.Result					-- � ������, ���� ������ �� �����������, �� Null ��������� �� 'Not Finished'
ADD CONSTRAINT IsFinished CHECK (
Time = ISNULL(Time,'Not Finished')
)

GO

ALTER TABLE People.Swimmer						-- ������ ��������� PersonalRecord �� ������ � ���������
DROP COLUMN PersonalRecord;

GO

ALTER TABLE Competitions.Result
ADD PersonalRecord time;

GO
												-- ������� �������-�����
CREATE TABLE Competitions.Bridge_Competition_Pool (
PoolID int FOREIGN KEY REFERENCES Competitions.Pool(PoolID),
CompetitionID int FOREIGN KEY REFERENCES Competitions.Competition(CompetitionID)
)