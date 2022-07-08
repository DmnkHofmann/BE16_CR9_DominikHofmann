-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 10:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr9_famazon_dominikhofmann`
--
CREATE DATABASE IF NOT EXISTS `be16_cr9_famazon_dominikhofmann` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `be16_cr9_famazon_dominikhofmann`;

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `streetname` varchar(30) DEFAULT NULL,
  `postalcode` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`id`, `streetname`, `postalcode`, `city`, `country`) VALUES
(1, 'Joestreet', '1150', 'Vienna', 'Austria'),
(2, 'Dominikstreet', '7000', 'Eisenstadt', 'Austria'),
(3, 'Holgerstreet', '4020', 'Linz', 'Timbuktu');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 1),
(3, 2, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`) VALUES
(1, 'Kellog'),
(2, 'Nintendo'),
(3, 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `companiy_adresses`
--

CREATE TABLE `companiy_adresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companiy_adresses`
--

INSERT INTO `companiy_adresses` (`id`, `company_id`, `adress_id`) VALUES
(1, 1, 3),
(2, 1, 3),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `user_adress_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cart_id`, `user_adress_id`, `payment_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_companies`
--

CREATE TABLE `order_delivery_companies` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_delivery_companies`
--

INSERT INTO `order_delivery_companies` (`id`, `order_id`, `company_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `creditcard` varchar(30) DEFAULT NULL,
  `paypal` varchar(30) DEFAULT NULL,
  `klarna` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `creditcard`, `paypal`, `klarna`) VALUES
(1, 1, 'Visa', 'Paypal', 'Klarna'),
(2, 2, 'Mastercard', 'Paypal', 'Klarna'),
(3, 3, 'Amex', 'Paypal', 'Klarna');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `modelnumber` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `modelnumber`, `price`, `color`, `company_id`) VALUES
(1, 'Poptarts', '12345', 4.02, 'dark', 1),
(2, 'Switch', '54321', 250.99, 'yellow', 2),
(3, 'Ps5', '34521', 399.99, 'blck', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prouct_type`
--

CREATE TABLE `prouct_type` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prouct_type`
--

INSERT INTO `prouct_type` (`id`, `product_id`, `type`) VALUES
(1, 2, 'Console'),
(2, 3, 'Console'),
(3, 1, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `f_name`, `l_name`, `username`, `email`, `password`) VALUES
(1, 'Holger', 'Kun', 'Ayayaweeb', 'ayaya@weeb.anime.com', 'asdfasdf'),
(2, 'Hans', 'Wurst', 'Hansi', 'hinterseer@livemusic.com', 'fdsafdsa'),
(3, 'Hans-Peter', 'Gerdes', 'HPBaxxter', 'scooter@music.com', 'wqrqwrqw');

-- --------------------------------------------------------

--
-- Table structure for table `user_adress`
--

CREATE TABLE `user_adress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_adress`
--

INSERT INTO `user_adress` (`id`, `user_id`, `adress_id`) VALUES
(1, 2, 2),
(2, 1, 3),
(3, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companiy_adresses`
--
ALTER TABLE `companiy_adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `adress_id` (`adress_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `user_adress_id` (`user_adress_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `order_delivery_companies`
--
ALTER TABLE `order_delivery_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `prouct_type`
--
ALTER TABLE `prouct_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_adress`
--
ALTER TABLE `user_adress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `adress_id` (`adress_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companiy_adresses`
--
ALTER TABLE `companiy_adresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_delivery_companies`
--
ALTER TABLE `order_delivery_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prouct_type`
--
ALTER TABLE `prouct_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_adress`
--
ALTER TABLE `user_adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `companiy_adresses`
--
ALTER TABLE `companiy_adresses`
  ADD CONSTRAINT `companiy_adresses_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `companiy_adresses_ibfk_2` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_adress_id`) REFERENCES `user_adress` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Constraints for table `order_delivery_companies`
--
ALTER TABLE `order_delivery_companies`
  ADD CONSTRAINT `order_delivery_companies_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `order_delivery_companies_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `prouct_type`
--
ALTER TABLE `prouct_type`
  ADD CONSTRAINT `prouct_type_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_adress`
--
ALTER TABLE `user_adress`
  ADD CONSTRAINT `user_adress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_adress_ibfk_2` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
