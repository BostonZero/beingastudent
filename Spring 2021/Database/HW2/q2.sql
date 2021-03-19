--a
SELECT p.age 
FROM p.Passengers, f.Flights, t.Tickets
WHERE p.pid NOT IN (
    SELECT p.pid 
    FROM p.Passengers, f.Flights, t.Tickets
    WHERE f.fid = t.fid and t.pid = p.pid and f.aircraft != 'B787');


--b
SELECT p.pname
FROM p.Passengers, f.Flights, t.Tickets
WHERE f.fid = t.fid and t.pid = p.pid
GROUP BY 


--c

SELECT f.fid, AVG(t.price)
FROM p.Passengers, f.Flights, t.Tickets
WHERE f.fid = t.fid and p.pid = t.pid and p.age > 30
GROUP BY t.fid
HAVING COUNT(*) > 100;


--d
SELECT 
FROM p.Passengers, f.Flights, t.Tickets
WHERE  


--e
SELECT 
FROM p.Passengers, f.Flights, t.Tickets
WHERE  

