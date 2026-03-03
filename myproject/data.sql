--首先创建数据库 recommand 并使用它：

CREATE SCHEMA recommand;

USE recommand


--创建 user 表存储 id，名字，用 id 为主键，即 id 不能重复。
--创建 anime 表存储 id，名称，介绍信息，同样用 id 为主键，即 id 不能重复。

CREATE TABLE user (
    id INT PRIMARY KEY,
    name VARCHAR(32)
    );



CREATE TABLE anime (
    id INT PRIMARY KEY,
    name VARCHAR(128),
    brief VARCHAR(128)
    );



SHOW TABLES;


--向已创建的 user 数据表中插入一条数据：
INSERT INTO user VALUE (1, 'Shiyanlou');



SELECT * FROM user;


--向 anime 番剧表插入数据：
INSERT INTO anime VALUE
    (279,"a","A"),
    (3494,"b","B"),
    (3377,"c","C"),
    (3452,"d","D"),
    (782,"e","E"),
    (3421,"f","F"),
    (2730,"g","G");


SELECT * FROM anime;


--创建 user_anime 表并插入三条测试数据，表示 1 号用户有三个喜爱的番剧。
--注意该表只有两个字段，分别定义两个外键关联到 user 表的 id 字段和 anime 的 id 字段：

CREATE TABLE user_anime (
    user_id INT,
    anime_id INT,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(anime_id) REFERENCES anime(id)
    );




INSERT INTO user_anime VALUE
    (1, 782),
    (1, 3421),
    (1, 2730);




SELECT * FROM user_anime;



--最后创建 anime_style 表，该表仍然有外键约束，anime_id 字段对应 anime 表的主键

CREATE TABLE anime_style (
    anime_id INT,
    style_id INT,
    FOREIGN KEY(anime_id) REFERENCES anime(id)
    );





INSERT INTO anime_style VALUE
(279,26),
(279,30),
(279,32),
(279,8),
(279,7),
(3494,9),
(3494,1),
(3494,2),
(3494,4),
(3377,34),
(3377,7),
(3377,18),
(3452,30),
(3452,32),
(3452,7),
(3452,22),
(782,30),
(782,32),
(782,7),
(782,1),
(782,50),
(3421,30),
(3421,32),
(3421,7),
(3421,22),
(2730,11),
(2730,30),
(2730,22);




--完成后，我们本实验测试所需要的数据库和数据表建立完毕，相关测试数据也已经写入:

SHOW TABLES;











