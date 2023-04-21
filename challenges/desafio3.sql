-- Exibindo o histórico de reprodução para cada pessoa usuária

SELECT 
    u.name AS pessoa_usuaria,
    COUNT(h.song_id) AS musicas_ouvidas,
    (ROUND(SUM(s.song_duration) / 60, 2)) AS total_minutos
FROM
    users AS u
        JOIN
    history AS h ON h.user_id = u.id
        JOIN
    songs AS s ON s.id = h.song_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;