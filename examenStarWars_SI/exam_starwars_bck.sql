-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: exam_starwars
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `exam_starwars`
--

/*!40000 DROP DATABASE IF EXISTS `exam_starwars`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `exam_starwars` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `exam_starwars`;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `nameName` varchar(100) NOT NULL,
  `heightHeight` varchar(100) DEFAULT NULL,
  `massWeight` varchar(100) DEFAULT NULL,
  `hair_colorHair` varchar(100) DEFAULT NULL,
  `skin_colorSkin` varchar(100) DEFAULT NULL,
  `eye_colorEye` varchar(100) DEFAULT NULL,
  `birth_yearYear` varchar(100) DEFAULT NULL,
  `genderGender` varchar(100) DEFAULT NULL,
  `homeworldName` varchar(100) DEFAULT NULL,
  `speciesName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nameName`),
  KEY `homeworldName` (`homeworldName`),
  KEY `speciesName` (`speciesName`),
  CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`speciesName`) REFERENCES `species` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`homeworldName`) REFERENCES `planets` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `characters_ibfk_3` FOREIGN KEY (`speciesName`) REFERENCES `species` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES ('Ackbar','180','83','none','brown mottle','orange','41BBY','male','Mon Cala','Mon Calamari'),('Adi Gallia','184','50','none','dark','blue','NA','female','Coruscant','Tholothian'),('Anakin Skywalker','188','84','blond','fair','blue','41.9BBY','male','Tatooine','Human'),('Arvel Crynyd','NA','NA','brown','fair','brown','NA','male','NA','Human'),('Ayla Secura','178','55','none','blue','hazel','48BBY','female','Ryloth','Twi\'lek'),('Bail Prestor Organa','191','NA','black','tan','brown','67BBY','male','Alderaan','Human'),('Barriss Offee','166','50','black','yellow','blue','40BBY','female','Mirial','Mirialan'),('BB8','NA','NA','none','none','black','NA','none','NA','Droid'),('Ben Quadinaros','163','65','none','grey, green, yellow','orange','NA','male','Tund','Toong'),('Beru Whitesun lars','165','75','brown','light','blue','47BBY','female','Tatooine','Human'),('Bib Fortuna','180','NA','none','pale','pink','NA','male','Ryloth','Twi\'lek'),('Biggs Darklighter','183','84','black','light','brown','24BBY','male','Tatooine','Human'),('Boba Fett','183','78.2','black','fair','brown','31.5BBY','male','Kamino','Human'),('Bossk','190','113','none','green','red','53BBY','male','Trandosha','Trandoshan'),('C-3PO','167','75','NA','gold','yellow','112BBY','NA','Tatooine','Droid'),('Captain Phasma','NA','NA','NA','NA','NA','NA','female','NA',NULL),('Chewbacca','228','112','brown','NA','blue','200BBY','male','Kashyyyk','Wookiee'),('Cliegg Lars','183','NA','brown','fair','blue','82BBY','male','Tatooine','Human'),('Cordé','157','NA','brown','light','brown','NA','female','Naboo','Human'),('Darth Maul','175','80','none','red','yellow','54BBY','male','Dathomir','Zabrak'),('Darth Vader','202','136','none','white','yellow','41.9BBY','male','Tatooine','Human'),('Dexter Jettster','198','102','none','brown','yellow','NA','male','Ojom','Besalisk'),('Dooku','193','80','white','fair','brown','102BBY','male','Serenno','Human'),('Dormé','165','NA','brown','light','brown','NA','female','Naboo','Human'),('Dud Bolt','94','45','none','blue, grey','yellow','NA','male','Vulpter','Vulptereen'),('Eeth Koth','171','NA','black','brown','brown','NA','male','Iridonia','Zabrak'),('Finis Valorum','170','NA','blond','fair','blue','91BBY','male','Coruscant','Human'),('Finn','NA','NA','black','dark','dark','NA','male','NA','Human'),('Gasgano','122','NA','none','white, blue','black','NA','male','Troiken','Xexto'),('Greedo','173','74','NA','green','black','44BBY','male','Rodia','Rodian'),('Gregar Typho','185','85','black','dark','brown','NA','male','Naboo','Human'),('Grievous','216','159','none','brown, white','green, yellow','NA','male','Kalee','Kaleesh'),('Han Solo','180','80','brown','fair','brown','29BBY','male','Corellia','Human'),('IG-88','200','140','none','metal','red','15BBY','none','NA','Droid'),('Jabba Desilijic Tiure','175','1,358','NA','green-tan, brown','orange','600BBY','hermaphrodite','Nal Hutta','Hutt'),('Jango Fett','183','79','black','tan','brown','66BBY','male','Concord Dawn','Human'),('Jar Jar Binks','196','66','none','orange','orange','52BBY','male','Naboo','Gungan'),('Jek Tono Porkins','180','110','brown','fair','blue','NA','male','Bestine IV','Human'),('Jocasta Nu','167','NA','white','fair','blue','NA','female','Coruscant','Human'),('Ki-Adi-Mundi','198','82','white','pale','yellow','92BBY','male','Cerea','Cerean'),('Kit Fisto','196','87','none','green','black','NA','male','Glee Anselm','Nautolan'),('Lama Su','229','88','none','grey','black','NA','male','Kamino','Kaminoan'),('Lando Calrissian','177','79','black','dark','brown','31BBY','male','Socorro','Human'),('Leia Organa','150','49','brown','light','brown','19BBY','female','Alderaan','Human'),('Lobot','175','79','none','light','blue','37BBY','male','Bespin','Human'),('Luke Skywalker','172','77','blond','fair','blue','19BBY','male','Tatooine','Human'),('Luminara Unduli','170','56.2','black','yellow','blue','58BBY','female','Mirial','Mirialan'),('Mace Windu','188','84','none','dark','brown','72BBY','male','Haruun Kal','Human'),('Mas Amedda','196','NA','none','blue','blue','NA','male','Champala','Chagrian'),('Mon Mothma','150','NA','auburn','fair','blue','48BBY','female','Chandrila','Human'),('Nien Nunb','160','68','none','grey','black','NA','male','Sullust','Sullustan'),('Nute Gunray','191','90','none','mottled green','red','NA','male','Cato Neimoidia','Neimodian'),('Obi-Wan Kenobi','182','77','auburn, white','fair','blue-gray','57BBY','male','Stewjon','Human'),('Owen Lars','178','120','brown, grey','light','blue','52BBY','male','Tatooine','Human'),('Padmé Amidala','165','45','brown','light','brown','46BBY','female','Naboo','Human'),('Palpatine','170','75','grey','pale','yellow','82BBY','male','Naboo','Human'),('Plo Koon','188','80','none','orange','black','22BBY','male','Dorin','Kel Dor'),('Poe Dameron','NA','NA','brown','light','brown','NA','male','NA','Human'),('Poggle the Lesser','183','80','none','green','yellow','NA','male','Geonosis','Geonosian'),('Quarsh Panaka','183','NA','black','dark','brown','62BBY','male','Naboo',NULL),('Qui-Gon Jinn','193','89','brown','fair','blue','92BBY','male','NA','Human'),('R2-D2','96','32','NA','white, blue','red','33BBY','NA','Naboo','Droid'),('R4-P17','96','NA','none','silver, red','red, blue','NA','female','NA',NULL),('R5-D4','97','32','NA','white, red','red','NA','NA','Tatooine','Droid'),('Ratts Tyerell','79','15','none','grey, blue','NA','NA','male','Aleen Minor','Aleena'),('Raymus Antilles','188','79','brown','light','brown','NA','male','Alderaan','Human'),('Rey','NA','NA','brown','light','hazel','NA','female','NA','Human'),('Ric Olié','183','NA','brown','fair','blue','NA','male','Naboo',NULL),('Roos Tarpals','224','82','none','grey','orange','NA','male','Naboo','Gungan'),('Rugor Nass','206','NA','none','green','orange','NA','male','Naboo','Gungan'),('Saesee Tiin','188','NA','none','pale','orange','NA','male','Iktotch','Iktotchi'),('San Hill','191','NA','none','grey','gold','NA','male','Muunilinst','Muun'),('Sebulba','112','40','none','grey, red','orange','NA','male','Malastare','Dug'),('Shaak Ti','178','57','none','red, blue, white','black','NA','female','Shili','Togruta'),('Shmi Skywalker','163','NA','black','fair','brown','72BBY','female','Tatooine','Human'),('Sly Moore','178','48','none','pale','white','NA','female','Umbara',NULL),('Tarfful','234','136','brown','brown','blue','NA','male','Kashyyyk','Wookiee'),('Taun We','213','NA','none','grey','black','NA','female','Kamino','Kaminoan'),('Tion Medon','206','80','none','grey','black','NA','male','Utapau','Pau\'an'),('Wat Tambor','193','48','none','green, grey','NA','NA','male','Skako','Skakoan'),('Watto','137','NA','black','blue, grey','yellow','NA','male','Toydaria','Toydarian'),('Wedge Antilles','170','77','brown','fair','hazel','21BBY','male','Corellia','Human'),('Wicket Systri Warrick','88','20','brown','brown','brown','8BBY','male','Endor','Ewok'),('Wilhuff Tarkin','180','NA','auburn, grey','fair','blue','64BBY','male','Eriadu','Human'),('Yarael Poof','264','NA','none','white','yellow','NA','male','Quermia','Quermian'),('Yoda','66','17','white','green','brown','896BBY','male','NA','Yoda\'s species'),('Zam Wesell','168','55','blonde','fair, green, yellow','yellow','NA','female','Zolan','Clawdite');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `title` varchar(100) DEFAULT NULL,
  `episode_id` varchar(100) NOT NULL,
  `opening_crawl` text DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`episode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_characters`
--

DROP TABLE IF EXISTS `movies_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_characters` (
  `episode_id` varchar(100) NOT NULL,
  `characterName` varchar(100) NOT NULL,
  PRIMARY KEY (`episode_id`,`characterName`),
  KEY `characterName` (`characterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_characters`
--

LOCK TABLES `movies_characters` WRITE;
/*!40000 ALTER TABLE `movies_characters` DISABLE KEYS */;
INSERT INTO `movies_characters` VALUES ('1','Anakin Skywalker'),('1','Han Solo'),('1','Yoda'),('6','Rey'),('7','Rey');
/*!40000 ALTER TABLE `movies_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planets` (
  `name` varchar(100) NOT NULL,
  `rotation_period` varchar(100) DEFAULT NULL,
  `orbital_period` varchar(100) DEFAULT NULL,
  `diameter` varchar(100) DEFAULT NULL,
  `climate` varchar(100) DEFAULT NULL,
  `gravity` varchar(100) DEFAULT NULL,
  `terrain` varchar(100) DEFAULT NULL,
  `surface_water` varchar(100) DEFAULT NULL,
  `population` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
INSERT INTO `planets` VALUES ('Alderaan','24','364','12500','temperate','1 standard','grasslands, mountains','40','2000000000'),('Aleen Minor','NA','NA','NA','NA','NA','NA','NA','NA'),('Bespin','12','5110','118000','temperate','1.5 (surface), 1 standard (Cloud City)','gas giant','0','6000000'),('Bestine IV','26','680','6400','temperate','NA','rocky islands, oceans','98','62000000'),('Cato Neimoidia','25','278','0','temperate, moist','1 standard','mountains, fields, forests, rock arches','NA','10000000'),('Cerea','27','386','NA','temperate','1','verdant','20','450000000'),('Champala','27','318','NA','temperate','1','oceans, rainforests, plateaus','NA','3500000000'),('Chandrila','20','368','13500','temperate','1','plains, forests','40','1200000000'),('Concord Dawn','NA','NA','NA','NA','NA','jungles, forests, deserts','NA','NA'),('Corellia','25','329','11000','temperate','1 standard','plains, urban, hills, forests','70','3000000000'),('Coruscant','24','368','12240','temperate','1 standard','cityscape, mountains','NA','1000000000000'),('Dagobah','23','341','8900','murky','N/A','swamp, jungles','8','NA'),('Dantooine','25','378','9830','temperate','1 standard','oceans, savannas, mountains, grasslands','NA','1000'),('Dathomir','24','491','10480','temperate','0.9','forests, deserts, savannas','NA','5200'),('Dorin','22','409','13400','temperate','1','NA','NA','NA'),('Endor','18','402','4900','temperate','0.85 standard','forests, mountains, lakes','8','30000000'),('Eriadu','24','360','13490','polluted','1 standard','cityscape','NA','22000000000'),('Felucia','34','231','9100','hot, humid','0.75 standard','fungus forests','NA','8500000'),('Geonosis','30','256','11370','temperate, arid','0.9 standard','rock, desert, mountain, barren','5','100000000000'),('Glee Anselm','33','206','15600','tropical, temperate','1','lakes, islands, swamps, seas','80','500000000'),('Haruun Kal','25','383','10120','temperate','0.98','toxic cloudsea, plateaus, volcanoes','NA','705300'),('Hoth','23','549','7200','frozen','1.1 standard','tundra, ice caves, mountain ranges','100','NA'),('Iktotch','22','481','NA','arid, rocky, windy','1','rocky','NA','NA'),('Iridonia','29','413','NA','NA','NA','rocky canyons, acid pools','NA','NA'),('Jakku','NA','NA','NA','NA','NA','deserts','NA','NA'),('Kalee','23','378','13850','arid, temperate, tropical','1','rainforests, cliffs, canyons, seas','NA','4000000000'),('Kamino','27','463','19720','temperate','1 standard','ocean','100','1000000000'),('Kashyyyk','26','381','12765','tropical','1 standard','jungle, forests, lakes, rivers','60','45000000'),('Malastare','26','201','18880','arid, temperate, tropical','1.56','swamps, deserts, jungles, mountains','NA','2000000000'),('Mirial','NA','NA','NA','NA','NA','deserts','NA','NA'),('Mon Cala','21','398','11030','temperate','1','oceans, reefs, islands','100','27000000000'),('Mustafar','36','412','4200','hot','1 standard','volcanoes, lava rivers, mountains, caves','0','20000'),('Muunilinst','28','412','13800','temperate','1','plains, forests, hills, mountains','25','5000000000'),('Mygeeto','12','167','10088','frigid','1 standard','glaciers, mountains, ice canyons','NA','19000000'),('NA','0','0','0','NA','NA','NA','NA','NA'),('Naboo','26','312','12120','temperate','1 standard','grassy hills, swamps, forests, mountains','12','4500000000'),('Nal Hutta','87','413','12150','temperate','1 standard','urban, oceans, swamps, bogs','NA','7000000000'),('Ojom','NA','NA','NA','frigid','NA','oceans, glaciers','100','500000000'),('Ord Mantell','26','334','14050','temperate','1 standard','plains, seas, mesas','10','4000000000'),('Polis Massa','24','590','0','artificial temperate ','0.56 standard','airless asteroid','0','1000000'),('Quermia','NA','NA','NA','NA','NA','NA','NA','NA'),('Rodia','29','305','7549','hot','1 standard','jungles, oceans, urban, swamps','60','1300000000'),('Ryloth','30','305','10600','temperate, arid, subartic','1','mountains, valleys, deserts, tundra','5','1500000000'),('Saleucami','26','392','14920','hot','NA','caves, desert, mountains, volcanoes','NA','1400000000'),('Serenno','NA','NA','NA','NA','NA','rainforests, rivers, mountains','NA','NA'),('Shili','NA','NA','NA','temperate','1','cities, savannahs, seas, plains','NA','NA'),('Skako','27','384','NA','temperate','1','urban, vines','NA','500000000000'),('Socorro','20','326','0','arid','1 standard','deserts, mountains','NA','300000000'),('Stewjon','NA','NA','0','temperate','1 standard','grass','NA','NA'),('Sullust','20','263','12780','superheated','1','mountains, volcanoes, rocky deserts','5','18500000000'),('Tatooine','23','304','10465','arid','1 standard','desert','1','200000'),('Tholoth','NA','NA','NA','NA','NA','NA','NA','NA'),('Toydaria','21','184','7900','temperate','1','swamps, lakes','NA','11000000'),('Trandosha','25','371','0','arid','0.62 standard','mountains, seas, grasslands, deserts','NA','42000000'),('Troiken','NA','NA','NA','NA','NA','desert, tundra, rainforests, mountains','NA','NA'),('Tund','48','1770','12190','NA','NA','barren, ash','NA','0'),('Umbara','NA','NA','NA','NA','NA','NA','NA','NA'),('Utapau','27','351','12900','temperate, arid, windy','1 standard','scrublands, savanna, canyons, sinkholes','0.9','95000000'),('Vulpter','22','391','14900','temperate, artic','1','urban, barren','NA','421000000'),('Yavin IV','24','4818','10200','temperate, tropical','1 standard','jungle, rainforests','8','1000'),('Zolan','NA','NA','NA','NA','NA','NA','NA','NA');
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `name` varchar(100) NOT NULL,
  `classification` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `average_height` varchar(100) DEFAULT NULL,
  `skin_colors` varchar(100) DEFAULT NULL,
  `hair_colors` varchar(100) DEFAULT NULL,
  `eye_colors` varchar(100) DEFAULT NULL,
  `average_lifespan` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `homeworld` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `homeworld` (`homeworld`),
  CONSTRAINT `species_ibfk_1` FOREIGN KEY (`homeworld`) REFERENCES `planets` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('Aleena','reptile','sentient','80','blue, gray','none','NA','79','Aleena','Aleen Minor'),('Besalisk','amphibian','sentient','178','brown','none','yellow','75','besalisk','Ojom'),('Cerean','mammal','sentient','200','pale pink','red, blond, black, white','hazel','NA','Cerean','Cerea'),('Chagrian','amphibian','sentient','190','blue','none','blue','NA','Chagria','Champala'),('Clawdite','reptilian','sentient','180','green, yellow','none','yellow','70','Clawdite','Zolan'),('Droid','artificial','sentient','NA','NA','NA','NA','indefinite','NA','NA'),('Dug','mammal','sentient','100','brown, purple, grey, red','none','yellow, blue','NA','Dugese','Malastare'),('Ewok','mammal','sentient','100','brown','white, brown, black','orange, brown','NA','Ewokese','Endor'),('Geonosian','insectoid','sentient','178','green, brown','none','green, hazel','NA','Geonosian','Geonosis'),('Gungan','amphibian','sentient','190','brown, green','none','orange','NA','Gungan basic','Naboo'),('Human','mammal','sentient','180','caucasian, black, asian, hispanic','blonde, brown, black, red','brown, blue, green, hazel, grey, amber','120','Galactic Basic','Coruscant'),('Hutt','gastropod','sentient','300','green, brown, tan','NA','yellow, red','1000','Huttese','Nal Hutta'),('Iktotchi','NA','sentient','180','pink','none','orange','NA','Iktotchese','Iktotch'),('Kaleesh','reptile','sentient','170','brown, orange, tan','none','yellow','80','Kaleesh','Kalee'),('Kaminoan','amphibian','sentient','220','grey, blue','none','black','80','Kaminoan','Kamino'),('Kel Dor','NA','sentient','180','peach, orange, red','none','black, silver','70','Kel Dor','Dorin'),('Mirialan','mammal','sentient','180','yellow, green','black, brown','blue, green, red, yellow, brown, orange','NA','Mirialan','Mirial'),('Mon Calamari','amphibian','sentient','160','red, blue, brown, magenta','none','yellow','NA','Mon Calamarian','Mon Cala'),('Muun','mammal','sentient','190','grey, white','none','black','100','Muun','Muunilinst'),('Nautolan','amphibian','sentient','180','green, blue, brown, red','none','black','70','Nautila','Glee Anselm'),('Neimodian','NA','sentient','180','grey, green','none','red, pink','NA','Neimoidia','Cato Neimoidia'),('Pau\'an','mammal','sentient','190','grey','none','black','700','Utapese','Utapau'),('Quermian','mammal','sentient','240','white','none','yellow','86','Quermian','Quermia'),('Rodian','sentient','reptilian','170','green, blue','NA','black','NA','Galactic Basic','Rodia'),('Skakoan','mammal','sentient','NA','grey, green','none','NA','NA','Skakoan','Skako'),('Sullustan','mammal','sentient','180','pale','none','black','NA','Sullutese','Sullust'),('Tholothian','mammal','sentient','NA','dark','NA','blue, indigo','NA','NA','Tholoth'),('Togruta','mammal','sentient','180','red, white, orange, yellow, green, blue','none','red, orange, yellow, green, blue, black','94','Togruti','Shili'),('Toong','NA','sentient','200','grey, green, yellow','none','orange','NA','Tundan','Tund'),('Toydarian','mammal','sentient','120','blue, green, grey','none','yellow','91','Toydarian','Toydaria'),('Trandoshan','reptile','sentient','200','brown, green','none','yellow, orange','NA','Dosh','Trandosha'),('Twi\'lek','mammals','sentient','200','orange, yellow, blue, green, pink, purple, tan','none','blue, brown, orange, pink','NA','Twi\'leki','Ryloth'),('Vulptereen','NA','sentient','100','grey','none','yellow','NA','vulpterish','Vulpter'),('Wookiee','mammal','sentient','210','gray','black, brown','blue, green, yellow, brown, golden, red','400','Shyriiwook','Kashyyyk'),('Xexto','NA','sentient','125','grey, yellow, purple','none','black','NA','Xextese','Troiken'),('Yoda\'s species','mammal','sentient','66','green, yellow','brown, white','brown, green, yellow','900','Galactic basic','NA'),('Zabrak','mammal','sentient','180','pale, brown, red, orange, yellow','black','brown, orange','NA','Zabraki','Iridonia');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starships`
--

DROP TABLE IF EXISTS `starships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starships` (
  `name` varchar(100) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `cost_in_credits` varchar(100) DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `max_atmosphering_speed` varchar(100) DEFAULT NULL,
  `crew` varchar(100) DEFAULT NULL,
  `passengers` varchar(100) DEFAULT NULL,
  `cargo_capacity` varchar(100) DEFAULT NULL,
  `consumables` varchar(100) DEFAULT NULL,
  `hyperdrive_rating` varchar(100) DEFAULT NULL,
  `MGLT` varchar(100) DEFAULT NULL,
  `starship_class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starships`
--

LOCK TABLES `starships` WRITE;
/*!40000 ALTER TABLE `starships` DISABLE KEYS */;
INSERT INTO `starships` VALUES ('A-wing','RZ-1 A-wing Interceptor','Alliance Underground Engineering, Incom Corporation','175000','9.6','1300','1','0','40','1 week','1.0','120','Starfighter'),('AA-9 Coruscant freighter','Botajef AA-9 Freighter-Liner','Botajef Shipyards','NA','390','NA','NA','30000','NA','NA','NA','NA','freighter'),('arc-170','Aggressive Reconnaissance-170 starfighte','Incom Corporation, Subpro Corporation','155000','14.5','1000','3','0','110','5 days','1.0','100','starfighter'),('B-wing','A/SF-01 B-wing starfighter','Slayn & Korpil','220000','16.9','950','1','0','45','1 week','2.0','91','Assault Starfighter'),('Banking clan frigate','Munificent-class star frigate','Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries','57000000','825','NA','200','NA','40000000','2 years','1.0','NA','cruiser'),('Belbullab-22 starfighter','Belbullab-22 starfighter','Feethan Ottraw Scalable Assemblies','168000','6.71','1100','1','0','140','7 days','6','NA','starfighter'),('Calamari Cruiser','MC80 Liberty type Star Cruiser','Mon Calamari shipyards','104000000','1200','n/a','5400','1200','NA','2 years','1.0','60','Star Cruiser'),('CR90 corvette','CR90 corvette','Corellian Engineering Corporation','3500000','150','950','165','600','3000000','1 year','2.0','60','corvette'),('Death Star','DS-1 Orbital Battle Station','Imperial Department of Military Research, Sienar Fleet Systems','1000000000000','120000','n/a','342953','843342','1000000000000','3 years','4.0','10','Deep Space Mobile Battlestation'),('Droid control ship','Lucrehulk-class Droid Control Ship','Hoersch-Kessel Drive, Inc.','NA','3170','n/a','175','139000','4000000000','500 days','2.0','NA','Droid control ship'),('EF76 Nebulon-B escort frigate','EF76 Nebulon-B escort frigate','Kuat Drive Yards','8500000','300','800','854','75','6000000','2 years','2.0','40','Escort ship'),('Executor','Executor-class star dreadnought','Kuat Drive Yards, Fondor Shipyards','1143350000','19000','n/a','279144','38000','250000000','6 years','2.0','40','Star dreadnought'),('H-type Nubian yacht','H-type Nubian yacht','Theed Palace Space Vessel Engineering Corps','NA','47.9','8000','4','NA','NA','NA','0.9','NA','yacht'),('Imperial shuttle','Lambda-class T-4a shuttle','Sienar Fleet Systems','240000','20','850','6','20','80000','2 months','1.0','50','Armed government transport'),('J-type diplomatic barge','J-type diplomatic barge','Theed Palace Space Vessel Engineering Corps, Nubia Star Drives','2000000','39','2000','5','10','NA','1 year','0.7','NA','Diplomatic barge'),('Jedi Interceptor','Eta-2 Actis-class light interceptor','Kuat Systems Engineering','320000','5.47','1500','1','0','60','2 days','1.0','NA','starfighter'),('Jedi starfighter','Delta-7 Aethersprite-class interceptor','Kuat Systems Engineering','180000','8','1150','1','0','60','7 days','1.0','NA','Starfighter'),('Millennium Falcon','YT-1300 light freighter','Corellian Engineering Corporation','100000','34.37','1050','4','6','100000','2 months','0.5','75','Light freighter'),('Naboo fighter','N-1 starfighter','Theed Palace Space Vessel Engineering Corps','200000','11','1100','1','0','65','7 days','1.0','NA','Starfighter'),('Naboo Royal Starship','J-type 327 Nubian royal starship','Theed Palace Space Vessel Engineering Corps, Nubia Star Drives','NA','76','920','8','NA','NA','NA','1.8','NA','yacht'),('Naboo star skiff','J-type star skiff','Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated','NA','29.2','1050','3','3','NA','NA','0.5','NA','yacht'),('Rebel transport','GR-75 medium transport','Gallofree Yards, Inc.','NA','90','650','6','90','19000000','6 months','4.0','20','Medium transport'),('Republic Assault ship','Acclamator I-class assault ship','Rothana Heavy Engineering','NA','752','NA','700','16000','11250000','2 years','0.6','NA','assault ship'),('Republic attack cruiser','Senator-class Star Destroyer','Kuat Drive Yards, Allanteen Six shipyards','59000000','1137','975','7400','2000','20000000','2 years','1.0','NA','star destroyer'),('Republic Cruiser','Consular-class cruiser','Corellian Engineering Corporation','NA','115','900','9','16','NA','NA','2.0','NA','Space cruiser'),('Scimitar','Star Courier','Republic Sienar Systems','55000000','26.5','1180','1','6','2500000','30 days','1.5','NA','Space Transport'),('Sentinel-class landing craft','Sentinel-class landing craft','Sienar Fleet Systems, Cyngus Spaceworks','240000','38','1000','5','75','180000','1 month','1.0','70','landing craft'),('Slave 1','Firespray-31-class patrol and attack','Kuat Systems Engineering','NA','21.5','1000','1','6','70000','1 month','3.0','70','Patrol craft'),('Solar Sailer','Punworcca 116-class interstellar sloop','Huppla Pasa Tisc Shipwrights Collective','35700','15.2','1600','3','11','240','7 days','1.5','NA','yacht'),('Star Destroyer','Imperial I-class Star Destroyer','Kuat Drive Yards','150000000','1,600','975','47060','0','36000000','2 years','2.0','60','Star Destroyer'),('T-70 X-wing fighter','T-70 X-wing fighter','Incom','NA','NA','NA','1','NA','NA','NA','NA','NA','fighter'),('Theta-class T-2c shuttle','Theta-class T-2c shuttle','Cygnus Spaceworks','1000000','18.5','2000','5','16','50000','56 days','1.0','NA','transport'),('TIE Advanced x1','Twin Ion Engine Advanced x1','Sienar Fleet Systems','NA','9.2','1200','1','0','150','5 days','1.0','105','Starfighter'),('Trade Federation cruiser','Providence-class carrier/destroyer','Rendili StarDrive, Free Dac Volunteers Engineering corps.','125000000','1088','1050','600','48247','50000000','4 years','1.5','NA','capital ship'),('V-wing','Alpha-3 Nimbus-class V-wing starfighter','Kuat Systems Engineering','102500','7.9','1050','1','0','60','15 hours','1.0','NA','starfighter'),('X-wing','T-65 X-wing','Incom Corporation','149999','12.5','1050','1','0','110','1 week','1.0','100','Starfighter'),('Y-wing','BTL Y-wing','Koensayr Manufacturing','134999','14','1000km','2','0','110','1 week','1.0','80','assault starfighter');
/*!40000 ALTER TABLE `starships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `name` varchar(100) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `cost_in_credits` varchar(100) DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `max_atmosphering_speed` varchar(100) DEFAULT NULL,
  `crew` varchar(100) DEFAULT NULL,
  `passengers` varchar(100) DEFAULT NULL,
  `cargo_capacity` varchar(100) DEFAULT NULL,
  `consumables` varchar(100) DEFAULT NULL,
  `vehicle_class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('Armored Assault Tank','Armoured Assault Tank','Baktoid Armor Workshop','NA','9.75','55','4','6','NA','NA','repulsorcraft'),('AT-AT','All Terrain Armored Transport','Kuat Drive Yards, Imperial Department of Military Research','NA','20','60','5','40','1000','NA','assault walker'),('AT-RT','All Terrain Recon Transport','Kuat Drive Yards','40000','3.2','90','1','0','20','1 day','walker'),('AT-ST','All Terrain Scout Transport','Kuat Drive Yards, Imperial Department of Military Research','NA','2','90','2','0','200','none','walker'),('AT-TE','All Terrain Tactical Enforcer','Rothana Heavy Engineering, Kuat Drive Yards','NA','13.2','60','6','36','10000','21 days','walker'),('Bantha-II cargo skiff','Bantha-II','Ubrikkian Industries','8000','9.5','250','5','16','135000','1 day','repulsorcraft cargo skiff'),('C-9979 landing craft','C-9979 landing craft','Haor Chall Engineering','200000','210','587','140','284','1800000','1 day','landing craft'),('Clone turbo tank','HAVw A6 Juggernaut','Kuat Drive Yards','350000','49.4','160','20','300','30000','20 days','wheeled walker'),('Corporate Alliance tank droid','NR-N99 Persuader-class droid enforcer','Techno Union','49000','10.96','100','0','4','none','none','droid tank'),('Droid gunship','HMP droid gunship','Baktoid Fleet Ordnance, Haor Chall Engineering','60000','12.3','820','0','0','0','none','airspeeder'),('Droid tri-fighter','tri-fighter','Colla Designs, Phlac-Arphocc Automata Industries','20000','5.4','1180','1','0','0','none','droid starfighter'),('Emergency Firespeeder','Fire suppression speeder','NA','NA','NA','NA','2','NA','NA','NA','fire suppression ship'),('Flitknot speeder','Flitknot speeder','Huppla Pasa Tisc Shipwrights Collective','8000','2','634','1','0','NA','NA','speeder'),('Geonosian starfighter','Nantex-class territorial defense','Huppla Pasa Tisc Shipwrights Collective','NA','9.8','20000','1','0','NA','NA','starfighter'),('Imperial Speeder Bike','74-Z speeder bike','Aratech Repulsor Company','8000','3','360','1','1','4','1 day','speeder'),('Koro-2 Exodrive airspeeder','Koro-2 Exodrive airspeeder','Desler Gizh Outworld Mobility Corporation','NA','6.6','800','1','1','80','NA','airspeeder'),('LAAT/c','Low Altitude Assault Transport/carrier','Rothana Heavy Engineering','NA','28.82','620','1','0','40000','NA','gunship'),('LAAT/i','Low Altitude Assault Transport/infrantry','Rothana Heavy Engineering','NA','17.4','620','6','30','170','NA','gunship'),('Multi-Troop Transport','Multi-Troop Transport','Baktoid Armor Workshop','138000','31','35','4','112','12000','NA','repulsorcraft'),('Neimoidian shuttle','Sheathipede-class transport shuttle','Haor Chall Engineering','NA','20','880','2','6','1000','7 days','transport'),('Oevvaor jet catamaran','Oevvaor jet catamaran','Appazanna Engineering Works','12125','15.1','420','2','2','50','3 days','airspeeder'),('Raddaugh Gnasp fluttercraft','Raddaugh Gnasp fluttercraft','Appazanna Engineering Works','14750','7','310','2','0','20','none','air speeder'),('Sail barge','Modified Luxury Sail Barge','Ubrikkian Industries Custom Vehicle Division','285000','30','100','26','500','2000000','Live food tanks','sail barge'),('Sand Crawler','Digger Crawler','Corellia Mining Corporation','150000','36.8','30','46','30','50000','2 months','wheeled'),('Single Trooper Aerial Platform','Single Trooper Aerial Platform','Baktoid Armor Workshop','2500','2','400','1','0','none','none','repulsorcraft'),('Sith speeder','FC-20 speeder bike','Razalon','4000','1.5','180','1','0','2','NA','speeder'),('Snowspeeder','t-47 airspeeder','Incom corporation','NA','4.5','650','2','0','10','none','airspeeder'),('SPHA','Self-Propelled Heavy Artillery','Rothana Heavy Engineering','NA','140','35','25','30','500','7 days','walker'),('Storm IV Twin-Pod cloud car','Storm IV Twin-Pod','Bespin Motors','75000','7','1500','2','0','10','1 day','repulsorcraft'),('T-16 skyhopper','T-16 skyhopper','Incom Corporation','14500','10.4','1200','1','1','50','0','repulsorcraft'),('TIE bomber','TIE/sa bomber','Sienar Fleet Systems','NA','7.8','850','1','0','none','2 days','space/planetary bomber'),('TIE/IN interceptor','Twin Ion Engine Interceptor','Sienar Fleet Systems','NA','9.6','1250','1','0','75','2 days','starfighter'),('TIE/LN starfighter','Twin Ion Engine/Ln Starfighter','Sienar Fleet Systems','NA','6.4','1200','1','0','65','2 days','starfighter'),('Tribubble bongo','Tribubble bongo','Otoh Gunga Bongameken Cooperative','NA','15','85','1','2','1600','NA','submarine'),('Tsmeu-6 personal wheel bike','Tsmeu-6 personal wheel bike','Z-Gomot Ternbuell Guppat Corporation','15000','3.5','330','1','1','10','none','wheeled walker'),('Vulture Droid','Vulture-class droid starfighter','Haor Chall Engineering, Baktoid Armor Workshop','NA','3.5','1200','0','0','0','none','starfighter'),('X-34 landspeeder','X-34 landspeeder','SoroSuub Corporation','10550','3.4','250','1','1','5','NA','repulsorcraft'),('XJ-6 airspeeder','XJ-6 airspeeder','Narglatch AirTech prefabricated kit','NA','6.23','720','1','1','NA','NA','airspeeder'),('Zephyr-G swoop bike','Zephyr-G swoop bike','Mobquet Swoops and Speeders','5750','3.68','350','1','1','200','none','repulsorcraft');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'exam_starwars'
--

--
-- Dumping routines for database 'exam_starwars'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21 19:31:25
