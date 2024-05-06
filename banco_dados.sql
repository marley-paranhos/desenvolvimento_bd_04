CREATE TABLE clientes (
    nome VARCHAR(100),
    data_cadastro DATE
);

INSERT INTO clientes (nome, data_cadastro)
VALUES
    ('Cliente1', '2024-05-06'),
    ('Cliente2', '2024-05-05'),
    ('Cliente3', '2024-05-06');

CREATE OR REPLACE FUNCTION contar_clientes_cadastrados(dia DATE)
RETURNS INT AS $$
DECLARE
    total INT := 0;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM clientes
    WHERE data_cadastro = dia;
    
    RETURN total;
END;
$$ LANGUAGE plpgsql;

SELECT contar_clientes_cadastrados('2024-05-06') AS total_clientes;