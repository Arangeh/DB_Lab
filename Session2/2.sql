
-- چند رنگ متفاوت برای قایق ها داریم
select count(distinct color)
from "Boats"
3
--  چند قایقران داریم که سن آنها از 45 بیشتر است
select count(distinct sid)
from "Sailors"
where age>45
3
-- میانگین سن قایقران هایی که قایق قرمز را رزرو کرده اند
select avg(m.age)
from(
select distinct sid,age
from ("Boats" natural join "Reserves") natural join "Sailors" 
where color='قرمز') m
34

-- اطلاعات مسن ترین قایقران
select *
from "Sailors" as s
where (s.age=(select max(age) from "Sailors"))
9	"امیر"	58	10


-- تاریخی که هر قایقران اولین قایق خود را رزرو نموده است
select sid,min(date)
from ("Boats" natural join "Reserves") natural join "Sailors" 
group by sid


-- هر قایقران تا کنون چند قایق رزرو کرده است (برای قایقران هایی که حداقل یک قایق رزرو نموده اند)ا
select sid, count(*)
from ("Boats" natural join "Reserves") natural join "Sailors" 
group by sid


---  هر قایقران از تاریخ 2011-02-24 تا 2011-02-26 چند قایق رزرو نموده است
select sid, count(*)
from ("Boats" natural join "Reserves") natural join "Sailors" 
where date > '2011-02-24' and date<'2011-02-26' 
group by sid

-- شماره قایقران هایی که بعد از تاریخ 24-02-2011 بیش از 2 بار قایق رزرو کرده اند

select sid
from ("Boats" natural join "Reserves") natural join "Sailors" 
where date > '2011-02-24'
group by sid
having count(*) >2

