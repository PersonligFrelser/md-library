-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27. Nov, 2018 20:37 PM
-- Tjener-versjon: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bio` text,
  `birthdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `nationality` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `book`
--

CREATE TABLE `book` (
  `isbn` bigint(13) NOT NULL,
  `title` varchar(64) NOT NULL,
  `pages` int(11) DEFAULT NULL,
  `pub_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(0) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `book`
--

INSERT INTO `book` (`isbn`, `title`, `pages`, `pub_time`, `lang`, `publisher_id`, `desc`, `img`) VALUES
(9780545791328, 'Harry Potter and the Chamber of Secrets', 623, '2018-11-20 18:02:50', '', 1, 'bla bla bla', 'https://images-na.ssl-images-amazon.com/images/I/616q9K7CrsL._SL160_.jpg'),
(9780545791342, 'Harry Potter and the Prisoner of Azkaban', NULL, '2018-11-20 18:03:35', NULL, 1, 'bla bla bla', 'https://images-na.ssl-images-amazon.com/images/I/61mc3mRBvoL._SL160_.jpg'),
(9781440503252, 'The Unofficial Harry Potter Cookbook', 123, '2018-11-20 18:03:27', '', 1, 'bla bla bla', 'https://images-na.ssl-images-amazon.com/images/I/51hRtiADa3L._SL160_.jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `book_copy`
--

CREATE TABLE `book_copy` (
  `id` int(9) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `library_id` int(11) DEFAULT NULL,
  `cover` enum('Hardback','Paperback') DEFAULT NULL COMMENT 'Type of protective binding'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `book_in_series`
--

CREATE TABLE `book_in_series` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `book_writer`
--

CREATE TABLE `book_writer` (
  `isbn` bigint(13) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `library`
--

CREATE TABLE `library` (
  `id` int(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `loan`
--

CREATE TABLE `loan` (
  `book_id` int(32) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `time_lended` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `due` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `text` text,
  `cover_img` varchar(255) DEFAULT NULL,
  `pub_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `est_country` varchar(255) DEFAULT NULL,
  `est_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `rank`
--

CREATE TABLE `rank` (
  `rank_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `alter_book` enum('0','1') NOT NULL DEFAULT '0',
  `alter_user` enum('0','1') DEFAULT '0',
  `alter_author` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `serie`
--

CREATE TABLE `serie` (
  `isbn` bigint(13) NOT NULL,
  `series_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `subscription`
--

INSERT INTO `subscription` (`id`, `email`) VALUES
(1, 'asdasd@asd.asd'),
(2, 'asdasd@asdasd.asd'),
(3, 'asdasdasdasd@asd.asd');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user`
--

CREATE TABLE `user` (
  `uid` int(5) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rank_id` int(5) NOT NULL DEFAULT '1',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `user`
--

INSERT INTO `user` (`uid`, `firstname`, `lastname`, `created`, `rank_id`, `username`, `password`, `email`, `avatar`) VALUES
(1, '', '', '2018-11-27 19:28:59', 1, 'liban', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'asd', 'http://png-5.findicons.com/files/icons/1072/face_avatars/300/a02.png');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_fav_book`
--

CREATE TABLE `user_fav_book` (
  `id` int(11) NOT NULL,
  `book_isbn` bigint(13) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `user_read`
--

CREATE TABLE `user_read` (
  `id` int(11) NOT NULL,
  `book_isbn` bigint(13) DEFAULT NULL,
  `current_page` int(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dupes_isbn` (`isbn`),
  ADD KEY `fk_library_dupes` (`library_id`);

--
-- Indexes for table `book_in_series`
--
ALTER TABLE `book_in_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_writer`
--
ALTER TABLE `book_writer`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_user_uid` (`uid`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_series_book_series` (`series_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `user_fav_book`
--
ALTER TABLE `user_fav_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_read`
--
ALTER TABLE `user_read`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_in_series`
--
ALTER TABLE `book_in_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `book_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `fk_dupes_isbn` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_library_dupes` FOREIGN KEY (`library_id`) REFERENCES `library` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `book_writer`
--
ALTER TABLE `book_writer`
  ADD CONSTRAINT `fk_book_writer_book` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `fk_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `fk_book_book_series` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_series_book_series` FOREIGN KEY (`series_id`) REFERENCES `book_in_series` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
