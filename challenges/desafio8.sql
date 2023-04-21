-- Exibindo uma relação de álbuns produzidos pela artista Elis Regina

SELECT 
    art.name AS artista, alb.name AS album
FROM
    artists AS art
        JOIN
    albums AS alb ON art.id = alb.artist_id
WHERE
    art.name = 'Elis Regina'
ORDER BY alb.name;