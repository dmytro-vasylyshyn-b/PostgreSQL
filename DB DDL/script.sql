CREATE TABLE Users (
  UserId SERIAL PRIMARY KEY,
  Username VARCHAR(30) NOT NULL,
  UserSurname VARCHAR(35) NOT NULL,
  CreatedAt TIMESTAMP NOT NULL
);

CREATE TABLE Categories (
  CategoryId SERIAL PRIMARY KEY,
  CategoryName VARCHAR(20) NOT NULL
);


CREATE TABLE Goods (
  GoodsId SERIAL PRIMARY KEY,
  GoodsName VARCHAR(30) NOT NULL,
  CreatedAt TIMESTAMP NOT NULL,
  Photo BYTEA,
  CategoryId INTEGER NOT NULL,
  currentPrice MONEY,
  CONSTRAINT fk_category_id FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Prices (
  GoodsId INTEGER NOT NULL,
  Date TIMESTAMP NOT NULL,
  Price MONEY NOT NULL,
  PRIMARY KEY (GoodsId, Date),
  CONSTRAINT fk_price_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE Posts (
  PostId SERIAL PRIMARY KEY,
  Title VARCHAR(50) NOT NULL,
  UserId INTEGER NOT NULL,
  Status BOOLEAN DEFAULT TRUE,
  CreatedAt TIMESTAMP NOT NULL,
  Body TEXT,
  GoodsId INTEGER NOT NULL,
  CONSTRAINT fk_user_id FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE Sellers (
  SellerId SERIAL PRIMARY KEY,
  Email VARCHAR(100) UNIQUE,
  Phone VARCHAR(20) unique,
  Status BOOLEAN DEFAULT true,
  Rating FLOAT,
  Description text,
  UserId INTEGER NOT NULL,
  CONSTRAINT fk_seller_user_id FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Follows (
  FollowingUserId INTEGER,
  FollowedUserId INTEGER,
  CreatedAt TIMESTAMP,
  CONSTRAINT fk_following_user_id FOREIGN KEY (FollowingUserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_followed_user_id FOREIGN KEY (FollowedUserId) REFERENCES Sellers(SellerId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Basket (
  BasketId SERIAL PRIMARY KEY,
  UserId INTEGER NOT NULL,
  GoodsId INTEGER NOT NULL,
  Quantity INTEGER NOT NULL,
  CONSTRAINT fk_basket_user_id FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_basket_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Chats (
  ChatId SERIAL PRIMARY KEY,
  UserId INTEGER NOT NULL,
  SellerId INTEGER NOT NULL,
  CreatedAt timestamp default now(),
  CONSTRAINT fk_chat_user_id FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_chat_seller_id FOREIGN KEY (SellerId) REFERENCES Sellers(SellerId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE GoodsPriceHistory (
  PriceHistoryId SERIAL PRIMARY KEY,
  GoodsId INTEGER NOT NULL,
  Price MONEY NOT NULL,
  Date TIMESTAMP NOT NULL,
  CONSTRAINT fk_price_history_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table ChatMessage(
ChatId int,
  UserId INTEGER NOT NULL,
  description text not null,
  constraint one foreign key (chatId) references chats(ChatID) on delete cascade,
  constraint two foreign key (UserID) references users(UserID) on delete cascade
);

CREATE TABLE Orders (
  OrderId SERIAL PRIMARY KEY,
  UserId INTEGER NOT NULL,
  Date DATE NOT NULL,
  DeliveryAddress VARCHAR(140) NOT NULL,
  CONSTRAINT fk_order_user_id FOREIGN KEY (UserId) REFERENCES Users(UserId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
  OrderDetailsId SERIAL PRIMARY KEY,
  OrderId INTEGER NOT NULL,
  GoodsId INTEGER NOT NULL,
  Quantity INTEGER NOT NULL,
  CONSTRAINT fk_order_details_order_id FOREIGN KEY (OrderId) REFERENCES Orders(OrderId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_order_details_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PostGoods (
  GoodsId INTEGER NOT NULL,
  PostId INTEGER NOT NULL,
  CONSTRAINT fk_post_goods_id FOREIGN KEY (GoodsId) REFERENCES Goods(GoodsId) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_post_id FOREIGN KEY (PostId) REFERENCES Posts(PostId) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (GoodsId, PostId)
);