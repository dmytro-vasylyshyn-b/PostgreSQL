
INSERT INTO Users (Username, UserSurname, CreatedAt)
VALUES
  ('John', 'Doe', NOW()),
  ('Jane', 'Smith', NOW()),
  ('Michael', 'Johnson', NOW()),
  ('Emily', 'Williams', NOW()),
  ('Christopher', 'Brown', NOW()),
  ('Jessica', 'Jones', NOW()),
  ('Matthew', 'Garcia', NOW()),
  ('Emma', 'Martinez', NOW()),
  ('Daniel', 'Miller', NOW()),
  ('Olivia', 'Davis', NOW()),
  ('ohn', 'Doe', NOW()),
  ('ane', 'Smith', NOW()),
  ('ichael', 'Johnson', NOW()),
  ('mily', 'Williams', NOW()),
  ('hristopher', 'Brown', NOW()),
  ('essica', 'Jones', NOW()),
  ('atthew', 'Garcia', NOW()),
  ('mma', 'Martinez', NOW()),
  ('aniel', 'Miller', NOW()),
  ('livia', 'Davis', NOW());


INSERT INTO Categories (CategoryName)
VALUES
  ('Electronics'),
  ('Clothing'),
  ('Books'),
  ('Home & Garden'),
  ('Sports'),
  ('Toys'),
  ('Beauty'),
  ('Health'),
  ('Food'),
  ('Automotive');


INSERT INTO Goods (GoodsName, CreatedAt, CategoryId) 
VALUES
  ('Smartphone', NOW(), 1),
  ('T-shirt', NOW(), 2),
  ('Novel', NOW(), 3),
  ('Sofa', NOW(), 4),
  ('Football', NOW(), 5),
  ('Action Figure', NOW(), 6),
  ('Shampoo', NOW(), 7),
  ('Vitamin C', NOW(), 8),
  ('Apple', NOW(), 9),
  ('Car Battery', NOW(), 10);


INSERT INTO Prices (GoodsId, Price, Date) 
VALUES
  (1, 699.99, NOW()),
  (2, 19.99, NOW()),
  (3, 12.99, NOW()),
  (4, 899.99, NOW()),
  (5, 29.99, NOW()),
  (6, 9.99, NOW()),
  (7, 5.99, NOW()),
  (8, 15.99, NOW()),
  (9, 0.99, NOW()),
  (10, 99.99, NOW());


INSERT INTO Posts (Title, UserId, Status, CreatedAt, Body, GoodsId)
SELECT 
  'Review of the latest smartphone', 
  UserId, 
  TRUE, 
  NOW(), 
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 
  1
FROM Users
LIMIT 5;

INSERT INTO Posts (Title, UserId, Status, CreatedAt, Body, GoodsId)
SELECT 
  'Review of the latest smartphone', 
  UserId, 
  TRUE, 
  NOW(), 
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 
  1
FROM Users
LIMIT 5 OFFSET 5;


INSERT INTO Follows (FollowingUserId, FollowedUserId, CreatedAt)
SELECT 
  u1.UserId, 
  u2.SellerId, 
  NOW()
FROM Users u1
CROSS JOIN sellers  u2
WHERE u1.UserId != u2.SellerId;


INSERT INTO Sellers (Email, Phone, Status, Rating, Description, UserId)
SELECT 
  CONCAT(Username, '@example.com'), 
  CONCAT(UserId, '34567890'), 
  TRUE, 
  4.5, 
  'Great seller!', 
  UserId
FROM Users
limit 10;


INSERT INTO Basket (UserId, GoodsId, Quantity)
SELECT 
  UserId, 
  GoodsId, 
  1
FROM Users
CROSS JOIN Goods;


INSERT INTO Chats (UserId, SellerId, CreatedAt)
SELECT 
  u.UserId, 
  s.SellerId, 
  NOW()
FROM Users u
CROSS JOIN Sellers s;


INSERT INTO Orders (UserId, Date, DeliveryAddress)
SELECT 
  UserId, 
  NOW(), 
  CONCAT('Address ', UserId)
FROM Users;


INSERT INTO OrderDetails (OrderId, GoodsId, Quantity)
SELECT 
  o.OrderId, 
  g.GoodsId, 
  1
FROM Orders o
CROSS JOIN Goods g;


INSERT INTO PostGoods (GoodsId, PostId)
SELECT 
  g.GoodsId, 
  p.PostId
FROM Goods g
CROSS JOIN Posts p;


INSERT INTO GoodsPriceHistory (GoodsId, Price, Date)
SELECT 
  GoodsId, 
  Price, 
  Date
FROM Prices;
INSERT INTO ChatMessage (ChatId, UserId, Description)
SELECT 
  ChatId, 
  UserId, 
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
FROM Chats;