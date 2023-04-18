--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 
--일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)
WITH 
    FP AS (SELECT * FROM PROFESSOR WHERE ORDERS LIKE '정교수')
    , OG AS (SELECT * FROM COURSE WHERE CNAME LIKE '%일반%')

SELECT OG.CNO
      , OG.CNAME
      , FP.PNO
      , FP.PNAME
      FROM OG, FP
      WHERE OG.PNO = FP.PNO;
      GROUP BY OG.CNO, OG.CNAME, FP.PNO, FP.PNAME;
    

--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 
--보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.

WITH 
    THR AS (SELECT * FROM EMP WHERE SAL >= 3000),
    BO AS (SELECT * FROM EMP WHERE COMM >= 500)

SELECT DISTINCT *
    FROM THR, BO
    WHERE THR.ENAME = BO.ENAME;
    

--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 
--학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.
WITH 
    GOOD AS (SELECT * FROM STUDENT WHERE AVR >= 3.3),
    AVRES AS (SELECT SNO, ROUND (AVG(RESULT),2) AS AVGRE FROM SCORE GROUP BY SNO)
    
SELECT GOOD.SNAME
    , GOOD.AVR
    , AVRES.AVGRE
    FROM GOOD, AVRES
    WHERE GOOD.SNO=AVRES.SNO
    GROUP BY GOOD.SNAME, GOOD.AVR, AVRES.AVGRE ;

--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 
--과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을 갖는 가상테이블 하나를 생성하여 
--  기말고사 성적이 90이상인 
--과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.

WITH
    OP AS (SELECT * FROM PROFESSOR WHERE 
            TO_CHAR (SYSDATE, 'YYYY') - TO_CHAR (HIREDATE, 'YYYY')>= 25),
    SCHOOL AS (SELECT SC.CNO AS SCNO, C.CNAME AS SCNAME, ST.SNO AS SSNO, 
                ST.SNAME AS SSNAME, C.PNO AS SPNO, SC.RESULT AS SRESULT
                    FROM SCORE SC
                    JOIN COURSE C
                    ON SC.CNO = C.CNO
                    JOIN STUDENT ST
                    ON ST.SNO = SC.SNO)
                    
SELECT SCHOOL.SCNO
    , SCHOOL.SCNAME
    , SCHOOL.SSNO
    , SCHOOL.SSNAME
    , OP.PNO
    , OP.PNAME
    , SCHOOL.SRESULT
    FROM OP, SCHOOL
    WHERE OP.PNO = SCHOOL.SPNO
    GROUP BY SCHOOL.SCNO, SCHOOL.SCNAME, SCHOOL.SSNO, SCHOOL.SSNAME
    , OP.PNO, OP.PNAME, SCHOOL.SRESULT
    HAVING SCHOOL.SRESULT>= 90;
