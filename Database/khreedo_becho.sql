-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2020 at 10:58 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khreedo_becho`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `adv_id` int(6) NOT NULL,
  `username` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price_initial` int(6) NOT NULL,
  `price_final` int(6) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `area` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approve` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`adv_id`, `username`, `title`, `price_initial`, `price_final`, `phone`, `address`, `area`, `category`, `description`, `image`, `datetime`, `approve`) VALUES
(64, 'ammu', 'Sherlock Homes', 1500, 2500, '9110620110', '', 'Vijayanagar', 'book', 'Unused copy of Sherlock Homes', 'book1.jpg', '2020-04-05 09:38:31', 1),
(65, 'ammu', 'Watch', 8000, 10000, '8197884270', 'NA', 'Rajajinagar', 'accesories', 'Watch about 1.5 years old', 'watch1.webp', '2020-04-05 09:38:32', 1),
(66, 'ammu', 'The Rudest Book Around', 1000, 2000, '8197884270', 'NA', 'MG_Road', 'book', 'NA', 'book2.jfif', '2020-04-05 09:52:23', 1),
(68, 'root1', 'Headphones', 2000, 3000, '9110620110', '1st stage 2nd block Bangalore', 'Peenya', 'electronics', 'Brand New Packed Headphones', 'headphones1.jfif', '2020-04-05 10:01:57', 1),
(69, 'root1', 'Painting', 5000, 7000, '9110620110', '1st stage 2nd block Bangalore', 'Indranagar', 'other', 'Extraordinary Rain Oil Painting', '2.jfif', '2020-04-05 10:02:50', 1),
(70, 'root1', 'Bike', 45000, 55000, '9110620110', '1st stage 2nd block Bangalore', 'Vijayanagar', 'Vehicles', '5 Years old bike, original price : 80000', 'bike1.webp', '2020-04-05 10:04:08', 1),
(72, 'root', 'Shoes', 5000, 8000, '9110620110', '1st stage 2nd block Bangalore', 'RT_Nagar', 'accesories', 'Shoes which is unused', 'shoes.jfif', '2020-04-07 08:04:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `negotiations`
--

CREATE TABLE `negotiations` (
  `neg_id` int(11) NOT NULL,
  `adv_id` int(11) NOT NULL,
  `interested_username` varchar(50) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `name`, `password`, `email`, `phone`) VALUES
('ammu', 'Amrutha', 'e0950e017a3b0a4e19cbefc3b26cc311', 'amruthashetty299@gmail.com', '9110620110'),
('root', 'root', 'ff9830c42660c1dd1942844f8069b74a', 'root@gmail.com', '8197004351'),
('root1', 'root', 'ff9830c42660c1dd1942844f8069b74a', 'root123@gmail.com', '1234567899');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`adv_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD PRIMARY KEY (`neg_id`),
  ADD KEY `adv_id` (`adv_id`),
  ADD KEY `interested_username` (`interested_username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `adv_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `negotiations`
--
ALTER TABLE `negotiations`
  MODIFY `neg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `user_adv` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD CONSTRAINT `neg-adv` FOREIGN KEY (`adv_id`) REFERENCES `advertisements` (`adv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `neg-user` FOREIGN KEY (`interested_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
