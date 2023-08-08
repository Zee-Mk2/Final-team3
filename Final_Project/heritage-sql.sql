DROP SCHEMA final_db;
CREATE SCHEMA final_db;
USE final_db;

-- drop table heritagestars;
select * from heribookmark;
select * from heritage;
select * from heritagestars;
select * from reply;

--------------- 테이블 생성 영역 -----------------

drop table reply;
create table reply(
rNo int primary key auto_increment,
hNo int,
mNo int,
NAME varchar(20),
CONTENT varchar(1000),
enrollDate datetime
);
select * from reply;



drop table heribookmark;
CREATE TABLE `heribookmark` (
	`mno`	INT,
	`hNo`	INT,
    FOREIGN KEY (mno) REFERENCES MEMBER(mno),
    FOREIGN KEY (hNo) REFERENCES HERITAGE(hNo)
);


DROP table HERITAGESTARS;
CREATE TABLE HERITAGESTARS(
	hno int,
    mno int,
    rating int,
    FOREIGN KEY (hno) REFERENCES HERITAGE(hno) ON DELETE CASCADE,
    FOREIGN KEY (mno) REFERENCES member(mno) ON DELETE CASCADE
);

----------------------------------------------
---------------- 쿼리 작업 영역 -----------------

select h.*, b.*, if(b.mno is not null ,'Y','N') as bookmark from heritage h 
LEFT OUTER JOIN heribookmark b ON(h.hNo = b.hNo)
where b.mno is null or b.mno = 1
order by h.hNo desc;



select h.*, b.*, if(b.mno is not null ,'Y','N') as bookmark from heritage h 
LEFT OUTER JOIN heribookmark b ON(h.hNo = b.hNo)
where b.mno is null or b.mno = 1
order by h.hNo desc;


SELECT H.*, IF(B.MNO IS NOT NULL ,'Y','N') AS BOOKMARK 
FROM HERITAGE H 
LEFT OUTER JOIN HERIBOOKMARK B ON(H.HNO = B.HNO)
WHERE 
 (B.MNO IS NULL OR B.MNO = 1)
	AND H.NAME LIKE '%의%' 
	ORDER BY H.HNO DESC	
LIMIT 10 OFFSET 0;


SELECT * FROM HeritageStars;
SELECT * FROM Heritage;
-- SUBQUERY
SELECT hNo, AVG(rating) AS average
	FROM HeritageStars
    GROUP BY hNo;
    
-- MAINQUERY
SELECT H.hNo, H.name, H.la, H.lo, HS.average
	FROM HERITAGE H
	LEFT JOIN (
		SELECT hNo, AVG(rating) AS average
		FROM HeritageStars
		GROUP BY hNo
    ) HS ON (H.hNo = HS.hNo);
SELECT * FROM Heritage;
SELECT * FROM heritagestars;
SELECT H.*, HS.average
	FROM HERITAGE H
	JOIN (
		SELECT hno, AVG(rating) AS average
			FROM HeritageStars
			GROUP BY hno
	) HS ON (H.hNo = HS.hno)
	WHERE 1=1
	AND H.hNo = 1257;
    
SELECT H.*, HS.average
	FROM HERITAGE H
	LEFT JOIN (
		SELECT hno, AVG(rating) AS average
			FROM HeritageStars
			GROUP BY hno
	) HS ON (H.hNo = HS.hno)
	WHERE 1=1
	AND H.hNo = 1123;


----------------------------------------------

insert into heribookmark values (1, 20729);


desc heribookmark;
select * from heribookmark;
select * from member;
select * from heritage;

SELECT * FROM heritagestars;

ALTER TABLE Member ADD reFileName VARCHAR(100);

SELECT H.*, HS.average FROM HERITAGE H
	INNER JOIN heribookmark HB ON (H.hno = HB.hno)
	LEFT JOIN (
		SELECT hno, AVG(rating) AS average
			FROM HeritageStars
			GROUP BY hno
	) HS ON (H.hNo = HS.hno)
	WHERE HB.mno = 1;

SELECT H.*, HS.average, IF(B.MNO = 2,'Y','N') AS BOOKMARK
	FROM HERITAGE H
	LEFT JOIN HERIBOOKMARK B ON(H.HNO = B.HNO)
	LEFT JOIN (
		SELECT hno, AVG(rating) AS average
			FROM HeritageStars
			GROUP BY hno
	) HS ON (H.hNo = HS.hno)
	WHERE 1=1
	AND H.hNo = 1257;
    
SELECT * FROM Heribookmark WHERE hno = 1257;



