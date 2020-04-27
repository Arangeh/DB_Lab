soal 1

select distinct  a.territoryid, d.name , c.unitprice
,dense_rank () OVER (
      PARTITION BY a.territoryid
      ORDER BY
         c.unitprice
   )
from ((sales.salesterritory a inner join sales.salesorderheader b using(territoryid))
inner join sales.salesorderdetail c using(salesorderid))
inner join production.product d using(productid)
order by a.territoryid,c.unitprice


****************************
soal2

select  a.name as territoryname, a.group as region,sum(c.unitprice)
,sum(orderqty)

from ((sales.salesterritory a inner join sales.salesorderheader b using(territoryid))
inner join sales.salesorderdetail c using(salesorderid))
inner join production.product d using(productid)
group by cube(territoryname,region)
******************************
soal3

select a.name as territoryname, d.color, count(*) as productcount
-- a.name as territoryname
from ((sales.salesterritory a inner join sales.salesorderheader b using(territoryid))
inner join sales.salesorderdetail c using(salesorderid))
inner join production.product d using(productid)
group by cube(territoryname,d.color)

