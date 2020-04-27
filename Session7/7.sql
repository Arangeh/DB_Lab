--Q1
create table Test(
age integer
);

begin;
insert into Test
values (1);

savepoint Roll_1;
insert into Test
values (2);
rollback to Roll_1
--comment the rollback in order to perform the transaction above
--in that case, rollback to the savepoint will occur if an error occurs
 
insert into Test
values (3);

savepoint Roll_3;
insert into Test
values (4);
rollback to Roll_3;

insert into Test
values (5);
commit;
-----------------------------------------
--Q2
BEGIN;
LOCK TABLE Test IN EXCLUSIVE MODE;
SELECT * FROM Test
    WHERE age = 1;
COMMIT;

BEGIN;
LOCK TABLE Test IN SHARE MODE;
SELECT * FROM Test
    WHERE age = 1;
COMMIT;

--first two from share, then first two from EXCLUSIVE -> ERROR
-----------------------------------------
---Q3
BEGIN;
LOCK TABLE Test IN EXCLUSIVE MODE;
INSERT into malakh values(20);
COMMIT;

BEGIN
LOCK TABLE malakh IN EXCLUSIVE MODE;
INSET into Test values(20);
COMMIT;
-----------------------------------------
---Q4
begin ISOLATION LEVEL REPEATABLE READ;
--without setting ISOLATION LEVEL we have a problem of nonrepeatable read
select * from Test2;
select * from Test2;
commit;

begin;
insert into Test2 values(3);
commit;