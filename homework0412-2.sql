--1) 송강 교수가 강의하는 과목을 검색한다
SELECT SECTION
    FROM PROFESSOR
    WHERE PNAME LIKE '송강';

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT PNAME
    FROM PROFESSOR
    WHERE SECTION LIKE '화학';
    
--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT C.ST_NUM
    , C.CNAME
    , P.PNAME
    FROM COURSE C
    JOIN PROFESSOR P
    ON P.PNO = C.PNO
    WHERE ST_NUM LIKE '2';
    
--4) 화학과 교수가 강의하는 과목을 검색한다
    
SELECT P.SECTION
    , C.CNAME
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    WHERE SECTION LIKE '화학';
   
--5) 화학과 1학년 학생의 기말고사 성적을 검색한다

SELECT SC.RESULT
    , ST.SYEAR
    , ST.MAJOR
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    WHERE MAJOR LIKE '화학'
    AND SYEAR LIKE '1'
    ORDER BY RESULT DESC;
    
 --6) 일반화학 과목의 기말고사 점수를 검색한다
 SELECT C.CNAME
    , SC.RESULT
    FROM COURSE C
    JOIN SCORE SC
    ON C.CNO = SC.CNO
    WHERE CNAME LIKE '일반화학';
 
--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다

SELECT SC.RESULT
    , ST.SYEAR
    , ST.MAJOR
    , C.CNAME
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    JOIN COURSE C
    ON SC.CNO = C.CNO
    WHERE MAJOR LIKE '화학'
    AND SYEAR LIKE '1'
    AND CNAME LIKE '일반화학';

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다

SELECT ST.SYEAR
    , ST.MAJOR
    , C.CNAME
    , SC.CNO
    FROM COURSE C
    JOIN SCORE SC
    ON C.CNO = SC.CNO
    JOIN STUDENT ST
    ON ST.SNO = SC.SNO
    WHERE MAJOR LIKE '화학'
    AND SYEAR LIKE '1';

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT ST.SNAME
    , SG.GRADE
    , C.CNAME
    FROM COURSE C
    CROSS JOIN SCGRADE SG
    CROSS JOIN STUDENT ST
    WHERE C.CNAME LIKE '유기화학'
    AND SG.GRADE LIKE 'F';
    
    
