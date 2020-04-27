soal2


CREATE OR REPLACE FUNCTION josh_test()
RETURNS SETOF varchar AS $$
DECLARE
  curs CURSOR FOR SELECT * FROM person.person;
  row  RECORD;
BEGIN
  open curs;
  LOOP
    FETCH FROM curs INTO row;
    EXIT WHEN NOT FOUND;
	IF floor(random() * 10 + 1)::int < 7 THEN
     return next row.firstname;
END IF;	
  END LOOP;

END; $$ LANGUAGE plpgsql;

SELECT josh_test();

***********************************************
soal3


select * from crosstab(
  'select territoryid,productid,count(productid)
from(
select territoryid,Sales.SalesOrderDetail.productid
from Sales.SalesOrderDetail,Production.product,Sales.SalesOrderHeader
where Sales.SalesOrderDetail.productid=Production.product.productid and Sales.SalesOrderDetail.salesorderid=Sales.SalesOrderHeader.salesorderid
) m
group by territoryid,productid',
	
	
  'select productid from Production.product where productid = 707 '
) as (
  "territoryid" int,
  "b707" int

);
