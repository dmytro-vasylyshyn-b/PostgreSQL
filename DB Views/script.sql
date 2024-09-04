-- горизонтального виду
CREATE VIEW HorizontalView AS
SELECT * FROM Users;


--  вертикального виду
CREATE VIEW VerticalView AS
SELECT UserId, Username, UserSurname, CreatedAt FROM Users;

-- змішаного виду
CREATE VIEW MixedView AS
SELECT UserId, Username, UserSurname, CreatedAt FROM Users;

-- з об'єднанням
CREATE VIEW JoiningView AS
SELECT p.Title, u.Username, u.UserSurname
FROM Posts p
JOIN Users u ON p.UserId = u.UserId;

-- з підзапитом
CREATE VIEW SubqueryView AS
SELECT UserId, Username, UserSurname
FROM Users
WHERE UserId IN (SELECT DISTINCT UserId FROM Orders);

--з об'єднанням
CREATE VIEW UnionView AS
SELECT UserId, Username, UserSurname FROM Users;

-- з іншого виду

CREATE VIEW ViewOnAnotherView AS
SELECT * FROM VerticalView;

-- параметр CHECK OPTION
CREATE VIEW CheckOptionView AS
SELECT UserId, Username, UserSurname
FROM Users
WITH CHECK OPTION;