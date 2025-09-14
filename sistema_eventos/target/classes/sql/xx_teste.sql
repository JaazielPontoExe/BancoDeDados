\connect sistema_eventos;

-- Liste os 10 participantes mais antigos no sistema (ordenado pela data de inscrição mais antiga).
WITH datas AS (
    SELECT inscricao.id, inscricao.participante_id, inscricao.data_hora as data_inscricao FROM inscricao
        ORDER BY data_hora ASC
), datas_unicas AS (
    SELECT DISTINCT datas.participante_id from datas
) SELECT participante.nome FROM ;