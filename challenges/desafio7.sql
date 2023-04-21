-- Exibindo uma relação de todos os álbuns produzidos por cada artista

SELECT 
    art.name AS artista,
    alb.name AS album,
    COUNT(f.artist_id) AS pessoas_seguidoras
FROM
    artists AS art
        JOIN
    albums AS alb ON art.id = alb.artist_id
        JOIN
    following AS f ON f.artist_id = art.id
GROUP BY art.id , alb.name
ORDER BY pessoas_seguidoras DESC, artista, album;