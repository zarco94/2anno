SELECT P.id, C.person, C.movie
FROM person AS P LEFT JOIN crew AS C
    ON P.id = C.person AND C.p_role = 'actor'
WHERE C.p_role = 'actor'
GROUP BY P.id
HAVING CONUT(C.movie) = 0


SELSCT P.id
FROM person AS P
EXCEPT
SELECT C.person FROM crew AS C