SQL��ü����

--���̺��� ������ Ȯ���ϱ� ���� ��ɾ��̴�
desc dept;

--���̺� ����� �����͸� ��ȸ�ϱ� ���� ��ɾ��̴�.
select * from dept;

desc emp;
select * from emp;

select * from salgrade;
select empno from emp;
select ename , sal, empno from emp;

select dname, loc from dept;

select * from emp where sal = 800;
select * from emp where sal = 950;
--������̺�(emp)���� �޿� (SAL)�� 3000 �̻��� ����� ����ϴ� ������

select * from emp where sal >= 3000;
--������̺�(emp)���� �޿� (SAL)�� 3000 �̸��� ����� ����ϴ� ������
select * from emp where sal < 3000;

--�μ� ��ȣ(DEPTNO)�� 20�� ����� ���� ������ ����ϴ� ������
select * from emp where deptno = 20;

-- �̸�(ENAME)�� FORD�� ����� ���(empno), �̸�(ename), �޿�(SAL)�� ����ϴ� ������

--����, ��¥�� �ݵ�� ���� ����ǥ �ȿ� ǥ���ؾ� �Ѵ�.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME = 'FORD';

desc emp;

--job clerk �� ����� ��ȸ �Ͻÿ�.
SELECT * FROM EMP WHERE job = 'CLERK';

--1982�� 1�� 1�� ���Ŀ� �Ի��� ����� ����ϴ� ������
SELECT * FROM EMP WHERE hiredate >= '1982/01/01';
SELECT * FROM EMP WHERE hiredate >= '1982.01.01';

--   �μ���ȣ�� 20���� �ƴ� ������� �̾� ���ÿ�.

select * from emp where deptno != 20;
select * from emp where deptno <> 20;
select * from emp where deptno ^= 20; 
select * from emp where not deptno = 20; 


select * from emp where deptno = 10 and job = 'MANAGER' ;
select * from emp where deptno = 10 or sal >= 2000 ;

select * from emp where job = 'MANAGER' or job = 'CLERK' ;

--�޿��� 2000~3000 ������ ����� �˻��ϴ� ������
select * from emp where sal >= 2000 and sal <=3000 ;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- �޿��� 2000 �̸��̰ų� 3000 �ʰ��� ����� �˻��ϴ� ������
select * from emp where sal < 2000 or sal > 3000 ;
SELECT * FROM EMP WHERE SAL not BETWEEN 2000 AND 3000;

--1981�⿡ �Ի��� ����� ����ϴ� ������
SELECT * FROM EMP WHERE hiredate not BETWEEN '1981/01/01' AND '1981/12/31';

--�μ���ȣ 10�� , 20���� ���
SELECT * FROM EMP WHERE deptno BETWEEN 10 AND 20;

--�μ���ȣ 10�� , 20���� �ƴ� ���
SELECT * FROM EMP WHERE deptno not BETWEEN 10 AND 20;

--in
-- Ŀ�̼�(COMM)�� 300 Ȥ�� 500 Ȥ�� 1400�� ����� �ִ��� �˻��ϴ� ������
select * from emp where comm = 300 or comm = 500 or  comm = 1400;
select * from emp where comm in (300,500,1400);

--in
select * from emp where job in ('CLERK','MANAGER');
select * from emp where deptno in (10,20);

-- ��) �̸��� F�� �����ϴ� ����� ã�� ������

select * from emp where ename like 'F%';

--��) ��ġ ��� ���� �̸� �߿� A�� ����ִ� ����� ã�� ������
select * from emp where ename like '%A%';

--��) �̸��� N���� ������ ����� ã�� ������
--Ư�� ���ڰ� ���ԵǱ⸸ �ϰ� �� �����̳� ���Ŀ� (� ���ڰ� �� ���� ������ �������)�� �ǹ̸� ǥ���ϱ� ���ؼ��� LIKE �����ڿ� �Բ� ����Ѵ�

select * from emp where ename like '%N';

-- _ (�����)
--��) �̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '_A%';

--��) �̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '__A%';

--��) �̸��� A�� �������� �ʴ� ����� �˻��ϴ� ������

select * from emp where ename not like '%A%';

-- �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.

select * from emp where ename like '%L%L%' and deptno = 30 ;
select * from emp where ename like '%L%L%' ;

-- NULL�� ���� ������
--Ŀ�̼�(COMM)�� ���� �ʴ� ����� �˻��ϴ� ������

select * from emp where comm is not null;

-- ����(order by)
--��) ������� �޿��� ������������ �����ϴ� ������

select * from emp order by sal asc;
select * from emp order by sal desc;

--���� �ֱٿ� �Ի��� ������� ����ϴ� ������
select * from emp order by hiredate desc;
select * from emp order by comm desc;

-- �μ���ȣ 30 ���� ����� sal �������� ���� �Ͻÿ�.
select * from emp where deptno = 20 and sal >=2000 order by sal desc;
select * from emp where deptno = 20 order by job, sal;

--������� �ҼӵǾ� �ִ� �μ��� ��ȣ�� ����ϴ� ������
--������ ������ ������ �ߺ��Ǿ� ��µ��� �ʵ��� ����Ѵ�.

select distinct deptno from emp;

--������� job�� �ߺ����� ����ϴ� ������
select  distinct job from emp;

--��Ī ������
select ename as "�̸� ��" from emp;

-- ������� ������ �̾� ���ÿ�
select ename, sal *12 as "����" from emp;

--���� ������

--SELECT�� ���ο� "||" �����ٸ� ����ؼ� ǥ���Ѵ�.
--������ �÷����� ���ڿ��� �߰��ϰ��� �� �� ����Ѵ�

SELECT ENAME || 'is a' ||JOB "�������� ��" FROM EMP;

-- DUAL ���̺�
-- �� ������ ����� ����ϱ� ���� ���̺��̴�
--��� �����̳� ���� �÷� ���� ���� �ѹ��� ����ϰ� ���� �� ���� ����Ѵ�.
select 24 *36 from dual;
select sysdate from dual;

-- ���� �Լ�
-- ���밪(�Ÿ� )
select -10, abs(-10) from dual;

--FLOOR(�Ҽ��� �Ʒ��� ������ �Լ��̴�.)
SELECT 34.5432, FLOOR(34.5432) FROM DUAL;

--ROUND(�ݿø� �Լ�)
SELECT 34.5432, ROUND(34.5432) FROM DUAL;

SELECT 34.5432, ROUND(34.5432,2) FROM DUAL;
SELECT 34.5432, ROUND(34.5678,2) FROM DUAL;

SELECT 34.5678, ROUND(34.5678, -1) FROM DUAL;

--Ư�� �ڸ������� �߶󳻴� �Լ��̴�
--TRUNC
SELECT TRUNC(34.5678, 2),TRUNC(34.5678, -1), TRUNC(34.5678),TRUNC(34.5678,0) from dual;

-- MOD % 
SELECT MOD(27, 2), MOD(27, 5), MOD(27, 7) FROM DUAL;

--���� ó�� �Լ�

SELECT 'Welcome to Oracle' as "������", UPPER('Welcome to Oracle') as "UPPER������" FROM DUAL;

SELECT 'Welcome to Oracle' as "������"  from dual;

--LOWER
--�ҹ��ڷ� ��ȯ�ϴ� �Լ��̴�
SELECT 'Welcome to Oracle' "������", lower('Welcome to Oracle') "UPPER������" FROM DUAL;

--INITCAP
--�̴ϼȸ� �빮�ڷ� ��ȯ�ϴ� �Լ��̴�.
SELECT 'Welcome to Oracle' "������", initcap('WECOME TO ORACLE') "UPPER������" FROM DUAL;

--LENGTH
--���� ���̸� ���ϴ� �Լ��̴�.
SELECT LENGTH('Oracle'), LENGTH('����Ŭ') FROM DUAL;

--LENGTHB
--����Ʈ ���� �˷��ִ� �Լ��̴�.
SELECT LENGTHB('Oracle'), LENGTHB('����Ŭ') FROM DUAL;

--INSTR
--Ư�� ������ ��ġ�� ���ϴ� �Լ��̴�.
SELECT INSTR('Welcome To Oracle', 'W') FROM DUAL;

--SUBSTR : ��� ���ڿ��̳� �÷��� �ڷῡ�� ���� ��ġ���� ���� ������ŭ�� ���ڸ� �����Ѵ�.
SELECT SUBSTR('Welcome to Oracle', 4, 3) FROM DUAL;

-- ������� �Ի��Ͽ��� �Ի� �⵵�� �Ի� ���� ����ϴ� ������
SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)�⵵, SUBSTR(HIREDATE, 4, 2)�� FROM EMP;

select ename, 19 || substr(hiredate,1,2) as �⵵, substr(hiredate,4,2) as ��  
from  emp
where substr(hiredate,4,2) = '09';

select * from emp;

-- 9���� �Ի��� ����� ����ϴ� ������

SELECT ENAME, 19||SUBSTR(HIREDATE, 1, 2)�⵵, SUBSTR(HIREDATE, 4, 2)�� FROM EMP WHERE SUBSTR(HIREDATE, 4, 2) = '09';

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

--��¥ �Լ�
--SYSDATE
select sysdate from dual;
select sysdate -1 ����, sysdate ����, sysdate + 1 from dual;

--ADD_MONTHS
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4) FROM EMP;

--MONTHS_BETWEEN
--�� ��¥ ������ �������� ���ϴ� �Լ��̴�.
select ename,TRUNC(months_between(sysdate,hiredate)) �ٹ������� from emp;

--�ش� ���� ������ ��¥ ��ȯ �Լ�
select hiredate, last_day(hiredate) from emp;

--������� ������ ��¥�� ���Ͻÿ�.
select last_day(sysdate) from dual;

--����ȯ �Լ�
--TO_CHAR
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- ������� �Ի����� ����ϵ�, YYYY-MM-DD ǥ���Ͻÿ�.
select ename, TO_CHAR(hiredate, 'YYYY-MM-DD DAY') from emp;

--��) ���� ��¥�� �ð��� ����ϴ� ������

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') FROM DUAL;

--TO_Date �Լ�
--�������� ��¥������ ��ȯ�ϴ� �Լ��̴�.
--1981�� 2�� 20�Ͽ� �Ի��� ����� �˻��ϴ� ������


SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE='1981/02/20';
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220, 'YYYYMMDD');

--���� ��ĥ�� �������� ���� ��¥���� 2016/01/01�� �� ����� ����ϴ� ������
select sysdate - to_date('2016/01/01','yyyy/mm/dd') from dual;

--TO_NUMBER
sELECT TO_NUMBER('20,000', '99,999')-TO_NUMBER('10,000', '99,999') FROM DUAL;

-- NVL = null value
select ename, (sal * 12) + nvl(comm,0) as "����" , nvl(comm,0) , comm from emp;

-- ��� �߿� �Ŵ����� ���� ����� �Ŵ��� ��ȣ�� 0 ���� ó�� �Ͻÿ�
select * from emp;
select ename,  nvl(mgr,0) from emp;

-- ������ ���� DECODE �Լ� ��ɾ�
--�������� ��쿡 ���ؼ� ������ �� �ֵ��� �ϴ� ����� �����Ѵ�.(SWITCH CASE���� ���� ����̴�.)

select deptno from emp order by deptno;
select deptno, decode(deptno,10,'A',20,'B','default') from emp order by deptno;

select ename, deptno, decode(deptno,10,'ACCONTING',20,'Research',30,'SALES') as �μ� from emp;

-- ���ǿ� ���� ���� �ٸ� ó���� ������ CASE �Լ�
-- CASE �Լ�
-- ��ø 'IF ELSE'�� ������ �����̴�.

select ename, deptno, 
            case when deptno = 10 then 'ACCOUNTING'
                   when deptno = 20 then 'RESEARCH'
                   when deptno = 30 then 'SALES'
            end as �μ�
from emp;

-- 08. SQL ������ �Լ� - �׷� �Լ�

--(�׷��Լ�) �ϳ� �̻��� ���� �׷����� ���� �����Ͽ�, �ϳ��� ����� ��Ÿ���� �Լ��̴�.
-- ����� �� �޿��� ���ϴ� ������
SELECT SUM(SAL) FROM EMP;

--Ŀ�̼�(COMM) �Ѿ��� ���ϴ� ������
--Ŀ�̼�(COMM)�� ������ ���� ����� NULL������ ��µ��� �ʴ� ������ 
--�׷� �Լ��� �ٸ� �����ڿʹ� �޸� �ش� �÷� ���� NULL�� ���� �����ϰ� ����ϱ� �����̴�.
SELECT SUM(COMM) FROM EMP;

--����� �޿� ����� ���ϴ� ������
SELECT avg(sal),   SUM(COMM) , sum(sal) FROM EMP;

-- ��) ���� ���� �޿��� ���� ���� �޿��� ���ϴ� ������
SELECT max(sal),   min(sal)  FROM EMP;

--COUNT

--��ü����� ��
--���̺��� ������ �����ϴ� ���� ������ ��ȯ�ϴ� �Լ��̴�.
select count(*) from emp;

--COUNT �Լ��� Ư�� �÷��� ����ϴ� ��� �ش� �÷� ���� ���� �ִ� �ο��� ������ ����Ͽ� ��ȯ�Ѵ�.
--COUNT �Լ��� NULL���� ���� ������ ���� �ʴ´�.
select count(comm) from emp;
select count(DISTINCT job) from emp;

-- GROUP BY ��

-- ��� ���̺��� �μ� ��ȣ�� �׷� ���� ������
select * from emp order by deptno desc;

select DISTINCT deptno from emp;
select deptno from emp group by deptno order by deptno asc;

--�Ҽ� �μ��� ��� �޿��� ���ϴ� ������
sELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;

-- ��) �Ҽ� �μ��� �޿� �Ѿװ� ��� �޿��� ���ϴ� ������
sELECT sum(sal) ,AVG(SAL) FROM EMP GROUP BY DEPTNO;

-- �Ҽ� �μ��� �ִ� �޿��� �ּ� �޿��� ���ϴ� ������
sELECT DEPTNO , max(sal) ,min(SAL) FROM EMP GROUP BY DEPTNO;

-- �μ��� ����� ���� Ŀ�̼��� �޴� ����� ���� ����ϴ� ������
sELECT deptno, count(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;

-- �׷� ������ �μ��� ��� �޿��� 2000 �̻��� �μ��� ��ȣ�� �μ��� ��� �޿��� ����ϴ� ������
select deptno, avg(sal) from emp group by deptno having avg(sal)>=2000;

--�μ��� �ִ밪�� �ּҰ��� ���ϵ�, �ִ� �޿��� 2900 �̻��� �μ��� ����ϴ� ������
select deptno, min(sal),max(sal) from emp group by deptno having max(sal)>2900;

SELECT * FROM DEPT;
SELECT * FROM EMP;

-- ������� �Ҽӵ� �μ� �̸��� ��� �Ͻÿ�.
SELECT * FROM EMP, DEPT  order by ename;

--EQUI JOIN
--���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ���� ���
SELECT ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

--�̸��� ALLEN�� ����� �μ����� ����� ���� ������
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';
SELECT ename, dname FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';

--"column ambiguously defined"
--���ν� ���� ����
SELECT ename, dname , dept.deptno FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO and ename = 'ALLEN';
--���̺��� ��Ī�� �ټ� �ִ�.
SELECT ename, dname , d.deptno FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO and ename = 'ALLEN';

-- NON-EQUI JOIN(�� ����)
-- �� ����� �޿��� �� ������� ���캸�� ������
select * from salgrade;
select * from emp, salgrade where sal BETWEEN losal AND hisal order by ename, grade;
select ename, sal ,grade from emp, salgrade where sal >= losal AND sal <= hisal order by ename, grade;

--SELF JOIN
--�ش� ����� �޴��� �̸��� ������ �Ͻÿ�.
select * from emp e, emp m where e.mgr = m.empno;
select e.ename, m.ename as �޴��� from emp e, emp m where e.mgr = m.empno;
select e.ename || '�� �޴�����' || m.ename as �޴��� from emp e, emp m where e.mgr = m.empno;

-- ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ���� ���� ����̴�.
-- 2�� �̻��� ���̺��� ���ε� ��, 
-- ��� ������ ���̺��� �ش��ϴ� �����Ͱ� �����ϴµ� 
-- �ٸ� �� ���̺��� �����Ͱ� �������� �ʴ� ��� �� �����Ͱ� ��µ��� �ʴ� ������ �ذ��ϱ� ���ؼ� ���Ǵ� ���α���̴�.

select e.ename, d.dname from emp e , dept d where e.deptno = d.deptno(+);

-- outer join
-- �����ʿ� + �ٿ��ش�
select * from emp e, dept d where e.deptno(+) = d.deptno;

select * from dept;

SELECT "���".empno AS "���ID"
             , "���".ename AS "�����"
             , nvl("������".ename, '�����ھ���') AS "�����ڸ�"
FROM  emp "���", emp "������"
WHERE "���".mgr = "������".empno(+);

--��������
--1) ������ ���� ����

-- SMITH �� ���� �μ��� �̸�.
select * from emp, dept where emp.deptno = dept.deptno and ename='SMITH' ;

select * 
from dept 
where deptno = (select deptno from emp where ename = 'SMITH');

--������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ������
select *
from emp 
where sal > (select avg(sal) from emp );

-- SMITH ���� �� ���� �޿��� �޴� ���
select *
from emp 
where sal > (select sal from emp where ename='SMITH');

--2) ������ ���� ����
-- ������ 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� ������
-- IN
select *
from emp
where deptno in ( 20,10);

-- Any
--�μ� ��ȣ�� 30���� ������� �޿� �� ���� ���� ��(950)���� ���� �޿��� �޴� ����� �̸�, �޿��� ����ϴ� ������
select ename,sal from emp where sal > any (select sal from emp where deptno =30);
select ename,sal from emp where sal > (select min(sal) from emp where deptno =30);
-- (�����ϴ� �� �ϳ��� ������ ��)

select ename,sal from emp where sal < any (500,1200,3000);
select ename,sal from emp where sal < (select max(sal) from emp where deptno =30);
-- all
--30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ���ʺ��� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϴ� ������
-- (�����ϴ� �� ��� )
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

--2) ���̺� ������ �����ϴ� ALTER TABLE
--���̺� ���� ���� ������ �÷��� �߰�, ����, ������ ���ȴ�.

desc emp01;
alter table emp01 add (job varchar2(9));
alter table emp01 modify (job VARCHAR2(30));
alter table emp01 drop column job;

--3) ���̺� ������ �����ϴ� DROP TABLE
drop table emp01;

desc emp01;

--4) ���̺��� ��� �ο츦 �����ϴ� TRUNCATE TABLE

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

commit; --��������
select *from dept02; 

CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;
insert into dept03 select * from dept; 
select * from dept03; 

drop table emp01; 
create table emp01 as select * from emp;
 
select *from emp01; 
--��� ����� �μ� ��ȣ�� 30������ ���� �� Ȯ���ϴ� ������ 
update emp01 set deptno=30; 
commit; 
--����� �޿��� 10% �λ��Ű�� UPDATE���� ����� ������ 
update emp01 set sal=sal*1.1; 
--��� �Ի����� ���÷� �����ϴ� ������
update emp01 set hiredate=sysdate;

--�μ� ��ȣ�� 10���� ����� �μ� ��ȣ�� 40������ �����ϰ� Ȯ���ϴ� ������ 
update emp01 set deptno=40 where deptno=10; 

--JOB �÷����� MANAGER�� ���, �޿��� 10% �λ��ϴ� ������
update emp01 set sal=sal*1.1 where job='MANAGER';

--1981�⿡ �Ի��� ����� �Ի����� ���÷� �����ϴ� ������
UPDATE emp01 SET hiredate = sysdate WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';
-- �Ǵ� 
update emp01 set hiredate = sysdate where  substr(hiredate,1,2)='81';

--���̺��� 2��  �̻��� �÷���

--SMITH ����� �μ���ȣ�� 20������, JOB�÷����� MANAGER�� �Ѳ����� �����ϴ� ������
update emp01 set deptno=20,job='MANAGER'where ename = 'SMITH';

--ALLEN����� �Ի� ��¥�� ���÷�, �޿��� 50����, Ŀ�̼��� 4000���� �����ϴ� ������
update emp01 set hiredate=sysdate,sal=50,comm=4000 where ename='ALLEN';

--20�� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ���� �������� ����� ������ 
select * from dept02; 
update dept02 set loc = (select loc from dept where deptno =40)
where deptno =20; 

--Delete
DROP TABLE DEPT01; 
CREATE TABLE DEPT01 AS SELECT * FROM DEPT; 

select *from dept01; 
--delete from dept01;

--30�� �μ��� ������ �� �μ� ���̺��� Ȯ���ϴ� ������ 
delete from dept01 where deptno = 30;

--emp01���� ���� 
--���� ���������� �μ����� SALES�� �μ��� ��ȣ���� �˾Ƴ� �� SALES �μ� �Ҽ��� ����� �����ϴ� ������ 
delete from emp01 where deptno=(select deptno from dept where dname='SALES'); 
select*from emp01; 

--Ʈ������
drop table DEPT01; 
create table dept01 as select *from DEPT; 

delete from  DEPT01;
select *from dept01; 

rollback;
delete from dept01 where deptno= 20;
commit;
rollback;
--COMMIT�� �����Ͽ� �������� �����Ƿ� 
--ROLLBACK�� �ص� Ư�� �ο츦 �����ϱ� ������ ���� ���·� �ǵ��� �� ����. 

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
insert into emp02(empno,ename,job,deptno)values(1,'ȫ�浿',null,null);    


select*from emp03;

CREATE TABLE EMP03(
    EMPNO NUMBER(4)UNIQUE, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

insert into emp03(empno,ename,job,deptno)values(1,'ȫ�浿','SALES','20');
insert into emp03(empno,ename,job,deptno)values(1,'ȫ�浿',null,null);  
insert into emp03(empno,ename,job,deptno)values(null,'ȫ�浿',null,null); 


select * from emp04;

CREATE TABLE EMP04(
    EMPNO NUMBER(4)PRIMARY KEY, 
    ENAME VARCHAR2(10) NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2)
);

insert into emp04(empno,ename,job,deptno)values(null,'ȫ�浿',null,null);

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

insert into emp05(empno,ename,job,deptno)values(50,'ȫ�浿',null,null);

--�Ǵ� 

CREATE TABLE EMP05(
    EMPNO NUMBER(4)constraint emp05_emptno_pk PRIMARY KEY, 
    ENAME VARCHAR2(10) constraint emp05_ename_nn NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2),
    constraint empno_CK check(empno>=50)
);

insert into emp05(empno,ename,job,deptno)values(50,'ȫ�浿',null,null);

insert into emp(empno, ename, deptno)values(8000,'ȫ�浿',50);

drop table emp06;

CREATE TABLE EMP06(
    EMPNO NUMBER(4)constraint emp05_emptno_pk PRIMARY KEY, 
    ENAME VARCHAR2(10) constraint emp05_ename_nn NOT NULL, 
    JOB VARCHAR2(9), 
    DEPTNO NUMBER(2) constraint emp06_deptno_FK references dept(deptno)
);

insert into emp06(empno,ename,job,deptno)values(50,'ȫ�浿',null,50);
insert into emp06(empno,ename,job,deptno)values(50,'ȫ�浿',null,40);
select *from emp06;



--50�� 
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





