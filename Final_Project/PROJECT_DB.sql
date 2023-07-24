DROP SCHEMA final_db;
CREATE SCHEMA final_db;
USE final_db;

------------------------------------------------
--------------- HERITAGE 관련 테이블 ------------------
------------------------------------------------


DROP TABLE HERITAGE;

CREATE TABLE HERITAGE (
	hNo INT PRIMARY KEY,
    KIND VARCHAR(100),
    NAME VARCHAR(100),
    NAME2 VARCHAR(100),
    KINDCODE VARCHAR(100),
    CITYCODE VARCHAR(100),
    CCBAASNO VARCHAR(100),
    LO DOUBLE,
    LA DOUBLE,
    GCODENAME VARCHAR(100),
    BCODENAME VARCHAR(100),
    MCODENAME VARCHAR(100),
    SCODENAME VARCHAR(100),
    ASDATE DATETIME,
    LOCATION VARCHAR(1000),
    ERA VARCHAR(100),
    IMG VARCHAR(3000),
    CONTENT VARCHAR(3000)
);

COMMIT;

SELECT * FROM HERITAGE;



------------------------------------------------
--------------- PRODUCT 관련 테이블 ------------------
------------------------------------------------


DROP TABLE PRODUCT;

CREATE TABLE PRODUCT (
    PRODUCTID VARCHAR(100) PRIMARY KEY,
    PRODUCTTYPE VARCHAR(100),
    TITLE VARCHAR(100),
    IMAGE VARCHAR(3000),
    LPRICE INT,
    CATEGORY1 VARCHAR(100),
    CATEGORY2 VARCHAR(100),
    CATEGORY3 VARCHAR(100),
    CATEGORY4 VARCHAR(100),
    MALLNAME VARCHAR(100)
);

COMMIT;

SELECT * FROM PRODUCT;

