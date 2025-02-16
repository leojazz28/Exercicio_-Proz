 
CREATE TABLE Clientes (
    ClienteID SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15)
);

CREATE TABLE Pedidos (
    PedidoID SERIAL PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

SELECT Clientes.Nome, Pedidos.DataPedido, Pedidos.ValorTotal
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

