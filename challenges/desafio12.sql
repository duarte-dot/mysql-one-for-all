SELECT 
    art.name AS artista,
    CASE
        WHEN COUNT(f.song_id) >= 5 THEN 'A'
        WHEN COUNT(f.song_id) >= 3 THEN 'B'
        WHEN COUNT(f.song_id) >= 1 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    artists art
        INNER JOIN
    albums alb ON alb.artist_id = art.id
        INNER JOIN
    songs s ON s.album_id = alb.id
        LEFT JOIN
    favorite_songs f ON f.song_id = s.id
GROUP BY artista
ORDER BY COUNT(f.song_id) DESC , artista;