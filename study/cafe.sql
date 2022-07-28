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
