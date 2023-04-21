-- Exibindo o top 3 de álbuns com mais músicas favoritadas

SELECT 
    a.name AS album, COUNT(s.album_id) AS favoritadas
FROM
    favorite_songs f
        INNER JOIN
    songs s ON s.id = f.song_id
        INNER JOIN
    albums a ON s.album_id = a.id
GROUP BY s.album_id
ORDER BY COUNT(user_id) DESC
LIMIT 3;