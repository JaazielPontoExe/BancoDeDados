\connect trab2;

-- SELECTS

SELECT * FROM palestrante WHERE nome ILIKE 'Ana %';
SELECT * FROM palestra WHERE data_hora > CURRENT_TIMESTAMP;

-- UPDATE

UPDATE participante SET telefone = '(53) 99999-9999' WHERE id = 1;
SELECT * FROM participante WHERE id = 1;

-- DELETE

DELETE FROM inscricao WHERE participante_id = 1 AND evento_id = 3;
