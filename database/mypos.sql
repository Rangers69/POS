-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2020 at 04:36 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypos`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `gender`, `phone`, `address`, `created`, `updated`) VALUES
(1, 'Ahmad', 'L', '083873787974', 'Jakarta belah pinggiran', '2020-08-17 06:26:16', '2020-09-09 20:02:07'),
(3, 'Andika', 'L', '083873787974', 'Kemanggisan', '2020-08-21 19:32:22', NULL),
(4, 'Aldi', 'L', '083873787974', 'Bogor', '2020-08-21 19:32:42', NULL),
(5, 'Bumi', 'P', '083873787974', 'Sukabumi', '2020-08-21 19:33:07', NULL),
(6, 'Linda', 'P', '083873787974', 'Ciledug', '2020-08-21 19:33:26', NULL),
(7, 'Suketi', 'P', '0797907097', 'jl muktar', '2020-09-10 00:19:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p_category`
--

CREATE TABLE `p_category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_category`
--

INSERT INTO `p_category` (`category_id`, `name`, `created`, `updated`) VALUES
(1, 'Makanan', '2020-08-18 06:34:43', '2020-10-13 14:46:11'),
(2, 'Minuman', '2020-08-18 06:35:03', '2020-08-30 10:32:04'),
(4, 'Garmen', '2020-08-30 15:32:16', '2020-10-13 14:46:22'),
(5, 'Perabot ', '2020-09-08 11:23:11', '2020-10-13 14:46:00'),
(6, 'Cemilan', '2020-09-10 00:20:32', '2020-10-13 14:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `p_item`
--

CREATE TABLE `p_item` (
  `item_id` int(11) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT 0,
  `image` varchar(120) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_item`
--

INSERT INTO `p_item` (`item_id`, `barcode`, `name`, `category_id`, `unit_id`, `price`, `stock`, `image`, `created`, `updated`) VALUES
(11, 'A002', 'Celana Jeans', 4, 2, 50000, -1, 'item-201020-2a23438051.jpg', '2020-09-10 10:01:17', '2020-10-20 20:53:15'),
(15, 'A003', 'Shirt', 4, 2, 35000, 17, NULL, '2020-09-18 00:39:46', '2020-10-13 14:48:08'),
(16, 'A001', 'Permen Sugus', 6, 2, 500, 16, 'item-201020-e035dd99f0.jpg', '2020-09-18 01:56:01', '2020-10-20 20:59:35'),
(17, 'B001', 'T-shirt xs', 4, 2, 65000, 15, NULL, '2020-09-27 00:05:06', '2020-10-13 15:02:17'),
(18, 'B002', 'Peyek udang rebon', 1, 2, 2000, 19, 'item-201020-cd2bf039a6.jpg', '2020-10-13 19:49:25', '2020-10-20 21:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `p_unit`
--

CREATE TABLE `p_unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_unit`
--

INSERT INTO `p_unit` (`unit_id`, `name`, `created`, `updated`) VALUES
(1, 'Kg', '2020-08-18 06:34:43', '2020-10-13 14:51:13'),
(2, 'Satuan', '2020-08-18 06:35:03', '2020-10-13 14:50:53'),
(3, 'Bungkus', '2020-10-13 20:01:04', NULL),
(4, 'Karung', '2020-10-13 20:01:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(75) NOT NULL,
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `address`, `description`, `created`, `updated`) VALUES
(1, 'Toko A ', '0215990683', 'Jl Petamburan 2 no ', 'Toko parfum', '2020-08-09 05:56:10', '2020-08-12 14:53:03'),
(2, 'Toko B', '0219098732', 'Jl Petamburan 3 no 3', 'Toko Minyak', '2020-08-09 05:56:10', NULL),
(6, 'Toko C', '356375', 'Rajeg no', 'toko besi', '2020-08-10 06:25:09', '2020-08-12 14:53:15'),
(8, 'Toko E', '7564378', 'reaji', 'klopj', '2020-08-12 10:58:15', NULL),
(9, 'Toko F', '989756', 'jl kampung', 'Toko Mainan', '2020-08-12 19:50:25', NULL),
(10, 'Toko G', '0897698', 'jl tali', NULL, '2020-08-12 19:52:33', NULL),
(11, 'Toko D', '083873787974', 'jl apus', 'toko sembako', '2020-09-10 01:11:21', '2020-09-09 20:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `t_stock`
--

CREATE TABLE `t_stock` (
  `stock_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` varchar(150) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `qty` int(10) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_stock`
--

INSERT INTO `t_stock` (`stock_id`, `item_id`, `type`, `detail`, `supplier_id`, `qty`, `date`, `created`, `user_id`) VALUES
(1, 16, 'in', 'Kulakan', 1, 15, '2020-10-04', '2020-10-04 22:21:14', 1),
(3, 15, 'in', 'Kulakan', 1, 17, '2020-10-13', '2020-10-13 13:10:55', 1),
(4, 17, 'in', 'Kulakan', 6, 12, '2020-10-13', '2020-10-13 13:12:33', 1),
(5, 17, 'in', 'tambahan', 1, 3, '2020-10-13', '2020-10-13 20:00:06', 1),
(6, 18, 'in', 'Kulakan', 9, 12, '2020-10-13', '2020-10-13 20:00:47', 1),
(7, 18, 'in', 'tambahan', 11, 7, '2020-10-13', '2020-10-13 20:03:31', 1),
(9, 18, 'in', 'tambahan', 2, 2, '2020-10-13', '2020-10-13 20:04:36', 1),
(10, 11, 'in', 'Kulakan', 11, 12, '2020-10-13', '2020-10-13 20:05:07', 1),
(16, 16, 'in', 'tambahan', NULL, 4, '2020-10-20', '2020-10-20 17:25:08', 1),
(18, 11, 'out', 'rusak', NULL, 1, '2020-10-20', '2020-10-21 00:57:40', 1),
(28, 11, 'out', 'hilang', NULL, 10, '2020-10-21', '2020-10-21 21:10:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `level` int(1) NOT NULL COMMENT '1:admin,2:kasir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `address`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Ahmad Widodo', 'jl petamburan 1 no 2', 1),
(13, 'kasir', '8cb2237d0679ca88db6464eac60da96345513964', 'Tomi', 'Gajah Mada', 2),
(14, 'dodo', '8cb2237d0679ca88db6464eac60da96345513964', 'Ahmad Widodo', 'Jl Salak Timur IV no 26', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `p_category`
--
ALTER TABLE `p_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `p_item`
--
ALTER TABLE `p_item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `p_unit`
--
ALTER TABLE `p_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `t_stock`
--
ALTER TABLE `t_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `p_category`
--
ALTER TABLE `p_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `p_item`
--
ALTER TABLE `p_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `p_unit`
--
ALTER TABLE `p_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_stock`
--
ALTER TABLE `t_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `p_item`
--
ALTER TABLE `p_item`
  ADD CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `p_category` (`category_id`),
  ADD CONSTRAINT `p_item_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `p_unit` (`unit_id`);

--
-- Constraints for table `t_stock`
--
ALTER TABLE `t_stock`
  ADD CONSTRAINT `t_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `p_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stock_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
