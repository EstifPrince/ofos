-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2021 at 06:38 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `picture_location` varchar(150) NOT NULL DEFAULT 'images*food*food1.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `deleted`, `picture_location`) VALUES
(1, 'Egg Sandwich', 45, 1, 'images*food*food5.jpg'),
(2, 'Egg Scramble', 45, 0, 'images*food*food1.jpg'),
(3, 'Egg Sels', 45, 0, 'images*food*food7.jpg'),
(4, 'Shiro Bozena', 55, 0, 'images*food*food4.jpg'),
(5, 'Cheese', 45, 0, 'images*food*food3.jpg'),
(6, 'Spaghetti with Meat', 55, 0, 'images*food*food6.jpg'),
(7, 'Meat Firfir', 55, 0, 'images*food*food8.jpg'),
(8, 'Kuanta Firfir', 75, 1, 'images*food*food3.jpg'),
(9, 'Egg with Meat', 65, 0, 'images*food*food9.jpg'),
(10, 'Dullet', 55, 0, 'images*food*food10.jpg'),
(11, 'Lamb Tibs', 90, 0, 'images*food*food1.jpg'),
(12, 'Milas Senber', 75, 0, 'images*food*food2.jpg'),
(13, 'Misto', 60, 1, 'images*food*food1.jpg'),
(15, 'Kikil', 65, 0, 'images*food*food11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `latitude` float(10,6) NOT NULL,
  `longtude` float(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`, `latitude`, `longtude`) VALUES
(1, 2, 'Address 2', 'Sample Description 1', '2021-01-21 17:32:41', 'Wallet', 150, 'Delivered', 1, 0.000000, 0.000000),
(2, 2, 'New address 2', '', '2021-01-21 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1, 0.000000, 0.000000),
(3, 3, 'Address 3', 'Sample Description 2', '2021-01-21 19:49:33', 'Cash On Delivery', 130, 'Delivered', 0, 0.000000, 0.000000),
(4, 3, 'Address 3', '', '2021-01-21 19:52:01', 'Cash On Delivery', 130, 'Cancelled by Customer', 1, 0.000000, 0.000000),
(5, 3, 'New Address 3', '', '2021-01-21 20:47:28', 'Wallet', 285, 'Paused', 0, 0.000000, 0.000000),
(6, 3, 'New Address 3', '', '2021-01-21 00:43:31', 'Wallet', 325, 'Cancelled by Customer', 1, 0.000000, 0.000000),
(7, 2, 'My address\r\n', '', '2021-01-12 14:52:48', 'Cash On Delivery', 315, 'Delivered', 0, 11.588790, 37.388119),
(8, 2, 'Address 2', '', '2021-01-14 19:51:32', 'Cash On Delivery', 0, 'Yet to be delivered', 0, 0.000000, 0.000000),
(9, 3, 'Address 3', '', '2021-01-17 21:44:59', 'Cash On Delivery', 235, 'Yet to be delivered', 0, 11.585991, 37.385849),
(10, 2, 'Address 2', '', '2021-01-18 19:17:21', 'Cash On Delivery', 100, 'Cancelled by Admin', 0, 11.589383, 37.388092),
(11, 2, 'Address 2', 'som', '2021-01-18 20:12:58', 'Cash On Delivery', 240, 'Cancelled by Customer', 1, 0.000000, 0.000000),
(12, 2, 'Bahir dars', '', '2021-01-20 00:11:24', 'Cash On Delivery', 315, 'Paused', 0, 11.603784, 37.402782),
(13, 2, 'Bahir darr', '', '2021-01-25 19:38:52', 'Cash On Delivery', 135, 'Cancelled by Customer', 1, 0.000000, 0.000000),
(14, 3, 'Address 3', '', '2021-01-25 19:42:19', 'Cash On Delivery', 75, 'Paused', 0, 0.000000, 0.000000),
(15, 2, 'Bahir darr', '', '2021-01-25 20:32:39', 'Wallet', 90, 'Yet to be delivered', 0, 0.000000, 0.000000);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 2, 2, 90),
(2, 1, 3, 3, 60),
(3, 2, 2, 2, 90),
(4, 2, 3, 2, 40),
(5, 3, 2, 2, 90),
(6, 3, 3, 2, 40),
(7, 4, 2, 2, 90),
(8, 4, 3, 2, 40),
(9, 5, 2, 5, 225),
(10, 5, 3, 2, 40),
(11, 5, 5, 1, 20),
(12, 6, 2, 5, 225),
(13, 6, 3, 3, 60),
(14, 6, 5, 2, 40),
(15, 7, 2, 7, 315),
(16, 9, 2, 2, 90),
(17, 9, 5, 2, 90),
(18, 9, 7, 1, 55),
(19, 10, 2, 1, 45),
(20, 10, 4, 1, 55),
(21, 11, 13, 4, 240),
(22, 12, 2, 5, 225),
(23, 12, 5, 2, 90),
(24, 13, 2, 2, 90),
(25, 13, 3, 1, 45),
(26, 14, 12, 1, 75),
(27, 15, 2, 2, 90);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `delivered` int(11) NOT NULL,
  `cancelled` int(11) NOT NULL,
  `total_sale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `date`, `delivered`, `cancelled`, `total_sale`) VALUES
(3, '2021-01-21', 2, 3, 280);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `poster_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(1, 2, 'Subject 1', 'New Description for Subject 1', 'Answered', 'Support', '2017-03-30 18:08:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`id`, `ticket_id`, `user_id`, `description`, `date`) VALUES
(1, 1, 2, 'New Description for Subject 1', '2017-03-30 18:08:51'),
(2, 1, 2, 'Reply-1 for Subject 1', '2017-03-30 19:59:09'),
(3, 1, 1, 'Reply-2 for Subject 1 from Administrator.', '2017-03-30 20:35:39'),
(4, 1, 1, 'Reply-3 for Subject 1 from Administrator.', '2017-03-30 20:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Admin 1', 'root', 'toor', '', 'Address 1', 9898000000, 1, 0),
(2, 'Customer', 'Customer 1', 'user1', 'pass1', 'mail2@example.com', 'Bahir darr', 9898000005, 1, 0),
(3, 'Customer', 'Customer 2', 'user2', 'pass2', 'mail3@example.com', 'Address 3', 9898000002, 1, 0),
(4, 'Customer', 'Customer 3', 'user3', 'pass3', '', '', 9898000003, 0, 0),
(5, 'Customer', 'Customer 4', 'user4', 'pass4', '', '', 9898000004, 0, 1),
(6, 'Customer', 'Myname', 'Newuser', 'pass1', NULL, NULL, 987562458, 0, 0),
(7, 'Waiter', 'Waiter1', 'waiter1', 'pass1', 'waiter@zemar.com', 'Bahir Dar', 912256489, 1, 0),
(8, 'Cashier', 'Cashier1', 'cashier1', 'pass1', 'cashier@zemar.com', 'Bahir Dar', 965235478, 0, 0),
(9, 'Chef', 'Chef1', 'Chef1', 'pass1', 'chef1@zemar.com', 'Bahir Dar', 925145789, 1, 0),
(10, 'Customer', 'Aweke', 'Fenta', 'fenta', NULL, NULL, 932785202, 0, 0),
(11, 'Customer', 'Userc', 'Userc', 'psss3', NULL, NULL, 1234567890, 0, 0),
(13, 'Customer', 'Userd', 'Userd', 'pass33', NULL, NULL, 912345678, 0, 0),
(14, 'Customer', 'Aweke', 'Tri', '', NULL, NULL, 0, 0, 0),
(15, 'Customer', 'Ffggggg', 'Tirtyy', 'tyyyrtyyy', NULL, NULL, 4511222, 0, 0),
(16, 'Customer', 'Aweke', 'Ttttt', '090909', NULL, NULL, 9122232, 0, 0),
(17, 'Customer', 'Aweke', 'Habtamu', 'aweke', NULL, NULL, 999999, 0, 0),
(18, 'Manager', 'Mang', 'mng1', 'pass1', 'mng1@zemar.com', 'Bahir Dar', 925153245, 1, 0),
(20, 'Customer', 'User55', 'user5', 'pass5', NULL, NULL, 926547895, 0, 0),
(21, 'Customer', 'Tadd', 'Tadd', '123456', NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `customer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 20),
(19, 21);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE `wallet_details` (
  `id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` (`id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '6155247490533921', 983, 3430),
(2, 2, '1887587142382050', 772, 1680),
(3, 3, '4595809639046830', 532, 1585),
(4, 4, '5475856443351234', 521, 2000),
(5, 5, '9076633115663264', 229, 2000),
(6, 6, '108224724609485', 596, 2000),
(7, 7, '5954534527923855', 800, 2000),
(8, 8, '6155804100602834', 617, 2000),
(9, 9, '5676301405963364', 970, 2000),
(10, 10, '4173521271196923', 47, 1000),
(11, 11, '5332214545945451', 493, 0),
(12, 12, '5597562676771762', 926, 0),
(13, 13, '1561761844433780', 880, 0),
(14, 14, '9722125457268610', 123, 0),
(15, 15, '4448477565247499', 410, 0),
(16, 16, '6340635257765868', 108, 0),
(17, 17, '7577717926767854', 929, 0),
(18, 18, '7362688288092200', 348, 0),
(19, 19, '7225783623971823', 720, 18000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ticket_details`
--
ALTER TABLE `ticket_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `wallet_details_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
