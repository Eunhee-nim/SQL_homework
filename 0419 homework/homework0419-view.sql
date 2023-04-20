--뷰 이름은 자유
--1) 학생의 학점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW DOT_VIEW
    ( SNO, SNAME, AVR )
    AS ( SELECT SNO, SNAME, AVR * 4.5 / 4.0
        FROM STUDENT ) ;

--2) 각 과목별 평균 점수를 검색할 수 있는 뷰를 생성하세요.

CREATE VIEW AVG_VIEW
    ( CNAME
    , AVGRE )
        AS ( SELECT CNAME
                    , ROUND(AVG(RESULT),2) AS AVGRE
                    FROM COURSE
                    NATURAL JOIN SCORE
                    GROUP BY CNAME) ;
                    

--3) 각 사원과 관리자의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW EM_VIEW
    (  ENAME
        , MENAME ) AS ( SELECT E.ENAME AS ENAME
                                , D.ENAME AS MENAME
                            FROM EMP E, EMP D
                            WHERE E.ENO = D.MGR
                             );
  

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 
--해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW SCG_VIEW
    ( CNAME, GRADE, SNO, SNAME, RESULT )
        AS ( SELECT CNAME
                    , SG.GRADE AS GRADE
                    , SNO
                    , SNAME
                    , SC.RESULT AS RESULT
                    FROM COURSE
                    NATURAL JOIN SCORE SC
                    NATURAL JOIN STUDENT
                    JOIN SCGRADE SG
                    ON SC.RESULT BETWEEN LOSCORE AND HISCORE );

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.

CREATE VIEW PSC_VIEW
    ( PNAME , CNAME , SNO, SNAME )
        AS (SELECT PNAME 
                    , CNAME 
                    , SNO
                    , SNAME
                    FROM SCORE
                    NATURAL JOIN STUDENT
                    NATURAL JOIN COURSE
                    NATURAL JOIN PROFESSOR
                    WHERE SECTION = '물리' );