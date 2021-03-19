--a
SELECT DISTINCT b.author
FROM b.Books, o.Orders, c.Customers
WHERE o.quantity>49 and o.bid = b.bid and c.cid = p.cid and c.zipcode = 02125; 


--b
SELECT c.cname
FROM b.Books, o.Orders, c.Customers
WHERE c.cname NOT IN (
    SELECT c.cname
    FROM b.Books, o.Orders, c.Customers
    WHERE c.cid = o.cid and o.bid = b.bid and b.price >= 100
);



--c
SELECT c.cid, AVG(b.price)
FROM b.Books, o.Orders, c.Customers
GROUP BY c.cid
HAVING 19 < (
    SELECT COUNT(DISTINCT b.name)
    FROM b.Books, o.Orders, c.Customers
    WHERE b.price >= 20
);


--d
SELECT c.cname
FROM b.Books, o.Orders, c.Customers
WHERE  


--e
SELECT 
FROM b.Books, o.Orders, c.Customers
WHERE  

