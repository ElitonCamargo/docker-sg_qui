-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: sgqui    Database: sg_qui
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `configuracao`
--

DROP TABLE IF EXISTS `configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `value` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao`
--

/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
INSERT INTO `configuracao` VALUES (1,'textoImpressaoRodape','\"valor\"'),(2,'print-produzido-por','\"David Carvalho\"'),(3,'print-resultado-final','\"Aprovado\"'),(4,'exemplo2','[{\"id\": 0, \"nome\": \"A\"}, {\"id\": 1, \"nome\": \"B\"}, {\"id\": 2, \"nome\": \"C\"}]'),(5,'print-anexo','\"ANEXO PQ03 A01 - VIGÊNCIA: 05/03/2024 - REVISÃO:01\"'),(6,'print-responsavel-area','\"Fábio Scudeler\"'),(7,'print-procedimento','\"Acrescentar as matérias primas em ordem de adição, seguindo os tempos de agitação.\"'),(8,'print-analises','\"Cor, Densidade, pH, Solubilidade, Viscosidade, Supersensibilidade, Índice Salino (IS), Condutividade Elétrica (CE)\"'),(9,'print-logo','\"data:image/jpeg;base64,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\"');
/*!40000 ALTER TABLE `configuracao` ENABLE KEYS */;

--
-- Table structure for table `elemento`
--

DROP TABLE IF EXISTS `elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elemento` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `simbolo` char(3) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `numero_atomico` int DEFAULT NULL,
  `massa_atomica` decimal(10,6) DEFAULT NULL,
  `grupo` int unsigned DEFAULT NULL,
  `periodo` int unsigned DEFAULT NULL,
  `ponto_de_fusao` decimal(10,6) DEFAULT NULL,
  `ponto_de_ebulicao` decimal(10,6) DEFAULT NULL,
  `densidade` decimal(10,8) DEFAULT NULL,
  `estado_padrao` varchar(20) DEFAULT NULL,
  `configuracao_eletronica` varchar(50) DEFAULT NULL,
  `propriedades` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `simbolo` (`simbolo`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elemento`
--

/*!40000 ALTER TABLE `elemento` DISABLE KEYS */;
INSERT INTO `elemento` VALUES (1,'H','Hidrogênio',1,1.008000,1,1,-259.140000,-252.870000,0.08990000,'Gasoso','1s¹','Não metal'),(2,'He','Hélio',2,4.002600,18,1,-272.200000,-268.930000,0.17860000,'Gasoso','1s²','Gás nobre'),(3,'Li','Lítio',3,6.940000,1,2,180.540000,1342.000000,0.53000000,'Sólido','[He] 2s¹','Metal alcalino'),(4,'Be','Berílio',4,9.012200,2,2,1278.000000,2970.000000,1.85000000,'Sólido','[He] 2s²','Metal alcalino-terroso'),(5,'B','Boro',5,10.810000,13,2,2076.000000,3927.000000,2.34000000,'Sólido','[He] 2s² 2p¹','Semimetal'),(6,'C','Carbono',6,12.011000,14,2,3550.000000,4827.000000,2.26700000,'Sólido','[He] 2s² 2p²','Não metal'),(7,'N','Nitrogênio',7,14.007000,15,2,-209.860000,-195.790000,0.00125000,'Gasoso','[He] 2s² 2p³','Não metal'),(8,'O','Oxigênio',8,15.999000,16,2,-218.790000,-182.960000,0.00143000,'Gasoso','[He] 2s² 2p⁴','Não metal'),(9,'F','Flúor',9,18.998000,17,2,-219.670000,-188.120000,0.00170000,'Gasoso','[He] 2s² 2p⁵','Halogênio'),(10,'Ne','Neônio',10,20.180000,18,2,-248.590000,-246.080000,0.00090000,'Gasoso','[He] 2s² 2p⁶','Gás nobre'),(11,'Na','Sódio',11,22.990000,1,3,97.720000,883.000000,0.97000000,'Sólido','[Ne] 3s¹','Metal alcalino'),(12,'Mg','Magnésio',12,24.305000,2,3,650.000000,1090.000000,1.74000000,'Sólido','[Ne] 3s²','Metal alcalino-terroso'),(13,'Al','Alumínio',13,26.982000,13,3,660.320000,2519.000000,2.70000000,'Sólido','[Ne] 3s² 3p¹','Metal'),(14,'Si','Silício',14,28.085000,14,3,1414.000000,3265.000000,2.33000000,'Sólido','[Ne] 3s² 3p²','Semimetal'),(15,'P','Fósforo',15,30.974000,15,3,44.150000,280.500000,1.82300000,'Sólido','[Ne] 3s² 3p³','Não metal'),(16,'S','Enxofre',16,32.060000,16,3,115.210000,444.720000,2.06700000,'Sólido','[Ne] 3s² 3p⁴','Não metal'),(17,'Cl','Cloro',17,35.450000,17,3,-100.980000,-34.600000,0.00320000,'Gasoso','[Ne] 3s² 3p⁵','Halogênio'),(18,'Ar','Argônio',18,39.948000,18,3,-189.360000,-185.860000,0.00170000,'Gasoso','[Ne] 3s² 3p⁶','Gás nobre'),(19,'K','Potássio',19,39.098000,1,4,63.380000,759.900000,0.89000000,'Sólido','[Ar] 4s¹','Metal alcalino'),(20,'Ca','Cálcio',20,40.078000,2,4,839.000000,1484.000000,1.55000000,'Sólido','[Ar] 4s²','Metal alcalino-terroso'),(21,'Sc','Escândio',21,44.956000,3,4,1539.000000,2832.000000,2.99000000,'Sólido','[Ar] 3d¹ 4s²','Metal de transição'),(22,'Ti','Titânio',22,47.867000,4,4,1668.000000,3287.000000,4.50700000,'Sólido','[Ar] 3d² 4s²','Metal de transição'),(23,'V','Vanádio',23,50.942000,5,4,1910.000000,3407.000000,6.11000000,'Sólido','[Ar] 3d³ 4s²','Metal de transição'),(24,'Cr','Cromo',24,51.996000,6,4,1907.000000,2672.000000,7.15000000,'Sólido','[Ar] 3d⁵ 4s¹','Metal de transição'),(25,'Mn','Manganês',25,54.938000,7,4,1246.000000,2061.000000,7.44000000,'Sólido','[Ar] 3d⁵ 4s²','Metal de transição'),(26,'Fe','Ferro',26,55.845000,8,4,1538.000000,2862.000000,7.87000000,'Sólido','[Ar] 3d⁶ 4s²','Metal de transição'),(27,'Co','Cobalto',27,58.933000,9,4,1495.000000,2927.000000,8.90000000,'Sólido','[Ar] 3d⁷ 4s²','Metal de transição'),(28,'Ni','Níquel',28,58.693000,10,4,1455.000000,2913.000000,8.90000000,'Sólido','[Ar] 3d⁸ 4s²','Metal de transição'),(29,'Cu','Cobre',29,63.546000,11,4,1084.620000,2562.000000,8.96000000,'Sólido','[Ar] 3d¹⁰ 4s¹','Metal de transição'),(30,'Zn','Zinco',30,65.380000,12,4,419.530000,907.000000,7.14000000,'Sólido','[Ar] 3d¹⁰ 4s²','Metal de transição'),(31,'Ga','Gálio',31,69.723000,13,4,29.760000,2204.000000,5.91000000,'Sólido','[Ar] 3d¹⁰ 4s² 4p¹','Metal'),(32,'Ge','Germanio',32,72.630000,14,4,938.250000,2830.000000,5.32000000,'Sólido','[Ar] 3d¹⁰ 4s² 4p²','Semimetal'),(33,'As','Arsênio',33,74.922000,15,4,817.000000,613.000000,5.73000000,'Sólido','[Ar] 3d¹⁰ 4s² 4p³','Semimetal'),(34,'Se','Selênio',34,78.971000,16,4,221.000000,685.000000,4.81000000,'Sólido','[Ar] 3d¹⁰ 4s² 4p⁴','Não metal'),(35,'Br','Bromo',35,79.904000,17,4,-7.200000,58.780000,3.12000000,'Líquido','[Ar] 3d¹⁰ 4s² 4p⁵','Halogênio'),(36,'Kr','Criptônio',36,83.798000,18,4,-157.370000,-153.220000,0.00375000,'Gasoso','[Ar] 3d¹⁰ 4s² 4p⁶','Gás nobre'),(37,'Rb','Rubídio',37,85.468000,1,5,38.890000,688.000000,1.53200000,'Sólido','[Kr] 5s¹','Metal alcalino'),(38,'Sr','Estrôncio',38,87.620000,2,5,769.000000,1384.000000,2.64000000,'Sólido','[Kr] 5s²','Metal alcalino-terroso'),(39,'Y','Ítrio',39,88.906000,3,5,1522.000000,3345.000000,4.47000000,'Sólido','[Kr] 4d¹ 5s²','Metal de transição'),(40,'Zr','Zircônio',40,91.224000,4,5,1852.000000,4377.000000,6.52000000,'Sólido','[Kr] 4d² 5s²','Metal de transição'),(41,'Nb','Nióbio',41,92.906000,5,5,2477.000000,4744.000000,8.57000000,'Sólido','[Kr] 4d⁴ 5s¹','Metal de transição'),(42,'Mo','Molibdênio',42,95.950000,6,5,2623.000000,4639.000000,10.22000000,'Sólido','[Kr] 4d⁵ 5s¹','Metal de transição'),(43,'Tc','Tecnécio',43,98.000000,7,5,2157.000000,4265.000000,11.00000000,'Sólido','[Kr] 4d⁵ 5s²','Metal de transição'),(44,'Ru','Rutênio',44,101.070000,8,5,2334.000000,4150.000000,12.41000000,'Sólido','[Kr] 4d⁷ 5s¹','Metal de transição'),(45,'Rh','Ródio',45,102.910000,9,5,1964.000000,3695.000000,12.41000000,'Sólido','[Kr] 4d⁸ 5s¹','Metal de transição'),(46,'Pd','Paládio',46,106.420000,10,5,1552.000000,2927.000000,12.02000000,'Sólido','[Kr] 4d¹⁰','Metal de transição'),(47,'Ag','Prata',47,107.870000,11,5,961.780000,2162.000000,10.49000000,'Sólido','[Kr] 4d¹⁰ 5s¹','Metal de transição'),(48,'Cd','Cádmio',48,112.410000,12,5,321.070000,767.000000,8.65000000,'Sólido','[Kr] 4d¹⁰ 5s²','Metal de transição'),(49,'In','Índio',49,114.820000,13,5,156.600000,2072.000000,7.31000000,'Sólido','[Kr] 4d¹⁰ 5s² 5p¹','Metal'),(50,'Sn','Estanho',50,118.710000,14,5,231.930000,2602.000000,7.31000000,'Sólido','[Kr] 4d¹⁰ 5s² 5p²','Metal'),(51,'Sb','Antimônio',51,121.760000,15,5,630.630000,1587.000000,6.68000000,'Sólido','[Kr] 4d¹⁰ 5s² 5p³','Semimetal'),(52,'Te','Telúrio',52,127.600000,16,5,449.510000,988.000000,6.24000000,'Sólido','[Kr] 4d¹⁰ 5s² 5p⁴','Semimetal'),(53,'I','Iodo',53,126.900000,17,5,113.700000,184.400000,4.93000000,'Sólido','[Kr] 4d¹⁰ 5s² 5p⁵','Halogênio'),(54,'Xe','Xenônio',54,131.290000,18,5,-111.790000,-108.120000,0.00590000,'Gasoso','[Kr] 4d¹⁰ 5s² 5p⁶','Gás nobre'),(55,'Cs','Césio',55,132.910000,1,6,28.440000,671.000000,1.87300000,'Sólido','[Xe] 6s¹','Metal alcalino'),(56,'Ba','Bário',56,137.330000,2,6,727.000000,1870.000000,3.51000000,'Sólido','[Xe] 6s²','Metal alcalino-terroso'),(57,'Ce','Cério',58,140.120000,3,6,795.000000,3443.000000,6.77000000,'Sólido','[Xe] 4f¹ 5d¹ 6s²','Lantanídeo'),(58,'La','Lantânio',57,138.910000,3,6,920.000000,3464.000000,6.15000000,'Sólido','[Xe] 5d¹ 6s²','Lantanídeo'),(59,'Pm','Promécio',61,145.000000,3,6,1042.000000,3000.000000,7.26000000,'Sólido','[Xe] 4f⁵ 6s²','Lantanídeo'),(60,'Hf','Háfnio',72,178.490000,4,6,2233.000000,4603.000000,13.31000000,'Sólido','[Xe] 4f¹⁴ 5d² 6s²','Metal de transição'),(61,'Pr','Praseodímio',59,140.910000,3,6,931.000000,3290.000000,6.77000000,'Sólido','[Xe] 4f³ 6s²','Lantanídeo'),(62,'Nd','Neodímio',60,144.240000,3,6,1021.000000,3068.000000,7.01000000,'Sólido','[Xe] 4f⁴ 6s²','Lantanídeo'),(63,'Ta','Tântalo',73,180.950000,5,6,3017.000000,5458.000000,16.65000000,'Sólido','[Xe] 4f¹⁴ 5d³ 6s²','Metal de transição'),(64,'W','Tungstênio',74,183.840000,6,6,3422.000000,5555.000000,19.25000000,'Sólido','[Xe] 4f¹⁴ 5d⁴ 6s²','Metal de transição'),(65,'Re','Rênio',75,186.210000,7,6,3186.000000,5627.000000,21.02000000,'Sólido','[Xe] 4f¹⁴ 5d⁵ 6s²','Metal de transição'),(66,'Sm','Samário',62,150.360000,3,6,1072.000000,1794.000000,7.52000000,'Sólido','[Xe] 4f⁶ 6s²','Lantanídeo'),(67,'Eu','Európio',63,151.960000,3,6,822.000000,1597.000000,5.24000000,'Sólido','[Xe] 4f⁷ 6s²','Lantanídeo'),(68,'Os','Ósmio',76,190.230000,8,6,3033.000000,5012.000000,22.59000000,'Sólido','[Xe] 4f¹⁴ 5d⁶ 6s²','Metal de transição'),(69,'Gd','Gadolínio',64,157.250000,3,6,1311.000000,3233.000000,7.90000000,'Sólido','[Xe] 4f⁷ 5d¹ 6s²','Lantanídeo'),(70,'Ir','Irídio',77,192.220000,9,6,2739.000000,4701.000000,22.65000000,'Sólido','[Xe] 4f¹⁴ 5d⁷ 6s²','Metal de transição'),(71,'Pt','Platina',78,195.080000,10,6,2041.400000,4098.000000,21.45000000,'Sólido','[Xe] 4f¹⁴ 5d⁹ 6s¹','Metal de transição'),(72,'Tb','Térbio',65,158.930000,3,6,1356.000000,3123.000000,8.23000000,'Sólido','[Xe] 4f⁹ 6s²','Lantanídeo'),(73,'Au','Ouro',79,196.970000,11,6,1064.180000,2856.000000,19.32000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s¹','Metal de transição'),(74,'Dy','Disprósio',66,162.500000,3,6,1412.000000,2567.000000,8.55000000,'Sólido','[Xe] 4f¹⁰ 6s²','Lantanídeo'),(75,'Hg','Mercúrio',80,200.590000,12,6,-38.830000,356.730000,13.53000000,'Líquido','[Xe] 4f¹⁴ 5d¹⁰ 6s²','Metal de transição'),(76,'Ho','Hólmio',67,164.930000,3,6,1474.000000,2720.000000,8.79000000,'Sólido','[Xe] 4f¹¹ 6s²','Lantanídeo'),(77,'Er','Érbio',68,167.260000,3,6,1522.000000,2510.000000,9.07000000,'Sólido','[Xe] 4f¹² 6s²','Lantanídeo'),(78,'Tl','Tálio',81,204.380000,13,6,304.000000,1473.000000,11.85000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p¹','Metal'),(79,'Pb','Chumbo',82,207.200000,14,6,327.500000,1749.000000,11.34000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p²','Metal'),(80,'Tm','Túlio',69,168.930000,3,6,1545.000000,1727.000000,9.32000000,'Sólido','[Xe] 4f¹³ 6s²','Lantanídeo'),(81,'Bi','Bismuto',83,208.980000,15,6,271.300000,1564.000000,9.78000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p³','Metal'),(82,'Yb','Itérbio',70,173.050000,3,6,819.000000,1196.000000,6.90000000,'Sólido','[Xe] 4f¹⁴ 6s²','Lantanídeo'),(83,'Lu','Lutécio',71,174.970000,3,6,1663.000000,3402.000000,9.84000000,'Sólido','[Xe] 4f¹⁴ 5d¹ 6s²','Lantanídeo'),(84,'Po','Polônio',84,209.000000,16,6,254.000000,962.000000,9.20000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁴','Semimetal'),(85,'At','Ástato',85,210.000000,17,6,302.000000,337.000000,7.00000000,'Sólido','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁵','Halogênio'),(86,'Rn','Radônio',86,222.000000,18,6,-71.000000,-61.700000,0.00973000,'Gasoso','[Xe] 4f¹⁴ 5d¹⁰ 6s² 6p⁶','Gás nobre'),(87,'Fr','Frâncio',87,223.000000,1,7,27.000000,677.000000,1.87000000,'Sólido','[Rn] 7s¹','Metal alcalino'),(88,'Ra','Rádio',88,226.000000,2,7,700.000000,1737.000000,5.00000000,'Sólido','[Rn] 7s²','Metal alcalino-terroso'),(89,'Ac','Actínio',89,227.000000,3,7,1050.000000,3200.000000,10.07000000,'Sólido','[Rn] 6d¹ 7s²','Actinídeo'),(90,'Am','Amerício',95,243.000000,13,7,1176.000000,2011.000000,13.67000000,'Sólido','[Rn] 5f⁷ 7s²','Actinídeo'),(91,'Bk','Berquélio',97,247.000000,NULL,7,1323.000000,2627.000000,14.78000000,'Sólido','[Rn] 5f⁹ 7s²','Actinídeo'),(92,'Cf','Califórnio',98,251.000000,NULL,7,1173.000000,NULL,15.10000000,'Sólido','[Rn] 5f¹⁰ 7s²','Actinídeo'),(93,'Cm','Cúrio',96,247.000000,NULL,7,1345.000000,NULL,13.51000000,'Sólido','[Rn] 5f⁸ 7s²','Actinídeo'),(94,'Es','Einstênio',99,252.000000,NULL,7,883.000000,NULL,8.84000000,'Sólido','[Rn] 5f¹¹ 7s²','Actinídeo'),(95,'Fm','Férmio',100,257.000000,NULL,7,1527.000000,NULL,NULL,'Sólido','[Rn] 5f¹² 7s²','Actinídeo'),(96,'Lr','Laurêncio',103,266.000000,NULL,7,1627.000000,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 7s²','Actinídeo'),(97,'Md','Mendelévio',101,258.000000,NULL,7,1100.000000,NULL,NULL,'Sólido','[Rn] 5f¹³ 7s²','Actinídeo'),(98,'No','Nobélio',102,259.000000,NULL,7,827.000000,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 7s² 7p¹','Actinídeo'),(99,'Np','Neptúnio',93,237.000000,NULL,7,640.000000,3900.000000,20.45000000,'Sólido','[Rn] 5f⁴ 6d¹ 7s²','Actinídeo'),(100,'Pa','Protactínio',91,231.036000,NULL,7,1841.000000,4300.000000,15.37000000,'Sólido','[Rn] 5f² 6d¹ 7s²','Actinídeo'),(101,'Pu','Plutônio',94,244.000000,NULL,7,640.000000,3235.000000,19.86000000,'Sólido','[Rn] 5f⁶ 7s²','Actinídeo'),(102,'Th','Tório',90,232.038000,NULL,7,1750.000000,4820.000000,11.72000000,'Sólido','[Rn] 6d² 7s²','Actinídeo'),(103,'U','Urânio',92,238.029000,NULL,7,1132.200000,4131.000000,19.05000000,'Sólido','[Rn] 5f³ 6d¹ 7s²','Actinídeo'),(104,'Rf','Rutherfórdio',104,267.000000,4,7,2100.000000,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d² 7s²','Metal de transição'),(105,'Db','Dúbnio',105,268.000000,5,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d³ 7s²','Metal de transição'),(106,'Sg','Seabórgio',106,269.000000,6,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d⁴ 7s²','Metal de transição'),(107,'Bh','Bório',107,270.000000,7,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d⁵ 7s²','Metal de transição'),(108,'Hs','Hássio',108,277.000000,8,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d⁶ 7s²','Metal de transição'),(109,'Mt','Meitnério',109,278.000000,9,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d⁷ 7s²','Metal de transição'),(110,'Ds','Darmstádio',110,281.000000,10,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d⁹ 7s²','Metal de transição'),(111,'Rg','Roentgênio',111,282.000000,11,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s²','Metal de transição'),(112,'Cn','Copernício',112,285.000000,12,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p¹','Metal de transição'),(113,'Nh','Nihônio',113,286.000000,13,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p²','Metal de transição'),(114,'Fl','Fleróvio',114,289.000000,14,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p³','Metal de transição'),(115,'Mc','Moscóvio',115,290.000000,15,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁴','Metal de transição'),(116,'Lv','Livermório',116,293.000000,16,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁵','Metal de transição'),(117,'Ts','Tenessino',117,294.000000,17,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁶','Metal de transição'),(118,'Og','Oganessônio',118,294.000000,18,7,NULL,NULL,NULL,'Sólido','[Rn] 5f¹⁴ 6d¹⁰ 7s² 7p⁶','Desconhecido');
/*!40000 ALTER TABLE `elemento` ENABLE KEYS */;

--
-- Table structure for table `etapa`
--

DROP TABLE IF EXISTS `etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projeto` int unsigned DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `ordem` tinyint DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `projeto` (`projeto`),
  CONSTRAINT `etapa_ibfk_1` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa`
--

/*!40000 ALTER TABLE `etapa` DISABLE KEYS */;
INSERT INTO `etapa` VALUES (1,1,'Mistura','Tancagem',1,'2024-10-30 16:32:53','2024-12-03 13:45:18'),(2,1,'Moagem','Moer por 21 Horas',2,'2024-11-26 11:19:59','2024-12-03 13:45:18');
/*!40000 ALTER TABLE `etapa` ENABLE KEYS */;

--
-- Table structure for table `etapa_mp`
--

DROP TABLE IF EXISTS `etapa_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa_mp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `etapa` int unsigned DEFAULT NULL,
  `mp` int unsigned DEFAULT NULL,
  `percentual` double DEFAULT NULL,
  `tempo_agitacao` varchar(10) DEFAULT NULL,
  `observacao` varchar(1000) DEFAULT NULL,
  `ordem` tinyint DEFAULT NULL,
  `lote` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mp` (`mp`),
  KEY `etapa_2` (`etapa`),
  CONSTRAINT `etapa_mp_ibfk_2` FOREIGN KEY (`mp`) REFERENCES `materia_prima` (`id`),
  CONSTRAINT `etapa_mp_ibfk_3` FOREIGN KEY (`etapa`) REFERENCES `etapa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa_mp`
--

/*!40000 ALTER TABLE `etapa_mp` DISABLE KEYS */;
INSERT INTO `etapa_mp` VALUES (2,1,21,21,'01:10','',3,'123456789','2024-10-30 16:36:10','2024-12-03 13:45:05'),(3,1,24,1,'00:10','',5,'123456789','2024-10-30 17:44:54','2024-11-29 11:39:51'),(5,1,25,0.13,'00:10','',4,'123456789','2024-10-30 17:50:22','2024-12-03 13:45:05'),(7,1,23,15,'00:10','',2,'123456789','2024-10-30 18:10:24','2025-06-05 10:57:46'),(10,2,26,2.23,'0','',1,'','2024-11-26 11:20:25','2024-11-29 11:39:51'),(11,1,20,36.81,'0','',1,'teste','2024-11-26 11:22:28','2025-01-28 12:01:46'),(13,1,23,15,'0','',0,'','2025-06-05 10:59:05','2025-06-05 10:59:24');
/*!40000 ALTER TABLE `etapa_mp` ENABLE KEYS */;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantia` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `materia_prima` int unsigned NOT NULL,
  `nutriente` int unsigned NOT NULL,
  `percentual` double unsigned DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nutriente` (`nutriente`,`materia_prima`),
  KEY `materia_prima` (`materia_prima`),
  CONSTRAINT `garantia_ibfk_1` FOREIGN KEY (`nutriente`) REFERENCES `nutriente` (`id`),
  CONSTRAINT `garantia_ibfk_2` FOREIGN KEY (`materia_prima`) REFERENCES `materia_prima` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia`
--

/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
INSERT INTO `garantia` VALUES (2,24,20,100,'2024-10-30 16:23:11','2024-10-30 16:23:11'),(4,22,23,100,'2024-10-30 16:25:14','2024-10-30 16:25:14'),(5,21,24,100,'2024-10-30 16:25:28','2024-10-30 16:25:28'),(6,20,18,100,'2024-10-30 16:25:54','2024-10-30 16:25:54'),(7,19,16,46,'2024-10-30 16:27:07','2024-10-30 16:27:07'),(8,18,11,27,'2024-10-30 16:28:01','2024-10-30 16:28:01'),(9,17,7,14,'2024-10-30 16:28:56','2024-10-30 16:28:56'),(10,16,6,11,'2024-10-30 16:30:02','2024-10-30 16:30:02'),(11,23,1,17,'2024-10-30 17:38:34','2024-10-30 17:38:34'),(12,25,20,100,'2024-10-30 17:48:24','2024-10-30 17:48:24');
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `formula` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cas_number` varchar(50) DEFAULT NULL,
  `densidade` double unsigned DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'135','Sulfato de Manganês Mono','MnSO4.H2O','10034-96-5',1,'Sal Inorgânico, levemente rosa, fornecedores: Microsal','2024-10-30 10:43:39','2024-10-30 10:43:39'),(2,'568','Sulfato de Cobre Mono','CuSO4.H2O','10257-54-2',1,'Sal Inorgânico, Azul Claro, Fornecedor: Microsal.','2024-10-30 10:49:03','2024-10-30 10:49:03'),(3,'125','Sulfato de Cobre Penta','CuSO4.5H2O','7758-99-8',1,'Sal Inorgânico, Azul Escuro, Fornecedor: Microsal.','2024-10-30 10:50:30','2024-10-30 10:50:52'),(4,'142','Sulfato de Zinco Mono','ZnSO4.H2O','7446-19-7',1,'Sal Inorgânico, Branco, Fornecedor: Microsal.','2024-10-30 10:52:24','2024-10-30 10:52:24'),(5,'126','Sulfato de Zinco hepta','ZnSO4.7H2O','7446-20-0',1,'Sal Inorgânico, Branco, Fornecedor: Microsal.','2024-10-30 10:54:50','2024-10-30 10:54:50'),(8,'141','Sulfato de Magnésio Mono','MgSO4.H2O','14168-73-1',1,'Sal Inorgânico, Branco, Fornecedor: Microsal.','2024-10-30 10:58:11','2024-10-30 10:58:11'),(9,'138','Sulfato de Manganês Hepta','MnSO4.7H2O','15553-21-6',1,'Sal Inorgânico, Levemente Amarelado, Fornecedor: Microsal.','2024-10-30 10:59:50','2024-10-30 10:59:50'),(10,'151','Sulfato de Cobalto Hepta','CoSO4.7H2O','10026-24-1',1,'Sal Inorgânico, Vermelho Escuro, Fornecedor: Schem (Nicomo).','2024-10-30 11:03:06','2024-10-30 11:03:06'),(11,'600','Sulfato de Níquel Hexa','NiSO4.6H2O','10101-97-0',1,'Sal Inorgânico, Verde, Fornecedor: Schem (Nicomo)','2024-10-30 11:05:02','2024-10-30 11:05:02'),(12,'162','Sulfato de Potássio','K2SO4','7778-80-5',1,'Sal inorgânico, Branco, Fornecedor: Microsal.','2024-10-30 11:06:26','2024-10-30 11:06:26'),(13,'139','Sullfato de Ferro Hepta','FeSO₄.7H2O','7782-63-0',1,'Sal Inorgânico, Verde(Novo) ou Marrom(Oxidado), Fornecedor: Microsal.','2024-10-30 11:08:40','2024-10-30 11:08:40'),(14,'132','Sulfato de Amônio','(NH4)2SO4','7783-20-2',1,'Sal inorgânico, Branco ou Levemente Amarelo, Fornecedor: Agraria','2024-10-30 12:34:58','2024-10-30 12:34:58'),(15,'140','Cloreto de Potássio','KCl','7447-40-7',1,'Sal Inorgânico, Branco, Fornecedor: ICL','2024-10-30 14:17:41','2024-10-30 14:17:41'),(16,'153','Cloreto de Magnésio Hexa','MgCl2.6H2O','7791-18-6',1,'Sal Inorgânico, Levemente amarelo, Fornecedor:','2024-10-30 14:29:40','2024-10-30 14:29:40'),(17,'175','Cloreto de Manganês em Solução','MnCl2.4H₂O','13446-34-9',1.36,'Solução Inorgânica, Rosa, Fornecedor: MultiTecnica.','2024-10-30 14:34:42','2024-10-30 14:34:42'),(18,'128','Cloreto de Cálcio Di-hidratado','CaCl2.2H2O','10035-04-8',1,'Sal Inorgânico, Branco, Fornecedor: River.','2024-10-30 14:36:46','2024-10-30 14:36:46'),(19,'150','Cloreto de Zinco','ZnCl2','7646-85-7',1,'Sal Inorgânico, Branco, Fornecedor: Carbon (Weifang Heingfeng Zinc)','2024-10-30 14:41:07','2024-10-30 14:41:07'),(20,'173','Água','H2O','7732-18-5',1,'Inerte.','2024-10-30 14:43:37','2024-10-30 14:43:37'),(21,'450','Monoetanolamina (MEA)','CH2(NH2)CH2OH,','141-43-5',1.02,'Liquido Orgânico, Levemente Amarelo, Fornecedor: MCassab (Oxiteno)','2024-10-30 14:49:27','2024-10-30 14:49:27'),(22,'146','Ácido Cítrico','C6H8O7','77-92-9',1,'Ácido Carboxílico, Branco, Fornecedor: Nicron (Cargil)','2024-10-30 14:51:22','2024-10-30 14:51:22'),(23,'124','Ácido Borico','H3BO3','10043-35-3',1,'Ácido Inorgânico, Branco, Fornecedor: MCassab (Quiborax)','2024-10-30 14:54:44','2024-10-30 14:54:44'),(24,'477','Alga Ascophyllum Nodosum','-','84775-78-0',1,'Matéria Orgânica, Preto, Fornecedor: Algea e Acadian','2024-10-30 16:09:57','2024-10-30 16:09:57'),(25,'3711','Humic 80','-','215-809-6',1,'Matéria Orgânica - Ácido Húmico e Fulvico.','2024-10-30 16:13:29','2024-10-30 16:13:29'),(26,'144','Ureia','CH4N2O','57-13-6',1,'Produto Orgânico de Cor branca, aspecto perolado, Fornecedor Heringer','2024-11-26 11:15:10','2024-11-26 11:15:10');
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;

--
-- Table structure for table `nutriente`
--

DROP TABLE IF EXISTS `nutriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutriente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `formula` varchar(100) DEFAULT NULL,
  `visivel` tinyint unsigned DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `formula` (`formula`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutriente`
--

/*!40000 ALTER TABLE `nutriente` DISABLE KEYS */;
INSERT INTO `nutriente` VALUES (1,'Boro','B',1,'2024-10-29 18:41:44','2024-10-29 18:41:44'),(2,'Enxofre','S',1,'2024-10-29 18:41:58','2024-10-29 18:41:58'),(3,'Nitrogênio','N',1,'2024-10-29 18:42:14','2024-11-26 11:16:46'),(4,'Potássio','K2O',1,'2024-10-29 18:42:33','2024-10-29 18:42:33'),(5,'Fósforo','P2O5',1,'2024-10-29 18:43:55','2024-10-29 18:43:55'),(6,'Magnésio','Mg',1,'2024-10-29 18:44:03','2024-10-29 18:44:03'),(7,'Manganês','Mn',1,'2024-10-29 18:44:13','2024-10-29 18:44:13'),(8,'Cobre','Cu',1,'2024-10-29 18:44:30','2024-10-29 18:44:30'),(9,'Silício','Si',1,'2024-10-29 18:45:08','2024-10-29 18:45:08'),(10,'Selênio','Se',1,'2024-10-29 18:45:33','2024-10-29 18:45:33'),(11,'Cálcio','Ca',1,'2024-10-29 18:45:44','2024-10-29 18:45:44'),(12,'Ferro','Fe',1,'2024-10-29 18:45:54','2024-10-29 18:45:54'),(13,'Níquel','Ni',1,'2024-10-29 18:46:05','2024-10-29 18:46:05'),(14,'Cobalto','Co',1,'2024-10-29 18:46:14','2024-10-29 18:46:14'),(15,'Molibdênio ','Mo',1,'2024-10-29 18:46:25','2024-10-29 18:46:25'),(16,'Zinco','Zn',1,'2024-10-29 18:46:59','2024-10-29 18:46:59'),(17,'Carbono Orgânico Total','COT',1,'2024-10-29 18:47:16','2024-10-29 18:47:16'),(18,'Água','H2O',0,'2024-10-29 18:48:37','2024-10-30 16:15:25'),(19,'Aminoácido','A.A',0,'2024-10-29 18:49:00','2024-10-30 16:15:18'),(20,'Matéria Orgânica','-',0,'2024-10-30 16:14:44','2024-10-30 16:15:09'),(23,'Acido','--',0,'2024-10-30 16:17:35','2024-11-25 14:18:17'),(24,'Estabilizante','---',0,'2024-10-30 16:18:21','2024-11-25 14:18:27'),(25,'Umectante','----',0,'2024-10-30 16:18:43','2024-11-25 14:19:53'),(26,'Tensoativo','-----',0,'2024-10-30 16:18:57','2024-11-25 14:20:51'),(27,'Espessante','.',0,'2024-10-30 16:19:28','2024-11-25 14:20:06'),(28,'Conservante','..',0,'2024-10-30 16:19:40','2024-11-25 14:18:05'),(29,'Óleo','...',0,'2024-10-30 16:20:01','2024-11-25 14:20:30');
/*!40000 ALTER TABLE `nutriente` ENABLE KEYS */;

--
-- Temporary view structure for view `percentual_nutriente_projeto`
--

DROP TABLE IF EXISTS `percentual_nutriente_projeto`;
/*!50001 DROP VIEW IF EXISTS `percentual_nutriente_projeto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `percentual_nutriente_projeto` AS SELECT 
 1 AS `projeto_id`,
 1 AS `projeto_nome`,
 1 AS `nutriente_id`,
 1 AS `nutriente_nome`,
 1 AS `percentual_nutriente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `descricao` text,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `densidade` double unsigned DEFAULT NULL,
  `ph` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `aplicacao` json DEFAULT NULL,
  `natureza_fisica` varchar(255) DEFAULT NULL,
  `status` json DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'D1024.10','CYTO NUTRI BORON','VERDESIAN','SP 002786-3 000088','2024-10-29','2024-11-13',1.35,'6,50 - 7,50','Mineral Misto/Simples','[\"Foliar\"]','Fluido (Solução)','[{\"status\": \"Finalizado\", \"data_alteracao\": \"2024-11-26 18:21:09.000000\", \"id_responsavel\": \"1\"}, {\"status\": \"Inicializando\", \"data_alteracao\": \"2024-10-30 16:32:17.000000\", \"id_responsavel\": \"1\"}]','2024-10-30 16:32:17','2025-06-05 10:59:05');
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;

--
-- Temporary view structure for view `projeto_detalhado`
--

DROP TABLE IF EXISTS `projeto_detalhado`;
/*!50001 DROP VIEW IF EXISTS `projeto_detalhado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projeto_detalhado` AS SELECT 
 1 AS `projeto_id`,
 1 AS `projeto_codigo`,
 1 AS `projeto_nome`,
 1 AS `projeto_cliente`,
 1 AS `projeto_descricao`,
 1 AS `projeto_data_inicio`,
 1 AS `projeto_data_termino`,
 1 AS `projeto_densidade`,
 1 AS `projeto_ph`,
 1 AS `projeto_tipo`,
 1 AS `projeto_aplicacao`,
 1 AS `projeto_natureza_fisica`,
 1 AS `projeto_status`,
 1 AS `projeto_createdAt`,
 1 AS `projeto_updatedAt`,
 1 AS `etapa_id`,
 1 AS `etapa_nome`,
 1 AS `etapa_descricao`,
 1 AS `etapa_ordem`,
 1 AS `etapa_mp_id`,
 1 AS `etapa_mp_percentual`,
 1 AS `etapa_mp_tempo_agitacao`,
 1 AS `etapa_mp_observacao`,
 1 AS `etapa_mp_lote`,
 1 AS `etapa_mp_ordem`,
 1 AS `materia_prima_id`,
 1 AS `materia_prima_codigo`,
 1 AS `materia_prima_nome`,
 1 AS `materia_prima_formula`,
 1 AS `materia_prima_cas_number`,
 1 AS `materia_prima_densidade`,
 1 AS `materia_prima_descricao`,
 1 AS `garantia_id`,
 1 AS `garantia_percentual`,
 1 AS `nutriente_id`,
 1 AS `nutriente_nome`,
 1 AS `nutriente_formula`,
 1 AS `nutriente_visivel`,
 1 AS `percentual_origem`,
 1 AS `parcial_densidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `usuario` int unsigned NOT NULL,
  `chave_token` varchar(255) DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,'1.$2a$04$z4S.FBb1Xjt1LC4kpe5yUuqdrYPhoNrdRnLYLEwXRw76lM.dnPF1q','2025-06-06 10:52:16'),(6,'6.$2a$04$.pjlTvx2G1d.LFHHt21vVei55OF84w8c7KW20Mts5Iiqlq0Uv2FYa','2025-02-13 07:41:07');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `permissao` tinyint DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','admin@sgqui.com','$2a$10$LkIQ1SVYcFOS5NZyA2OPDewXmBLMMblMuAiGmagK/0s1Mc3gGZr2y',0,NULL,1,'2024-06-05 09:56:50','2024-07-09 12:18:23'),(6,'Aluno','aluno@sgqui.com','$2a$10$qqwZ6l3nSHLlsKsA3HWT6upqCeTHvtUVT3OOTa5gu9RIY049jMXKO',NULL,NULL,NULL,'2025-02-12 07:39:41','2025-02-12 07:41:07');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'sg_qui'
--
/*!50003 DROP FUNCTION IF EXISTS `nutriente_percentualComposicao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE FUNCTION `nutriente_percentualComposicao`(`mp_id` INT, `mp_percentual` DOUBLE) RETURNS json
    DETERMINISTIC
BEGIN
    RETURN (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'nutriente', nutriente.nome,
                'percentual', mp_percentual/100*garantia.percentual
            )
        )
        FROM nutriente
        JOIN garantia ON nutriente.id = garantia.nutriente
        JOIN materia_prima ON garantia.materia_prima = materia_prima.id
        WHERE materia_prima.id = mp_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `duplicar_projeto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `duplicar_projeto`(IN `projeto_base_id` INT)
BEGIN
    DECLARE novo_projeto_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        ROLLBACK;        
    END;
    
	START TRANSACTION;    
    
    
    INSERT INTO projeto (nome, descricao, data_inicio, data_termino, densidade, ph, tipo, aplicacao, natureza_fisica, status)
    SELECT CONCAT(nome, ' (Copy)'), descricao, data_inicio, data_termino, densidade, ph, tipo, aplicacao, natureza_fisica, status
    FROM projeto
    WHERE id = projeto_base_id;
    
    SET novo_projeto_id = LAST_INSERT_ID();
    
    
    INSERT INTO etapa (projeto, nome, descricao, ordem)
    SELECT novo_projeto_id, nome, descricao, ordem
    FROM etapa
    WHERE projeto = projeto_base_id;
    
    
    CREATE TEMPORARY TABLE etapa_mapeamento AS
    SELECT e_base.id AS base_etapa_id, e_new.id AS new_etapa_id
    FROM 
	etapa e_base
    JOIN 
	etapa e_new ON e_base.ordem = e_new.ordem AND e_base.projeto = projeto_base_id AND e_new.projeto = novo_projeto_id;
    
    
    INSERT INTO etapa_mp (etapa, mp, percentual, tempo_agitacao, observacao, ordem)
    SELECT emap.new_etapa_id, em.mp, em.percentual, em.tempo_agitacao, em.observacao, em.ordem
    FROM 
	etapa_mp em
    JOIN 
	etapa_mapeamento emap ON em.etapa = emap.base_etapa_id;

    DROP TEMPORARY TABLE etapa_mapeamento;

    SELECT * FROM projeto WHERE projeto.id = novo_projeto_id;
    
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etapa_alterarOrdem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `etapa_alterarOrdem`(IN `ordemEtapa` JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT DEFAULT JSON_LENGTH(ordemEtapa);
    DECLARE etapaId INT;
    DECLARE etapaOrdem INT;

    
    START TRANSACTION;

    
    WHILE i < total DO
        
        SET etapaId = JSON_UNQUOTE(JSON_EXTRACT(ordemEtapa, CONCAT('$[', i, '].id')));
        SET etapaOrdem = JSON_UNQUOTE(JSON_EXTRACT(ordemEtapa, CONCAT('$[', i, '].ordem')));
        
        
        UPDATE etapa SET ordem = etapaOrdem WHERE id = etapaId;
        
        
        SET i = i + 1;
    END WHILE;

    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etapa_mp_alterarOrdemMateriasPrimas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `etapa_mp_alterarOrdemMateriasPrimas`(IN `ordemMateriasPrimas` JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT DEFAULT JSON_LENGTH(ordemMateriasPrimas);
    DECLARE _id INT;
    DECLARE etapaId INT;
    DECLARE materiaPrimaOrdem INT;

    
    START TRANSACTION;

    
    WHILE i < total DO
        
        SET _id = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].id')));
        SET etapaId = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].etapa')));
        SET materiaPrimaOrdem = JSON_UNQUOTE(JSON_EXTRACT(ordemMateriasPrimas, CONCAT('$[', i, '].ordem')));
        
        
        UPDATE etapa_mp SET etapa = etapaId,  ordem = materiaPrimaOrdem WHERE id = _id;
        
        
        SET i = i + 1;
    END WHILE;

    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mp_precentual_nutriente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `mp_precentual_nutriente`(IN `_nutriente` INT, IN `_percentual` DOUBLE)
SELECT
	materia_prima.id 					as mp_id,
	materia_prima.nome 					as mp_nome,
	materia_prima.formula 				as mp_formula,
	(_percentual * 100) / garantia.percentual 	as percentual,
    nutriente_percentualComposicao(materia_prima.id, ((_percentual * 100) / garantia.percentual)) as composicao
FROM
	nutriente
	JOIN
	garantia ON nutriente.id = garantia.nutriente
	JOIN
	materia_prima ON garantia.materia_prima = materia_prima.id
WHERE
	nutriente.id = _nutriente AND ((_percentual * 100) / garantia.percentual) < 100
    ORDER BY percentual ASC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `projeto_marcarVisualizacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `projeto_marcarVisualizacao`(IN `id` INT)
BEGIN
    UPDATE projeto SET updatedAt = CURRENT_TIMESTAMP WHERE projeto.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `token_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `token_consultar`(IN `_chave_token` VARCHAR(255))
BEGIN
	SET @usuario = SUBSTRING_INDEX(_chave_token, '.', 1);
	SELECT * FROM token WHERE token.usuario = @usuario AND token.chave_token LIKE _chave_token;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `token_criar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `token_criar`(IN `_usuario` INT, IN `_validade` INT, IN `_chave_token` VARCHAR(255))
BEGIN
    SET @token = CONCAT(_usuario, '.', _chave_token);
    SET @vaidade = DATE_ADD(CURRENT_TIMESTAMP, INTERVAL _validade HOUR);
    INSERT INTO token(usuario, chave_token, validade) VALUES(_usuario, @token, @vaidade) ON DUPLICATE KEY UPDATE chave_token = VALUES(chave_token), validade = VALUES(validade);
    SELECT * FROM token WHERE token.usuario = _usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `token_extender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `token_extender`(IN `_usuario` INT, IN `_horas` INT)
    NO SQL
UPDATE token
SET 
	validade = DATE_ADD(validade, INTERVAL _horas HOUR)
WHERE 
	token.usuario = _usuario ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `percentual_nutriente_projeto`
--

/*!50001 DROP VIEW IF EXISTS `percentual_nutriente_projeto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `percentual_nutriente_projeto` AS select `projeto_detalhado`.`projeto_id` AS `projeto_id`,`projeto_detalhado`.`projeto_nome` AS `projeto_nome`,`projeto_detalhado`.`nutriente_id` AS `nutriente_id`,`projeto_detalhado`.`nutriente_nome` AS `nutriente_nome`,sum(`projeto_detalhado`.`percentual_origem`) AS `percentual_nutriente` from `projeto_detalhado` group by `projeto_detalhado`.`projeto_id`,`projeto_detalhado`.`nutriente_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projeto_detalhado`
--

/*!50001 DROP VIEW IF EXISTS `projeto_detalhado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY DEFINER */
/*!50001 VIEW `projeto_detalhado` AS select `projeto`.`id` AS `projeto_id`,`projeto`.`codigo` AS `projeto_codigo`,`projeto`.`nome` AS `projeto_nome`,`projeto`.`cliente` AS `projeto_cliente`,`projeto`.`descricao` AS `projeto_descricao`,`projeto`.`data_inicio` AS `projeto_data_inicio`,`projeto`.`data_termino` AS `projeto_data_termino`,`projeto`.`densidade` AS `projeto_densidade`,`projeto`.`ph` AS `projeto_ph`,`projeto`.`tipo` AS `projeto_tipo`,`projeto`.`aplicacao` AS `projeto_aplicacao`,`projeto`.`natureza_fisica` AS `projeto_natureza_fisica`,`projeto`.`status` AS `projeto_status`,`projeto`.`createdAt` AS `projeto_createdAt`,`projeto`.`updatedAt` AS `projeto_updatedAt`,`etapa`.`id` AS `etapa_id`,`etapa`.`nome` AS `etapa_nome`,`etapa`.`descricao` AS `etapa_descricao`,`etapa`.`ordem` AS `etapa_ordem`,`etapa_mp`.`id` AS `etapa_mp_id`,`etapa_mp`.`percentual` AS `etapa_mp_percentual`,`etapa_mp`.`tempo_agitacao` AS `etapa_mp_tempo_agitacao`,`etapa_mp`.`observacao` AS `etapa_mp_observacao`,`etapa_mp`.`lote` AS `etapa_mp_lote`,`etapa_mp`.`ordem` AS `etapa_mp_ordem`,`materia_prima`.`id` AS `materia_prima_id`,`materia_prima`.`codigo` AS `materia_prima_codigo`,`materia_prima`.`nome` AS `materia_prima_nome`,`materia_prima`.`formula` AS `materia_prima_formula`,`materia_prima`.`cas_number` AS `materia_prima_cas_number`,`materia_prima`.`densidade` AS `materia_prima_densidade`,`materia_prima`.`descricao` AS `materia_prima_descricao`,`garantia`.`id` AS `garantia_id`,`garantia`.`percentual` AS `garantia_percentual`,`nutriente`.`id` AS `nutriente_id`,`nutriente`.`nome` AS `nutriente_nome`,`nutriente`.`formula` AS `nutriente_formula`,`nutriente`.`visivel` AS `nutriente_visivel`,((`garantia`.`percentual` * `etapa_mp`.`percentual`) / 100) AS `percentual_origem`,((`etapa_mp`.`percentual` / 100) * `materia_prima`.`densidade`) AS `parcial_densidade` from (((((`projeto` left join `etapa` on((`projeto`.`id` = `etapa`.`projeto`))) left join `etapa_mp` on((`etapa`.`id` = `etapa_mp`.`etapa`))) left join `materia_prima` on((`etapa_mp`.`mp` = `materia_prima`.`id`))) left join `garantia` on((`materia_prima`.`id` = `garantia`.`materia_prima`))) left join `nutriente` on((`garantia`.`nutriente` = `nutriente`.`id`))) order by `projeto`.`id`,`etapa`.`ordem`,`etapa_mp`.`ordem`,`etapa_mp`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10  7:41:42
