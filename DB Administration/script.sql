
CREATE ROLE regular_user;
CREATE ROLE administrator;


GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Users, Categories, Goods, Prices, Posts, Sellers, Follows, Basket, Chats, GoodsPriceHistory, ChatMessage, Orders, OrderDetails, PostGoods TO regular_user;
GRANT ALL PRIVILEGES ON TABLE Users, Categories, Goods, Prices, Posts, Sellers, Follows, Basket, Chats, GoodsPriceHistory, ChatMessage, Orders, OrderDetails, PostGoods TO administrator;


CREATE USER regular_user_login PASSWORD '06092875Br';
CREATE USER administrator_login PASSWORD '09457HOST975@guid';
GRANT regular_user TO regular_user_login;
GRANT administrator TO administrator_login;

BEGIN;


SET ROLE regular_user;
INSERT INTO Users (Username, UserSurname, CreatedAt) VALUES ('Regular', 'User', NOW());
INSERT INTO Categories (CategoryName) VALUES ('Category1');


SET ROLE administrator;
INSERT INTO Users (Username, UserSurname, CreatedAt) VALUES ('Admin', 'User', NOW());

COMMIT;