 
CREATE TABLE PedidosLog (
    LogID SERIAL PRIMARY KEY,
    PedidoID INT,
    Acao VARCHAR(50) NOT NULL,
    DataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_pedido_insert()
RETURNS TRIGGER AS $$
BEGIN
    -- Insere um registro na tabela PedidosLog
    INSERT INTO PedidosLog (PedidoID, Acao)
    VALUES (NEW.PedidoID, 'INSERT');

    -- Retorna o novo registro (NEW) para o comando INSERT
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_after_insert_pedido
AFTER INSERT ON Pedidos
FOR EACH ROW
EXECUTE FUNCTION log_pedido_insert();


INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal)
VALUES (2, '2023-10-05', 300.00);

SELECT * FROM PedidosLog;