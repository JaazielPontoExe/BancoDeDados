--> Liste o nome dos participantes e os nomes dos eventos em que estão inscritos.
SELECT participante.nome, evento.nome FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    INNER JOIN evento
        ON (inscricao.evento_id = evento.id)
    ORDER BY participante.nome;

--> Liste o nome dos eventos e os nomes das palestras associadas.
SELECT palestra.nome, evento.nome FROM palestra
    LEFT JOIN evento
        ON (palestra.evento_id = evento.id);

--> Liste os nomes dos palestrantes e as palestras que eles ministram.
SELECT palestrante.nome, palestra.nome FROM palestrante
    LEFT JOIN palestra_palestrante
        ON (palestrante.id = palestra_palestrante.palestrante_id)
    LEFT JOIN palestra
        ON (palestra_palestrante.palestra_id = palestra.id);

--> Liste os eventos e a quantidade de palestras que cada um possui.
SELECT evento.nome, COUNT(*) as qtd FROM evento
    LEFT JOIN palestra
        ON (palestra.evento_id = evento.id)
    GROUP BY evento.nome;

--> Liste os eventos e o número total de participantes inscritos.
SELECT evento.nome, COUNT(*) as qtd FROM evento
    INNER JOIN inscricao
        ON (inscricao.evento_id = evento.id)
    GROUP BY evento.nome;

--> Liste os eventos que ocorrem entre duas datas específicas (ex: entre '2025-01-01' e '2025-12-31').
SELECT evento.nome FROM evento 
    WHERE 
        (data_inicio BETWEEN '2025-08-01' AND '2025-11-01')
        AND
        (data_fim BETWEEN '2025-08-01' AND '2025-11-01');

--> Liste os participantes que estão inscritos em mais de um evento.
SELECT participante.nome FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    INNER JOIN evento
        ON (inscricao.evento_id = evento.id)
    GROUP BY participante.nome
    HAVING COUNT(inscricao.evento_id) > 1;

-- Corrigindo...
SELECT participante.nome, COUNT(*) FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    GROUP BY participante.id
    HAVING COUNT(inscricao.evento_id) > 1;
    
--> Liste os palestrantes que participaram de uma palestra com o nome contendo a palavra "IA".
SELECT palestrante.nome as palestrante, palestra.nome as palestra FROM palestrante
    LEFT JOIN palestra_palestrante
        ON (palestrante.id = palestra_palestrante.palestrante_id)
    LEFT JOIN palestra
        ON (palestra_palestrante.palestra_id = palestra.id)
    WHERE palestra.nome LIKE '%IA%';

-- Um plus a mais;
SELECT palestra.nome as palestra, STRING_AGG(palestrante.nome,', ') as palestrantes FROM palestrante
    LEFT JOIN palestra_palestrante
        ON (palestrante.id = palestra_palestrante.palestrante_id)
    LEFT JOIN palestra
        ON (palestra_palestrante.palestra_id = palestra.id)
    WHERE palestra.nome LIKE '%IA%'
    GROUP BY palestra.nome;

--> Liste as inscrições feitas em uma data específica.
SELECT participante.nome, evento.nome, inscricao.data_hora FROM participante
    INNER JOIN inscricao
        ON (participante.id = inscricao.participante_id)
    INNER JOIN evento
        ON (inscricao.evento_id = evento.id)
    WHERE CAST(inscricao.data_hora AS DATE) = '2025-06-01';

--> Liste os eventos que ocorreram em um local específico (ex: 'Expo Center Norte').
SELECT evento.nome FROM evento
    WHERE evento.localidade = 'Expo Center Norte';

--> Liste os participantes que estão inscritos no evento com o maior número de palestras.
WITH contagem_palestras AS (
    SELECT evento.id as id, evento.nome as evento, COUNT(palestra.id) as qtd_palestras FROM evento
            INNER JOIN palestra
                ON evento.id = palestra.evento_id
            GROUP BY evento.id
), evento_maior AS (
    SELECT evento, qtd_palestras, id FROM contagem_palestras
        WHERE qtd_palestras = (SELECT MAX(qtd_palestras) FROM contagem_palestras)
) SELECT participante.nome, evento_maior.evento FROM participante
    INNER JOIN inscricao
        ON participante.id = inscricao.participante_id
    INNER JOIN evento_maior
        ON inscricao.evento_id = evento_maior.id;

--> Liste as palestras com mais de um palestrante.
SELECT palestra.nome, COUNT(*) FROM palestra
    INNER JOIN palestra_palestrante
        ON (palestra_palestrante.palestra_id = palestra.id)
    GROUP BY palestra.nome
    HAVING COUNT(*) > 1;

--> Liste os eventos que têm mais participantes do que a média de participantes por evento.
WITH contagem AS (
    SELECT evento_id, COUNT(*) as qtd FROM inscricao 
    GROUP BY evento_id
) SELECT evento.nome, contagem.qtd FROM evento
    INNER JOIN contagem
        ON (contagem.evento_id = evento.id)
    WHERE qtd > (SELECT AVG(qtd) as media FROM contagem);

--> Liste os nomes dos palestrantes que não estão vinculados a nenhuma palestra;
SELECT palestrante.nome as palestrante FROM palestrante
    WHERE id NOT IN (
        SELECT palestra_palestrante.palestrante_id as id FROM palestra_palestrante
    );

--> Liste os participantes que não se inscreveram em nenhum evento.
SELECT participante.nome FROM participante
    WHERE participante.id NOT IN (
        SELECT inscricao.participante_id FROM inscricao
    );

--> Liste a quantidade de inscrições por evento.
SELECT evento.nome as evento, COUNT(*) as nro_inscricoes FROM evento
    INNER JOIN inscricao
        ON (inscricao.evento_id = evento.id)
    GROUP BY evento.id;

--> Liste os palestrantes que participam de mais de 3 palestras.
SELECT palestrante.nome as palestrantes, COUNT(*) as qtd_palestras FROM palestrante
    INNER JOIN palestra_palestrante
        ON (palestra_palestrante.palestrante_id = palestrante.id)
    GROUP BY palestrante.id
    HAVING COUNT(palestra_palestrante.palestra_id) > 3;