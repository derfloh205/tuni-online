-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Mai 2019 um 17:50
-- Server-Version: 10.1.39-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `tunidb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lecture`
--

CREATE TABLE `lecture` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `lecture`
--

INSERT INTO `lecture` (`ID`, `name`) VALUES
(1, 'Structured Data Management'),
(2, 'Applied Cryptographie'),
(3, 'Modern Public Key Crypto'),
(4, 'Web Technology'),
(5, 'Analysis'),
(6, 'Operating Systems'),
(7, 'Software Paradigms');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lectureProducts`
--

CREATE TABLE `lectureProducts` (
  `ID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `lectureProducts`
--

INSERT INTO `lectureProducts` (`ID`, `lectureID`, `productID`) VALUES
(1, 5, 1),
(2, 6, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`ID`, `name`, `price`) VALUES
(1, 'Analysis notes', '10'),
(2, 'Operating systems solutions', '50'),
(3, 'Zbook 15', '800');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `student`
--

INSERT INTO `student` (`studentID`, `name`, `email`, `password`) VALUES
(45, 'test test', 'f@af.at', '123'),
(123, 'test user', 'test@user.at', '123'),
(1311885, 'Tina Promitzer', 'tina@rotehaare.at', 'thisissafe'),
(1330231, 'Anja Reibenbacher', 'anja@reibenbacher.at', 'pw123'),
(1330656, 'Florian Paul Markus Dietrich', 'flo@gamer.at', '1234'),
(1331106, 'Flexi Grass', 'flexi@flex.com', 'password'),
(1430534, 'Simon Guggi', 'test@test.com', 'test123');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `university`
--

CREATE TABLE `university` (
  `ID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `university`
--

INSERT INTO `university` (`ID`, `name`) VALUES
(1, 'TU Graz'),
(2, 'TU Wien'),
(3, 'KF'),
(4, 'FH Johanneum'),
(5, 'WU Wien'),
(6, 'TU Klagenfurt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `universityLectures`
--

CREATE TABLE `universityLectures` (
  `ID` int(11) NOT NULL,
  `uniID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `universityProducts`
--

CREATE TABLE `universityProducts` (
  `ID` int(11) NOT NULL,
  `uniID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `universityProducts`
--

INSERT INTO `universityProducts` (`ID`, `uniID`, `productID`) VALUES
(1, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `lectureProducts`
--
ALTER TABLE `lectureProducts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `lectureID` (`lectureID`),
  ADD KEY `productID` (`productID`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indizes für die Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `productID` (`productID`);

--
-- Indizes für die Tabelle `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `universityLectures`
--
ALTER TABLE `universityLectures`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `uniID` (`uniID`),
  ADD KEY `lectureID` (`lectureID`);

--
-- Indizes für die Tabelle `universityProducts`
--
ALTER TABLE `universityProducts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `uniID` (`uniID`),
  ADD KEY `productID` (`productID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `lecture`
--
ALTER TABLE `lecture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `lectureProducts`
--
ALTER TABLE `lectureProducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `universityLectures`
--
ALTER TABLE `universityLectures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `universityProducts`
--
ALTER TABLE `universityProducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `lectureProducts`
--
ALTER TABLE `lectureProducts`
  ADD CONSTRAINT `lectureProducts_ibfk_1` FOREIGN KEY (`lectureID`) REFERENCES `lecture` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lectureProducts_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `universityLectures`
--
ALTER TABLE `universityLectures`
  ADD CONSTRAINT `universityLectures_ibfk_1` FOREIGN KEY (`lectureID`) REFERENCES `lecture` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `universityLectures_ibfk_2` FOREIGN KEY (`uniID`) REFERENCES `university` (`ID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `universityProducts`
--
ALTER TABLE `universityProducts`
  ADD CONSTRAINT `universityProducts_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `universityProducts_ibfk_2` FOREIGN KEY (`uniID`) REFERENCES `university` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
