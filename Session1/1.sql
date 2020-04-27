SELECT sname, S.sid
FROM "Sailors" S,(
SELECT DISTINCT sid
FROM "Reserves") M
WHERE S.sid = M.sid
; 


SELECT DISTINCT sname
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid and (B.color = 'قرمز' or B.color = 'سبز');


SELECT M.sid,sname 
FROM 

(SELECT DISTINCT sname,S.sid
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid and (B.color = 'قرمز')) M,

(SELECT DISTINCT S.sid
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid and (B.color = 'سبز')) N 

WHERE N.sid = M.sid; 


With Intersection

(SELECT DISTINCT sname, S.sid
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid and (B.color = 'قرمز'))-- M

INTERSECT

(SELECT DISTINCT sname, S.sid
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid and (B.color = 'سبز'));-- N 

--WHERE N.sid = M.sid; 


(SELECT DISTINCT sname, sid
FROM "Sailors")-- M

EXCEPT

(SELECT DISTINCT sname, S.sid
FROM "Reserves" R, "Boats" B, "Sailors" S
WHERE R.bid = B.bid and R.sid = S.sid);-- N 


Aggregate Functions: 
Chapter 3

