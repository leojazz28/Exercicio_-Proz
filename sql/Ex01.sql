 CREATE DATABASE proz;


 CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,          
    Nome VARCHAR(100),        
    Email VARCHAR(100),          
    Endereco VARCHAR(255)       
);


INSERT INTO ALUNO (ID, Nome, Email, Endereco)
VALUES (1, 'João Silva', 'joao.silva@example.com', 'Rua das Flores, 123');