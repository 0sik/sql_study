-- users 테이블
CREATE TABLE users(
    id SERIAL PRIMARY KEY, --PK선언(SERIAL:자동 생성 타입)
    nickname VARCHAR(50),
    email VARCHAR(100)
);

--users 레코드 등록
INSERT INTO
    users(nickname,email)
VALUES
    ('a','a1'),
    ('b','b1'),
    ('c','c1')
;    

--users 조회
SELECT * FROM users;

--photos 테이블 생성
CREATE TABLE photos(
    id SERIAL PRIMARY KEY, --pk
    filename VARCHAR(255),
    user_id INTEGER REFERENCES users(id) --FK:사진 게시자의 pk로 연결
);

--photos 레코드 등록
INSERT INTO
    photos(filename,user_id)
VALUES
    ('cat',1),
    ('dog',1),
    ('rabbit',1),       
    ('hot',2),
    ('cool',2)
;

--photos 조회
SELECT * FROM photos;

--comments 테이블 생성
CREATE TABLE comments(
    id SERIAL PRIMARY KEY, --pk
    body VARCHAR(1000),
    user_id INTEGER REFERENCES users(id),--FK:댓글 작성자
    photo_id INTEGER REFERENCES photos(id) --FK:댓글이 달린 사진
);

--comments 레코드 등록
INSERT INTO
    comments(body,user_id,photo_id)
VALUES
    --1번사진에 달린 댓글
    ('좋네',1,1), --1번 유저
    ('좋네2',2,1), --2번 유저
    ('좋네3',3,1), --3번 유저
    --2번 사진에 달린 댓글
    ('아쉽다',1,2),--1번 유저
    ('아쉽다2',2,2),--2번 유저
    --3번 사진에 달린 댓글
    ('아쉽다31',1,3),--1번 유저
    ('아쉽다33',3,3)--3번 유저
;
--comments 조회
SELECT * FROM comments;