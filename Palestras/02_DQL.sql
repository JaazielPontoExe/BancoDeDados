SELECT participante.nome, evento.nome FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    INNER JOIN evento
        ON (inscricao.evento_id = evento.id)
    ORDER BY participante.nome;

SELECT palestra.nome, evento.nome FROM palestra
    LEFT JOIN evento
        ON (palestra.evento_id = evento.id);

SELECT palestrante.nome, palestra.nome FROM palestrante
    LEFT JOIN palestra_palestrante
        ON (palestrante.id = palestra_palestrante.palestrante_id)
    LEFT JOIN palestra
        ON (palestra_palestrante.palestra_id = palestra.id);

SELECT evento.nome, COUNT(*) as qtd FROM evento
    LEFT JOIN palestra
        ON (palestra.evento_id = evento.id)
    GROUP BY evento.nome;

SELECT evento.nome, COUNT(*) as qtd FROM evento
    INNER JOIN inscricao
        ON (inscricao.evento_id = evento.id)
    GROUP BY evento.nome;

SELECT evento.nome FROM evento 
    WHERE 
        (data_inicio BETWEEN '2025-08-01' AND '2025-11-01')
        AND
        (data_fim BETWEEN '2025-08-01' AND '2025-11-01');

SELECT participante.nome FROM (
    SELECT participante.nome, COUNT(*) as eventos FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    INNER JOIN evento
        ON (inscricao.evento_id = evento.id)
    GROUP BY participante.nome
) WHERE eventos > 1;

SELECT * FROM (
    SELECT palestrante.nome as palestrante, palestra.nome as palestra FROM palestrante
    LEFT JOIN palestra_palestrante
        ON (palestrante.id = palestra_palestrante.palestrante_id)
    LEFT JOIN palestra
        ON (palestra_palestrante.palestra_id = palestra.id)
) WHERE palestra LIKE '%IA%';

SELECT * FROM (
    SELECT participante.nome, evento.nome, inscricao.data_hora FROM participante
        INNER JOIN inscricao
            ON (participante.id = inscricao.participante_id)
        INNER JOIN evento
            ON (inscricao.evento_id = evento.id)
) WHERE CAST(data_hora AS DATE) = '2025-07-16';

SELECT evento.nome FROM evento_id
    WHERE evento.localidade = 'Expo Center Norte';

