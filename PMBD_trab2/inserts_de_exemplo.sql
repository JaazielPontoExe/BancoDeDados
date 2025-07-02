\connect trab2;

INSERT INTO evento (nome, data_inicio, data_fim, bairro, rua, cep, nro) VALUES
('Conferência de Tecnologia', '2025-08-15', '2025-08-17', 'Centro', 'Rua das Flores', '96200100', '123'),
('Festival de Música Local', '2025-09-05', '2025-09-05', 'Cassino', 'Avenida Beira Mar', '96207550', '456'),
('Workshop de IA', '2025-10-10', '2025-10-11', 'Parque São Pedro', 'Rua Principal', '96203200', '789'),
('Seminário de Segurança', '2025-12-01', '2025-12-01', 'Centro', 'Rua do Código', '96200500', '1010');

INSERT INTO participante (nome, telefone) VALUES
('Ana Silva', '(53) 99123-4567'),
('Bruno Costa', '(53) 98123-4568'),
('Carla Dias', '(53) 99988-7766'),
('Daniel Souza', '(53) 98456-1234'),
('Eduarda Lima', '(53) 99111-2233');

INSERT INTO palestrante (nome) VALUES
('Dr. Hélio Vargas'),
('Mariana Ferreira'),
('Prof. Ricardo Almeida'),
('Ana Júlia'),
('Ana Clara Borges');

INSERT INTO inscricao (participante_id, evento_id, data_inscricao) VALUES
(1, 1, '2025-07-20'),
(2, 1, '2025-07-21'),
(3, 2, '2025-08-01'),
(4, 3, '2025-09-15'),
(1, 3, '2025-09-16');

INSERT INTO palestra (nome, evento_id, data_hora) VALUES
('O Futuro da Computação Quântica', 1, '2024-08-15 10:00:00'),
('Desenvolvimento Web Moderno', 1, '2024-08-16 14:00:00'),
('Introdução ao Machine Learning', 3, '2025-10-10 09:00:00'),
('Redes Neurais Profundas', 3, '2025-10-11 11:00:00'),
('Segurança Cibernética Essencial', 4, '2025-12-01 19:30:00');

INSERT INTO palestra_palestrante (palestra_id, palestrante_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 4),
(5, 5);
