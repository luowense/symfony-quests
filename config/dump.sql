-- MySQL dump 10.13  Distrib 5.7.28, for osx10.14 (x86_64)
--
-- Host: localhost    Database: wild_series
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Andrew Lincoln'),(2,'Norman Reedus'),(3,'Lauren Cohan'),(4,'Danai Gurira');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_program`
--

DROP TABLE IF EXISTS `actor_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_program` (
  `actor_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`program_id`),
  KEY `IDX_B01827EE10DAF24A` (`actor_id`),
  KEY `IDX_B01827EE3EB8070A` (`program_id`),
  CONSTRAINT `FK_B01827EE10DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B01827EE3EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_program`
--

LOCK TABLES `actor_program` WRITE;
/*!40000 ALTER TABLE `actor_program` DISABLE KEYS */;
INSERT INTO `actor_program` VALUES (1,6),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `actor_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Horreur'),(2,'comedy'),(3,'comedy'),(4,'comedy'),(5,'action'),(6,'action'),(7,'action');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DDAA1CDA4EC001D1` (`season_id`),
  CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'Episode 1',1,'Sheriff\'s deputy Rick Grimes wakes from a gunshot-inflicted coma to discover the world overrun with walkers. He goes back to his house to try and find his wife and son but meets survivor Morgan Jones and his son Duane. Rick decides to head to Atlanta to find his wife Lori and son Carl, unaware they are safe with other survivors, led by his former partner Shane. He encounters hordes of walkers and becomes trapped inside a tank.',1),(2,'Episode 2',2,'Rick is ambushed by a walker horde but is rescued by scavenger survivor Glenn when he becomes trapped inside a tank. They meet up with the rest of the survivors where they have to leave Merle handcuffed to the roof to stop him attracting walkers. They are forced to leave Rick\'s gun bag behind as well as abandon the unhinged Merle as walkers surround them, but manage to escape the city.',1),(3,'Episode 3',3,'Glenn takes Rick to the survivors\' camp, where he finds Lori, Carl, and Shane. Rick leads a group, including Glenn, T-Dog, and Merle\'s younger brother, Daryl back to Atlanta to recover his weapons, finding that Merle managed to free himself by sawing off his hand.',1),(4,'Episode 1',5,'As the survivors bury their dead, some split off on their own. Rick, against Shane\'s judgement, leads the rest to the CDC facility in Atlanta, which initially appears abandoned and locked-down, but Rick spots signs of life and demands entry.',2),(5,'Episode 2',6,'Dr. Edwin Jenner of the CDC welcomes the survivors, allowing them to enjoy the amenities of the powered building while explaining what he knows about walkers. When the survivors discover that the building will self-detonate once it runs out of backup power, Dr. Jenner initially prevents them from leaving. Rick convinces Jenner to let them go, and Jenner whispers something to Rick. They escape just before the building explodes, and the group departs the city.',2),(6,'Episode 1',7,'Dr. Edwin Jenner of the CDC welcomes the survivors, allowing them to enjoy the amenities of the powered building while explaining what he knows about walkers. When the survivors discover that the building will self-detonate once it runs out of backup power, Dr. Jenner initially prevents them from leaving. Rick convinces Jenner to let them go, and Jenner whispers something to Rick. They escape just before the building explodes, and the group departs the city.',3);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20191130132442','2019-11-30 13:24:56'),('20191130142451','2019-11-30 14:25:28'),('20191130143137','2019-11-30 14:31:44'),('20191130184118','2019-11-30 18:41:34'),('20191130184628','2019-11-30 18:46:49');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92ED778412469DE2` (`category_id`),
  CONSTRAINT `FK_92ED778412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,1,'Walking Dead','Le policier Rick Grimes se réveille après un long coma. Il découvre avec effarement que le monde, ravagé par une épidémie, est envahi par les morts-vivants.','https://m.media-amazon.com/images/M/MV5BZmFlMTA0MmUtNWVmOC00ZmE1LWFmMDYtZTJhYjJhNGVjYTU5XkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_.jpg'),(2,1,'The Haunting Of Hill House','Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis, sont contraints de se réunir pour finalement affronter les fantômes de leur passé.','https://m.media-amazon.com/images/M/MV5BMTU4NzA4MDEwNF5BMl5BanBnXkFtZTgwMTQxODYzNjM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),(3,1,'American Horror Story','A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants et cauchemardesques, mêlant la peur, le gore et le politiquement correct.','https://m.media-amazon.com/images/M/MV5BODZlYzc2ODYtYmQyZS00ZTM4LTk4ZDQtMTMyZDdhMDgzZTU0XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg'),(4,1,'Love Death And Robots','Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles, des chasseurs de primes cyborgs, des araignées extraterrestres et des démons assoiffés de sang : tout ce beau monde est réuni dans 18 courts métrages animés déconseillés aux âmes sensibles.','https://m.media-amazon.com/images/M/MV5BMTc1MjIyNDI3Nl5BMl5BanBnXkFtZTgwMjQ1OTI0NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),(5,1,'Penny Dreadful','Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques, allie ses forces à celles de Ethan, un garçon rebelle et violent aux allures de cowboy, et de Sir Malcolm, un vieil homme riche aux ressources inépuisables. Ensemble, ils combattent un ennemi inconnu, presque invisible, qui ne semble pas humain et qui massacre la population.','https://m.media-amazon.com/images/M/MV5BNmE5MDE0ZmMtY2I5Mi00Y2RjLWJlYjMtODkxODQ5OWY1ODdkXkEyXkFqcGdeQXVyNjU2NjA5NjM@._V1_SY1000_CR0,0,695,1000_AL_.jpg'),(6,1,'Fear The Walking Dead','La série se déroule au tout début de l épidémie relatée dans la série mère The Walking Dead et se passe dans la ville de Los Angeles, et non à Atlanta. Madison est conseillère dans un lycée de Los Angeles. Depuis la mort de son mari, elle élève seule ses deux enfants : Alicia, excellente élève qui découvre les premiers émois amoureux, et son grand frère Nick qui a quitté la fac et a sombré dans la drogue.','https://m.media-amazon.com/images/M/MV5BYWNmY2Y1NTgtYTExMS00NGUxLWIxYWQtMjU4MjNkZjZlZjQ3XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg'),(7,2,'test','test','khk');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0E45BA93EB8070A` (`program_id`),
  CONSTRAINT `FK_F0E45BA93EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,2010,'Sheriff\'s deputy Rick Grimes wakes from a coma discovering a world overrun by zombies. After befriending Morgan Jones, Rick travels alone to Atlanta to find his wife Lori, his son, Carl, and his police partner and best friend, Shane Walsh, encountering other survivors. The group travels to the Centers for Disease Control (CDC), but find from the sole remaining CDC member that no cure exists for the epidemic.',1),(2,2,2011,'Traveling from Atlanta, Rick\'s group takes shelter at Hershel Greene\'s farm while they search for Carol\'s missing daughter, Sophia. Tension between the survivors worsen after it is discovered that Hershel has kept friends and family turned into zombies, including Sophia, in his barn. Rick learns that Shane and Lori were romantically involved at the outset of the apocalypse, and Shane and Rick\'s friendship becomes increasingly unhinged when Lori reveals that she is pregnant. Rick is eventually forced to kill Shane in self-defense. The noise draws zombies, forcing Rick\'s group and Hershel\'s surviving family to evacuate the farm',1),(3,3,2012,'Eight months after fleeing Hershel\'s farm, Rick\'s group finds a prison, which they clear of zombies to make their new home. Lori dies in childbirth, and Rick becomes withdrawn. Meanwhile, Andrea is rescued by Michonne and the two discover Woodbury, a fortified town led by a man known as the Governor. He learns of Rick\'s group at the prison, leading to conflict between them. Rick\'s group eventually raids and destroys Woodbury, but the Governor ultimately has Andrea killed and escapes. Woodbury\'s citizens live with Rick\'s group at the prison.',1);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 10:17:27