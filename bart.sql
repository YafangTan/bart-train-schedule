-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2015 at 05:05 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=2206 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`pri`, `st_name`, `latitude`, `longitude`, `fullname`) VALUES
(2161, '12TH', 37.8037, -122.272, '12th St. Oakland City Center'),
(2162, '16TH', 37.7651, -122.42, '16th St. Mission'),
(2163, '19TH', 37.8079, -122.269, '19th St. Oakland'),
(2164, '24TH', 37.7523, -122.418, '24th St. Mission'),
(2165, 'ASHB', 37.853, -122.27, 'Ashby'),
(2166, 'BALB', 37.722, -122.447, 'Balboa Park'),
(2167, 'BAYF', 37.6972, -122.127, 'Bay Fair'),
(2168, 'CAST', 37.6908, -122.076, 'Castro Valley'),
(2169, 'CIVC', 37.7795, -122.414, 'Civic Center/UN Plaza'),
(2170, 'COLS', 37.754, -122.197, 'Coliseum/Oakland Airport'),
(2171, 'COLM', 37.6846, -122.466, 'Colma'),
(2172, 'CONC', 37.9737, -122.029, 'Concord'),
(2173, 'DALY', 37.7061, -122.469, 'Daly City'),
(2174, 'DBRK', 37.8699, -122.268, 'Downtown Berkeley'),
(2175, 'DUBL', 37.7017, -121.9, 'Dublin/Pleasanton'),
(2176, 'DELN', 37.9257, -122.317, 'El Cerrito del Norte'),
(2177, 'PLZA', 37.9031, -122.299, 'El Cerrito Plaza'),
(2178, 'EMBR', 37.793, -122.397, 'Embarcadero'),
(2179, 'FRMT', 37.5574, -121.976, 'Fremont'),
(2180, 'FTVL', 37.775, -122.224, 'Fruitvale'),
(2181, 'GLEN', 37.7329, -122.434, 'Glen Park'),
(2182, 'HAYW', 37.6704, -122.088, 'Hayward'),
(2183, 'LAFY', 37.8934, -122.124, 'Lafayette'),
(2184, 'LAKE', 37.7975, -122.266, 'Lake Merritt'),
(2185, 'MCAR', 37.8284, -122.267, 'MacArthur'),
(2186, 'MLBR', 37.5998, -122.387, 'Millbrae'),
(2187, 'MONT', 37.7893, -122.401, 'Montgomery St.'),
(2188, 'NBRK', 37.874, -122.283, 'North Berkeley'),
(2189, 'NCON', 38.0033, -122.025, 'North Concord/Martinez'),
(2190, 'OAKL', 37.713, -122.212, 'Oakland Int''l Airport'),
(2191, 'ORIN', 37.8784, -122.184, 'Orinda'),
(2192, 'PITT', 38.0189, -121.945, 'Pittsburg/Bay Point'),
(2193, 'PHIL', 37.9284, -122.056, 'Pleasant Hill/Contra Costa Centre'),
(2194, 'POWL', 37.785, -122.407, 'Powell St.'),
(2195, 'RICH', 37.9369, -122.353, 'Richmond'),
(2196, 'ROCK', 37.8446, -122.252, 'Rockridge'),
(2197, 'SBRN', 37.6378, -122.416, 'San Bruno'),
(2198, 'SFIA', 37.616, -122.393, 'San Francisco Int''l Airport'),
(2199, 'SANL', 37.7226, -122.161, 'San Leandro'),
(2200, 'SHAY', 37.6348, -122.058, 'South Hayward'),
(2201, 'SSAN', 37.6642, -122.444, 'South San Francisco'),
(2202, 'UCTY', 37.5912, -122.018, 'Union City'),
(2203, 'WCRK', 37.9056, -122.067, 'Walnut Creek'),
(2204, 'WDUB', 37.6998, -121.928, 'West Dublin/Pleasanton'),
(2205, 'WOAK', 37.8047, -122.295, 'West Oakland');

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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`pri`, `rt_name`, `rt_abbr`, `rt_num`, `rt_color`) VALUES
(158, 'Pittsburg/Bay Point - SFIA/Millbrae', 'PITT-SFIA', 1, '#ffff33'),
(159, 'Daly City - Dublin/Pleasanton', 'DALY-DUBL', 12, '#0099cc'),
(160, 'Daly City - Fremont', 'DALY-FRMT', 6, '#339933'),
(161, 'Dublin/Pleasanton - Daly City', 'DUBL-DALY', 11, '#0099cc'),
(162, 'Fremont - Daly City', 'FRMT-DALY', 5, '#339933'),
(163, 'Fremont - Richmond', 'FRMT-RICH', 3, '#ff9933'),
(164, 'Millbrae/Daly City - Richmond', 'MLBR-RICH', 8, '#ff0000'),
(165, 'Richmond - Fremont', 'RICH-FRMT', 4, '#ff9933'),
(166, 'Richmond - Daly City/Millbrae', 'RICH-MLBR', 7, '#ff0000'),
(167, 'Millbrae/SFIA - Pittsburg/Bay Point', 'SFIA-PITT', 2, '#ffff33'),
(168, 'Coliseum - Oakland Int''l Airport', 'COLS-OAKL', 19, '#d5cfa3'),
(169, 'Oakland Int''l Airport - Coliseum', 'OAKL-COLS', 20, '#d5cfa3');

-- --------------------------------------------------------

--
-- Table structure for table `routeinfo`
--

CREATE TABLE IF NOT EXISTS `routeinfo` (
`pri` mediumint(8) unsigned NOT NULL,
  `rt_num` mediumint(9) NOT NULL,
  `rt_num_station` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routeinfo`
--

INSERT INTO `routeinfo` (`pri`, `rt_num`, `rt_num_station`) VALUES
(61, 1, '26'),
(62, 12, '18'),
(63, 6, '19'),
(64, 11, '18'),
(65, 5, '19'),
(66, 3, '18'),
(67, 8, '23'),
(68, 4, '18'),
(69, 7, '23'),
(70, 2, '26'),
(71, 19, '2'),
(72, 20, '2');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
`pri` mediumint(8) unsigned NOT NULL,
  `st_name` varchar(20) NOT NULL,
  `rt_num` mediumint(9) NOT NULL,
  `rt_stop_pos` mediumint(9) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2333 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`pri`, `st_name`, `rt_num`, `rt_stop_pos`) VALUES
(2121, 'PITT', 1, 0),
(2122, 'NCON', 1, 1),
(2123, 'CONC', 1, 2),
(2124, 'PHIL', 1, 3),
(2125, 'WCRK', 1, 4),
(2126, 'LAFY', 1, 5),
(2127, 'ORIN', 1, 6),
(2128, 'ROCK', 1, 7),
(2129, 'MCAR', 1, 8),
(2130, '19TH', 1, 9),
(2131, '12TH', 1, 10),
(2132, 'WOAK', 1, 11),
(2133, 'EMBR', 1, 12),
(2134, 'MONT', 1, 13),
(2135, 'POWL', 1, 14),
(2136, 'CIVC', 1, 15),
(2137, '16TH', 1, 16),
(2138, '24TH', 1, 17),
(2139, 'GLEN', 1, 18),
(2140, 'BALB', 1, 19),
(2141, 'DALY', 1, 20),
(2142, 'COLM', 1, 21),
(2143, 'SSAN', 1, 22),
(2144, 'SBRN', 1, 23),
(2145, 'SFIA', 1, 24),
(2146, 'MLBR', 1, 25),
(2147, 'DALY', 12, 0),
(2148, 'BALB', 12, 1),
(2149, 'GLEN', 12, 2),
(2150, '24TH', 12, 3),
(2151, '16TH', 12, 4),
(2152, 'CIVC', 12, 5),
(2153, 'POWL', 12, 6),
(2154, 'MONT', 12, 7),
(2155, 'EMBR', 12, 8),
(2156, 'WOAK', 12, 9),
(2157, 'LAKE', 12, 10),
(2158, 'FTVL', 12, 11),
(2159, 'COLS', 12, 12),
(2160, 'SANL', 12, 13),
(2161, 'BAYF', 12, 14),
(2162, 'CAST', 12, 15),
(2163, 'WDUB', 12, 16),
(2164, 'DUBL', 12, 17),
(2165, 'DALY', 6, 0),
(2166, 'BALB', 6, 1),
(2167, 'GLEN', 6, 2),
(2168, '24TH', 6, 3),
(2169, '16TH', 6, 4),
(2170, 'CIVC', 6, 5),
(2171, 'POWL', 6, 6),
(2172, 'MONT', 6, 7),
(2173, 'EMBR', 6, 8),
(2174, 'WOAK', 6, 9),
(2175, 'LAKE', 6, 10),
(2176, 'FTVL', 6, 11),
(2177, 'COLS', 6, 12),
(2178, 'SANL', 6, 13),
(2179, 'BAYF', 6, 14),
(2180, 'HAYW', 6, 15),
(2181, 'SHAY', 6, 16),
(2182, 'UCTY', 6, 17),
(2183, 'FRMT', 6, 18),
(2184, 'DUBL', 11, 0),
(2185, 'WDUB', 11, 1),
(2186, 'CAST', 11, 2),
(2187, 'BAYF', 11, 3),
(2188, 'SANL', 11, 4),
(2189, 'COLS', 11, 5),
(2190, 'FTVL', 11, 6),
(2191, 'LAKE', 11, 7),
(2192, 'WOAK', 11, 8),
(2193, 'EMBR', 11, 9),
(2194, 'MONT', 11, 10),
(2195, 'POWL', 11, 11),
(2196, 'CIVC', 11, 12),
(2197, '16TH', 11, 13),
(2198, '24TH', 11, 14),
(2199, 'GLEN', 11, 15),
(2200, 'BALB', 11, 16),
(2201, 'DALY', 11, 17),
(2202, 'FRMT', 5, 0),
(2203, 'UCTY', 5, 1),
(2204, 'SHAY', 5, 2),
(2205, 'HAYW', 5, 3),
(2206, 'BAYF', 5, 4),
(2207, 'SANL', 5, 5),
(2208, 'COLS', 5, 6),
(2209, 'FTVL', 5, 7),
(2210, 'LAKE', 5, 8),
(2211, 'WOAK', 5, 9),
(2212, 'EMBR', 5, 10),
(2213, 'MONT', 5, 11),
(2214, 'POWL', 5, 12),
(2215, 'CIVC', 5, 13),
(2216, '16TH', 5, 14),
(2217, '24TH', 5, 15),
(2218, 'GLEN', 5, 16),
(2219, 'BALB', 5, 17),
(2220, 'DALY', 5, 18),
(2221, 'FRMT', 3, 0),
(2222, 'UCTY', 3, 1),
(2223, 'SHAY', 3, 2),
(2224, 'HAYW', 3, 3),
(2225, 'BAYF', 3, 4),
(2226, 'SANL', 3, 5),
(2227, 'COLS', 3, 6),
(2228, 'FTVL', 3, 7),
(2229, 'LAKE', 3, 8),
(2230, '12TH', 3, 9),
(2231, '19TH', 3, 10),
(2232, 'MCAR', 3, 11),
(2233, 'ASHB', 3, 12),
(2234, 'DBRK', 3, 13),
(2235, 'NBRK', 3, 14),
(2236, 'PLZA', 3, 15),
(2237, 'DELN', 3, 16),
(2238, 'RICH', 3, 17),
(2239, 'MLBR', 8, 0),
(2240, 'SBRN', 8, 1),
(2241, 'SSAN', 8, 2),
(2242, 'COLM', 8, 3),
(2243, 'DALY', 8, 4),
(2244, 'BALB', 8, 5),
(2245, 'GLEN', 8, 6),
(2246, '24TH', 8, 7),
(2247, '16TH', 8, 8),
(2248, 'CIVC', 8, 9),
(2249, 'POWL', 8, 10),
(2250, 'MONT', 8, 11),
(2251, 'EMBR', 8, 12),
(2252, 'WOAK', 8, 13),
(2253, '12TH', 8, 14),
(2254, '19TH', 8, 15),
(2255, 'MCAR', 8, 16),
(2256, 'ASHB', 8, 17),
(2257, 'DBRK', 8, 18),
(2258, 'NBRK', 8, 19),
(2259, 'PLZA', 8, 20),
(2260, 'DELN', 8, 21),
(2261, 'RICH', 8, 22),
(2262, 'RICH', 4, 0),
(2263, 'DELN', 4, 1),
(2264, 'PLZA', 4, 2),
(2265, 'NBRK', 4, 3),
(2266, 'DBRK', 4, 4),
(2267, 'ASHB', 4, 5),
(2268, 'MCAR', 4, 6),
(2269, '19TH', 4, 7),
(2270, '12TH', 4, 8),
(2271, 'LAKE', 4, 9),
(2272, 'FTVL', 4, 10),
(2273, 'COLS', 4, 11),
(2274, 'SANL', 4, 12),
(2275, 'BAYF', 4, 13),
(2276, 'HAYW', 4, 14),
(2277, 'SHAY', 4, 15),
(2278, 'UCTY', 4, 16),
(2279, 'FRMT', 4, 17),
(2280, 'RICH', 7, 0),
(2281, 'DELN', 7, 1),
(2282, 'PLZA', 7, 2),
(2283, 'NBRK', 7, 3),
(2284, 'DBRK', 7, 4),
(2285, 'ASHB', 7, 5),
(2286, 'MCAR', 7, 6),
(2287, '19TH', 7, 7),
(2288, '12TH', 7, 8),
(2289, 'WOAK', 7, 9),
(2290, 'EMBR', 7, 10),
(2291, 'MONT', 7, 11),
(2292, 'POWL', 7, 12),
(2293, 'CIVC', 7, 13),
(2294, '16TH', 7, 14),
(2295, '24TH', 7, 15),
(2296, 'GLEN', 7, 16),
(2297, 'BALB', 7, 17),
(2298, 'DALY', 7, 18),
(2299, 'COLM', 7, 19),
(2300, 'SSAN', 7, 20),
(2301, 'SBRN', 7, 21),
(2302, 'MLBR', 7, 22),
(2303, 'MLBR', 2, 0),
(2304, 'SFIA', 2, 1),
(2305, 'SBRN', 2, 2),
(2306, 'SSAN', 2, 3),
(2307, 'COLM', 2, 4),
(2308, 'DALY', 2, 5),
(2309, 'BALB', 2, 6),
(2310, 'GLEN', 2, 7),
(2311, '24TH', 2, 8),
(2312, '16TH', 2, 9),
(2313, 'CIVC', 2, 10),
(2314, 'POWL', 2, 11),
(2315, 'MONT', 2, 12),
(2316, 'EMBR', 2, 13),
(2317, 'WOAK', 2, 14),
(2318, '12TH', 2, 15),
(2319, '19TH', 2, 16),
(2320, 'MCAR', 2, 17),
(2321, 'ROCK', 2, 18),
(2322, 'ORIN', 2, 19),
(2323, 'LAFY', 2, 20),
(2324, 'WCRK', 2, 21),
(2325, 'PHIL', 2, 22),
(2326, 'CONC', 2, 23),
(2327, 'NCON', 2, 24),
(2328, 'PITT', 2, 25),
(2329, 'COLS', 19, 0),
(2330, 'OAKL', 19, 1),
(2331, 'OAKL', 20, 0),
(2332, 'COLS', 20, 1);

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
MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2206;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `routeinfo`
--
ALTER TABLE `routeinfo`
MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
MODIFY `pri` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2333;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
