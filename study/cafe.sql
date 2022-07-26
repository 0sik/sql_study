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