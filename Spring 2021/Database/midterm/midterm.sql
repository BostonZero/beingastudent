--1a
select c.cname 
from  Courses c, Enrolled e, Students s
where s.sid = e.sid and e.cid = c.cid and s.age in 
   (select MAX(s.age) 
    from Students s);
--1b
select c.cname 
from  Courses c, Enrolled e, Students s
where s.sid = e.sid and e.cid = c.cid and s.sid not in 
   (select s.sid  
    from Enrolled e, Students s
    where s.age > 25 and s.sid = e.sid and e.grade < 7);
--1c
select s.sname 
from  Courses c, Enrolled e, Students s
where 


--1d
select c.cname AVG(e.grade)
from  Courses c, Enrolled e, Students s
where s.sid = e.sid and e.cid = c.cid and s.age > 25
group by c.cid
having count(*) > 10


--1e
select c.cname 
from  Courses c, Enrolled e, Students s
where s.sid = e.sid and e.cid = c.cid and s.sid not in 
    (select s.age
    from Students s
    where s.age < 20)
group by c.name


