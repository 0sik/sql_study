-- 주석 : 실행되지 않는 쿼리(설명을 위함)
-- 테이블 생성 쿼리(SQL 명령)
CREATE TABLE burgers (
    id int,             --id(숫자)
    name VARCHAR(50),   --이름(최대 50글자)
    price INT,          --가격(숫자)
    gram INT,           --무게(숫자)
    Kcal INT,           --열량(숫자)
    protein INT         --단백질량(숫자)
);


--생성 쿼리
INSERT INTO
    burgers(id,name,price,gram,kcal,protein)
VALUES
    (1,'행운버거 골드 스페셜',6000,227,699,26);
    
--생성 쿼리#2
INSERT INTO
    burgers(id,name,price,gram,kcal,protein)
VALUES
    (2,'행운버거 스페셜',5300,222,549,25),
    (3,'트리플 치즈버거',6300,219,619,36),
    (4,'빅맥',5300,223,583,27)
    ;
    
--조회 커리
SELECT
    *          --모든 속성을 보여줘--
FROM
    burgers; --해당테이블의
    
--수정 쿼리
UPDATE
    burgers  --해당 테이블 모두를 변경
SET
    price = 1000;
    
--수정 쿼리#2
UPDATE
    burgers  --해당 테이블 모두를 변경
SET
    price = 500
WHERE
    id=4; -- id가 4인 빅맥만 바꿔줘
     
--삭제 쿼리
DELETE FROM
    burgers
WHERE
    id =4; --id가 4인 테이블 데이터 지우기