-- Exibindo a condição da pessoa usuária se está ativa ou inativa

SELECT 
    u.name AS pessoa_usuaria,
    IF(MAX(h.reproduction_date) >= '2021-01-01',
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    users AS u
        JOIN
    history AS h ON h.user_id = u.id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;