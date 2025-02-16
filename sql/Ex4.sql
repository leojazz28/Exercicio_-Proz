CREATE TABLE Produtos (
    ProdutoID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INT NOT NULL
);


INSERT INTO Produtos (Nome, Preco, Estoque) VALUES
('Notebook Dell Inspiron', 3500.00, 15),
('Mouse Sem Fio Logitech', 120.50, 50),
('Teclado Mecânico Redragon', 250.00, 30),
('Monitor Samsung 24”', 850.00, 20),
('HD Externo 1TB', 400.00, 25),
('Impressora HP LaserJet', 950.00, 10),
('Cadeira Gamer', 1100.00, 12),
('Smartphone Samsung Galaxy S22', 4500.00, 18),
('Fone de Ouvido Bluetooth JBL', 320.00, 40),
('SSD NVMe 512GB', 520.00, 35);

--------------------------------

CREATE TABLE ItensPedido (
    ItemPedidoID SERIAL PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);


CREATE OR REPLACE PROCEDURE RelatorioDiarioProdutosComprados()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Cria uma tabela temporária para armazenar o resultado
    CREATE TEMP TABLE TempRelatorioDiario (
        Data DATE,
        QuantidadeTotal BIGINT
    );

    -- Insere os dados no relatório diário
    INSERT INTO TempRelatorioDiario (Data, QuantidadeTotal)
    SELECT
        p.DataPedido AS Data,
        SUM(ip.Quantidade) AS QuantidadeTotal
    FROM
        Pedidos p
    JOIN
        ItensPedido ip ON p.PedidoID = ip.PedidoID
    GROUP BY
        p.DataPedido
    ORDER BY
        p.DataPedido;

    -- Exibe o resultado
    SELECT * FROM TempRelatorioDiario;

    -- Remove a tabela temporária
    DROP TABLE TempRelatorioDiario;
END;
$$;


