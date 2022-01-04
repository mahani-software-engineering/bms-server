-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2021 at 07:17 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `victoria-bms-db`
--

-- --------------------------------------------------------

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`created_at`, `updated_at`, `deleted_at`, `name`, `category`, `brand`, `type`, `price`, `quantity`, `quantity_units`, `supplier_id`, `created_by`) VALUES
('2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 'Cocacola soda', 'drinks', 'cocacola', 'soda', 100000, 60, 'crates', 3, NULL),
('2021-12-03 00:00:00.000', '2021-12-19 00:00:00.000', NULL, 'Cocacola soda', 'drinks', 'cocacola', 'soda', 5000, 68, 'bottles', 1, NULL);

-- --------------------------------------------------------

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`created_at`, `updated_at`, `deleted_at`, `username`, `password`, `firstname`, `lastname`, `phone`, `email`, `address`, `user_type`, `staff_title`, `identity_card_number`, `identity_card_type`, `nationality`, `access_rights`, `created_by`) VALUES
('2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 'lenon', 'lenon', 'Aaron', 'Lenon', '+256706123303', 'aaronlenon@gmail.com', 'London', 'staff', 'footballer', 'SOME-ID-NuMBER', 'EMPLOYEE_ID', 'Ugandan', 256, NULL),
( '2021-12-21 00:00:00.000', '2021-12-21 00:00:00.000', NULL, 'opio', 'opio', 'Opio', 'Daniel', '+256781224508', 'opidaniel@anymail.com', 'Gulu', 'customer', NULL, 'CM00889880000TFW', 'NATIONAL_ID', 'Ugandan', 213, NULL),
( '2021-12-23 00:00:00.000', '2021-12-23 00:00:00.000', NULL, 'brianmcdizo', 'brian', 'Brian', 'McDizo', '+256706123304', 'brianmcdizo@gmail.com', 'Kampala', 'supplier', 'supplier', 'SOME-ID-NUMBER', 'NATIONAL_ID', 'Ugandan', 256, NULL),
( '2021-12-23 21:01:05.763', '2021-12-23 21:01:05.763', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL),
( '2021-12-23 21:07:17.923', '2021-12-23 21:07:17.923', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL),
( '2021-12-23 21:09:05.327', '2021-12-23 21:09:05.327', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL),
( '2021-12-23 21:30:08.243', '2021-12-23 21:30:08.243', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 21:36:28.910', '2021-12-23 21:36:28.910', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 21:44:58.768', '2021-12-23 21:44:58.768', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
('2021-12-23 22:00:19.489', '2021-12-23 22:00:19.489', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:27:04.120', '2021-12-23 22:27:04.120', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:30:45.188', '2021-12-23 22:30:45.188', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:32:36.982', '2021-12-23 22:32:36.982', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:38:24.251', '2021-12-23 22:38:24.251', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:53:02.501', '2021-12-23 22:53:02.501', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 22:54:46.384', '2021-12-23 22:54:46.384', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL),
( '2021-12-23 23:03:31.293', '2021-12-23 23:03:31.293', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL),
( '2021-12-23 23:07:12.866', '2021-12-23 23:07:12.866', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL),
( '2021-12-24 08:48:54.210', '2021-12-24 08:48:54.210', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL);

-- --------------------------------------------------------


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
