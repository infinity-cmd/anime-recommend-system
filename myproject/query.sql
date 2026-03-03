--本实验中我们实现的推荐算法比较简单，基本思路：

--1、找到用户所喜爱的番剧
--2、分析这些番剧的类别（一个番剧可能有多个标签），进行统计排序
--3、找到数量最多的前三个标签
--4、从数据库中找到同时具有这三个标签的番剧
--5、去掉已经看过的番剧后，从中随机选择一个
--6、将番剧相关信息（name，brief）进行展示

--我们以 ID 为 1 的用户为例，首先，找到用户喜爱的番剧的 ID ：
--当然我们目前只是添加了ID=1的用户hhh

SELECT anime_id FROM user_anime
     WHERE user_id = 1;


--根据番剧 ID 从 anime_style 表中获取对应的全部标签 ID ：

SELECT style_id FROM anime_style
    -> WHERE anime_id IN (
    -> SELECT anime_id FROM user_anime
    -> WHERE user_id = 1
    -> );
    
--对这些番剧 ID 进行分组求数量，然后再进行倒序排序，获取前三组数据：
SELECT style_id, COUNT(style_id) FROM (
    SELECT style_id FROM anime_style
    WHERE anime_id IN (
    SELECT anime_id FROM user_anime
    WHERE user_id = 1
    )) AS a GROUP BY 1 ORDER BY 2 DESC LIMIT 3;
--这是比较高级复杂的query了


--注意，style_id 为 22 的标签的 COUNT 也是 2 ，所以有可能结果不同




