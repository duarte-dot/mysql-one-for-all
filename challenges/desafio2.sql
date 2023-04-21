-- Exibindo as estatísticas musicais

SELECT 
    COUNT(DISTINCT sng.name) AS cancoes,
    COUNT(DISTINCT art.name) AS artistas,
    COUNT(DISTINCT alb.name) AS albuns
FROM
    songs AS sng,
    artists AS art,
    albums AS alb;