SQL전체복사

--테이블의 구조를 확인하기 위한 명령어이다
desc dept;

--테이블에 저장된 데이터를 조회하기 위한 명령어이다.
select * from dept;

desc emp;
select * from emp;

select * from salgrade;
select empno from emp;
select ename , sal, empno from emp;

select dname, loc from dept;

select * from emp where sal = 800;
select * from emp where sal = 950;
--사원테이블(emp)에서 급여 (SAL)가 3000 이상인 사원을 출력하는 쿼리문

select * from emp where sal >= 3000;
--사원테이블(emp)에서 급여 (SAL)가 3000 미만인 사원을 출력하는 쿼리문
select * from emp where sal < 3000;

--부서 번호(DEPTNO)가 20인 사원에 관한 정보만 출력하는 쿼리문
select * from emp where deptno = 20;

-- 이름(ENAME)이 FORD인 사람의 사번(empno), 이름(ename), 급여(SAL)를 출력하는 쿼리문

--문자, 날짜는 반드시 단일 따옴표 안에 표시해야 한다.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME = 'FORD';

desc emp;

--job clerk 인 사람을 조회 하시오.
SELECT * FROM EMP WHERE job = 'CLERK';

--1982년 1월 1일 이후에 입사한 사원을 출력하는 쿼리문
SELECT * FROM EMP WHERE hiredate >= '1982/01/01';
SELECT * FROM EMP WHERE hiredate >= '1982.01.01';

--   부서번호가 20번이 아닌 사워들을 뽑아 내시오.

select * from emp where deptno != 20;
select * from emp where deptno <> 20;
select * from emp where deptno ^= 20; 
select * from emp where not deptno = 20; 


select * from emp where deptno = 10 and job = 'MANAGER' ;
select * from emp where deptno = 10 or sal >= 2000 ;

select * from emp where job = 'MANAGER' or job = 'CLERK' ;

--급여가 2000~3000 사이의 사원을 검색하는 쿼리문
select * from emp where sal >= 2000 and sal <=3000 ;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- 급여가 2000 미만이거나 3000 초과인 사원을 검색하는 쿼리문
select * from emp where sal < 2000 or sal > 3000 ;
SELECT * FROM EMP WHERE SAL not BETWEEN 2000 AND 3000;

--1981년에 입사한 사원을 출력하는 쿼리문
SELECT * FROM EMP WHERE hiredate not BETWEEN '1981/01/01' AND '1981/12/31';

--부서번호 10번 , 20번인 사원
SELECT * FROM EMP WHERE deptno BETWEEN 10 AND 20;

--부서번호 10번 , 20번이 아닌 사원
SELECT * FROM EMP WHERE deptno not BETWEEN 10 AND 20;

--in
-- 커미션(COMM)이 300 혹은 500 혹은 1400인 사원이 있는지 검색하는 쿼리문
select * from emp where comm = 300 or comm = 500 or  comm = 1400;
select * from emp where comm in (300,500,1400);

--in
select * from emp where job in ('CLERK','MANAGER');
select * from emp where deptno in (10,20);

-- 예) 이름이 F로 시작하는 사람을 찾는 쿼리문

select * from emp where ename like 'F%';

--예) 위치 상관 없이 이름 중에 A가 들어있는 사람을 찾는 쿼리문
select * from emp where ename like '%A%';

--예) 이름이 N으로 끝나는 사람을 찾는 쿼리문
--특정 문자가 포함되기만 하고 그 이전이나 이후에 (어떤 문자가 몇 개가 오든지 상관없다)는 의미를 표현하기 위해서는 LIKE 연산자와 함께 사용한다

select * from emp where ename like '%N';

-- _ (언더바)
--예) 이름의 두 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '_A%';

--예) 이름의 세 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '__A%';

--예) 이름에 A를 포함하지 않는 사람만 검색하는 쿼리문

select * from emp where ename not like '%A%';

-- 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력하라.

select * from emp where ename like '%L%L%' and deptno = 30 ;
select * from emp where ename like '%L%L%' ;

-- NULL을 위한 연산자
--커미션(COMM)을 받지 않는 사원을 검색하는 쿼리문

select * from emp where comm is not null;

-- 정렬(order by)
--예) 사원들의 급여를 오름차순으로 정렬하는 쿼리문

select * from emp order by sal asc;
select * from emp order by sal desc;

--가장 최근에 입사한 사원부터 출력하는 쿼리문
select * from emp order by hiredate desc;
select * from emp order by comm desc;

-- 부서번호 30 번인 사람의 sal 내림차순 정렬 하시오.
select * from emp where deptno = 20 and sal >=2000 order by sal desc;
select * from emp where deptno = 20 order by job, sal;

--사원들이 소속되어 있는 부서의 번호를 출력하는 쿼리문
--동일한 데이터 값들이 중복되어 출력되지 않도록 사용한다.

select distinct deptno from emp;

--사원들이 job을 중복없이 출력하는 쿼리문
select  distinct job from emp;

--별칭 연산자
select ename as "이름 아" from emp;

-- 각사원의 연봉을 뽑아 내시오
select ename, sal *12 as "연봉" from emp;

--연결 연산자

--SELECT문 내부에 "||" 수직바를 사용해서 표현한다.
--기존의 컬럼내에 문자열을 추가하고자 할 떄 사용한다

SELECT ENAME || 'is a' ||JOB "연결정의 예" FROM EMP;

-- DUAL 테이블
-- 한 행으로 결과를 출력하기 위한 테이블이다
--산술 연산이나 가상 컬럼 등의 값을 한번만 출력하고 싶을 때 많이 사용한다.
select 24 *36 from dual;
select sysdate from dual;

-- 숫자 함수
-- 절대값(거리 )
select -10, abs(-10) from dual;

--FLOOR(소수점 아래를 버리는 함수이다.)
SELECT 34.5432, FLOOR(34.5432) FROM DUAL;

--ROUND(반올림 함수)
SELECT 34.5432, ROUND(34.5432) FROM DUAL;

SELECT 34.5432, ROUND(34.5432,2) FROM DUAL;
SELECT 34.5432, ROUND(34.5678,2) FROM DUAL;

SELECT 34.5678, ROUND(34.5678, -1) FROM DUAL;

--특정 자릿수에서 잘라내는 함수이다
--TRUNC
SELECT TRUNC(34.5678, 2),TRUNC(34.5678, -1), TRUNC(34.5678),TRUNC(34.5678,0) from dual;

-- MOD % 
SELECT MOD(27, 2), MOD(27, 5), MOD(27, 7) FROM DUAL;

--문자 처리 함수

SELECT 'Welcome to Oracle' as "적용전", UPPER('Welcome to Oracle') as "UPPER적용후" FROM DUAL;

SELECT 'Welcome to Oracle' as "적용전"  from dual;

--LOWER
--소문자로 변환하는 함수이다
SELECT 'Welcome to Oracle' "적용전", lower('Welcome to Oracle') "UPPER적용후" FROM DUAL;

--INITCAP
--이니셜만 대문자로 변환하는 함수이다.
SELECT 'Welcome to Oracle' "적용전", initcap('WECOME TO ORACLE') "UPPER적용후" FROM DUAL;

--LENGTH
--문자 길이를 구하는 함수이다.
SELECT LENGTH('Oracle'), LENGTH('오라클') FROM DUAL;

--LENGTHB
--바이트 수를 알려주는 함수이다.
SELECT LENGTHB('Oracle'), LENGTHB('오라클') FROM DUAL;

--INSTR
--특정 문자의 위치를 구하는 함수이다.
SELECT INSTR('Welcome To Oracle', 'W') FROM DUAL;

--SUBSTR : 대상 문자열이나 컬럼의 자료에서 시작 위치부터 선택 개수만큼의 문자를 추출한다.
SELECT SUBSTR('Welcome to Oracle', 4, 3) FROM DUAL;

-- 사원들의 입사일에서 입사 년도와 입사 달을 출력하는 쿼리문
SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 FROM EMP;

select ename, 19 || substr(hiredate,1,2) as 년도, substr(hiredate,4,2) as 달  
from  emp
where substr(hiredate,4,2) = '09';

select * from emp;

-- 9월에 입사한 사원을 출력하는 쿼리문

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)년도, SUBSTR(HIREDATE, 4, 2)달 FROM EMP WHERE SUBSTR(HIREDATE, 4, 2) = '09';

--LPAD/RPAD
SELECT LPAD('ORACLE', 20, '#') FROM DUAL;
SELECT LPAD('ORACLE', 20) FROM DUAL;

SELECT RPAD('ORACLE', 20, '#') FROM DUAL;
SELECT RPAD('ORACLE', 20) FROM DUAL;

--LTRIM/RTRIM
SELECT LTRIM('              ORACLE') FROM DUAL;
SELECT RTRIM('ORACLE              ') FROM DUAL;

SELECT TRIM('          ORACLE              ') FROM DUAL;
SELECT TRIM('A          ORACLE              B') FROM DUAL;

SELECT TRIM(   'a' FROM 'aaaaORACLEaaaaa'  ) FROM DUAL;

--날짜 함수
--SYSDATE
select sysdate from dual;
select sysdate -1 어제, sysdate 오늘, sysdate + 1 from dual;

--ADD_MONTHS
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4) FROM EMP;

--MONTHS_BETWEEN
--두 날짜 사이의 개월수를 구하는 함수이다.
select ename,TRUNC(months_between(sysdate,hiredate)) 근무개월수 from emp;

--해당 달의 마지막 날짜 반환 함수
select hiredate, last_day(hiredate) from emp;

--현재달의 마지막 날짜를 구하시오.
select last_day(sysdate) from dual;

--형변환 함수
--TO_CHAR
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 사원들의 입사일을 출력하되, YYYY-MM-DD 표현하시오.
select ename, TO_CHAR(hiredate, 'YYYY-MM-DD DAY') from emp;

--예) 현재 날짜와 시간을 출력하는 쿼리문

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') FROM DUAL;

--TO_Date 함수
--문자형을 날짜형으로 변환하는 함수이다.
--1981년 2월 20일에 입사한 사원을 검색하는 쿼리문


SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE='1981/02/20';
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220, 'YYYYMMDD');

--올해 며칠이 지났는지 현재 날짜에서 2016/01/01을 뺀 결과를 출력하는 쿼리문
select sysdate - to_date('2016/01/01','yyyy/mm/dd') from dual;

--TO_NUMBER
sELECT TO_NUMBER('20,000', '99,999')-TO_NUMBER('10,000', '99,999') FROM DUAL;

-- NVL = null value
select ename, (sal * 12) + nvl(comm,0) as "연봉" , nvl(comm,0) , comm from emp;

-- 사원 중에 매니저가 없는 사원의 매니저 번호를 0 으로 처리 하시오
select * from emp;
select ename,  nvl(mgr,0) from emp;

-- 선택을 위한 DECODE 함수 명령어
--여러가지 경우에 대해서 선택할 수 있도록 하는 기능을 제공한다.(SWITCH CASE문과 같은 기능이다.)

select deptno from emp order by deptno;
select deptno, decode(deptno,10,'A',20,'B','default') from emp order by deptno;

select ename, deptno, decode(deptno,10,'ACCONTING',20,'Research',30,'SALES') as 부서 from emp;

-- 조건에 따라 서로 다른 처리가 가능한 CASE 함수
-- CASE 함수
-- 중첩 'IF ELSE'와 유사한 구조이다.

select ename, deptno, 
            case when deptno = 10 then 'ACCOUNTING'
                   when deptno = 20 then 'RESEARCH'
                   when deptno = 30 then 'SALES'
            end as 부서
from emp;

-- 08. SQL 복수행 함수 - 그룹 함수

--(그룹함수) 하나 이상의 행을 그룹으로 묶어 연산하여, 하나의 결과를 나타내는 함수이다.
-- 사원의 총 급여를 구하는 쿼리문
SELECT SUM(SAL) FROM EMP;

--커미션(COMM) 총액을 구하는 쿼리문
--커미션(COMM)의 총합을 구한 결과가 NULL값으로 출력되지 않는 이유는 
--그룹 함수는 다른 연산자와는 달리 해당 컬럼 값이 NULL인 것은 제외하고 계산하기 때문이다.
SELECT SUM(COMM) FROM EMP;

--사원의 급여 평균을 구하는 쿼리문
SELECT avg(sal),   SUM(COMM) , sum(sal) FROM EMP;

-- 예) 가장 높은 급여와 가장 낮은 급여를 구하는 쿼리문
SELECT max(sal),   min(sal)  FROM EMP;

--COUNT

--전체사원의 수
--테이블에서 조건을 만족하는 행위 개수를 반환하는 함수이다.
select count(*) from emp;

--COUNT 함수에 특정 컬럼을 기술하는 경우 해당 컬럼 값을 갖고 있는 로우의 개수를 계산하여 반환한다.
--COUNT 함수는 NULL값에 대한 개수를 세지 않는다.
select count(comm) from emp;
select count(DISTINCT job) from emp;

-- GROUP BY 절

-- 사원 테이블을 부서 번호로 그룹 짓는 쿼리문
select * from emp order by deptno desc;

select DISTINCT deptno from emp;
select deptno from emp group by deptno order by deptno asc;

--소속 부서별 평균 급여를 구하는 쿼리문
sELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;

-- 예) 소속 부서별 급여 총액과 평균 급여를 구하는 쿼리문
sELECT sum(sal) ,AVG(SAL) FROM EMP GROUP BY DEPTNO;

-- 소속 부서별 최대 급여와 최소 급여를 구하는 쿼리문
sELECT DEPTNO , max(sal) ,min(SAL) FROM EMP GROUP BY DEPTNO;

-- 부서별 사원의 수와 커미션을 받는 사원의 수를 계산하는 쿼리문
sELECT deptno, count(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;

-- 그룹 지어진 부서별 평균 급여가 2000 이상인 부서의 번호와 부서별 평균 급여를 출력하는 쿼리문
select deptno, avg(sal) from emp group by deptno having avg(sal)>=2000;

--부서별 최대값과 최소값을 구하되, 최대 급여가 2900 이상인 부서만 출력하는 쿼리문
select deptno, min(sal),max(sal) from emp group by deptno having max(sal)>2900;

SELECT * FROM DEPT;
SELECT * FROM EMP;

-- 각사원의 소속된 부서 이름을 출력 하시오.
SELECT * FROM EMP, DEPT  order by ename;

--EQUI JOIN
--조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 조인 기법
SELECT ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

--이름이 ALLEN인 사람의 부서명을 출력해 보는 쿼리문
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';
SELECT ename, dname FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';

--"column ambiguously defined"
--조인시 주의 할점
SELECT ename, dname , dept.deptno FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';
--테이블에도 별칭을 줄수 있다.
SELECT ename, dname , d.deptno FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO and ename = 'ALLEN';

-- NON-EQUI JOIN(비등가 조인)
-- 각 사원의 급여가 몇 등급인지 살펴보는 쿼리문
select * from salgrade;
select * from emp, salgrade where sal BETWEEN losal AND hisal order by ename, grade;
select ename, sal ,grade from emp, salgrade where sal >= losal AND sal <= hisal order by ename, grade;

--SELF JOIN
--해당 사원의 메니져 이름이 나오게 하시오.
select * from emp e, emp m where e.mgr = m.empno;
select e.ename, m.ename as 메니져 from emp e, emp m where e.mgr = m.empno;
select e.ename || '의 메니져는' || m.ename as 메니져 from emp e, emp m where e.mgr = m.empno;

-- 조인 조건에 만족하지 않는 행도 나타내는 조인 기법이다.
-- 2개 이상의 테이블이 조인될 때, 
-- 어느 한쪽의 테이블에는 해당하는 데이터가 존재하는데 
-- 다른 쪽 테이블에는 데이터가 존재하지 않는 경우 그 데이터가 출력되지 않는 문제를 해결하기 위해서 사용되는 조인기법이다.

select e.ename, d.dname from emp e , dept d where e.deptno = d.deptno(+);

-- outer join
-- 없는쪽에 + 붙여준다
select * from emp e, dept d where e.deptno(+) = d.deptno;

select * from dept;

SELECT "사원".empno AS "사원ID"
             , "사원".ename AS "사원명"
             , nvl("관리자".ename, '관리자없음') AS "관리자명"
FROM  emp "사원", emp "관리자"
WHERE "사원".mgr = "관리자".empno(+);

--서브쿼리
--1) 단일행 서브 쿼리

-- SMITH 가 속한 부서의 이름.
select * from emp, dept where emp.deptno = dept.deptno and ename='SMITH' ;

select * 
from dept 
where deptno = (select deptno from emp where ename = 'SMITH');

--사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 쿼리문
select *
from emp 
where sal > (select avg(sal) from emp );

-- SMITH 보다 더 많은 급여를 받는 사원
select *
from emp 
where sal > (select sal from emp where ename='SMITH');

--2) 다중행 서브 쿼리
-- 연봉을 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 쿼리문
-- IN
select *
from emp
where deptno in ( 20,10);

-- Any
--부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(950)보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 쿼리문
select ename,sal from emp where sal > any (select sal from emp where deptno =30);
select ename,sal from emp where sal > (select min(sal) from emp where deptno =30);
-- (만족하는 값 하나만 있으면 됨)

select ename,sal from emp where sal < any (500,1200,3000);
select ename,sal from emp where sal < (select max(sal) from emp where deptno =30);
-- all
--30번 소속 사원들 중에서 급여를 가장 많이 받는 사우너보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하는 쿼리문
-- (만족하는 값 모두 )
SELECT ENAME, SAL FROM EMP WHERE SAL > 2850;

select dept.loc, sum(emp.sal) from emp, dept 
where emp.deptno(+) = dept.deptno
group by dept.loc;

-----DDL---- 
create table emp01(
    empno number(4),
    ename VARCHAR2(20),
    sal NUMBER(8,2)
);

desc emp01;

create table emp02 as select * from emp;

desc emp02;
select * from emp02;

create table emp03 as select empno, ename from emp;
select * from emp03;

--2) 테이블 구조를 변경하는 ALTER TABLE
--테이블에 대한 구조 변경은 컬럼의 추가, 수정, 삭제시 사용된다.

desc emp01;
alter table emp01 add (job varchar2(9));
alter table emp01 modify (job VARCHAR2(30));
alter table emp01 drop column job;

--3) 테이블 구조를 제거하는 DROP TABLE
drop table emp01;

desc emp01;

--4) 테이블의 모든 로우를 제거하는 TRUNCATE TABLE

desc emp02;
TRUNCATE table emp02;

select * from emp02;


create table emp05 as select * from emp;
rename emp05 to test;

desc test;



CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;

desc dept02; 
select *from dept02; 

insert into dept02(deptno,dname,loc)values(10,'ACCOUNTING','NEW YORK');
insert into dept02 values('RESEARCH','DALLAS',20);

commit; --영구저장
select *from dept02; 

CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;
insert into dept03 select * from dept; 
select * from dept03; 

drop table emp01; 
create table emp01 as select * from emp;
 
select *from emp01; 
--모든 사원의 부서 번호를 30번으로 수정 후 확인하는 쿼리문 
update emp01 set deptno=30; 
commit; 
--사원의 급여를 10% 인상시키는 UPDATE문을 만드는 쿼리문 
update emp01 set sal=sal*1.1; 
--모든 입사일을 오늘로 수정하는 쿼리문
update emp01 set hiredate=sysdate;

--부서 번호가 10번인 사원의 부서 번호를 40번으로 수정하고 확인하는 쿼리문 
update emp01 set deptno=40 where deptno=10; 

--JOB 컬럼값이 MANAGER인 경우, 급여를 10% 인상하는 쿼리문
update emp01 set sal=sal*1.1 where job='MANAGER';

--1981년에 입사한 사원의 입사일을 오늘로 수정하는 쿼리문
UPDATE emp01 SET hiredate = sysdate WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';
-- 또는 
update emp01 set hiredate = sysdate where  substr(hiredate,1,2)='81';

--테이블에서 2개  이상의 컬럼값

--SMITH 사원의 부서번호는 20번으로, JOB컬럼값은 MANAGER로 한꺼번에 수정하는 쿼리문
update emp01 set deptno=20,job='MANAGER'where ename = 'SMITH';

--ALLEN사원의 입사 날짜는 오늘로, 급여는 50으로, 커미션은 4000으로 수정하는 쿼리문
update emp01 set hiredate=sysdate,sal=50,comm=4000 where ename='ALLEN';

--20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용한 쿼리문 
select * from dept02; 
update dept02 set loc = (select loc from dept where deptno =40)
where deptno =20; 

--Delete
DROP TABLE DEPT01; 
CREATE TABLE DEPT01 AS SELECT * FROM DEPT; 

select *from dept01; 
--delete from dept01;

--30번 부서를 삭제한 후 부서 테이블을 확인하는 쿼리문 
delete from dept01 where deptno = 30;

--emp01에서 삭제 
--서브 쿼리문으로 부서명이 SALES인 부서의 번호부터 알아낸 뒤 SALES 부서 소속의 사원을 삭제하는 쿼리문 
delete from emp01 where deptno=(select deptno from dept where dname='SALES'); 
select*from emp01; 

--트랜젝션
drop table DEPT01; 
create table dept01 as select *from DEPT; 

delete from  DEPT01;
select *from dept01; 

rollback;
delete from dept01 where deptno= 20;
commit;
rollback;
--COMMIT을 수행하여 영구저장 했으므로 
--ROLLBACK을 해도 특정 로우를 삭제하기 이전의 이전 상태로 되돌릴 수 없다. 

select *from dept;

insert into dept values(10,'Test','Test');

create table board(
 bid number(4) primary key
);
desc board;

insert into board values(1); 
insert into board values(2); 


drop table emp02;
CREATE TABLE EMP02(
    EMPNO NUMBER(4) NOT NULL, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

insert into emp02(empno,ename,job,deptno)values(NULL,null,'SALES','20');
insert into emp02(empno,ename,job,deptno)values(1,'홍길동',null,null);    


select*from emp03;

CREATE TABLE EMP03(
    EMPNO NUMBER(4)UNIQUE, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

insert into emp03(empno,ename,job,deptno)values(1,'홍길동','SALES','20');
insert into emp03(empno,ename,job,deptno)values(1,'홍길동',null,null);  
insert into emp03(empno,ename,job,deptno)values(null,'홍길동',null,null); 


select * from emp04;

CREATE TABLE EMP04(
    EMPNO NUMBER(4)PRIMARY KEY, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

insert into emp04(empno,ename,job,deptno)values(null,'홍길동',null,null);

--CHECK
drop table emp05;
select * from emp05;

CREATE TABLE EMP05(
    EMPNO NUMBER(4)PRIMARY KEY, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2),
    constraint empno_CK check(empno>=50)
);

insert into emp05(empno,ename,job,deptno)values(50,'홍길동',null,null);

--또는 

CREATE TABLE EMP05(
    EMPNO NUMBER(4)constraint emp05_emptno_pk PRIMARY KEY, 
    ENAME VARCHAR2(10) constraint emp05_ename_nn NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2),
    constraint empno_CK check(empno>=50)
);

insert into emp05(empno,ename,job,deptno)values(50,'홍길동',null,null);

insert into emp(empno, ename, deptno)values(8000,'홍길동',50);

drop table emp06;

CREATE TABLE EMP06(
    EMPNO NUMBER(4)constraint emp05_emptno_pk PRIMARY KEY, 
    ENAME VARCHAR2(10) constraint emp05_ename_nn NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2) constraint emp06_deptno_FK references dept(deptno)
);

insert into emp06(empno,ename,job,deptno)values(50,'홍길동',null,50);
insert into emp06(empno,ename,job,deptno)values(50,'홍길동',null,40);
select *from emp06;



--50제 
select*from dept;

select job, empno, ename, hiredate from emp;

select distinct job from emp;

select ename,sal from emp where sal>2850;

select ename,deptno from emp where empno=7566;

select ename,sal from emp where sal not between 1500 and 2850;

select ename,job,hiredate from emp where hiredate between '1981/02/20' and '1981/5/1' order by hiredate asc;

select ename, deptno from emp where deptno in(10, 30) order by ename;

select ename as "employee", sal as "montly salary" from emp where deptno in(10, 30)  and sal>=1500;

select ename,job from emp where mgr is null;

select ename,sal,comm from emp where comm is not null order by sal desc;

select ename from emp where ename like '__A%';

select ename from emp where ename like '%L%L%' and deptno=30;

select ename, job, sal from emp where job in('CLERK','ANALYST')and sal not in(1000,3000,5000); 

select empno, ename, sal, ROUND (sal+(sal*0.15))as  "New Salary" from emp;

select upper(substr(ename,1,1))||lower(substr(ename,2,length(ename))) as "NAME", length(ename) as "LENENAME" from emp; 

select ename,NVL(to_char(comm),'no commission') from emp; 

select e.ename, e.deptno, d.dname from emp e, dept d where e.deptno=d.deptno and e.deptno=30; 

select distinct e.job, d.loc from emp e, dept d where e.deptno = d.deptno and d.deptno=30;

select e.ename, d.dname,d.loc from emp e, dept d where e.deptno=d.deptno and comm is not null;

select e.ename, d.dname from emp e, dept d where e.deptno=d.deptno and e.ename like '%A%';
select* from emp, dept where emp.deptno=dept.deptno and emp.ename like '%A%';

select  e.ename, e.job,e.deptno,d.dname from emp e,dept d where e.deptno=d.deptno and d.loc='Dallas';

select e.ename as "employee",e.empno as "emp#", m.ename as "manager",m.empno as "mgr#" from emp e, emp m where e.mgr=m.empno;

SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE FROM EMP E, DEPT D, SALGRADE S WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
 
 
select ename, hiredate from emp where hiredate>(select hiredate from emp where ename='SMITH');


select  max(sal) as "Maximum",min(sal) as "Minimum",sum(sal)as "Sum",avg(sal)as "Average" from emp;

select job, max(sal),min(sal), sum(sal),avg(sal) from emp group by job;

select job, count(job) from emp group by job;

select count (distinct (mgr))as "Number of manager" from emp;

select max(sal)-min(sal) from emp;





