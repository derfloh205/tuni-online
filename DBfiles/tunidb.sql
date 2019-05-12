-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Mai 2019 um 16:22
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 5.6.39

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
-- Tabellenstruktur für Tabelle `lectureproducts`
--

CREATE TABLE `lectureproducts` (
  `ID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `lectureproducts`
--

INSERT INTO `lectureproducts` (`ID`, `lectureID`, `productID`) VALUES
(1, 5, 1),
(2, 6, 2),
(3, 1, 1),
(4, 2, 1),
(5, 3, 1),
(6, 4, 2),
(7, 7, 1),
(8, 7, 3);

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
(1, '1', '1', '1'),
(123, 'test user', 'test@user.at', '123'),
(1311885, 'Tina Promitzer', 'tina@rotehaare.at', 'thisissafe'),
(1330231, 'Anja Reibenbacher', 'anja@reibenbacher.at', 'pw123'),
(1330656, 'Florian Paul Markus Dietrich', 'flo@gamer.at', '1234'),
(1331106, 'Flexi Grass', 'flexi@flex.com', 'password'),
(1345667, '1', '1', '1'),
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

--
-- Daten für Tabelle `transactions`
--

INSERT INTO `transactions` (`ID`, `studentID`, `productID`, `date`) VALUES
(1, 1, 0, '2019-05-12'),
(2, 1, 0, '2019-05-12'),
(3, 1, 0, '2019-05-12'),
(4, 1, 0, '2019-05-12'),
(5, 1, 0, '2019-05-12'),
(6, 1, 0, '2019-05-12'),
(7, 123, 0, '2019-05-12'),
(8, 123, 0, '2019-05-12'),
(9, 123, 0, '2019-05-12'),
(10, 123, 2, '2019-05-12'),
(11, 123, 1, '2019-05-12'),
(12, 123, 2, '2019-05-12'),
(13, 123, 1, '2019-05-12'),
(14, 123, 2, '2019-05-12'),
(15, 123, 0, '2019-05-12');

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
-- Tabellenstruktur für Tabelle `universitylectures`
--

CREATE TABLE `universitylectures` (
  `ID` int(11) NOT NULL,
  `uniID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `universitylectures`
--

INSERT INTO `universitylectures` (`ID`, `uniID`, `lectureID`) VALUES
(1, 3, 4),
(2, 4, 4),
(3, 1, 3),
(4, 2, 3),
(5, 4, 6),
(6, 5, 1),
(7, 6, 6),
(8, 5, 2),
(9, 6, 5),
(10, 5, 7),
(11, 1, 4),
(12, 2, 7),
(13, 4, 7),
(14, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `universityproducts`
--

CREATE TABLE `universityproducts` (
  `ID` int(11) NOT NULL,
  `uniID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `universityproducts`
--

INSERT INTO `universityproducts` (`ID`, `uniID`, `productID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 2),
(4, 3, 1),
(5, 5, 3),
(6, 6, 2),
(7, 4, 3),
(8, 1, 2),
(9, 3, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `lectureproducts`
--
ALTER TABLE `lectureproducts`
  ADD PRIMARY KEY (`ID`);

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
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `universitylectures`
--
ALTER TABLE `universitylectures`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `universityproducts`
--
ALTER TABLE `universityproducts`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `lecture`
--
ALTER TABLE `lecture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `lectureproducts`
--
ALTER TABLE `lectureproducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `universitylectures`
--
ALTER TABLE `universitylectures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `universityproducts`
--
ALTER TABLE `universityproducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
