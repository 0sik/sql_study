--학생 테이블 생성
CREATE TABLE students(
    id INTEGER,
    nickname VARCHAR(50),
    math_score INTEGER,
    english_score INTEGER,
    programming_score INTEGER
);
INSERT INTO
    students(id,nickname,math_score,english_score,programming_score)
VALUES
    (1,'a',98,96,93),
    (2,'b',82,66,98),
    (3,'c',84,70,82),
    (4,'d',87,99,98),
    (5,'e',75,73,70),
    (6,'f',84,82,70),
    (7,'g',97,91,87),
    (8,'f',99,100,88)
;

--전체 학생 정보
SELECT
    *
FROM
    students
;
SELECT
    *
FROM
    students
WHERE
    math_score >= 90
        AND
    english_score>=90
        AND
    programming_score>=90
;
SELECT
    *
FROM
    students
WHERE
    math_score < 90
        AND
    english_score<90
        AND
    programming_score<90
;
SELECT
    *
FROM
    students
WHERE
    math_score < 75
        AND
    english_score<75
        AND
    programming_score<75
;
--모든 학생별 정보와 성적 총점

SELECT
    *,
    math_score + english_score + programming_score AS total --성적 총점
FROM
    students
    ;
    
SELECT
    *,--모든 컬럼을보여줘!
     (math_score + english_score + programming_score)/3 AS average --성적 평균
FROM
    students
;

SELECT
    nickname,
    math_score + english_score + programming_score AS total, --성적 총점
    (math_score + english_score + programming_score)/3 AS average --성적 평균
FROM
    students
WHERE
    math_score+english_score+programming_score >=270
;