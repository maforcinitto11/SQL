-- Criação das tabelas
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY,
    placa VARCHAR(10),
    modelo VARCHAR(50),
    ano INT,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Servico (
    servico_id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Veiculo_Servico (
    veiculo_id INT,
    servico_id INT,
    PRIMARY KEY (veiculo_id, servico_id),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

-- Inserção de dados de exemplo
INSERT INTO Cliente (cliente_id, nome, email, telefone)
VALUES (1, 'João Silva', 'joao@example.com', '1234567890');

INSERT INTO Veiculo (veiculo_id, placa, modelo, ano, cliente_id)
VALUES (1, 'ABC1234', 'Fusca', 1970, 1);

INSERT INTO Servico (servico_id, nome, preco)
VALUES (1, 'Troca de óleo', 50.00);

INSERT INTO Veiculo_Servico (veiculo_id, servico_id)
VALUES (1, 1);

SELECT * FROM Cliente;
SELECT * FROM Veiculo;
SELECT * FROM Servico;
SELECT * FROM Veiculo WHERE ano > 2000;
SELECT * FROM Servico WHERE preco <= 100.00;
SELECT veiculo_id, placa, modelo, CONCAT(ano, ' - ', modelo) AS ano_modelo FROM Veiculo;
SELECT nome, preco FROM Servico ORDER BY preco DESC;
SELECT cliente_id, COUNT(*) AS num_veiculos FROM Veiculo GROUP BY cliente_id HAVING num_veiculos > 1;
SELECT c.nome, v.placa, s.nome
FROM Cliente c
JOIN Veiculo v ON c.cliente_id = v.cliente_id
JOIN Veiculo_Servico vs ON v.veiculo_id = vs.veiculo_id
JOIN Servico s ON vs.servico_id = s.servico_id;
