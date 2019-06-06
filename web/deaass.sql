-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 04:31 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deaass`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('test', '123');

-- --------------------------------------------------------

--
-- Table structure for table `ideahub`
--

CREATE TABLE `ideahub` (
  `id` int(4) NOT NULL,
  `idea` text NOT NULL,
  `comments` text NOT NULL,
  `user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ideahub`
--

INSERT INTO `ideahub` (`id`, `idea`, `comments`, `user`) VALUES
(9, 'Some Idea For Final Year Project', '<br><b>Shan : </b>Test<br><b>Shan : </b><img src=\"http://localhost/dea/equipment-clipart-factory-machine-7.png\" style=\"width:150x;height:150px;\">', 'Shan');

-- --------------------------------------------------------

--
-- Table structure for table `incal`
--

CREATE TABLE `incal` (
  `id` int(4) NOT NULL,
  `industry` varchar(30) NOT NULL,
  `event` varchar(100) NOT NULL,
  `des` text NOT NULL,
  `date` date NOT NULL,
  `dis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incal`
--

INSERT INTO `incal` (`id`, `industry`, `event`, `des`, `date`, `dis`) VALUES
(1, '99x', 'Sample Wokshop', 'Java Workshop\r\nEntrance Free\r\n												', '2019-04-17', '<br><b>99x : </b>Sample Comment');

-- --------------------------------------------------------

--
-- Table structure for table `industry`
--

CREATE TABLE `industry` (
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id` int(4) NOT NULL,
  `appr` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `industry`
--

INSERT INTO `industry` (`username`, `password`, `id`, `appr`) VALUES
('99x', '123', 1001, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inuncal`
--

CREATE TABLE `inuncal` (
  `id` int(4) NOT NULL,
  `university` varchar(30) NOT NULL,
  `event` varchar(100) NOT NULL,
  `des` text NOT NULL,
  `date` date NOT NULL,
  `dis` longtext NOT NULL,
  `uniid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inuncal`
--

INSERT INTO `inuncal` (`id`, `university`, `event`, `des`, `date`, `dis`, `uniid`) VALUES
(10, 'NSBM', 'Mobile Development Lecture', 'NSBM C2009 - 9am onwards\r\n												', '2019-04-16', '<br><b>NSBM : </b>Test', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id` int(4) NOT NULL,
  `appr` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`username`, `password`, `id`, `appr`) VALUES
('NSBM', '123', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id` int(4) NOT NULL,
  `apr` int(1) NOT NULL,
  `uniid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `id`, `apr`, `uniid`) VALUES
('Shan', '123', 1002, 1, 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ideahub`
--
ALTER TABLE `ideahub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incal`
--
ALTER TABLE `incal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry`
--
ALTER TABLE `industry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inuncal`
--
ALTER TABLE `inuncal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ideahub`
--
ALTER TABLE `ideahub`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `incal`
--
ALTER TABLE `incal`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `industry`
--
ALTER TABLE `industry`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `inuncal`
--
ALTER TABLE `inuncal`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
