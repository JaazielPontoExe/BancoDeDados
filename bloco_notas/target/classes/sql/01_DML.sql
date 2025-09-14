INSERT INTO evento (nome, data_inicio, data_fim, localidade) VALUES
('Tech Conference 2025', '2025-08-01', '2025-08-03', 'Centro de Convenções Principal'),
('Workshop de Design UX/UI', '2025-09-10', '2025-09-11', 'Universidade Central, Bloco D'),
('Meetup de IA Generativa', '2025-10-05', '2025-10-05', 'Hub de Inovação Tech'),
('Semana da Gastronomia', '2025-07-20', '2025-07-25', 'Mercado Público'),
('Congresso de Inovação', '2025-11-10', '2025-11-15', 'Expo Center Norte'),
('Feira do Livro de POA', '2025-08-10', '2025-08-20', 'Praça da Alfândega');

INSERT INTO participante (nome, data_nascimento) VALUES
('Carlos Santana', '1990-05-15'),
('Beatriz Lima', '1998-11-22'),
('Ana Costa', '2001-02-10'),
('Davi Souza', '1985-09-30'),
('Fernanda Mello', '1995-07-07'),
('Roberto Carlos', '1970-04-19'),
('Mariana Silva', '2002-03-12'),
('Lucas Almeida', '1999-01-25'),
('Super Fã de Eventos', '2000-01-01'),
('Gabriela Pereira', '1993-06-05'),
('João Mendes', '1988-12-30'),
('André Marques', '1991-08-17');

INSERT INTO palestrante (nome, biografia, cpf) VALUES
('Dr. Helena Ramos', 'Especialista em Inteligência Artificial e Machine Learning.', '11122233344'),
('Marcos Valério', 'Engenheiro de Software Sênior com 15 anos de experiência.', '22233344455'),
('Juliana Paes', 'Designer de Produto premiada, com foco em interfaces móveis.', '33344455566'),
('Ricardo Nobre', 'Chef de cozinha e pesquisador de ingredientes amazônicos.', '44455566677'),
('Carlos Santana', 'Músico e agora entusiasta de tecnologia.', '55566677788');

INSERT INTO palestra (nome, duracao, data_hora_inicio, evento_id) VALUES
('O Futuro da IA', 90, '2025-08-01 10:00:00', 1),
('Arquitetura de Microsserviços na Nuvem', 60, '2025-08-01 14:00:00', 1),
('Design Thinking na Prática', 120, '2025-09-10 09:00:00', 2),
('Sabores da Amazônia', 75, '2025-07-21 11:00:00', 4),
('História do Pão', 45, '2025-07-22 15:00:00', 4),
('Aplicações de IA em Finanças', 90, '2025-08-02 10:00:00', 1),
('Visualização de Dados com D3.js', 100, '2025-08-02 14:00:00', 1),
('O Mindset da Inovação Disruptiva', 60, '2025-11-11 09:30:00', 5),
('Deep Learning Avançado', 120, '2025-08-03 11:00:00', 1);

INSERT INTO palestra_palestrante (palestra_id, palestrante_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 5),
(6, 1),
(7, 1),
(8, 2),
(9, 1);

INSERT INTO inscricao (evento_id, participante_id, data_hora, valor, pago) VALUES
(1, 1, '2025-06-10 09:30:00', 150.00, TRUE),
(1, 2, '2025-06-12 11:00:00', 150.00, FALSE),
(1, 3, '2025-07-01 18:45:00', 175.50, TRUE),
(1, 8, '2025-07-02 20:00:00', 175.50, TRUE),
(2, 2, '2025-08-05 14:20:00', 200.00, TRUE),
(2, 4, '2025-08-06 15:00:00', 200.00, TRUE),
(4, 4, '2025-07-15 10:10:10', 50.00, TRUE),
(4, 1, '2025-07-16 11:00:00', 50.00, FALSE),
(1, 9, '2025-06-01 10:00:00', 150.00, TRUE),
(2, 9, '2025-06-01 10:01:00', 200.00, TRUE),
(3, 9, '2025-06-01 10:02:00', 25.00, TRUE),
(4, 9, '2025-06-01 10:03:00', 50.00, TRUE),
(5, 9, '2025-06-01 10:04:00', 300.00, TRUE),
(6, 9, '2025-06-01 10:05:00', 10.00, TRUE);