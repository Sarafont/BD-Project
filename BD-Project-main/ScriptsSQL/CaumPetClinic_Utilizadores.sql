USE CaumPetClinic;

-- Criação do utilizador 'admin'
CREATE USER 'adminPR'@'localhost';
SET PASSWORD FOR 'adminPR'@'localhost' = 'PauloRochaLCC';

-- Criação do utilizador 'prog'
CREATE USER 'prog'@'localhost';
SET PASSWORD FOR 'prog'@'localhost' = 'prog1234';

-- Criação do utilizador gestor de clinica da clinica 
CREATE USER 'adminClinica'@'localhost';
SET PASSWORD FOR 'adminClinica'@'localhost' = 'adoroCauns';

-- Criação do perfil de funcionário de cada clinica
CREATE USER 'funcionarioClinica'@'localhost';
SET PASSWORD FOR 'funcionarioClinica'@'localhost' = 'clinicaDoPaulo';

-- Definição do utilizador estafeta
CREATE USER 'estafeta'@'localhost';
SET PASSWORD FOR 'estafeta'@'localhost' = 'passwordGenerica123';

-- Criação do utilizador 'user'
CREATE USER 'user'@'localhost';
SET PASSWORD FOR 'user'@'localhost' = 'user1234';

-- Permissão de acesso a todos os objectos da base de dados em 'localhost'.
GRANT ALL ON CaumPetClinic.* TO 'adminPR'@'localhost';

-- Definição de alguns previlégios para os diversos utilizadores. 
-- Permissão para a execução de instruções SELECT, INSERT e UPDATE na base de dados 
-- em 'localhost'.
GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'prog'@'localhost';
GRANT CREATE ROUTINE ON CaumPetClinic.* TO 'prog'@'localhost';
GRANT EXECUTE ON CaumPetClinic.* TO 'prog'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, LOCK TABLES, CREATE VIEW, SHOW VIEW, EXECUTE, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, TRIGGER, CREATE TABLESPACE, CREATE TEMPORARY TABLES, EVENT, PROCESS ON *.* TO 'prog'@'localhost';


GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'adminClinica'@'localhost';
GRANT SELECT, INSERT ON  CaumPetClinic.* TO 'funcionarioClinica'@'localhost';
GRANT SELECT ON CaumPetClinic.Pedido TO 'estafeta'@'localhost';

GRANT EXECUTE ON PROCEDURE topClientesMensais TO 'adminPR'@'localhost';
GRANT EXECUTE ON PROCEDURE topClientesMensais TO 'adminClinica'@'localhost';
GRANT EXECUTE ON PROCEDURE topAnimais TO 'adminPR'@'localhost';
GRANT EXECUTE ON PROCEDURE topAnimais TO 'adminClinica'@'localhost';

GRANT EXECUTE ON PROCEDURE topClientesMensaisCadeia TO 'adminPR'@'localhost';

GRANT EXECUTE ON FUNCTION criaCliente TO 'user'@'localhost';
GRANT EXECUTE ON FUNCTION criaAnimal TO 'user'@'localhost';
GRANT EXECUTE ON PROCEDURE criaPedido TO 'user'@'localhost';
GRANT EXECUTE ON FUNCTION registaEntrega TO 'user'@'localhost';
GRANT EXECUTE ON FUNCTION registaRecolha TO 'user'@'localhost';

