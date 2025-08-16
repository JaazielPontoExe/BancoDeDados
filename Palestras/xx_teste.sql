\connect sistema_eventos;

WITH contagem_palestras AS (
    SELECT evento.id as id, evento.nome as evento, COUNT(palestra.id) as qtd_palestras FROM evento
            INNER JOIN palestra
                ON evento.id = palestra.evento_id
            GROUP BY evento.id
), evento_maior AS 
(
    SELECT evento, qtd_palestras, id FROM contagem_palestras
        WHERE qtd_palestras = (SELECT MAX(qtd_palestras) FROM contagem_palestras)
) 
SELECT participante.nome, evento_maior.evento FROM participante
    INNER JOIN inscricao
        ON participante.id = inscricao.participante_id
    INNER JOIN evento_maior
        ON inscricao.evento_id = evento_maior.id;