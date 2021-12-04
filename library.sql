-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Dez 2021 um 13:53
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article`
--

INSERT INTO `article` (`article_id`, `name`) VALUES
(1, 'Wie baue ich ein Haus'),
(2, 'der neue Ferrar F19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_journal`
--

CREATE TABLE `article_journal` (
  `journal_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article_journal`
--

INSERT INTO `article_journal` (`journal_id`, `article_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `firstname`, `lastname`) VALUES
(1, 'hannes', 'Schmidberger'),
(2, 'stefan', 'etzlsdorfer'),
(3, 'josef', 'hasenleitner');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_article`
--

CREATE TABLE `author_article` (
  `author_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author_article`
--

INSERT INTO `author_article` (`author_id`, `article_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `publishing_house_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `publishing_house_id`) VALUES
(1, 'Tag der Abrechnung', 2),
(2, 'Dune', 2),
(3, 'Strib langsam', 1),
(4, 'Stargate', 1),
(5, 'The last day on earth', 2),
(6, 'sdf', 1),
(7, 'Atlas', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_athor`
--

CREATE TABLE `book_athor` (
  `book_id` int(11) NOT NULL,
  `athor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_athor`
--

INSERT INTO `book_athor` (`book_id`, `athor_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_copy`
--

CREATE TABLE `book_copy` (
  `book_copy_id` int(11) NOT NULL,
  `copy_nr` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `shelves_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_copy`
--

INSERT INTO `book_copy` (`book_copy_id`, `copy_nr`, `book_id`, `shelves_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 1, NULL),
(3, 3, 1, NULL),
(4, 1, 1, NULL),
(5, 2, 1, NULL),
(6, 3, 1, NULL),
(7, 1, 2, 2),
(8, 1, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_copy_loan`
--

CREATE TABLE `book_copy_loan` (
  `book_copy_loan_id` int(11) NOT NULL,
  `book_copy_loan_date` date DEFAULT current_timestamp(),
  `book_copy_loan_return_date` date DEFAULT NULL,
  `book_copy_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id_loan` int(11) DEFAULT NULL,
  `employee_id_return` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_copy_loan`
--

INSERT INTO `book_copy_loan` (`book_copy_loan_id`, `book_copy_loan_date`, `book_copy_loan_return_date`, `book_copy_id`, `customer_id`, `employee_id_loan`, `employee_id_return`) VALUES
(1, '2021-12-02', '2022-01-01', 1, 2, 2, 1),
(2, '2021-12-02', '2001-01-01', 1, 1, 1, 1),
(3, '2021-12-03', NULL, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_copy_loan__book_copy_reservation`
--

CREATE TABLE `book_copy_loan__book_copy_reservation` (
  `book_copy_loan_id` int(11) NOT NULL,
  `book_copy_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_copy_loan__book_copy_reservation`
--

INSERT INTO `book_copy_loan__book_copy_reservation` (`book_copy_loan_id`, `book_copy_reservation_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_copy_reservation`
--

CREATE TABLE `book_copy_reservation` (
  `book_copy_reservation_id` int(11) NOT NULL,
  `book_copy_reservation_date` date DEFAULT current_timestamp(),
  `book_copy_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_copy_reservation`
--

INSERT INTO `book_copy_reservation` (`book_copy_reservation_id`, `book_copy_reservation_date`, `book_copy_id`, `employee_id`, `customer_id`) VALUES
(1, '2020-01-01', 1, 1, NULL),
(2, '2022-01-01', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_firstname` varchar(50) NOT NULL,
  `customer_lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_firstname`, `customer_lastname`) VALUES
(1, 'Lisa', 'Huber'),
(2, 'Stephan', 'Schmidberger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_firstname` varchar(50) NOT NULL,
  `employee_lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_firstname`, `employee_lastname`) VALUES
(1, 'Hannse', 'Schmidberger'),
(2, 'Anderas', 'Schmidberger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `journal_id` int(11) NOT NULL,
  `journal_name` varchar(50) NOT NULL,
  `shelves_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `journal`
--

INSERT INTO `journal` (`journal_id`, `journal_name`, `shelves_id`, `author_id`) VALUES
(1, 'Forbs', 2, 1),
(2, 'Spiegel', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `keyword_word` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `keyword_word`) VALUES
(1, 'Auto'),
(2, 'Haus'),
(3, 'PKW');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword_book`
--

CREATE TABLE `keyword_book` (
  `keyword_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `relevance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword_book`
--

INSERT INTO `keyword_book` (`keyword_id`, `book_id`, `relevance`) VALUES
(1, 1, 'hoch'),
(1, 2, 'hoch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishing_house`
--

CREATE TABLE `publishing_house` (
  `publishing_house_id` int(11) NOT NULL,
  `publishing_house_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publishing_house`
--

INSERT INTO `publishing_house` (`publishing_house_id`, `publishing_house_name`) VALUES
(1, 'Hansen Verlag'),
(2, 'HuberVerlag');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelves`
--

CREATE TABLE `shelves` (
  `shelves_id` int(11) NOT NULL,
  `shelves_name` varchar(50) NOT NULL,
  `subject_area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shelves`
--

INSERT INTO `shelves` (`shelves_id`, `shelves_name`, `subject_area`) VALUES
(1, 'A1', 1),
(2, 'A2', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` int(11) NOT NULL,
  `name_of_subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subject_area`
--

INSERT INTO `subject_area` (`subject_area_id`, `name_of_subject`) VALUES
(1, 'Krimi'),
(2, 'Scifi');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area_keyword`
--

CREATE TABLE `subject_area_keyword` (
  `keyword_id` int(11) NOT NULL,
  `subject_area_id` int(11) NOT NULL,
  `relevance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subject_area_keyword`
--

INSERT INTO `subject_area_keyword` (`keyword_id`, `subject_area_id`, `relevance`) VALUES
(1, 1, 'hoch'),
(2, 2, 'hoch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `synonyous_keyword`
--

CREATE TABLE `synonyous_keyword` (
  `keyword_id1` int(11) NOT NULL,
  `keyword_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `synonyous_keyword`
--

INSERT INTO `synonyous_keyword` (`keyword_id1`, `keyword_id2`) VALUES
(1, 3),
(2, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indizes für die Tabelle `article_journal`
--
ALTER TABLE `article_journal`
  ADD PRIMARY KEY (`journal_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `author_article`
--
ALTER TABLE `author_article`
  ADD PRIMARY KEY (`author_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publishing_house_id` (`publishing_house_id`);

--
-- Indizes für die Tabelle `book_athor`
--
ALTER TABLE `book_athor`
  ADD PRIMARY KEY (`book_id`,`athor_id`),
  ADD KEY `athor_id` (`athor_id`);

--
-- Indizes für die Tabelle `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`book_copy_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `shelves_id` (`shelves_id`);

--
-- Indizes für die Tabelle `book_copy_loan`
--
ALTER TABLE `book_copy_loan`
  ADD PRIMARY KEY (`book_copy_loan_id`),
  ADD KEY `book_copy_id` (`book_copy_id`),
  ADD KEY `employee_id_loan` (`employee_id_loan`),
  ADD KEY `employee_id_return` (`employee_id_return`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `book_copy_loan__book_copy_reservation`
--
ALTER TABLE `book_copy_loan__book_copy_reservation`
  ADD PRIMARY KEY (`book_copy_loan_id`,`book_copy_reservation_id`),
  ADD KEY `book_copy_reservation_id` (`book_copy_reservation_id`);

--
-- Indizes für die Tabelle `book_copy_reservation`
--
ALTER TABLE `book_copy_reservation`
  ADD PRIMARY KEY (`book_copy_reservation_id`),
  ADD KEY `book_copy_id` (`book_copy_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journal_id`),
  ADD KEY `shelves_id` (`shelves_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indizes für die Tabelle `keyword_book`
--
ALTER TABLE `keyword_book`
  ADD PRIMARY KEY (`keyword_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indizes für die Tabelle `publishing_house`
--
ALTER TABLE `publishing_house`
  ADD PRIMARY KEY (`publishing_house_id`);

--
-- Indizes für die Tabelle `shelves`
--
ALTER TABLE `shelves`
  ADD PRIMARY KEY (`shelves_id`),
  ADD KEY `subject_area` (`subject_area`);

--
-- Indizes für die Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`);

--
-- Indizes für die Tabelle `subject_area_keyword`
--
ALTER TABLE `subject_area_keyword`
  ADD PRIMARY KEY (`keyword_id`,`subject_area_id`),
  ADD KEY `subject_area_id` (`subject_area_id`);

--
-- Indizes für die Tabelle `synonyous_keyword`
--
ALTER TABLE `synonyous_keyword`
  ADD PRIMARY KEY (`keyword_id1`,`keyword_id2`),
  ADD KEY `keyword_id2` (`keyword_id2`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `book_copy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `book_copy_loan`
--
ALTER TABLE `book_copy_loan`
  MODIFY `book_copy_loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `book_copy_reservation`
--
ALTER TABLE `book_copy_reservation`
  MODIFY `book_copy_reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `journal`
--
ALTER TABLE `journal`
  MODIFY `journal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keyword_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `publishing_house`
--
ALTER TABLE `publishing_house`
  MODIFY `publishing_house_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `shelves`
--
ALTER TABLE `shelves`
  MODIFY `shelves_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  MODIFY `subject_area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `article_journal`
--
ALTER TABLE `article_journal`
  ADD CONSTRAINT `article_journal_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`journal_id`),
  ADD CONSTRAINT `article_journal_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`);

--
-- Constraints der Tabelle `author_article`
--
ALTER TABLE `author_article`
  ADD CONSTRAINT `author_article_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `author_article_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishing_house` (`publishing_house_id`);

--
-- Constraints der Tabelle `book_athor`
--
ALTER TABLE `book_athor`
  ADD CONSTRAINT `book_athor_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_athor_ibfk_2` FOREIGN KEY (`athor_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`shelves_id`) REFERENCES `shelves` (`shelves_id`);

--
-- Constraints der Tabelle `book_copy_loan`
--
ALTER TABLE `book_copy_loan`
  ADD CONSTRAINT `book_copy_loan_ibfk_1` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`book_copy_id`),
  ADD CONSTRAINT `book_copy_loan_ibfk_2` FOREIGN KEY (`employee_id_loan`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `book_copy_loan_ibfk_3` FOREIGN KEY (`employee_id_return`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `book_copy_loan_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `book_copy_loan__book_copy_reservation`
--
ALTER TABLE `book_copy_loan__book_copy_reservation`
  ADD CONSTRAINT `book_copy_loan__book_copy_reservation_ibfk_1` FOREIGN KEY (`book_copy_loan_id`) REFERENCES `book_copy_loan` (`book_copy_loan_id`),
  ADD CONSTRAINT `book_copy_loan__book_copy_reservation_ibfk_2` FOREIGN KEY (`book_copy_reservation_id`) REFERENCES `book_copy_reservation` (`book_copy_reservation_id`);

--
-- Constraints der Tabelle `book_copy_reservation`
--
ALTER TABLE `book_copy_reservation`
  ADD CONSTRAINT `book_copy_reservation_ibfk_1` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`book_copy_id`),
  ADD CONSTRAINT `book_copy_reservation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`shelves_id`) REFERENCES `shelves` (`shelves_id`),
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `keyword_book`
--
ALTER TABLE `keyword_book`
  ADD CONSTRAINT `keyword_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `keyword_book_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `shelves`
--
ALTER TABLE `shelves`
  ADD CONSTRAINT `shelves_ibfk_1` FOREIGN KEY (`subject_area`) REFERENCES `subject_area` (`subject_area_id`);

--
-- Constraints der Tabelle `subject_area_keyword`
--
ALTER TABLE `subject_area_keyword`
  ADD CONSTRAINT `subject_area_keyword_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`),
  ADD CONSTRAINT `subject_area_keyword_ibfk_2` FOREIGN KEY (`subject_area_id`) REFERENCES `subject_area` (`subject_area_id`);

--
-- Constraints der Tabelle `synonyous_keyword`
--
ALTER TABLE `synonyous_keyword`
  ADD CONSTRAINT `synonyous_keyword_ibfk_1` FOREIGN KEY (`keyword_id1`) REFERENCES `keyword` (`keyword_id`),
  ADD CONSTRAINT `synonyous_keyword_ibfk_2` FOREIGN KEY (`keyword_id2`) REFERENCES `keyword` (`keyword_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
