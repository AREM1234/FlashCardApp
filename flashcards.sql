-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 12, 2019 at 01:35 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flashcards`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
CREATE TABLE IF NOT EXISTS `cards` (
  `CardID` int(11) NOT NULL AUTO_INCREMENT,
  `DeckFK` int(11) NOT NULL,
  `Side1` varchar(750) NOT NULL,
  `Side2` varchar(750) NOT NULL,
  PRIMARY KEY (`CardID`),
  KEY `DeckFK` (`DeckFK`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`CardID`, `DeckFK`, `Side1`, `Side2`) VALUES
(1, 1, 'C# is ', 'a general-purpose, multi-paradigm programming language encompassing strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.'),
(2, 2, 'c++ was made by', 'Bjarne Stroustrup'),
(3, 2, 'C++ is an extension of', 'C'),
(4, 2, 'C++ file extensions', 'C,.cc,.cpp,.cxx,.c++,.h,.hh,.hpp,.hxx,.h++'),
(5, 2, 'C++ was released in', '1985'),
(6, 2, 'The latest release came out', '1 December 2017'),
(9, 1, 'C# is a hybrid of', 'C++ & C'),
(10, 2, 'Cards are cool.', 'Yes they are,'),
(13, 17, 'adads', 'sadsad'),
(14, 13, 'ARRRGGGHHHHH', 'RAAAAGGGEEEE'),
(15, 13, 'ENKE SUCKS!!!!!', 'ARRRRGGGGHHHHHH');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(300) NOT NULL,
  `CategoryImage` varchar(300) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `CategoryImage`) VALUES
(1, 'C#', 'cimage.jpg'),
(2, 'C++', 'cimage2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `decks`
--

DROP TABLE IF EXISTS `decks`;
CREATE TABLE IF NOT EXISTS `decks` (
  `DeckID` int(11) NOT NULL AUTO_INCREMENT,
  `DeckDesc` varchar(750) NOT NULL,
  `DeckName` varchar(150) NOT NULL,
  `Public` tinyint(1) NOT NULL,
  PRIMARY KEY (`DeckID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decks`
--

INSERT INTO `decks` (`DeckID`, `DeckDesc`, `DeckName`, `Public`) VALUES
(1, 'A C# deck with great cards.', 'C# Deck1', 1),
(2, 'A c++ deck made for those who love this language.', 'C++ IS AWESOME!!!!!!!!!', 0),
(13, 'IM DBADfsddsffssfsfd', 'BAD DECK cc c c c', 1),
(17, 'adsasdasddsa', 'dadsads', 0);

-- --------------------------------------------------------

--
-- Table structure for table `deckscategories`
--

DROP TABLE IF EXISTS `deckscategories`;
CREATE TABLE IF NOT EXISTS `deckscategories` (
  `CategoryFK` int(11) NOT NULL,
  `DeckFK` int(11) NOT NULL,
  KEY `DeckFK` (`DeckFK`),
  KEY `CategoryFK` (`CategoryFK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deckscategories`
--

INSERT INTO `deckscategories` (`CategoryFK`, `DeckFK`) VALUES
(1, 1),
(2, 2),
(1, 13),
(1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(150) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `userdecks`
--

DROP TABLE IF EXISTS `userdecks`;
CREATE TABLE IF NOT EXISTS `userdecks` (
  `UserFK` int(11) NOT NULL,
  `DeckFK` int(11) NOT NULL,
  `Creator` tinyint(1) DEFAULT NULL,
  KEY `UserFK` (`UserFK`),
  KEY `DeckFK` (`DeckFK`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdecks`
--

INSERT INTO `userdecks` (`UserFK`, `DeckFK`, `Creator`) VALUES
(21, 1, 1),
(21, 2, 1),
(22, 13, 1),
(24, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleFK` int(11) NOT NULL,
  `Email` varchar(300) NOT NULL,
  `UserName` varchar(300) NOT NULL,
  `Password` varchar(300) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `EMAILUNIQUE` (`Email`),
  KEY `ROLEFK` (`RoleFK`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `RoleFK`, `Email`, `UserName`, `Password`) VALUES
(21, 2, 'trimelijah@gmail.com', 'AREM', '$2y$10$6hXPvEhFo2eMRH9D/hKp9OE4VRoRhuHnlxRG/SlAdaosMW44fD/8.'),
(22, 2, 'donad@gmail.com', 'Donad Dongle', '$2y$10$OedOivpxfYTVHvTsP6sNcu/OMjPQtCaf3Xohw4WGflBo.YpJlWKha'),
(23, 1, 'admin@gmail.com', 'Admin', '$2y$10$Kn0PMuTIlyOd.6sK/3CX7.z.O8v6RxxQ8bWcmFoRHCuAza.8cTMn2'),
(24, 2, 'enkeeg@alfredstate.edu', 'sadasas', '$2y$10$K0WsT45HmsH0JyMbDFTAhuaPoxgagFjRlEWp0yaEX1oBs.UPU06GC');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`DeckFK`) REFERENCES `decks` (`DeckID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deckscategories`
--
ALTER TABLE `deckscategories`
  ADD CONSTRAINT `deckscategories_ibfk_1` FOREIGN KEY (`CategoryFK`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deckscategories_ibfk_2` FOREIGN KEY (`DeckFK`) REFERENCES `decks` (`DeckID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userdecks`
--
ALTER TABLE `userdecks`
  ADD CONSTRAINT `userdecks_ibfk_1` FOREIGN KEY (`UserFK`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userdecks_ibfk_2` FOREIGN KEY (`DeckFK`) REFERENCES `decks` (`DeckID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleFK`) REFERENCES `roles` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
