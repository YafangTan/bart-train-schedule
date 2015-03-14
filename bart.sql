-- phpMyAdmin SQL Dump
-- version 4.3.11.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2015 at 07:29 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bart`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `pri` mediumint(8) unsigned NOT NULL,
  `st_name` varchar(20) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `fullname` text
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`pri`, `st_name`, `latitude`, `longitude`, `fullname`) VALUES
(1, '12TH', 37.8037, -122.272, '12th St. Oakland City Center'),
(2, '16TH', 37.7651, -122.42, '16th St. Mission'),
(3, '19TH', 37.8079, -122.269, '19th St. Oakland'),
(4, '24TH', 37.7523, -122.418, '24th St. Mission'),
(5, 'ASHB', 37.853, -122.27, 'Ashby'),
(6, 'BALB', 37.722, -122.447, 'Balboa Park'),
(7, 'BAYF', 37.6972, -122.127, 'Bay Fair'),
(8, 'CAST', 37.6908, -122.076, 'Castro Valley'),
(9, 'CIVC', 37.7795, -122.414, 'Civic Center/UN Plaza'),
(10, 'COLS', 37.754, -122.197, 'Coliseum/Oakland Airport'),
(11, 'COLM', 37.6846, -122.466, 'Colma'),
(12, 'CONC', 37.9737, -122.029, 'Concord'),
(13, 'DALY', 37.7061, -122.469, 'Daly City'),
(14, 'DBRK', 37.8699, -122.268, 'Downtown Berkeley'),
(15, 'DUBL', 37.7017, -121.9, 'Dublin/Pleasanton'),
(16, 'DELN', 37.9257, -122.317, 'El Cerrito del Norte'),
(17, 'PLZA', 37.9031, -122.299, 'El Cerrito Plaza'),
(18, 'EMBR', 37.793, -122.397, 'Embarcadero'),
(19, 'FRMT', 37.5574, -121.976, 'Fremont'),
(20, 'FTVL', 37.775, -122.224, 'Fruitvale'),
(21, 'GLEN', 37.7329, -122.434, 'Glen Park'),
(22, 'HAYW', 37.6704, -122.088, 'Hayward'),
(23, 'LAFY', 37.8934, -122.124, 'Lafayette'),
(24, 'LAKE', 37.7975, -122.266, 'Lake Merritt'),
(25, 'MCAR', 37.8284, -122.267, 'MacArthur'),
(26, 'MLBR', 37.5998, -122.387, 'Millbrae'),
(27, 'MONT', 37.7893, -122.401, 'Montgomery St.'),
(28, 'NBRK', 37.874, -122.283, 'North Berkeley'),
(29, 'NCON', 38.0033, -122.025, 'North Concord/Martinez'),
(30, 'OAKL', 37.713, -122.212, 'Oakland Int''l Airport'),
(31, 'ORIN', 37.8784, -122.184, 'Orinda'),
(32, 'PITT', 38.0189, -121.945, 'Pittsburg/Bay Point'),
(33, 'PHIL', 37.9284, -122.056, 'Pleasant Hill/Contra Costa Centre'),
(34, 'POWL', 37.785, -122.407, 'Powell St.'),
(35, 'RICH', 37.9369, -122.353, 'Richmond'),
(36, 'ROCK', 37.8446, -122.252, 'Rockridge'),
(37, 'SBRN', 37.6378, -122.416, 'San Bruno'),
(38, 'SFIA', 37.616, -122.393, 'San Francisco Int''l Airport'),
(39, 'SANL', 37.7226, -122.161, 'San Leandro'),
(40, 'SHAY', 37.6348, -122.058, 'South Hayward'),
(41, 'SSAN', 37.6642, -122.444, 'South San Francisco'),
(42, 'UCTY', 37.5912, -122.018, 'Union City'),
(43, 'WCRK', 37.9056, -122.067, 'Walnut Creek'),
(44, 'WDUB', 37.6998, -121.928, 'West Dublin/Pleasanton'),
(45, 'WOAK', 37.8047, -122.295, 'West Oakland');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `pri` mediumint(8) unsigned NOT NULL,
  `rt_name` varchar(200) NOT NULL,
  `rt_abbr` varchar(100) NOT NULL,
  `rt_num` mediumint(9) NOT NULL,
  `rt_color` mediumtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`pri`, `rt_name`, `rt_abbr`, `rt_num`, `rt_color`) VALUES
(1, 'Pittsburg/Bay Point - SFIA/Millbrae', 'PITT-SFIA', 1, '#ffff33'),
(2, 'Daly City - Dublin/Pleasanton', 'DALY-DUBL', 12, '#0099cc'),
(3, 'Daly City - Fremont', 'DALY-FRMT', 6, '#339933'),
(4, 'Dublin/Pleasanton - Daly City', 'DUBL-DALY', 11, '#0099cc'),
(5, 'Fremont - Daly City', 'FRMT-DALY', 5, '#339933'),
(6, 'Fremont - Richmond', 'FRMT-RICH', 3, '#ff9933'),
(7, 'Millbrae/Daly City - Richmond', 'MLBR-RICH', 8, '#ff0000'),
(8, 'Richmond - Fremont', 'RICH-FRMT', 4, '#ff9933'),
(9, 'Richmond - Daly City/Millbrae', 'RICH-MLBR', 7, '#ff0000'),
(10, 'Millbrae/SFIA - Pittsburg/Bay Point', 'SFIA-PITT', 2, '#ffff33'),
(11, 'Coliseum - Oakland Int''l Airport', 'COLS-OAKL', 19, '#d5cfa3'),
(12, 'Oakland Int''l Airport - Coliseum', 'OAKL-COLS', 20, '#d5cfa3');

-- --------------------------------------------------------

--
-- Table structure for table `routeinfo`
--

CREATE TABLE IF NOT EXISTS `routeinfo` (
  `pri` mediumint(8) unsigned NOT NULL,
  `rt_num` mediumint(9) NOT NULL,
  `rt_num_station` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routeinfo`
--

INSERT INTO `routeinfo` (`pri`, `rt_num`, `rt_num_station`) VALUES
(1, 1, '26'),
(2, 12, '18'),
(3, 6, '19'),
(4, 11, '18'),
(5, 5, '19'),
(6, 3, '18'),
(7, 8, '23'),
(8, 4, '18'),
(9, 7, '23'),
(10, 2, '26'),
(11, 19, '2'),
(12, 20, '2');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `pri` mediumint(8) unsigned NOT NULL,
  `st_name` varchar(20) NOT NULL,
  `rt_num` mediumint(9) NOT NULL,
  `rt_stop_pos` mediumint(9) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`pri`, `st_name`, `rt_num`, `rt_stop_pos`) VALUES
(1, 'PITT', 1, 0),
(2, 'NCON', 1, 1),
(3, 'CONC', 1, 2),
(4, 'PHIL', 1, 3),
(5, 'WCRK', 1, 4),
(6, 'LAFY', 1, 5),
(7, 'ORIN', 1, 6),
(8, 'ROCK', 1, 7),
(9, 'MCAR', 1, 8),
(10, '19TH', 1, 9),
(11, '12TH', 1, 10),
(12, 'WOAK', 1, 11),
(13, 'EMBR', 1, 12),
(14, 'MONT', 1, 13),
(15, 'POWL', 1, 14),
(16, 'CIVC', 1, 15),
(17, '16TH', 1, 16),
(18, '24TH', 1, 17),
(19, 'GLEN', 1, 18),
(20, 'BALB', 1, 19),
(21, 'DALY', 1, 20),
(22, 'COLM', 1, 21),
(23, 'SSAN', 1, 22),
(24, 'SBRN', 1, 23),
(25, 'SFIA', 1, 24),
(26, 'MLBR', 1, 25),
(27, 'DALY', 12, 0),
(28, 'BALB', 12, 1),
(29, 'GLEN', 12, 2),
(30, '24TH', 12, 3),
(31, '16TH', 12, 4),
(32, 'CIVC', 12, 5),
(33, 'POWL', 12, 6),
(34, 'MONT', 12, 7),
(35, 'EMBR', 12, 8),
(36, 'WOAK', 12, 9),
(37, 'LAKE', 12, 10),
(38, 'FTVL', 12, 11),
(39, 'COLS', 12, 12),
(40, 'SANL', 12, 13),
(41, 'BAYF', 12, 14),
(42, 'CAST', 12, 15),
(43, 'WDUB', 12, 16),
(44, 'DUBL', 12, 17),
(45, 'DALY', 6, 0),
(46, 'BALB', 6, 1),
(47, 'GLEN', 6, 2),
(48, '24TH', 6, 3),
(49, '16TH', 6, 4),
(50, 'CIVC', 6, 5),
(51, 'POWL', 6, 6),
(52, 'MONT', 6, 7),
(53, 'EMBR', 6, 8),
(54, 'WOAK', 6, 9),
(55, 'LAKE', 6, 10),
(56, 'FTVL', 6, 11),
(57, 'COLS', 6, 12),
(58, 'SANL', 6, 13),
(59, 'BAYF', 6, 14),
(60, 'HAYW', 6, 15),
(61, 'SHAY', 6, 16),
(62, 'UCTY', 6, 17),
(63, 'FRMT', 6, 18),
(64, 'DUBL', 11, 0),
(65, 'WDUB', 11, 1),
(66, 'CAST', 11, 2),
(67, 'BAYF', 11, 3),
(68, 'SANL', 11, 4),
(69, 'COLS', 11, 5),
(70, 'FTVL', 11, 6),
(71, 'LAKE', 11, 7),
(72, 'WOAK', 11, 8),
(73, 'EMBR', 11, 9),
(74, 'MONT', 11, 10),
(75, 'POWL', 11, 11),
(76, 'CIVC', 11, 12),
(77, '16TH', 11, 13),
(78, '24TH', 11, 14),
(79, 'GLEN', 11, 15),
(80, 'BALB', 11, 16),
(81, 'DALY', 11, 17),
(82, 'FRMT', 5, 0),
(83, 'UCTY', 5, 1),
(84, 'SHAY', 5, 2),
(85, 'HAYW', 5, 3),
(86, 'BAYF', 5, 4),
(87, 'SANL', 5, 5),
(88, 'COLS', 5, 6),
(89, 'FTVL', 5, 7),
(90, 'LAKE', 5, 8),
(91, 'WOAK', 5, 9),
(92, 'EMBR', 5, 10),
(93, 'MONT', 5, 11),
(94, 'POWL', 5, 12),
(95, 'CIVC', 5, 13),
(96, '16TH', 5, 14),
(97, '24TH', 5, 15),
(98, 'GLEN', 5, 16),
(99, 'BALB', 5, 17),
(100, 'DALY', 5, 18),
(101, 'FRMT', 3, 0),
(102, 'UCTY', 3, 1),
(103, 'SHAY', 3, 2),
(104, 'HAYW', 3, 3),
(105, 'BAYF', 3, 4),
(106, 'SANL', 3, 5),
(107, 'COLS', 3, 6),
(108, 'FTVL', 3, 7),
(109, 'LAKE', 3, 8),
(110, '12TH', 3, 9),
(111, '19TH', 3, 10),
(112, 'MCAR', 3, 11),
(113, 'ASHB', 3, 12),
(114, 'DBRK', 3, 13),
(115, 'NBRK', 3, 14),
(116, 'PLZA', 3, 15),
(117, 'DELN', 3, 16),
(118, 'RICH', 3, 17),
(119, 'MLBR', 8, 0),
(120, 'SBRN', 8, 1),
(121, 'SSAN', 8, 2),
(122, 'COLM', 8, 3),
(123, 'DALY', 8, 4),
(124, 'BALB', 8, 5),
(125, 'GLEN', 8, 6),
(126, '24TH', 8, 7),
(127, '16TH', 8, 8),
(128, 'CIVC', 8, 9),
(129, 'POWL', 8, 10),
(130, 'MONT', 8, 11),
(131, 'EMBR', 8, 12),
(132, 'WOAK', 8, 13),
(133, '12TH', 8, 14),
(134, '19TH', 8, 15),
(135, 'MCAR', 8, 16),
(136, 'ASHB', 8, 17),
(137, 'DBRK', 8, 18),
(138, 'NBRK', 8, 19),
(139, 'PLZA', 8, 20),
(140, 'DELN', 8, 21),
(141, 'RICH', 8, 22),
(142, 'RICH', 4, 0),
(143, 'DELN', 4, 1),
(144, 'PLZA', 4, 2),
(145, 'NBRK', 4, 3),
(146, 'DBRK', 4, 4),
(147, 'ASHB', 4, 5),
(148, 'MCAR', 4, 6),
(149, '19TH', 4, 7),
(150, '12TH', 4, 8),
(151, 'LAKE', 4, 9),
(152, 'FTVL', 4, 10),
(153, 'COLS', 4, 11),
(154, 'SANL', 4, 12),
(155, 'BAYF', 4, 13),
(156, 'HAYW', 4, 14),
(157, 'SHAY', 4, 15),
(158, 'UCTY', 4, 16),
(159, 'FRMT', 4, 17),
(160, 'RICH', 7, 0),
(161, 'DELN', 7, 1),
(162, 'PLZA', 7, 2),
(163, 'NBRK', 7, 3),
(164, 'DBRK', 7, 4),
(165, 'ASHB', 7, 5),
(166, 'MCAR', 7, 6),
(167, '19TH', 7, 7),
(168, '12TH', 7, 8),
(169, 'WOAK', 7, 9),
(170, 'EMBR', 7, 10),
(171, 'MONT', 7, 11),
(172, 'POWL', 7, 12),
(173, 'CIVC', 7, 13),
(174, '16TH', 7, 14),
(175, '24TH', 7, 15),
(176, 'GLEN', 7, 16),
(177, 'BALB', 7, 17),
(178, 'DALY', 7, 18),
(179, 'COLM', 7, 19),
(180, 'SSAN', 7, 20),
(181, 'SBRN', 7, 21),
(182, 'MLBR', 7, 22),
(183, 'MLBR', 2, 0),
(184, 'SFIA', 2, 1),
(185, 'SBRN', 2, 2),
(186, 'SSAN', 2, 3),
(187, 'COLM', 2, 4),
(188, 'DALY', 2, 5),
(189, 'BALB', 2, 6),
(190, 'GLEN', 2, 7),
(191, '24TH', 2, 8),
(192, '16TH', 2, 9),
(193, 'CIVC', 2, 10),
(194, 'POWL', 2, 11),
(195, 'MONT', 2, 12),
(196, 'EMBR', 2, 13),
(197, 'WOAK', 2, 14),
(198, '12TH', 2, 15),
(199, '19TH', 2, 16),
(200, 'MCAR', 2, 17),
(201, 'ROCK', 2, 18),
(202, 'ORIN', 2, 19),
(203, 'LAFY', 2, 20),
(204, 'WCRK', 2, 21),
(205, 'PHIL', 2, 22),
(206, 'CONC', 2, 23),
(207, 'NCON', 2, 24),
(208, 'PITT', 2, 25),
(209, 'COLS', 19, 0),
(210, 'OAKL', 19, 1),
(211, 'OAKL', 20, 0),
(212, 'COLS', 20, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`pri`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`pri`);

--
-- Indexes for table `routeinfo`
--
ALTER TABLE `routeinfo`
  ADD PRIMARY KEY (`pri`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`pri`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `routeinfo`
--
ALTER TABLE `routeinfo`
  MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=213;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
