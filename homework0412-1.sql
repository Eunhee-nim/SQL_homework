--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
SELECT AVR
    FROM STUDENT
    WHERE AVR
    BETWEEN '3.0' AND '4.0'
    ORDER BY AVR DESC;

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT SECTION,
       PNAME
    FROM PROFESSOR
    WHERE SECTION LIKE '화학';
    
--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT C.ST_NUM
      , C.CNAME
      ,  P.PNAME
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    WHERE ST_NUM LIKE '2';

--4) 정교수와 조교수를 검색하라(in)

SELECT *
    FROM PROFESSOR
    WHERE ORDERS IN ('정교수', '부교수');
    
--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
SELECT *
    FROM COURSE
    WHERE ST_NUM IN ('1', '2');
    
--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)

SELECT *
    FROM STUDENT
    WHERE SYEAR IN ('1','2')
    AND AVR BETWEEN '2.0' AND '3.0';

--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
SELECT *
    FROM STUDENT
    WHERE MAJOR IN ('화학', '물리')
    AND SYEAR IN ('1','2')
    ORDER BY AVR DESC;

--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
SELECT *
    FROM PROFESSOR
    WHERE HIREDATE < TO_DATE('1995-01-01', 'yyyy-MM-dd')
    AND ORDERS LIKE '정교수';
    

    
