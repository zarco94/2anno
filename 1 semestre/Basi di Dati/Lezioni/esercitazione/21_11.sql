--1-- TROVARE IL TITOLO ORIGINALE E IL TITOLO ITALIANO DEI FILM DIRETTI DA 'Alfred Hitchcock' NEGLI ANNI '50
SELECT M.id, M.official_title, R.title
FROM person AS P JOIN cast AS C ON P.id = C.person 
    JOIN movie AS M ON C.movie = M.id
    JOIN released AS R ON M.id = R.movie
WHERE P.given_name ='Alfred Hitchcok'
    AND M.year BETWEEN 1950 AND 1960
    AND C.p_role = 'director'
    AND R.country = 'ITA'
;

--2-- TROVIAMO LA SIMILARITà MEDIA FRA I FILM DIRETTI DA 'Alfred Hitchcok' (la media tra gli score dei film)
SELECT AVG(S.score)
FROM person AS P JOIN cast AS C ON P.id = C.person 
    JOIN movie AS M ON C.movie = M.id
    JOIN sim AS S ON M.id = S.movie1   --- entrmbi i film devono essere di HIchcock! Devo fare due JOIN
WHERE P.first_name = 'Alfred' AND P.last_name = 'Hitchcock'
;

SELECT AVG(S.score)
FROM sim AS S
WHERE S.movie1 IN(
    SELECT K.movie
    FROM cast AS K
        JOIN person AS P ON K.person = P.id
        WHERE P.given_name ='Alfred Hitchcok'
        AND k.p_role = 'director'
)
AND S.movie2 IN(
    SELECT K.movie
    FROM cast AS K
        JOIN person AS P ON K.person = P.id
        WHERE P.given_name ='Alfred Hitchcok'
        AND k.p_role = 'director'
;

    -- dato che uso due volte la stessa query ne uso una temporanea -> WITH
WITH h_movie(movie) AS(
    SELECT K.movie
    FROM cast AS K
        JOIN person AS P ON K.person = P.id
    WHERE P.given_name ='Alfred Hitchcok'
        AND K.p_role = 'director'
)
SELECT AVG(S.score)
FROM sim AS S
WHERE S.movie1 IN(SELECT * FROM h_movie)
AND S.movie2 IN(SELECT * FROM h_movie)
;

--3-- TROVARE I(L) ID DEI FILM PIU' SIMILI A 0016127, ESCLUDENDO SE STESSO
WITH h_movie(movie) AS(
    SELECT K.movie
    FROM cast AS K
        JOIN person AS P ON K.person = P.id
    WHERE P.given_name ='Alfred Hitchcok'
        AND K.p_role = 'director'
)
SELECT  MAX(score)
FROM sim AS S 
WHERE S.movie2 IN(SELECT * FROM h_movie AS H WHERE H.movie = 0016127)
;
    -----------------------------------------

SELECT S.movie2 
FROM sim AS S
WHERE S.movie1 = '0016127'
    AND S.movie1 <> S.movie2
    AND S.score >= ALL(    -- lo metto nel WHERE e non nell'HAVING perchè having serve quando faccio delle aggregazioni, perchè l'having sposta il calcolo a dopo l'aggregazione, ma qui non sto facendo aggregazioni
        SELECT * 
        FROM sim AS S
        WHERE S.movie1 = '0016127'
            AND S.movie1 <> S.movie2
    )
;

--4-- età media per paese di nascita delle persone ancora vive
    --divido in sottoproblemi -> 1.età delle persone in vita
SELECT EXTRACT(YEAR FROM now()) - EXTRACT(YEAR FROM P.birth_date) AS age    -- la funzione now() ritorna un timestamp del momento in cui siamo
FROM person AS P
WHERE P.death_date IS NULL
    AND P.birth_date IS NOT NULL
    AND P.id NOT IN(
        SELECT L.person FROM location AS L
        WHERE L.d_role = 'D'
    )
;

    -- 2.
SELECT 
    B.country ,
    AVG(EXTRACT(YEAR FROM now()) - EXTRACT(YEAR FROM P.birth_date)) AS age    -- la funzione now() ritorna un timestamp del momento in cui siamo
FROM person AS P
    JOIN location AS B ON B.person = P.id
    AND B.d_role = 'B'
WHERE P.death_date IS NULL
    AND P.birth_date IS NOT NULL
    AND P.id NOT IN(
        SELECT L.person FROM location AS L
        WHERE L.d_role = 'D'
    )
GROUP BY
;