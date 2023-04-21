-- Exibindo a quantidade de músicas no histórico de Barbara Liskov

SELECT 
    COUNT(h.user_id) AS musicas_no_historico
FROM
    history h
        INNER JOIN
    users u ON h.user_id = u.id
WHERE
    u.name = 'Barbara Liskov'
GROUP BY h.user_id;