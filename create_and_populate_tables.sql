CREATE TABLE ordens_producao (
    id SERIAL PRIMARY KEY,
    codigo_ordem VARCHAR(20) NOT NULL,
    produto VARCHAR(50) NOT NULL,
    quantidade_planejada INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    maquina VARCHAR(50) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('planejada', 'em_execucao', 'concluida')) NOT NULL
);

CREATE TABLE producao_realizada (
    id SERIAL PRIMARY KEY,
    id_ordem INT REFERENCES ordens_producao(id),
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    quantidade INT NOT NULL,
    observacao TEXT
);

INSERT INTO ordens_producao (codigo_ordem, produto, quantidade_planejada, data_inicio, maquina, status)
VALUES 
('ORD-001', 'Carcaça Metálica A', 500, '2025-08-16', 'Prensa Hidráulica Aurora-5000', 'em_execucao'),
('ORD-002', 'Eixo CNC B', 300, '2025-08-16', 'Fresadora CNC AlphaCut', 'planejada'),
('ORD-003', 'Engrenagem Térmica C', 200, '2025-08-15', 'Forno de Tratamento Térmico Fênix', 'concluida'),
('ORD-004', 'Kit Transportador D', 400, '2025-08-17', 'Esteira Transportadora Zeus', 'planejada'),
('ORD-005', 'Pacote Final E', 600, '2025-08-18', 'Sistema de Embalagem Hermes', 'planejada');

INSERT INTO producao_realizada (id_ordem, quantidade, observacao)
VALUES
(1, 120, 'Primeiro lote concluído com sucesso'),
(1, 80, 'Pequena parada para ajuste de pressão'),
(3, 200, 'Ordem concluída com sucesso');
