CREATE DATABASE  IF NOT EXISTS `TrabalhoBD` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TrabalhoBD`;
-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: TrabalhoBD
-- ------------------------------------------------------
-- Server version	5.7.21-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Ana'),(2,'Joaquim'),(3,'Maria'),(4,'José'),(5,'João'),(6,'Cícero');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItensVenda`
--

DROP TABLE IF EXISTS `ItensVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItensVenda` (
  `Item` int(11) NOT NULL,
  `Venda_ID` int(11) NOT NULL,
  `Produto_ID` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Item`,`Venda_ID`),
  KEY `fk_ItensVenda_1_idx` (`Venda_ID`),
  KEY `fk_ItensVenda_2_idx` (`Produto_ID`),
  CONSTRAINT `fk_ItensVenda_1` FOREIGN KEY (`Venda_ID`) REFERENCES `Vendas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItensVenda_2` FOREIGN KEY (`Produto_ID`) REFERENCES `Produtos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItensVenda`
--

LOCK TABLES `ItensVenda` WRITE;
/*!40000 ALTER TABLE `ItensVenda` DISABLE KEYS */;
INSERT INTO `ItensVenda` VALUES (1,1,12,2,25.00,50.00),(1,2,10,1,120.00,120.00),(1,3,7,3,90.00,270.00),(1,4,10,2,120.00,240.00),(1,5,5,3,30.00,90.00),(1,6,8,2,30.00,60.00),(2,1,11,5,25.00,125.00),(2,3,2,4,30.00,120.00),(3,2,12,3,25.00,75.00),(4,2,8,2,30.00,60.00);
/*!40000 ALTER TABLE `ItensVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `Produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produtos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Preco` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `Produtos` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
INSERT INTO `Produtos` VALUES (1,'Calça Azul','100.00'),(2,'Saia Rosa','30.00'),(3,'Jardineira Bege','120.00'),(4,'Saia Verde','30.00'),(5,'Blusa Amarela','25.00'),(6,'Sapato Social','100.00'),(7,'Sandália Casual','90.00'),(8,'Regata Masculina Verde','30.00'),(9,'Regata Masculina Estampada','30.00'),(10,'Sapato Casual ','120.00'),(11,'Regata Feminina Azul','25.00'),(12,'Regata Feminina Estampada','25.00');
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendas`
--

DROP TABLE IF EXISTS `Vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClieteID` int(11) NOT NULL,
  `Data` varchar(45) NOT NULL DEFAULT 'now',
  PRIMARY KEY (`ID`),
  KEY `fk_Vendas_1_idx` (`ClieteID`),
  CONSTRAINT `fk_Vendas_1` FOREIGN KEY (`ClieteID`) REFERENCES `Clientes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendas`
--

LOCK TABLES `Vendas` WRITE;
/*!40000 ALTER TABLE `Vendas` DISABLE KEYS */;
INSERT INTO `Vendas` VALUES (1,1,'24/02/2018'),(2,1,'23/02/2018'),(3,2,'12/03/2019'),(4,2,'24/02/2019'),(5,3,'30/03/2018'),(6,3,'31/03/2018'),(7,4,'02/02/2019'),(8,5,'04/04/2019'),(9,6,'28/04/2018'),(10,6,'118/06/2018');
/*!40000 ALTER TABLE `Vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'TrabalhoBD'
--

--
-- Dumping routines for database 'TrabalhoBD'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-24 13:15:48
