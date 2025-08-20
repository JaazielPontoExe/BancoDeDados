--> psql -h localhost -U postgres sistema_eventos;

--> \connect sistema_eventos;

--> Liste os palestrantes que participam de mais de 3 palestras.
SELECT palestrante.nome as palestrantes, COUNT(*) as qtd_palestras FROM palestrante
    INNER JOIN palestra_palestrante
        ON (palestra_palestrante.palestrante_id = palestrante.id)
    GROUP BY palestrante.id
    HAVING COUNT(palestra_palestrante.palestra_id) > 3;