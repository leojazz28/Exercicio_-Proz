CREATE OR REPLACE FUNCTION TotalClientesCadastradosNoDia(data_consulta DATE)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;
    
    RETURN total;
END;
$$ LANGUAGE plpgsql;