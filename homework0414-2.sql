--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR
    , ROUND (AVG(AVR),2)
    FROM STUDENT
    GROUP BY MAJOR
    HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR
    , ROUND (AVG(AVR),2)
    FROM STUDENT
    GROUP BY MAJOR
    HAVING MAJOR != '화학'
    AND AVG(AVR)>= 2.0;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT ROUND (AVG(RESULT),2)
    , ST. SNAME
    FROM SCORE SC
    JOIN STUDENT ST
    ON ST.SNO = SC.SNO
    GROUP BY SNAME
    HAVING AVG(RESULT)>= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT C.ST_NUM
    , P.*
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    WHERE ST_NUM >= 3.0;


--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요




--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT E.DNO
    , D.DNAME
    , COUNT (*)
    FROM EMP E
    JOIN DEPT D
    ON E.DNO = D.DNO
    GROUP BY E.DNO, D.DNAME
    HAVING COUNT (*) >=4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB
    ,ROUND (AVG(SAL),2) 
    FROM EMP
    GROUP BY JOB
    HAVING ROUND(AVG(SAL),2) >= 3000;
    
--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요

SELECT MAJOR
    , SYEAR
    , COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING  COUNT(*)>=5;