-- MySQL dump 10.13  Distrib 8.0.31, for macos13.0 (arm64)
--
-- Host: localhost    Database: CaumPetClinic
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `idAnimal` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `peso` double NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `especie` varchar(150) NOT NULL,
  `raca` varchar(150) NOT NULL,
  `historico` varchar(150) DEFAULT NULL,
  `Cliente_NIF` int NOT NULL,
  PRIMARY KEY (`idAnimal`,`Cliente_NIF`),
  UNIQUE KEY `idAnimal_UNIQUE` (`idAnimal`),
  KEY `fk_Animal_Cliente_idx` (`Cliente_NIF`),
  CONSTRAINT `fk_Animal_Cliente` FOREIGN KEY (`Cliente_NIF`) REFERENCES `Cliente` (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (0,'Joaninha',5,'2011-10-24','C.Lupus','Yorkshire Terrier','Vacinas: Hepatite Canina, Raiva, Tosse de Canil.',647451205),(1,'Donatello',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',425366944),(2,'Michelangelo',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',425366944),(3,'Leonardo',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',425366944),(4,'Raphael',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',425366944),(5,'Budha',7,'2014-10-13','Felis Catus','Europeu Comum','Animal esterlizado a 2018-02-10',773409851),(6,'Simba',5,'2016-03-08','Felis Catus','Persa','',475564914),(7,'Bolota',4,'2022-12-25','C.Lupus','Yorkshire Terrier','Vacinas: Tosse de Canil',985455512),(8,'Flash',50,'2018-06-20','C.Lupus','Golden Retriever','Desparazitada a 2020-08-12',877612205),(9,'Naruto',12,'2022-12-24','C. Lupus','Europeu Comum','',647451205);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrinha`
--

DROP TABLE IF EXISTS `Carrinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carrinha` (
  `matricula` varchar(150) NOT NULL,
  `kmsNaUltimaUtil` varchar(45) DEFAULT NULL,
  `emUso` varchar(45) DEFAULT NULL,
  `anotacoes` varchar(45) DEFAULT NULL,
  `Funcionario_NIF` int DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  UNIQUE KEY `fk_Carrinha_Funcionario1_idx` (`Funcionario_NIF`),
  CONSTRAINT `fk_Carrinha_Funcionario1` FOREIGN KEY (`Funcionario_NIF`) REFERENCES `Funcionario` (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrinha`
--

LOCK TABLES `Carrinha` WRITE;
/*!40000 ALTER TABLE `Carrinha` DISABLE KEYS */;
INSERT INTO `Carrinha` VALUES ('12-LL-21','230379','0','Mudar oleo',NULL),('12-ZZ-24','155045','0','',NULL),('12-ZZ-99','119396','0','Mudar oleo',NULL),('18-AO-20','167152','0','Mudar pneus',NULL),('18-RE-19','105721','0','Provável fuga de combustivel',NULL),('22-18-QN','198708','0','',NULL),('27-OP-02','168199','0','',NULL),('34-OZ-10','139687','0','',NULL),('69-BB-96','130422','0','Fazer revisão',NULL),('78-PQ-21','170486','0','Verificar estado dos travões',NULL),('80-XZ-92','228001','0','Fazer revisão',NULL),('AB-77-LA','37191','0','Lavar dentro/fora',NULL),('AN-12-PL','18008','0','Barulho estranho a 2022-10-20',NULL),('AP-27-BN','7704','0','',NULL),('AR-20-TI','20123','0','',NULL);
/*!40000 ALTER TABLE `Carrinha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `NIF` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `pontos` int NOT NULL,
  `Morada_idMorada` int NOT NULL,
  `Contacto_idContacto` int NOT NULL,
  PRIMARY KEY (`NIF`,`Morada_idMorada`,`Contacto_idContacto`),
  UNIQUE KEY `idCliente_UNIQUE` (`NIF`),
  KEY `fk_Cliente_Morada1_idx` (`Morada_idMorada`),
  KEY `fk_Cliente_Contacto1_idx` (`Contacto_idContacto`),
  CONSTRAINT `fk_Cliente_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`),
  CONSTRAINT `fk_Cliente_Morada1` FOREIGN KEY (`Morada_idMorada`) REFERENCES `Morada` (`idMorada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (425366944,'Nelson Almeida','2002-03-30',21,52,52),(475564914,'Hugo Costa','2002-01-28',26,54,54),(647451205,'Nuno Costa','2002-08-23',15,51,51),(649851205,'António Castro','1977-03-29',0,55,55),(773409851,'Sara Fontes','2001-09-07',16,53,53),(877612205,'Jorge Mendes','1980-12-04',0,56,56),(985455512,'Sergio Calado','1981-11-13',96,57,57);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinica`
--

DROP TABLE IF EXISTS `Clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clinica` (
  `idClinica` int NOT NULL,
  `Morada_idMorada` int NOT NULL,
  `Contacto_idContacto` int NOT NULL,
  PRIMARY KEY (`idClinica`,`Morada_idMorada`,`Contacto_idContacto`),
  UNIQUE KEY `idClinica_UNIQUE` (`idClinica`),
  KEY `fk_Clinica_Morada1_idx` (`Morada_idMorada`),
  KEY `fk_Clinica_Contacto1_idx` (`Contacto_idContacto`),
  CONSTRAINT `fk_Clinica_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`),
  CONSTRAINT `fk_Clinica_Morada1` FOREIGN KEY (`Morada_idMorada`) REFERENCES `Morada` (`idMorada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinica`
--

LOCK TABLES `Clinica` WRITE;
/*!40000 ALTER TABLE `Clinica` DISABLE KEYS */;
INSERT INTO `Clinica` VALUES (0,0,0),(1,1,1),(2,2,2);
/*!40000 ALTER TABLE `Clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contacto`
--

DROP TABLE IF EXISTS `Contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contacto` (
  `idContacto` int NOT NULL,
  `email` varchar(150) NOT NULL,
  `telemovel` int DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  PRIMARY KEY (`idContacto`),
  UNIQUE KEY `idContacto_UNIQUE` (`idContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacto`
--

LOCK TABLES `Contacto` WRITE;
/*!40000 ALTER TABLE `Contacto` DISABLE KEYS */;
INSERT INTO `Contacto` VALUES (0,'geral.adaufe@caumpetclinic.pt',NULL,253577270),(1,'geral.tadim@caumpetclinic.pt',NULL,253577271),(2,'geral.requiao@caumpetclinic.pt',NULL,253577272),(3,'Francisca.Rodrigues459@hotmail.com',953388193,NULL),(4,'António.Gonçalves334@hotmail.pt',956513225,NULL),(5,'Luís.Fernandes@hotmail.com',964042597,NULL),(6,'Luís.Freitas@hotmail.pt',935465983,NULL),(7,'Domingos.Ribeiro981@outlook.pt',956676710,NULL),(8,'Tomás.Ribeiro426@gmail.com',966264692,NULL),(9,'Bento.Silva787@gmail.pt',966443664,NULL),(10,'Joana.Francisco609@hotmail.pt',931322068,NULL),(11,'Beatriz.Lopes@hotmail.pt',922793168,NULL),(12,'André.Freitas@yahoo.com',934815111,NULL),(13,'Rosa.Dias@gmail.pt',918438670,NULL),(14,'Rosa.Martins@outlook.pt',969987544,NULL),(15,'Domingos.Santos@hotmail.pt',933017712,NULL),(16,'Margarida.Martins@hotmail.com',959669539,NULL),(17,'Júlia.Silva845@hotmail.com',965420328,NULL),(18,'Miguel.Sousa120@hotmail.com',914245281,NULL),(19,'Catarina.Silva792@gmail.com',910015995,NULL),(20,'Francisca.Gomes@hotmail.pt',962713013,NULL),(21,'Lourenço.Martins159@yahoo.pt',916005234,NULL),(22,'Francisca.Lopes@yahoo.pt',937478253,NULL),(23,'Domingos.Gomes506@yahoo.pt',910194052,NULL),(24,'Alfredo.Francisco039@outlook.com',912420963,NULL),(25,'Rita.Mendes032@gmail.com',965973739,NULL),(26,'Pedro.Ferreira845@yahoo.pt',928289250,NULL),(27,'Ana.Dias727@yahoo.pt',926822542,NULL),(28,'Teresa.Pereira108@gmail.pt',919404538,NULL),(29,'Alice.Francisco266@yahoo.com',921856604,NULL),(30,'Diogo.Costa670@outlook.pt',933578753,NULL),(31,'Isabel.Oliveira022@yahoo.pt',917867109,NULL),(32,'Mariana.Almeida519@yahoo.com',955336334,NULL),(33,'Antónia.Francisco269@yahoo.pt',937614176,NULL),(34,'Francisco.Lopes819@outlook.com',963712541,NULL),(35,'Alfredo.Ribeiro@yahoo.pt',933517003,NULL),(36,'Augusto.Mendes176@outlook.com',965240667,NULL),(37,'Luísa.Francisco263@outlook.com',912644026,NULL),(38,'André.Ferreira112@yahoo.com',968468396,NULL),(39,'Tomás.Francisco@hotmail.pt',964967382,NULL),(40,'Francisco.Almeida424@yahoo.pt',915060805,NULL),(41,'Margarida.Gomes350@yahoo.pt',912590116,NULL),(42,'André.Ferreira516@hotmail.com',924027332,NULL),(43,'José.Lopes992@outlook.pt',966551033,NULL),(44,'Alfredo.Nunes@hotmail.pt',928618738,NULL),(45,'Bento.Silva845@gmail.pt',961090049,NULL),(46,'Joaquina.Martins968@hotmail.pt',919368931,NULL),(47,'Martim.Nunes712@gmail.com',920607791,NULL),(48,'Alice.Rodrigues@outlook.com',956269230,NULL),(49,'Augusto.Oliveira780@gmail.com',969505228,NULL),(50,'Domingas.Sousa@outlook.pt',966286629,NULL),(51,'nuno23@gmail.com',962323233,NULL),(52,'nelson30@gmail.com',912764589,NULL),(53,'sara7f@gmail.com',912171897,253707169),(54,'hugo9c@gmail.com',935987612,250172839),(55,'tony_das_camionetas@turismo.pt',957588463,NULL),(56,'sergio_calado@gmail.com',917651523,258455550),(57,'serginho123pt@sapo.pt',931234561,NULL);
/*!40000 ALTER TABLE `Contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `NIF` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `avaliacao` int NOT NULL,
  `Morada_idMorada` int NOT NULL,
  `Contacto_idContacto` int NOT NULL,
  `Clinica_idClinica` int NOT NULL,
  PRIMARY KEY (`NIF`,`Morada_idMorada`,`Contacto_idContacto`,`Clinica_idClinica`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`),
  KEY `fk_Funcionario_Morada1_idx` (`Morada_idMorada`),
  KEY `fk_Funcionario_Contacto1_idx` (`Contacto_idContacto`),
  KEY `fk_Funcionario_Clinica1_idx` (`Clinica_idClinica`),
  CONSTRAINT `fk_Funcionario_Clinica1` FOREIGN KEY (`Clinica_idClinica`) REFERENCES `Clinica` (`idClinica`),
  CONSTRAINT `fk_Funcionario_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`),
  CONSTRAINT `fk_Funcionario_Morada1` FOREIGN KEY (`Morada_idMorada`) REFERENCES `Morada` (`idMorada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES (19115371,'António Ferreira Francisco Gonçalves','1999-01-18','Estafeta',6,4,4,1),(20846577,'Bento Silva','1975-07-28','Profissional de saúde animal',5,45,45,0),(21229648,'Alice Rodrigues','1993-03-22','Assistente médico',5,48,48,0),(32556492,'Francisca Gomes Nunes Rodrigues','1985-08-26','Estafeta',6,3,3,0),(40508292,'Margarida Gomes','1990-08-22','Assistente médico',4,41,41,2),(41390189,'Domingos Costa Ferreira Gomes','1985-01-29','Estafeta',6,23,23,2),(43415001,'Luísa Nunes Freitas Francisco','1974-01-23','Profissional de saúde animal',1,37,37,1),(44381946,'Martim Martins Nunes','1992-01-05','Profissional de saúde animal',5,47,47,2),(46894403,'Rosa Silva Dias','1989-09-10','Estafeta',3,13,13,1),(51126379,'André Freitas','1975-05-27','Estafeta',1,12,12,0),(53190183,'Francisca Pereira Pereira Lopes','1994-01-26','Estafeta',1,22,22,1),(54851206,'Teresa Gomes Fernandes Pereira','1979-05-10','Profissional de saúde animal',3,28,28,1),(56801073,'André Nunes Ferreira','1980-02-20','Profissional de saúde animal',1,38,38,2),(56815569,'Ana Dias','1993-11-11','Profissional de saúde animal',6,27,27,0),(58510244,'Domingas Sousa','1972-08-16','Assistente médico',1,50,50,2),(59849550,'Júlia Gomes Silva','1996-08-19','Estafeta',3,17,17,2),(60535582,'Miguel Sousa','1973-02-18','Estafeta',5,18,18,0),(61298740,'Alfredo Silva Nunes','1998-02-24','Profissional de saúde animal',1,44,44,2),(63366610,'Domingos Oliveira Santos','1997-01-13','Estafeta',4,15,15,0),(64580885,'José Costa Freitas Lopes','1987-01-29','Administrador',3,43,43,1),(66273913,'Rosa Almeida Martins','2001-05-23','Estafeta',3,14,14,2),(66471559,'Francisco Lopes','1978-10-20','Administrador',1,34,34,1),(68657143,'Isabel Pereira Oliveira','1999-01-06','Assistente médico',6,31,31,1),(70080158,'Rita Gomes Freitas Mendes','1983-06-20','Administrador',3,25,25,1),(79852923,'André Fernandes Ferreira','1993-05-07','Gestor de clínica',4,42,42,0),(91559171,'Bento Silva Gonçalves Silva','1972-09-28','Estafeta',4,9,9,0),(99164836,'Luís Freitas','1975-02-28','Estafeta',6,6,6,0),(103473516,'Francisca Gomes','1973-01-28','Estafeta',6,20,20,2),(104991290,'Pedro Rodrigues Ferreira','1988-02-13','Profissional de saúde animal',6,26,26,2),(109849364,'Beatriz Fernandes Freitas Lopes','1996-05-03','Estafeta',3,11,11,2),(113664596,'Alfredo Sousa Ribeiro','1991-08-11','Profissional de saúde animal',3,35,35,2),(114039155,'Joaquina Costa Martins','1989-01-16','Profissional de saúde animal',1,46,46,1),(114258433,'Domingos Ribeiro','1978-03-20','Estafeta',6,7,7,1),(120882490,'Francisco Almeida Gonçalves Almeida','1996-11-12','Assistente médico',3,40,40,1),(131915470,'Mariana Sousa Almeida','1999-04-21','Assistente médico',3,32,32,2),(138022850,'Augusto Costa Oliveira','1976-12-21','Assistente médico',1,49,49,1),(144691911,'Alfredo Ribeiro Rodrigues Francisco','1975-02-04','Gestor de clínica',3,24,24,0),(165529400,'Tomás Francisco Francisco','1977-09-23','Assistente médico',5,39,39,0),(172304089,'Diogo Pereira Freitas Costa','1970-06-02','Assistente médico',1,30,30,0),(175550073,'Tomás Martins Ribeiro','1986-01-23','Estafeta',6,8,8,2),(177580819,'Margarida Silva Ribeiro Martins','1986-06-04','Estafeta',3,16,16,1),(182856385,'Catarina Costa Silva','1989-12-12','Estafeta',6,19,19,1),(197318417,'Joana Pereira Francisco','1985-01-05','Estafeta',2,10,10,1),(219159294,'Lourenço Martins','1970-12-22','Estafeta',4,21,21,0),(223417937,'Alice Francisco','1990-08-02','Profissional de saúde animal',5,29,29,2),(239267072,'Luís Nunes Fernandes Fernandes','1982-01-08','Estafeta',6,5,5,2),(241206088,'Augusto Ferreira Silva Mendes','2001-03-16','Profissional de saúde animal',2,36,36,0),(242993305,'Antónia Freitas Nunes Francisco','1982-01-19','Gestor de clínica',1,33,33,0);
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logs`
--

DROP TABLE IF EXISTS `Logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Logs` (
  `Número` int NOT NULL AUTO_INCREMENT,
  `Sucesso` int NOT NULL DEFAULT '0',
  `DataHora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Descrição` text NOT NULL,
  PRIMARY KEY (`Número`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logs`
--

LOCK TABLES `Logs` WRITE;
/*!40000 ALTER TABLE `Logs` DISABLE KEYS */;
INSERT INTO `Logs` VALUES (1,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 647451205\nContacto com identificador: 51\nIdentificador de morada: 51'),(2,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 425366944\nContacto com identificador: 52\nIdentificador de morada: 52'),(3,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 773409851\nContacto com identificador: 53\nIdentificador de morada: 53'),(4,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 475564914\nContacto com identificador: 54\nIdentificador de morada: 54'),(5,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 649851205\nContacto com identificador: 55\nIdentificador de morada: 55'),(6,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 877612205\nContacto com identificador: 56\nIdentificador de morada: 56'),(7,1,'2023-01-18 11:02:51','Operação bem sucedida: Criação de cliente\nCom o NIF: 985455512\nContacto com identificador: 57\nIdentificador de morada: 57'),(8,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 647451205\nIdentificado pelo número: 0'),(9,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 425366944\nIdentificado pelo número: 1'),(10,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 425366944\nIdentificado pelo número: 2'),(11,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 425366944\nIdentificado pelo número: 3'),(12,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 425366944\nIdentificado pelo número: 4'),(13,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 773409851\nIdentificado pelo número: 5'),(14,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 475564914\nIdentificado pelo número: 6'),(15,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 985455512\nIdentificado pelo número: 7'),(16,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 877612205\nIdentificado pelo número: 8'),(17,1,'2023-01-18 11:02:51','Operação bem sucedida: Animal associado ao cliente\nCom o NIF: 647451205\nIdentificado pelo número: 9'),(18,1,'2023-01-18 11:02:51','Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: 19115371\nData estimada de recolha: 2023-01-17\nData Estimada de Entrega2023-01-18\nNIF Cliente:425366944\nAnimal em causa: 3\nClinica de destino: 1\nO Cliente ficou agora com: 21.36 pontos'),(19,1,'2023-01-18 11:02:51','Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: 60535582\nData estimada de recolha: 2023-01-17\nData Estimada de Entrega2023-02-19\nNIF Cliente:647451205\nAnimal em causa: 9\nClinica de destino: 0\nO Cliente ficou agora com: 14.825 pontos'),(20,1,'2023-01-18 11:02:51','Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: 60535582\nData estimada de recolha: 2023-01-17\nData Estimada de Entrega2023-01-18\nNIF Cliente:425366944\nAnimal em causa: 1\nClinica de destino: 1\nO Cliente ficou agora com: 21.345 pontos'),(21,1,'2023-01-18 11:02:51','Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: 60535582\nData estimada de recolha: 2023-01-15\nData Estimada de Entrega2023-01-19\nNIF Cliente:773409851\nAnimal em causa: 5\nClinica de destino: 1\nO Cliente ficou agora com: 16.125 pontos'),(22,1,'2023-01-18 11:02:51','Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: 60535582\nData estimada de recolha: 2023-01-17\nData Estimada de Entrega2023-01-22\nNIF Cliente:475564914\nAnimal em causa: 6\nClinica de destino: 2\nO Cliente ficou agora com: 25.815 pontos');
/*!40000 ALTER TABLE `Logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Morada`
--

DROP TABLE IF EXISTS `Morada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Morada` (
  `idMorada` int NOT NULL,
  `codPostal` varchar(150) NOT NULL,
  `rua` varchar(150) NOT NULL,
  `localidade` varchar(150) NOT NULL,
  `porta` int NOT NULL,
  `piso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMorada`),
  UNIQUE KEY `idMorada_UNIQUE` (`idMorada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Morada`
--

LOCK TABLES `Morada` WRITE;
/*!40000 ALTER TABLE `Morada` DISABLE KEYS */;
INSERT INTO `Morada` VALUES (0,'4710-167','Rua Soldado Manuel Pinheiro','Adaúfe',7,NULL),(1,'4705-472','Rua Cruz de Vilar','Tadim',31,NULL),(2,'4770-121','Rua Joao Carlos Pereira','Requião',189,NULL),(3,'5821-402','Rua  25 de Abril','Vilar do Paraiso',220,'3D'),(4,'2126-197','Travessa do Vilar do Paraíso','Meirinhos',863,'null'),(5,'6694-056','Travessa  Estrela de Ouro','Bruçó',172,'9T'),(6,'5162-782','Rua da Boavista','Caldas de São Jorge',56,'5F'),(7,'8840-644','Rua de Comandante de Santa Marta','Mafamude',540,'1T'),(8,'8976-762','Travessa da Estrela de Ouro','Fiães',881,'null'),(9,'5610-246','Travessa do Facho','Bemposta',119,'null'),(10,'4533-723','Rua do Santa Engrácia','Bruçó',747,'9D'),(11,'2656-424','Rua do Vilar do Paraíso','Pego',223,'null'),(12,'4206-722','Travessa de Santa Casa da Misericórdia','Eirado',447,'null'),(13,'9754-074','Travessa do Independência','Fornos',769,'7E'),(14,'5738-676','Travessa da São Vicente de Fora','Fiães',813,'7E'),(15,'7708-350','Rua do Parque das Conchas','Santo Inácio',302,'null'),(16,'3310-595','Travessa  Parque das Conchas','Meirinhos',928,'null'),(17,'9506-704','Travessa  Bela Vista','Alferrarede',967,'null'),(18,'6083-986','Rua  25 de Abril','Cumieira',942,'null'),(19,'9702-289','Rua do São Vicente de Fora','Moimenta',325,'null'),(20,'0225-340','Rua do Santa Casa da Misericórdia','Moimenta',910,'9T'),(21,'7958-614','Rua  Santa Casa da Misericórdia','Bruçó',860,'null'),(22,'1683-795','Travessa da Santa Casa da Misericórdia','Caldas de São Jorge',911,'null'),(23,'6135-338','Rua  Estrela de Ouro','Bemposta',751,'null'),(24,'9513-742','Rua do Independência','Nespreira',850,'null'),(25,'0972-645','Travessa da Almirante Lopes','Moimenta',644,'3D'),(26,'9675-924','Rua de Estrela de Ouro','Alferrarede',869,'null'),(27,'5331-456','Travessa da Dom Diogo de Sousa','Pego',104,'4T'),(28,'3632-499','Rua  Santa Engrácia','Cortiçada',657,'6F'),(29,'3085-043','Travessa da Santa Casa da Misericórdia','Eirado',246,'null'),(30,'9795-066','Travessa do Santa Engrácia','Bruçó',779,'9D'),(31,'5621-241','Rua  Independência','Bemposta',939,'5E'),(32,'3830-644','Travessa da Almirante Lopes','Pego',414,'null'),(33,'7519-979','Travessa do Almirante Lopes','Bemposta',981,'null'),(34,'2009-432','Travessa do 19 de Junho','Rio Torto',658,'null'),(35,'3245-528','Travessa da Santa Casa da Misericórdia','Sequeira',334,'7T'),(36,'0786-202','Travessa  Facho','Santo Inácio',469,'null'),(37,'8615-658','Rua do 25 de Abril','Eirado',612,'1F'),(38,'5968-148','Travessa  São Vicente de Fora','Cortiçada',965,'0T'),(39,'2818-410','Travessa da Facho','Fiães',988,'4F'),(40,'7612-306','Travessa do Boavista','Moimenta',12,'8F'),(41,'0868-902','Rua da do Ferro','Meirinhos',928,'7D'),(42,'1666-297','Travessa de Vilar do Paraíso','Pego',820,'8T'),(43,'5836-341','Rua de 25 de Abril','Moimenta',923,'null'),(44,'4023-116','Travessa do Facho','Mouriscas',421,'null'),(45,'4208-619','Rua de Estrela de Ouro','Caldelas',369,'2E'),(46,'3521-582','Travessa  Santa Engrácia','Mafamude',477,'8E'),(47,'6892-711','Rua de Dom Diogo de Sousa','Santo Inácio',109,'null'),(48,'0139-196','Travessa  Parque das Conchas','Vilar do Paraiso',580,'null'),(49,'8369-387','Travessa da 19 de Junho','Fiães',478,'null'),(50,'6738-655','Rua  Santa Engrácia','Moimenta',244,'null'),(51,'4697','Rua das Bananeiras','Fafe',62,'0'),(52,'4694','Rua das Pessegos','Taipas',17,'0'),(53,'3216','Urbanização dos Astros','Braga',654,'5'),(54,'3774','Rua dos Carneiros','tadim',75,'2'),(55,'3447','Urbanização dos Bombeiros','Braga',61,'8'),(56,'4450','Rua das Empadas','Guimarães',96,'1'),(57,'4380','Rua das Avestruzes','Fafe',123,'4');
/*!40000 ALTER TABLE `Morada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `idPedido` int NOT NULL,
  `dataEstimadaRecolha` date NOT NULL,
  `dataEfetivaRecolha` date DEFAULT NULL,
  `dataEstimadaEntrega` date NOT NULL,
  `dataEfetivaEntrega` date DEFAULT NULL,
  `avaliacao` int DEFAULT NULL,
  `custoFinal` float NOT NULL,
  `Animal_idAnimal` int NOT NULL,
  `Servico_idServico` int NOT NULL,
  `Funcionario_NIF` int NOT NULL,
  `Clinica_idClinica` int NOT NULL,
  PRIMARY KEY (`idPedido`,`Animal_idAnimal`,`Servico_idServico`,`Funcionario_NIF`,`Clinica_idClinica`),
  UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  KEY `fk_Pedido_Animal1_idx` (`Animal_idAnimal`),
  KEY `fk_Pedido_Servico1_idx` (`Servico_idServico`),
  KEY `fk_Pedido_Funcionario1_idx` (`Funcionario_NIF`),
  KEY `fk_Pedido_Clinica1_idx` (`Clinica_idClinica`),
  CONSTRAINT `fk_Pedido_Animal1` FOREIGN KEY (`Animal_idAnimal`) REFERENCES `Animal` (`idAnimal`),
  CONSTRAINT `fk_Pedido_Clinica1` FOREIGN KEY (`Clinica_idClinica`) REFERENCES `Clinica` (`idClinica`),
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`Funcionario_NIF`) REFERENCES `Funcionario` (`NIF`),
  CONSTRAINT `fk_Pedido_Servico1` FOREIGN KEY (`Servico_idServico`) REFERENCES `Servico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (0,'2023-01-17',NULL,'2023-01-18',NULL,0,42.72,3,1,19115371,1),(1,'2023-01-17',NULL,'2023-02-19',NULL,0,29.65,9,2,60535582,0),(2,'2023-01-17',NULL,'2023-01-18',NULL,0,42.69,1,1,60535582,1),(3,'2023-01-15',NULL,'2023-01-19',NULL,0,32.25,5,6,60535582,1),(4,'2023-01-17',NULL,'2023-01-22',NULL,0,51.63,6,3,60535582,2);
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `idServico` int NOT NULL,
  `tipoServico` varchar(150) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `valorBase` float NOT NULL,
  `lucro` float NOT NULL,
  PRIMARY KEY (`idServico`),
  UNIQUE KEY `idServico_UNIQUE` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
INSERT INTO `Servico` VALUES (0,'Desparasitação externa','Banho e aplicação de uma ampôla desparasitante(pulgas e carraças)',15,10),(1,'Desparasitação interna','Banho e vacinação contra pulgas e carraças',25,12),(2,'Banho e brushing','Banho completo e brushing',15,7),(3,'Consulta de clínica geral','Consulta de medicina veterinária geral',35,25),(4,'Esterilização','Esterilização',150,100),(5,'Análises Clínicas','Análises clínicas básicas(Recolha de sangue, inspeção visual)',30,25),(6,'Hotel','Permanência no hotel com supervisionamento dos nossos profissionais e acompanhamento dos nossos profissionais',20,7);
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-18 11:04:03
