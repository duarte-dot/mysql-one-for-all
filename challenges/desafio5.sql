SELECT 
    s.name AS cancao, COUNT(h.song_id) AS reproducoes
FROM
    songs AS s
        JOIN
    history AS h ON s.id = h.song_id
GROUP BY s.name
HAVING COUNT(h.song_id) = COUNT(s.id)
ORDER BY reproducoes DESC, cancao LIMIT 2;