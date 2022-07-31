-- 테이블 생성
CREATE TABLE transactions (
  id         INTEGER,        -- 거래 고유 번호
  amount     DECIMAL(12, 2), -- 거래 금액(총 12자리 숫자, 소수점 이하 2자리까지)
  msg        VARCHAR(15),    -- 최대 15자리 글자
  created_at TIMESTAMPTZ     -- 거래 시각(+타임존)
);
-- 레코드 등록
INSERT INTO
  transactions(id, amount, msg, created_at)
VALUES
  (1,   -24.20, 'Google',          '2021-11-01 10:02:48'),
  (2,   -36.30, 'Amazon',          '2021-11-02 10:01:05'),
  (3,   557.13, 'Udemy',           '2021-11-10 11:00:09'),
  (4,  -684.04, 'Bank of America', '2021-11-15 17:30:16'),
  (5,   495.71, 'PayPal',          '2021-11-26 10:30:20'),
  (6,   726.87, 'Google',          '2021-11-26 10:31:04'),
  (7,   124.71, 'Amazon',          '2021-11-26 10:32:02'),
  (8,   -24.20, 'Google',          '2021-12-01 10:00:21'),
  (9,   -36.30, 'Amazon',          '2021-12-02 10:03:43'),
  (10,  821.63, 'Udemy',           '2021-12-10 11:01:19'),
  (11, -837.25, 'Bank of America', '2021-12-14 17:32:54'),
  (12,  695.96, 'PayPal',          '2021-12-27 10:32:02'),
  (13,  947.20, 'Google',          '2021-12-28 10:33:40'),
  (14,  231.97, 'Amazon',          '2021-12-28 10:35:12'),
  (15,  -24.20, 'Google',          '2022-01-03 10:01:20'),
  (16,  -36.30, 'Amazon',          '2022-01-03 10:02:35'),
  (17, 1270.87, 'Udemy',           '2022-01-10 11:03:55'),
  (18, -540.64, 'Bank of America', '2022-01-14 17:33:01'),
  (19,  732.33, 'PayPal',          '2022-01-25 10:31:21'),
  (20, 1328.72, 'Google',          '2022-01-26 10:32:45'),
  (21,  824.71, 'Amazon',          '2022-01-27 10:33:01'),
  (22,  182.55, 'Coupang',         '2022-01-27 10:33:25'),
  (23,  -24.20, 'Google',          '2022-02-03 10:02:23'),
  (24,  -36.30, 'Amazon',          '2022-02-03 10:02:34'),
  (25,  -36.30, 'Notion',          '2022-02-03 10:04:51'),
  (26, 1549.27, 'Udemy',           '2022-02-14 11:00:01'),
  (27, -480.78, 'Bank of America', '2022-02-14 17:30:12').
  (1,   -24.20, 'Google',          '2021-11-01 10:02:48'),
  (1,   -24.20, 'Google',          '2021-11-01 10:02:48'),
  (1,   -24.20, 'Google',          '2021-11-01 10:02:48')
;
-- 레코드 조회
SELECT * FROM transactions;

--거래 내역의 총합은?
SELECT
    SUM(amount)--amount 컬럼의 총합을 계산
FROM
    transactions
;

--최대 거래 금액과 최저 거래 금액은?
SELECT
    MAX(amount), --최대 거래 금액
    MIN(amount)  --최소 거래 금액
FROM
    transactions
;

--GOOGLE과 거래한 총 횟수는?
SELECT
    COUNT(*)
FROM
    transactions
WHERE
    msg = 'Google'
;

--거래 내역의 평균 금액은?
SELECT
    ROUND(AVG(amount),2) -- 평균값 계산후 , 소수점 이하 둘째자리에서 반올림
FROM
    transactions
;

--거래 메시지 목록을 중복되지 않게 추출하면?
SELECT
    DISTINCT(msg) --중복을 제거하여 ,고유한 값을 추출!
FROM
    transactions
;

--2022년 1월의 순수익은?
SELECT
    SUM(amount)
FROM
    transactions
WHERE
    created_at >= '2022-01-01'
        AND
    created_at < '2022-02-01'
;

--2021년 12월의 순수익은?
SELECT
    --EXTRACT() : 시간값에서 특정 속성을 숫자로 추출!
    SUM(amount)
FROM
    transactions
WHERE
    --EXTRACT() : 시간값에서 특정 속성을 숫자로 추출!
    -- 2021-12-01 10:00:21+09 => YEAR(2021)
    -- 2021-12-01 10:00:21+09 => MONTH(12)
    EXTRACT(YEAR FROM created_at) = 2021
        AND
    EXTRACT(MONTH FROM created_at) = 12
;

--2021년 11월의 순수익은?
SELECT
    *
FROM
    transactions
WHERE
    --TO_CHAR() : 특정값을 다양한 형식 문자로 바꿔!
    TO_CHAR(created_at,'YYYY-MM') = '2021-11'
;

--2021 11 과 2022 01 순수익
SELECT
    SUM(amount)
FROM
    transactions
WHERE
    TO_CHAR(created_at,'YYYY-MM') = '2021-11'
        OR
    TO_CHAR(created_at,'YYYY-MM') = '2022-01'
;