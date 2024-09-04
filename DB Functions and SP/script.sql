
CREATE OR REPLACE FUNCTION calculate_total_price(order_id INT) 
RETURNS MONEY AS
$$
DECLARE
    total_price MONEY;
BEGIN
    SELECT SUM(od.Quantity * g.currentPrice)
    INTO total_price
    FROM OrderDetails od
    JOIN Goods g ON od.GoodsId = g.GoodsId
    WHERE od.OrderId = order_id;
    
    RETURN total_price;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_average_rating(seller_id INT)
RETURNS FLOAT AS
$$
DECLARE
    avg_rating FLOAT;
BEGIN
    SELECT AVG(Rating)
    INTO avg_rating
    FROM Sellers
    WHERE SellerId = seller_id;

    RETURN avg_rating;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_total_followers(user_id INT)
RETURNS INTEGER AS
$$
DECLARE
    total_followers INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total_followers
    FROM Follows
    WHERE FollowedUserId = user_id;

    RETURN total_followers;
END;
$$
LANGUAGE plpgsql;








-- stored
CREATE OR REPLACE PROCEDURE get_orders_for_user(user_id INT)
AS $$
BEGIN
    SELECT *
    FROM Orders
    WHERE UserId = user_id;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE get_posts_for_goods(goods_id INT)
AS $$
BEGIN
    SELECT *
    FROM Posts
    WHERE GoodsId = goods_id;
END;
$$
LANGUAGE plpgsql;







CREATE OR REPLACE PROCEDURE insert_user(username VARCHAR(30), usersurname VARCHAR(35))
AS $$
BEGIN
    INSERT INTO Users (Username, UserSurname, CreatedAt)
    VALUES (username, usersurname, NOW());
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE insert_category(category_name VARCHAR(20))
AS $$
BEGIN
    INSERT INTO Categories (CategoryName)
    VALUES (category_name);
END;
$$
LANGUAGE plpgsql;