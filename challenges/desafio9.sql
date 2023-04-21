SELECT 
    COUNT(h.user_id) AS musicas_no_historico
FROM
    `SpotifyClone`.history h
        INNER JOIN
    `SpotifyClone`.users u ON h.user_id = u.id
WHERE
    u.name = 'Barbara Liskov'
GROUP BY h.user_id;