-- 1. 데이터베이스 생성 (이미 있으면 생략)
--CREATE DATABASE hrd;

SELECT current_database();

-- 2. 테이블 생성
CREATE TABLE guestbook (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50)  NOT NULL,
    message TEXT         NOT NULL,
    reg_date TIMESTAMP   DEFAULT NOW()
);

-- 3. 테스트 데이터 (선택)
INSERT INTO guestbook (name, message)
VALUES ('선생님', '방명록 테스트입니다!');

select * from guestbook;
