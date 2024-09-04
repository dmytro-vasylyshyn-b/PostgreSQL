--INNER JOIN
SELECT Goods.GoodsId, Goods.GoodsName, Categories.CategoryName
FROM Goods
INNER JOIN Categories ON Goods.CategoryId = Categories.CategoryId;

--LEFT JOIN
SELECT Users.UserId, Users.Username, Orders.OrderId, Orders.Date
FROM Users
LEFT JOIN Orders ON Users.UserId = Orders.UserId;

--RIGHT JOIN
SELECT Goods.GoodsName, Posts.Title
FROM Goods
RIGHT JOIN PostGoods ON Goods.GoodsId = PostGoods.GoodsId
RIGHT JOIN Posts ON PostGoods.PostId = Posts.PostId;

--FULL OUTER JOIN
SELECT Goods.GoodsName, Prices.Price, Prices.Date
FROM Goods
FULL OUTER JOIN Prices ON Goods.GoodsId = Prices.GoodsId;

--CROSS JOIN
SELECT Users.Username, Sellers.Email
FROM Users
CROSS JOIN Sellers;

--SELF JOIN
SELECT U1.Username AS Follower, U2.Username AS Followed
FROM Follows
INNER JOIN Users U1 ON Follows.FollowingUserId = U1.UserId
INNER JOIN Users U2 ON Follows.FollowedUserId = U2.UserId;
