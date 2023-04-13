--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
--LAST_DAY (마지막일) - 
SELECT LAST_DAY(HIREDATE)-HIREDATE
    FROM PROFESSOR;
    
--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT CEIL((LAST_DAY(SYSDATE) - HIREDATE)/7) 주
    FROM PROFESSOR;
    
--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT *
    FROM PROFESSOR
    WHERE HIREDATE >= TO_DATE(19910101)
        AND HIREDATE <= TO_DATE(19951231);
    
--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT SNAME
    , ROUND(AVR*(4/4.5),2)
    FROM STUDENT;
    
--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
SELECT ENAME
    , hdate
    , TRUNC (MONTHS_BETWEEN (SYSDATE, HDATE)/12) "년"
    , TRUNC (MOD(MONTHS_BETWEEN (SYSDATE, HDATE),12)) "개월"
    , TRUNC(SYSDATE - ADD_MONTHS(HDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)/12) * 12 
        + TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, HDATE), 12)))) "일"
    FROM EMP; 
