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

--settings 테이블 생성
CREATE TABLE settings(
    id serial PRIMARY KEY, --PK
    private BOOLEAN, --BOOLEAN :  참(true)/거짓(false)
    adding_photos VARCHAR(15),
    --FK : 개인설정 유저(1:1)
    user_id INTEGER UNIQUE REFERENCES users(id)--FK:개인설정 유저
);

--settings 레코드 생성
INSERT INTO
    settings(private,adding_photos,user_id)
VALUES
    (FALSE,'MANUAL',1),--유저1
    (FALSE,'AUTO',2),--유저2
    (TRUE,'AUTO',3)--유저3
;

--settings 조회
SELECT * FROM settings;

--likes 테이블 생성
CREATE TABLE likes(
    id SERIAL PRIMARY KEY, --pk
    user_id INTEGER REFERENCES users(id),--fk
    photo_id INTEGER REFERENCES photos(id)--fk
);

--likes 레코드 생성
INSERT INTO
    likes(user_id,photo_id)
VALUES
    (1,1),
    (2,1),
    (1,2),
    (2,2),
    (3,2),
    (1,3),
    (3,3)
;    

--likse조회
SELECT * FROM likes;

DROP TABLE likes;
DROP TABLE settings;
DROP TABLE comments;
DROP TABLE photos;
DROP TABLE users;

-- users 테이블
CREATE TABLE users (
  id       SERIAL       PRIMARY KEY,
  nickname VARCHAR(50),
  email    VARCHAR(100)
);
-- photos 테이블
CREATE TABLE photos (
  id       SERIAL        PRIMARY KEY,
  filename VARCHAR(255),
  user_id  INTEGER       REFERENCES users(id)
);
-- comments 테이블
CREATE TABLE comments (
  id       SERIAL         PRIMARY KEY,
  body     VARCHAR(1000),
  user_id  INTEGER        REFERENCES users(id),
  photo_id INTEGER        REFERENCES photos(id)
);
-- settings 테이블
CREATE TABLE settings (
  id            SERIAL       PRIMARY KEY,
  private       BOOLEAN,
  adding_photos VARCHAR(15),
  user_id       INTEGER      UNIQUE REFERENCES users(id)
);
-- likes 테이블 생성(사용자와 사진을 다대다 연결)
CREATE TABLE likes (
  id       SERIAL  PRIMARY KEY,
  user_id  INTEGER REFERENCES users(id),
  photo_id INTEGER REFERENCES photos(id)
);

-- users 레코드
INSERT INTO
  users(nickname, email)
VALUES
  ('cloudstudying_kr', 'mail@cloudstudying.kr'),
  ('hongpark_cs',      'sehongpark@cloudstudying.kr'),
  ('haesamq',          'haesamq@naver.com')
;
-- photos 레코드
INSERT INTO
  photos(filename, user_id)
VALUES
  ('cat-on-road.jpg',           1),
  ('sunset-over-the-ocean.jpg', 1),
  ('andromeda-galaxy.jpg',      1),
  ('white-tiger.jpg',           2),
  ('nero-the-black-cat.jpg',    2),
  ('deleted-image.jpg',         NULL),
  ('blocked-image.jpg',         NULL)
;
-- comments 레코드
INSERT INTO
  comments(body, user_id, photo_id)
VALUES
  ('meow',             1, 1),
  ('nyaong',           2, 1),
  ('냐옹',              3, 1),
  ('sunset',           1, 2),
  ('falling slowly',   2, 2),
  ('Andromeda galaxy', 1, 3),
  ('mysteriouse..!',   3, 3),
  ('wow..!',           3, NULL),
  ('oh..!',            3, NULL)
;
-- settings 레코드
INSERT INTO
  settings(private, adding_photos, user_id)
VALUES
  (FALSE, 'MANUAL', 1),
  (FALSE, 'AUTO',   2),
  (TRUE,  'AUTO',   3)
;
-- likes 레코드
INSERT INTO
  likes(user_id, photo_id)
VALUES
  (1,    1),
  (2,    1),
  (1,    2),
  (2,    2),
  (3,    2),
  (1,    3),
  (3,    3),
  (NULL, 6),
  (NULL, 7)
;

--사진#1에 달린 모든 "댓글내용"과 작성자"닉네임"을 조회하시오.
SELECT
    comments.body,
    users.nickname
From
    comments
Join users ON
    users.id = comments.user_id
WHERE
    comments.photo_id = 1
;    
--사진 #2를 좋아요한 사용자"닉네임"과 대상 사진의 "파일명"
SELECT
    users.nickname,
    photos.filename
FROM
    likes
JOIN users ON
    users.id = likes.user_id
JOIN photos ON
    photos.id = likes.photo_id
WHERE
    photos.id =2
;  

--모든 사진의 "파일명"을 조사하시오. 게시자가 있다면 "닉네임"도 함께 가져올것
SELECT
    photos.filename,
    users.nickname
FROM
    photos
LEFT JOIN users ON
    users.id=photos.user_id
;

--모든 댓글"내용"을 조회하시오. 단,댓글이 달린 사진의"파일명"도 함께 가져올것.
SELECT
    comments.body,
    photos.filename
FROM
    comments
LEFT JOIN photos ON
    photos.id = comments.photo_id
;  