/* 테이블 생성 */
-- 사용자
CREATE TABLE users(
  id       SERIAL      PRIMARY KEY, -- PK
  email    VARCHAR(60) UNIQUE,      -- 이메일
  nickname VARCHAR(30)              -- 닉네임
);
-- 주문
CREATE TABLE orders(
  id         SERIAL       PRIMARY KEY,         -- PK
  status     VARCHAR(15),                      -- 주문 상태
  created_at TIMESTAMPTZ,                      -- 주문시각
  user_id    INTEGER      REFERENCES users(id) -- FK: 주문 사용자
);
-- 결제
CREATE TABLE payments(
  id       SERIAL      PRIMARY KEY,          -- PK
  amount   INTEGER,                          -- 결재액
  ptype    VARCHAR(30),                      -- 결제 종류
  order_id INTEGER     REFERENCES orders(id) -- FK: 결제된 주문
);
-- 상품
CREATE TABLE products(
  id    SERIAL      PRIMARY KEY, -- PK
  name  VARCHAR(60),             -- 상품명
  price INTEGER,                 -- 가격
  ptype VARCHAR(15)              -- 상품 종류
);
-- 주문내역
CREATE TABLE order_details(
  id SERIAL PRIMARY KEY,                      -- PK
  order_id INTEGER REFERENCES orders(id),     -- FK: 연관된 주문
  product_id INTEGER REFERENCES products(id), -- FK: 연관된 상품
  count INTEGER                               -- 주문 개수
);
/* 레코드 등록 */
-- 사용자
INSERT INTO
  users(email, nickname)
VALUES
  ('sehongpark@cloudstudying.kr', '홍팍'),
  ('kuma@cloudstudying.kr', '쿠마'),
  ('hawk@cloudstudying.kr', '호크')
;
-- 주문
INSERT INTO
  orders(status, created_at, user_id)
VALUES
  ('DELIVERED', '2021-11-12 5:07:12', 1),
  ('DELIVERED', '2021-11-17 22:14:54', 1),
  ('DELIVERED', '2021-11-24 19:13:46', 2),
  ('DELIVERED', '2021-11-29 23:57:29', 3),
  ('DELIVERED', '2021-12-06 22:25:13', 3),
  ('DELIVERED', '2022-01-02 13:04:25', 2),
  ('DELIVERED', '2022-01-06 15:45:51', 2),
  ('DELIVERED', '2022-02-13 17:55:35', 1),
  ('DELIVERED', '2022-02-28 17:50:14', 2),
  ('IN_CART', '2022-03-06 14:54:23', 1)
;
-- 결제
INSERT INTO
  payments(amount, ptype, order_id)
VALUES
  (33640, 'SAMSUNG CARD', 1),
  (33110, 'SAMSUNG CARD', 2),
  (31200, 'LOTTE CARD',   3),
  (69870, 'KAKAO PAY',    4),
  (32800, 'KAKAO PAY',    5),
  (42210, 'LOTTE CARD',   6),
  (46060, 'LOTTE CARD',   7),
  (42520, 'SAMSUNG CARD', 8),
  (23070, 'LOTTE CARD',   9)
;
-- 상품
INSERT INTO
  products(name, price, ptype)
VALUES
  ('돈까스 8입 1kg', 12900, '냉장 식품'),
  ('우유 900mL', 1970, '냉장 식품'),
  ('채소 믹스 500g', 4990, '냉장 식품'),
  ('참치마요 120g',4400,'냉장 식품'),
  ('돼지 프랑크 360g',3900,'냉장 식품'),
  ('달걀감자 샐러드 500g',6900,'냉장 식품'),
  ('달걈듬뿍 샐러드 500g',6900,'냉장 식품'),
  ('크림치즈',2180,'냉장 식품'),
  ('김자반 볶음 50g + 50g',3000,'상온 식품'),
  ('신라면 멀티 5봉',3680,'상온 식품'),
  ('우유식빵',2900, '상온 식품'),
  ('야채참치 100g',1590, '상온 식품'),
  ('고추참치 85g 8캔',10800,'상온 식품'),
  ('간편 양배추 280g',2200, '냉장 식품'),
  ('샐러드 키트 6봉',8900,'냉장 식품'),
  ('직화구이 햄',2990,'냉장 식품'),
  ('비앤나 소시지 800g',6900,'냉장 식품'),
  ('무항생제 특란 20구',7200,'냉장 식품'),
  ('나가사키짬뽕 5입',4480,'상온 식품'),
  ('수제 크림치즈 200g',9000,'냉장 식품'),
  ('한돈 떡갈비',3100,'냉장 식품'),
  ('플레인 베이글',1300,'냉장 식품'),
  ('노브랜드 리얼 햄 1kg',7380,'냉장 식품'),
  ('짜파게티 멀티 5봉',3680,'상온 식품'),
  ('짜왕 멀티 4봉',5300,'상온 식품'),
  ('노브랜드 짜장라면 멀티 4봉',2280,'상온 식품')
;
-- 주문내역
INSERT INTO
  order_details(order_id, product_id, count)
VALUES
  (1, 22, 6),
  (1, 20, 1),
  (1,  2, 2),
  (1,  1, 1),
  (2,  2, 3),
  (2, 20, 1),
  (2, 11, 2),
  (2, 21, 4),
  (3, 18, 1),
  (3, 19, 1),
  (3, 10, 1),
  (3,  2, 2),
  (3, 20, 1),
  (3, 11, 1),
  (4, 15, 1),
  (4,  7, 1),
  (4,  1, 1),
  (4,  9, 4),
  (4, 12, 6),
  (4, 16, 1),
  (4, 17, 1),
  (4,  2, 2),
  (4, 11, 2),
  (5, 11, 2),
  (5, 20, 1),
  (5, 14, 1),
  (5, 15, 1),
  (5,  7, 1),
  (6, 10, 1),
  (6,  3, 1),
  (6,  1, 1),
  (6,  2, 2),
  (6,  6, 1),
  (6,  7, 1),
  (6, 11, 1),
  (7,  4, 1),
  (7, 12, 10),
  (7, 13, 1),
  (7, 14, 1),
  (7,  2, 1),
  (7,  3, 1),
  (7, 11, 2),
  (8,  8, 1),
  (8,  5, 1),
  (8,  2, 2),
  (8, 11, 2),
  (8,  1, 1),
  (8,  6, 1),
  (8,  7, 1),
  (9, 11, 1),
  (9,  4, 1),
  (9,  2, 1),
  (9,  6, 1),
  (9,  7, 1),
  (10, 1, 1),
  (10, 2, 2),
  (10, 5, 1),
  (10, 8, 1)
;

--홍팍이의 모든 주문 목록은?
SELECT
    *
FROM
    users
JOIN orders ON
    orders.user_id = users.id
WHERE
    users.nickname = '홍팍'
;    

--홍팍이의 모든 주문 횟수는?
SELECT
    count(*)
FROM
    users
JOIN orders ON
    orders.user_id = users.id
WHERE
    users.nickname = '홍팍'
;    

--홍팍이의 모든 주문별 결제 금액을 조회
SELECT
    users.nickname AS "주문자명",
    orders.id AS "주문번호",
    payments.amount AS "결제금액"
FROM
    users
JOIN orders ON
    orders.user_id = users.id
        AND
    users.nickname = '홍팍'
LEFT JOIN payments ON
    payments.order_id =orders.id
;    

--홍팍이의 총 결제 금액은?
SELECT
    SUM(payments.amount)
FROM
    users
JOIN orders ON
    orders.user_id = users.id
        AND
    users.nickname = '홍팍'
LEFT JOIN payments ON
    payments.order_id =orders.id
;  

--상품#1돈까스의 총판매 금액은 51600원이다 이를 쿼리를 통해 조회하시오
SELECT
    SUM(products.price * order_details.count)
FROM
    products
JOIN order_details ON
    order_details.product_id = products.id
        AND
    products.id = 1
JOIN orders ON
    orders.id = order_details.order_id
        AND
    orders.status = 'DELIVERED'
;   


--결제 방법별 결제횟수 조회
SELECT
    ptype   AS "결제 방법",
    COUNT(ptype) AS "결제 횟수"
FROM
    payments
GROUP BY
    ptype
    
--보관 타입별 상품 개수와 평균 가격 조회
SELECT
    ptype   AS "상품보관 타입",
    COUNT(ptype) AS"상품 개수",
    AVG(price)  AS"평균 가격"
FROM
    products
GROUP BY
    ptype
;   

--사용자 닉네임별 배송완료 주문수
SELECT
    users.nickname AS "사용자 닉네임",
    COUNT(*)    AS "배송 완료 주문 수"
FROM
    users
JOIN orders ON
    orders.user_id = users.id
        AND
    orders.status = 'DELIVERED'
GROUP BY
    users.nickname
;   

--36000 이상인 결제 수단 조회!
SELECT
    ptype AS "결제 수단",
    ROUND(AVG(amount),2) AS"평균 결제 금액"
FROM
    payments
GROUP BY    
    ptype
HAVING -- 그룹 필터링 : 그룹화된 것들을 조건으로 선별
    AVG(amount) >= 36000
;    

-- 상품 이름과 가격을 기준으로, 누적 판매정보(판매량, 매출)를 조회
SELECT                                     -- 4
  products.name                             AS "상품명",
  products.price                            AS "가격",
  SUM(order_details.count)                  AS "누적 판매량",
  SUM(products.price * order_details.count) AS "누적 매출"
FROM                                       -- 1
  products
LEFT JOIN order_details ON                 -- 2
  order_details.product_id = products.id
GROUP BY                                   -- 3
  products.name,
  products.price
;

--(a) 누적 매출이 35000원 이상인 상품
SELECT                                     -- 4
  products.name                             AS "상품명",
  products.price                            AS "가격",
  SUM(order_details.count)                  AS "누적 판매량",
  SUM(products.price * order_details.count) AS "누적 매출"
FROM                                       -- 1
  products
LEFT JOIN order_details ON                 -- 2
  order_details.product_id = products.id
GROUP BY                                   -- 3
  products.name,
  products.price
HAVING
    --누적 매출이 35000 이상인 것
    SUM(products.price*order_details.count) >= 35000
;

--누적 매출이 2만원 이상이면서, 누적 판매량도 10개 이상인 상품을 조회
SELECT                                     -- 4
  products.name                             AS "상품명",
  products.price                            AS "가격",
  SUM(order_details.count)                  AS "누적 판매량",
  SUM(products.price * order_details.count) AS "누적 매출"
FROM                                       -- 1
  products
LEFT JOIN order_details ON                 -- 2
  order_details.product_id = products.id
GROUP BY                                   -- 3
  products.name,
  products.price
HAVING
    --누적 매출이 20000 이상인 것
    SUM(products.price*order_details.count) >= 20000
        AND
   --누적 판매량도 10개 이상 
    SUM(order_details.count) >= 10
;

--누적 매출이 없는 제품을, 가격을 기준으로 오름차순 정렬하여 조회하시오
SELECT                                     -- 4
  products.name                             AS "상품명",
  products.price                            AS "가격",
  SUM(order_details.count)                  AS "누적 판매량",
  SUM(products.price * order_details.count) AS "누적 매출"
FROM                                       -- 1
  products
LEFT JOIN order_details ON                 -- 2
  order_details.product_id = products.id
GROUP BY                                   -- 3
  products.name,
  products.price
HAVING
    SUM(products.price*order_details.count) IS NULL
ORDER BY
    products.price ASC --오름차순
;

--누적 매출 상위 5개 상품을 조회하시오
SELECT                                     -- 4
  products.name                             AS "상품명",
  products.price                            AS "가격",
  SUM(order_details.count)                  AS "누적 판매량",
  SUM(products.price * order_details.count) AS "누적 매출"
FROM                                       -- 1
  products
LEFT JOIN order_details ON                 -- 2
  order_details.product_id = products.id
GROUP BY                                   -- 3
  products.name,
  products.price
HAVING  
    SUM(products.price*order_details.count) IS NOT NULL
ORDER BY    
    "누적 매출" DESC --내림차순
LIMIT
    5
;
