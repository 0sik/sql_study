 -- 주문(orders)
INSERT INTO
  orders(status, created_at)
VALUES
  ('DELIVERED', '2022-02-26 8:32:13'),
  ('CANCELLED', '2022-02-26 8:35:27'),
  ('DELIVERED', '2022-02-26 8:44:53'),
  ('DELIVERED', '2022-02-26 9:05:12'),
  ('DELIVERED', '2022-02-26 9:11:35'),
  ('DELIVERED', '2022-02-26 9:14:18'),
  ('DELIVERED', '2022-02-26 9:34:20'),
  ('DELIVERED', '2022-02-26 9:44:27'),
  ('DELIVERED', '2022-02-26 9:48:25'),
  ('DELIVERED', '2022-02-26 11:14:52'),
  ('CANCELLED', '2022-02-26 11:32:13'),
  ('DELIVERED', '2022-02-26 11:55:40'),
  ('DELIVERED', '2022-02-26 12:15:01'),
  ('DELIVERED', '2022-02-26 12:21:52'),
  ('CANCELLED', '2022-02-26 12:29:17')
;
-- 음료(beverages)
INSERT INTO
  beverages(name, price, btype)
VALUES
  ('아메리카노',   4500, 'COFFEE'),
  ('라떼',        5000, 'COFFEE'),
  ('카푸치노',     5000, 'COFFEE'),
  ('카페모카',     5500, 'COFFEE'),
  ('콜드브루',     5200, 'COFFEE'),
  ('레몬 에이드',  3800, 'AID'),
  ('자몽 에이드',  4800, 'AID'),
  ('바닐라 쉐이크', 5800, 'SHAKE')
;
-- 주문내역(order_details)
INSERT INTO
  order_details(order_id, beverage_id, count)
VALUES
  (1,  1, 1),
  (2,  1, 2),
  (2,  2, 3),
  (2,  8, 2),
  (3,  1, 2),
  (4,  8, 1),
  (5,  4, 1),
  (6,  5, 3),
  (7,  1, 3),
  (7,  2, 2),
  (8,  1, 1),
  (9,  5, 1),
  (10, 1, 4),
  (11, 2, 1),
  (12, 3, 1),
  (13, 1, 6),
  (14, 1, 8),
  (14, 2, 2),
  (14, 6, 1),
  (15, 1, 4)
;
 --주문#2에 담긴 음료들
 --join문법: 다른 테이블을 붙여옴
SELECT
    beverages.name
FROM
    order_details
JOIN beverages ON
    beverages.id = order_details.beverage_id
WHERE
    order_details.order_id=2 
;    
--주문#14의 매출
--JOIN 문법 사용
SELECT
    SUM(order_details.count * beverages.price)
FROM
    order_details
Join beverages ON
    beverages.id = order_details.beverage_id
WHERE
    order_id=14
;   

--주문#15의 매출
--JOIN 문법 사용
SELECT
    SUM(order_details.count * beverages.price)
FROM
    order_details
Join beverages ON
    beverages.id = order_details.beverage_id
WHERE
    order_id=15
;   


--주문#14의 매출의 수 (count함수 사용)
--JOIN 문법 사용
SELECT
    COUNT(order_details.count * beverages.price)
FROM
    order_details
Join beverages ON
    beverages.id = order_details.beverage_id
WHERE
    order_id=14
; 

--1.음료명, 가격, 최대 가격과의 차이
SELECT
    name AS"음료명",
    price AS"가격",
    price - (
        SELECT
        MAX(price)
        --가장 비싼 음료의 가격(무조건 1행 1열)
        FROM
            beverages
    )AS"최대 가격과의 차이"
FROM
    beverages
;   

--주문별 음료 개수 평균
SELECT
    AVG(sum) AS "주문별 음료 개수 평균"
FROM
(
--주문별 음료 개수
SELECT
    order_id,
    SUM(count)
FROM
    order_details
GROUP BY
    order_id
) AS"주문 별 음료 개수 집계"
;

--음료 별 주문 개수 조회
SELECT
    name AS "음료명",
    COALESCE(total_count,0)AS"주문 개수"
FROM
    becerages
LEFT JOIN(
   --음료 id 별 주문 개수
SELECT
    beverage_id,
    SUM(count)AS"total_count"
FROM
    order_details
GROUP BY
    beverage_id
     
)
;

--평균 가격보다 싼 음료를 조회
SELECT
    name AS"음료명",
    price AS"가격"
FROM
    beverages
WHERE
    price> (
    --음료의 평균 가격 조회
    SELECT
        AVG(price)
    FROM
        beverages
    )
;   
