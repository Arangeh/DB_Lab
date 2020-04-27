1)
create user db9331703d0

CREATE TABLE mytable
(
    sid INTEGER NOT NULL,
    sname CHARACTER VARYING(30),
    age INTEGER
);

create role db9331703d0

grant all on mytable to db9331703r0


GRANT group_role TO role1, ... ;

grant db9331703r0 to db9331703d0

ALTER USER db9331703d0 WITH PASSWORD '123456';

INSERT INTO mytable
VALUES(666,'something',23);


INSERT INTO mytable
VALUES(111,'db9331703d1',11);

INSERT INTO mytable
VALUES(222,'db9331703d2',22);

create user db9331703d1 WITH PASSWORD '123456';
create user db9331703d2 WITH PASSWORD '123456';


GRANT db9331703r1 TO db9331703d1;
GRANT db9331703r2 TO db9331703d2;

grant all on mytable to db9331703r1
grant all on mytable to db9331703r2



CREATE POLICY policy1 ON mytable
     FOR SELECT 
     TO  db9331703r1 
     USING  (userId=current_user)  

     CREATE POLICY policy2 ON mytable
     FOR SELECT 
     TO  db9331703r2 
     USING  (true)  

     
ALTER TABLE mytable enable row level security
     
create extension if not exists pgcrypto

       
select pgp_sym_encrypt('test', 'Password') ;
       
select pgp_sym_decrypt(pgp_sym_encrypt('test', 'Password'),'Password') ;
