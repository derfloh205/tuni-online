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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lectureproducts`
--

CREATE TABLE `lectureproducts` (
  `ID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `universitylectures`
--

CREATE TABLE `universitylectures` (
  `ID` int(11) NOT NULL,
  `uniID` int(11) NOT NULL,
  `lectureID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indizes für die Tabelle `universitylectures`
--
ALTER TABLE `universitylectures`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `uniID` (`uniID`),
  ADD KEY `lectureID` (`lectureID`);

--
-- Indizes für die Tabelle `universityproducts`
--
ALTER TABLE `universityproducts`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lectureproducts`
--
ALTER TABLE `lectureproducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `universitylectures`
--
ALTER TABLE `universitylectures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `universityproducts`
--
ALTER TABLE `universityproducts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `lectureproducts`
--
ALTER TABLE `lectureproducts`
  ADD CONSTRAINT `lectureproducts_ibfk_1` FOREIGN KEY (`lectureID`) REFERENCES `lecture` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lectureproducts_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `universitylectures`
--
ALTER TABLE `universitylectures`
  ADD CONSTRAINT `universitylectures_ibfk_1` FOREIGN KEY (`lectureID`) REFERENCES `lecture` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `universitylectures_ibfk_2` FOREIGN KEY (`uniID`) REFERENCES `university` (`ID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `universityproducts`
--
ALTER TABLE `universityproducts`
  ADD CONSTRAINT `universityproducts_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `universityproducts_ibfk_2` FOREIGN KEY (`uniID`) REFERENCES `university` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
