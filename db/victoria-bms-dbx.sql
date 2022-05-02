-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 05, 2022 at 08:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

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
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoices` varchar(200) DEFAULT 'none',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `created_at`, `updated_at`, `deleted_at`, `amount`, `status`, `customer_id`, `invoices`, `created_by`) VALUES
(2, '2021-12-23 18:06:25.598', '2021-12-23 18:06:25.598', NULL, 510000, 'paid', NULL, 'none', 1),
(3, '2021-12-23 18:09:56.143', '2021-12-23 18:09:56.143', NULL, 510000, 'paid', NULL, 'none', 1),
(4, '2021-12-23 23:03:31.248', '2021-12-23 23:03:31.393', NULL, 1520000, 'paid', 17, 'none', 1),
(5, '2021-12-23 23:07:12.832', '2021-12-23 23:07:12.944', NULL, 1520000, 'paid', 18, 'none', 1),
(6, '2021-12-24 08:48:54.088', '2021-12-24 08:48:54.388', NULL, 1520000, 'paid', 19, 'none', 1),
(7, '2021-12-24 09:21:50.256', '2021-12-24 09:21:50.256', NULL, 40000, 'paid', 2, 'none', 1),
(8, '2021-12-24 09:25:06.786', '2021-12-24 09:25:06.786', NULL, 40000, 'paid', 2, 'none', 1),
(9, '2021-12-24 09:32:01.614', '2021-12-24 09:32:01.614', NULL, 40000, 'paid', 2, 'none', 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL,
  `spent_on` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `created_at`, `updated_at`, `deleted_at`, `amount`, `spent_on`, `description`, `created_by`) VALUES
(1, '2021-12-24 09:41:46.840', '2021-12-24 09:41:46.840', NULL, 12000, 'petty-cash', 'some upkeep for the manager while in a trip', 1),
(2, '2021-12-24 09:45:47.894', '2021-12-24 09:45:47.894', NULL, 12000, 'transport', 'travelled to Nairobi', 1),
(3, '2021-12-29 23:56:53.777', '2021-12-29 23:56:53.777', NULL, 35000, 'offloading purchases', 'Hired some casual offloaders to offload purchases', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `created_at`, `updated_at`, `deleted_at`, `amount`, `status`, `customer_id`, `bill_id`, `created_by`) VALUES
(2, '2021-12-23 17:36:05.927', '2021-12-23 17:36:05.927', NULL, 750000, 'paid', NULL, 0, 1),
(3, '2021-12-23 17:54:07.129', '2021-12-23 17:54:07.129', NULL, 750000, 'paid', NULL, 0, 1),
(4, '2021-12-23 20:49:58.146', '2021-12-23 20:49:58.146', NULL, 550000, 'paid', NULL, 0, 1),
(8, '2021-12-23 21:44:58.656', '2021-12-23 21:44:58.970', NULL, 1650000, 'paid', 7, 0, 1),
(9, '2021-12-23 22:00:19.379', '2021-12-23 22:00:19.523', NULL, 1650000, 'paid', 10, 0, 1),
(10, '2021-12-23 22:27:04.009', '2021-12-23 22:27:04.220', NULL, 1650000, 'paid', 11, 0, 1),
(11, '2021-12-23 22:30:45.074', '2021-12-23 22:30:45.241', NULL, 1650000, 'paid', 12, 0, 1),
(12, '2021-12-23 22:32:36.824', '2021-12-23 22:32:37.071', NULL, 1650000, 'paid', 13, 0, 1),
(13, '2021-12-23 22:38:24.140', '2021-12-23 22:38:24.351', NULL, 1650000, 'paid', 14, 0, 1),
(14, '2021-12-23 22:53:02.468', '2021-12-23 22:53:02.615', NULL, 1650000, 'paid', 15, 0, 1),
(15, '2021-12-23 22:54:46.329', '2021-12-23 22:54:46.574', NULL, 1650000, 'paid', 16, 0, 1),
(16, '2021-12-24 09:16:59.182', '2021-12-24 09:16:59.182', NULL, 300000, 'paid', 19, 0, 1),
(17, '2021-12-29 18:20:35.942', '2021-12-29 18:20:35.942', NULL, 0, 'paid', 2, 0, 1),
(18, '2021-12-29 18:35:28.436', '2021-12-29 18:35:28.436', NULL, 2200000, 'paid', 2, 0, 1),
(19, '2021-12-29 19:55:36.447', '2021-12-29 19:55:36.447', NULL, 160000, 'paid', 2, 0, 1),
(20, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 0, 'paid', 2, 0, 1),
(21, '2021-12-29 20:56:31.997', '2021-12-29 20:56:31.997', NULL, 75000, 'paid', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_or_bookings`
--

CREATE TABLE `order_or_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `item` varchar(8) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT 0,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_or_bookings`
--

INSERT INTO `order_or_bookings` (`id`, `created_at`, `updated_at`, `deleted_at`, `item`, `item_id`, `quantity`, `status`, `paid`, `customer_id`, `visit_id`, `invoice_id`, `bill_id`, `created_by`) VALUES
(1, '2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 'product', 1, 2, 'pending', 1, 2, NULL, NULL, NULL, 1),
(4, '2021-12-23 15:31:34.701', '2021-12-23 15:31:34.701', NULL, 'product', 2, 0, 'served', 1, NULL, NULL, NULL, NULL, 0),
(5, '2021-12-23 16:01:43.648', '2021-12-23 16:01:43.648', NULL, 'product', 2, 3, 'served', 1, NULL, NULL, NULL, NULL, 0),
(6, '2021-12-23 16:43:14.284', '2021-12-23 16:43:14.284', NULL, 'product', 2, 3, 'served', 1, NULL, NULL, NULL, NULL, 1),
(7, '2021-12-23 17:36:05.928', '2021-12-23 17:36:05.928', NULL, 'service', 2, 1, 'served', 0, NULL, NULL, 2, NULL, 0),
(8, '2021-12-23 17:36:05.928', '2021-12-23 17:36:05.928', NULL, 'package', 2, 1, 'served', 0, NULL, NULL, 2, NULL, 0),
(9, '2021-12-23 17:36:05.928', '2021-12-23 17:36:05.928', NULL, 'product', 1, 3, 'served', 0, NULL, NULL, 2, NULL, 0),
(10, '2021-12-23 17:54:07.131', '2021-12-23 17:54:07.131', NULL, 'service', 2, 1, 'served', 1, NULL, NULL, 3, NULL, 1),
(11, '2021-12-23 17:54:07.131', '2021-12-23 17:54:07.131', NULL, 'package', 2, 1, 'served', 1, NULL, NULL, 3, NULL, 1),
(12, '2021-12-23 17:54:07.131', '2021-12-23 17:54:07.131', NULL, 'product', 1, 3, 'served', 1, NULL, NULL, 3, NULL, 1),
(13, '2021-12-23 18:06:25.600', '2021-12-23 18:06:25.600', NULL, 'product', 2, 0, 'billed', 1, NULL, NULL, NULL, 2, 1),
(14, '2021-12-23 18:06:25.600', '2021-12-23 18:06:25.600', NULL, 'package', 2, 0, 'billed', 1, NULL, NULL, NULL, 2, 1),
(15, '2021-12-23 18:06:25.600', '2021-12-23 18:06:25.600', NULL, 'product', 1, 0, 'billed', 1, NULL, NULL, NULL, 2, 1),
(16, '2021-12-23 18:09:56.145', '2021-12-23 18:09:56.145', NULL, 'product', 2, 2, 'billed', 1, NULL, NULL, NULL, 3, 1),
(17, '2021-12-23 18:09:56.145', '2021-12-23 18:09:56.145', NULL, 'package', 2, 1, 'billed', 1, NULL, NULL, NULL, 3, 1),
(18, '2021-12-23 18:09:56.145', '2021-12-23 18:09:56.145', NULL, 'product', 1, 1, 'billed', 1, NULL, NULL, NULL, 3, 1),
(19, '2021-12-23 20:49:58.148', '2021-12-23 20:49:58.148', NULL, 'service', 2, 1, 'served', 1, NULL, NULL, 4, NULL, 1),
(20, '2021-12-23 20:49:58.148', '2021-12-23 20:49:58.148', NULL, 'package', 2, 1, 'served', 1, NULL, NULL, 4, NULL, 1),
(21, '2021-12-23 20:49:58.148', '2021-12-23 20:49:58.148', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 4, NULL, 1),
(22, '2021-12-23 20:51:22.344', '2021-12-23 20:51:22.344', NULL, '', 0, 0, '', 1, NULL, NULL, NULL, NULL, 1),
(27, '2021-12-23 21:09:05.294', '2021-12-23 21:09:05.294', NULL, 'product', 2, 2, 'served', 1, NULL, NULL, NULL, NULL, 1),
(37, '2021-12-23 21:44:58.658', '2021-12-23 21:44:58.658', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 8, NULL, 1),
(38, '2021-12-23 21:44:58.658', '2021-12-23 21:44:58.658', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 8, NULL, 1),
(39, '2021-12-23 21:44:58.658', '2021-12-23 21:44:58.658', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 8, NULL, 1),
(40, '2021-12-23 22:00:19.380', '2021-12-23 22:00:19.380', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 9, NULL, 1),
(41, '2021-12-23 22:00:19.380', '2021-12-23 22:00:19.380', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 9, NULL, 1),
(42, '2021-12-23 22:00:19.380', '2021-12-23 22:00:19.380', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 9, NULL, 1),
(43, '2021-12-23 22:27:04.013', '2021-12-23 22:27:04.013', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 10, NULL, 1),
(44, '2021-12-23 22:27:04.013', '2021-12-23 22:27:04.013', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 10, NULL, 1),
(45, '2021-12-23 22:27:04.013', '2021-12-23 22:27:04.013', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 10, NULL, 1),
(46, '2021-12-23 22:30:45.075', '2021-12-23 22:30:45.075', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 11, NULL, 1),
(47, '2021-12-23 22:30:45.075', '2021-12-23 22:30:45.075', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 11, NULL, 1),
(48, '2021-12-23 22:30:45.075', '2021-12-23 22:30:45.075', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 11, NULL, 1),
(49, '2021-12-23 22:32:36.825', '2021-12-23 22:32:36.825', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 12, NULL, 1),
(50, '2021-12-23 22:32:36.825', '2021-12-23 22:32:36.825', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 12, NULL, 1),
(51, '2021-12-23 22:32:36.825', '2021-12-23 22:32:36.825', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 12, NULL, 1),
(52, '2021-12-23 22:38:24.142', '2021-12-23 22:38:24.142', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 13, NULL, 1),
(53, '2021-12-23 22:38:24.142', '2021-12-23 22:38:24.142', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 13, NULL, 1),
(54, '2021-12-23 22:38:24.142', '2021-12-23 22:38:24.142', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 13, NULL, 1),
(55, '2021-12-23 22:53:02.469', '2021-12-23 22:53:02.469', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 14, NULL, 1),
(56, '2021-12-23 22:53:02.469', '2021-12-23 22:53:02.469', NULL, 'product', 2, 10, 'served', 1, NULL, NULL, 14, NULL, 1),
(57, '2021-12-23 22:53:02.469', '2021-12-23 22:53:02.469', NULL, 'product', 1, 1, 'served', 1, NULL, NULL, 14, NULL, 1),
(58, '2021-12-23 22:54:46.330', '2021-12-23 22:54:46.330', NULL, 'service', 1, 1, 'served', 1, 16, NULL, 15, NULL, 1),
(59, '2021-12-23 22:54:46.330', '2021-12-23 22:54:46.330', NULL, 'product', 2, 10, 'served', 1, 16, NULL, 15, NULL, 1),
(60, '2021-12-23 22:54:46.330', '2021-12-23 22:54:46.330', NULL, 'product', 1, 1, 'served', 1, 16, NULL, 15, NULL, 1),
(61, '2021-12-23 23:03:31.250', '2021-12-23 23:03:31.250', NULL, 'service', 1, 1, 'billed', 1, NULL, NULL, NULL, 4, 1),
(62, '2021-12-23 23:03:31.250', '2021-12-23 23:03:31.250', NULL, 'product', 2, 4, 'billed', 1, NULL, NULL, NULL, 4, 1),
(63, '2021-12-23 23:07:12.834', '2021-12-23 23:07:12.834', NULL, 'service', 1, 1, 'billed', 1, 18, NULL, NULL, 5, 1),
(64, '2021-12-23 23:07:12.834', '2021-12-23 23:07:12.834', NULL, 'product', 2, 4, 'billed', 1, 18, NULL, NULL, 5, 1),
(65, '2021-12-24 08:48:54.113', '2021-12-24 08:48:54.113', NULL, 'service', 1, 1, 'billed', 1, 19, NULL, NULL, 6, 1),
(66, '2021-12-24 08:48:54.113', '2021-12-24 08:48:54.113', NULL, 'product', 2, 4, 'billed', 1, 19, NULL, NULL, 6, 1),
(67, '2021-12-24 08:55:19.000', '2021-12-24 08:55:19.000', NULL, 'product', 2, 4, 'served', 1, NULL, NULL, NULL, NULL, 1),
(68, '2021-12-24 08:59:41.510', '2021-12-24 08:59:41.510', NULL, 'product', 2, 4, 'served', 1, NULL, NULL, NULL, NULL, 1),
(69, '2021-12-24 09:11:31.709', '2021-12-24 09:11:31.709', NULL, 'product', 2, 4, 'served', 1, 2, NULL, NULL, NULL, 1),
(70, '2021-12-24 09:16:59.184', '2021-12-24 09:16:59.184', NULL, 'product', 1, 3, 'served', 1, 19, NULL, 16, NULL, 1),
(71, '2021-12-24 09:32:01.615', '2021-12-24 09:32:01.615', NULL, 'product', 2, 8, 'billed', 1, 2, NULL, NULL, 9, 1),
(72, '2021-12-29 18:20:35.943', '2021-12-29 18:20:35.943', NULL, 'product', 0, 0, 'served', 1, 2, NULL, 17, NULL, 1),
(73, '2021-12-29 18:35:28.437', '2021-12-29 18:35:28.437', NULL, 'product', 0, 4, 'served', 1, 2, NULL, 18, NULL, 1),
(74, '2021-12-29 19:55:36.447', '2021-12-29 19:55:36.447', NULL, 'product', 1, 2, 'served', 1, 2, NULL, 19, NULL, 1),
(75, '2021-12-29 19:55:36.447', '2021-12-29 19:55:36.447', NULL, 'product', 1, 1, 'served', 1, 2, NULL, 19, NULL, 1),
(76, '2021-12-29 19:55:36.447', '2021-12-29 19:55:36.447', NULL, 'service', 1, 1, 'served', 1, 2, NULL, 19, NULL, 1),
(77, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'service', 1, 1, 'served', 1, 2, NULL, 20, NULL, 1),
(78, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'product', 1, 0, 'pending', 1, 2, NULL, 20, NULL, 1),
(79, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'product', 1, 0, 'pending', 1, 2, NULL, 20, NULL, 1),
(80, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'product', 1, 0, 'pending', 1, 2, NULL, 20, NULL, 1),
(81, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'product', 1, 0, 'pending', 1, 2, NULL, 20, NULL, 1),
(82, '2021-12-29 20:50:50.376', '2021-12-29 20:50:50.376', NULL, 'product', 1, 0, 'pending', 1, 2, NULL, 20, NULL, 1),
(83, '2021-12-29 20:56:31.997', '2021-12-29 20:56:31.997', NULL, 'service', 1, 1, 'served', 1, NULL, NULL, 21, NULL, 1),
(84, '2021-12-29 20:56:31.997', '2021-12-29 20:56:31.997', NULL, 'product', 1, 5, 'served', 1, NULL, NULL, 21, NULL, 1),
(85, '2021-12-31 19:06:11.922', '2021-12-31 19:06:11.922', NULL, 'package', 1, 1, 'served', 0, 22, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT 1,
  `price` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `department` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `category`, `availability`, `price`, `created_by`, `department`) VALUES
(1, '2021-12-23 05:00:00.000', '2021-12-23 05:00:00.000', NULL, 'Classic', 'executive', 1, 1500000, NULL, NULL),
(2, '2021-12-23 05:10:00.000', '2021-12-23 05:10:00.000', NULL, 'Simple', 'guests', 1, 400000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_products`
--

CREATE TABLE `package_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_products`
--

INSERT INTO `package_products` (`id`, `created_at`, `updated_at`, `deleted_at`, `product_id`, `package_id`, `quantity`) VALUES
(1, '2021-12-23 14:16:10.000', '2021-12-23 14:16:10.000', NULL, 1, 1, 1),
(2, '2021-12-23 14:16:10.000', '2021-12-23 14:16:10.000', NULL, 2, 1, 1),
(3, '2021-12-23 14:16:10.000', '2021-12-23 14:16:10.000', NULL, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_services`
--

CREATE TABLE `package_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_services`
--

INSERT INTO `package_services` (`id`, `created_at`, `updated_at`, `deleted_at`, `service_id`, `package_id`, `quantity`) VALUES
(1, '2021-12-23 14:13:00.000', '2021-12-23 14:13:00.000', NULL, 1, 1, 1),
(2, '2021-12-23 14:13:00.000', '2021-12-23 14:13:00.000', NULL, 2, 1, 1),
(3, '2021-12-23 14:13:00.000', '2021-12-23 14:13:00.000', NULL, 3, 1, 1),
(4, '2021-12-23 14:13:00.000', '2021-12-23 14:13:00.000', NULL, 1, 2, 1),
(5, '2021-12-23 14:13:00.000', '2021-12-23 14:13:00.000', NULL, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL,
  `item` varchar(8) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `instalment` tinyint(1) DEFAULT 0,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `created_at`, `updated_at`, `deleted_at`, `amount`, `item`, `item_id`, `instalment`, `customer_id`, `created_by`) VALUES
(2, '2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 40000, 'order', 1, 0, 2, 1),
(7, '2021-12-23 16:43:14.335', '2021-12-23 16:43:14.335', NULL, 15000, 'order', 6, 0, 4, 1),
(10, '2021-12-23 17:54:07.341', '2021-12-23 17:54:07.341', NULL, 750000, 'invoice', 3, 0, NULL, 1),
(11, '2021-12-23 18:03:24.342', '2021-12-23 18:03:24.342', NULL, 510000, 'bill', 0, 0, NULL, 1),
(12, '2021-12-23 18:06:25.658', '2021-12-23 18:06:25.658', NULL, 510000, 'bill', 2, 0, NULL, 1),
(13, '2021-12-23 18:09:56.265', '2021-12-23 18:09:56.265', NULL, 510000, 'bill', 3, 0, NULL, 1),
(14, '2021-12-23 20:49:58.213', '2021-12-23 20:49:58.213', NULL, 550000, 'invoice', 4, 0, NULL, 1),
(15, '2021-12-23 20:51:22.394', '2021-12-23 20:51:22.394', NULL, 550000, 'invoice', 22, 0, NULL, 1),
(17, '2021-12-23 21:01:05.764', '2021-12-23 21:01:05.764', NULL, 10000, 'order', 0, 0, 4, 1),
(18, '2021-12-23 21:07:17.925', '2021-12-23 21:07:17.925', NULL, 10000, 'order', 0, 0, 5, 1),
(19, '2021-12-23 21:09:05.328', '2021-12-23 21:09:05.328', NULL, 10000, 'order', 27, 0, 6, 1),
(20, '2021-12-23 21:30:08.244', '2021-12-23 21:30:08.244', NULL, 1650000, 'invoice', 0, 0, 7, 1),
(21, '2021-12-23 21:36:28.916', '2021-12-23 21:36:28.916', NULL, 1650000, 'invoice', 7, 0, 8, 1),
(22, '2021-12-23 21:44:58.770', '2021-12-23 21:44:58.770', NULL, 1650000, 'invoice', 8, 0, 9, 1),
(23, '2021-12-23 22:00:19.492', '2021-12-23 22:00:19.492', NULL, 1650000, 'invoice', 9, 0, 10, 1),
(24, '2021-12-23 22:27:04.121', '2021-12-23 22:27:04.121', NULL, 1650000, 'invoice', 10, 0, 11, 1),
(25, '2021-12-23 22:30:45.190', '2021-12-23 22:30:45.190', NULL, 1650000, 'invoice', 11, 0, 12, 1),
(26, '2021-12-23 22:32:36.990', '2021-12-23 22:32:36.990', NULL, 1650000, 'invoice', 12, 0, 13, 1),
(27, '2021-12-23 22:38:24.252', '2021-12-23 22:38:24.252', NULL, 1650000, 'invoice', 13, 0, 14, 1),
(28, '2021-12-23 22:53:02.502', '2021-12-23 22:53:02.502', NULL, 1650000, 'invoice', 14, 0, 15, 1),
(29, '2021-12-23 22:54:46.385', '2021-12-23 22:54:46.385', NULL, 1650000, 'invoice', 15, 0, 16, 1),
(30, '2021-12-23 23:03:31.294', '2021-12-23 23:03:31.294', NULL, 1520000, 'bill', 4, 0, 17, 1),
(31, '2021-12-23 23:07:12.867', '2021-12-23 23:07:12.867', NULL, 1520000, 'bill', 5, 0, 18, 1),
(32, '2021-12-23 23:27:08.964', '2021-12-23 23:27:08.964', NULL, 200000, 'order', 1, 0, 2, 1),
(33, '2021-12-24 00:02:55.850', '2021-12-24 00:02:55.850', NULL, 200000, 'order', 1, 0, 2, 1),
(34, '2021-12-24 08:48:54.238', '2021-12-24 08:48:54.238', NULL, 1520000, 'bill', 6, 0, 19, 1),
(35, '2021-12-24 08:55:19.064', '2021-12-24 08:55:19.064', NULL, 20000, 'order', 67, 0, 2, 0),
(36, '2021-12-24 08:59:41.575', '2021-12-24 08:59:41.575', NULL, 20000, 'order', 68, 0, 2, 1),
(37, '2021-12-24 09:11:31.822', '2021-12-24 09:11:31.822', NULL, 20000, 'order', 69, 0, 2, 1),
(38, '2021-12-24 09:16:59.238', '2021-12-24 09:16:59.238', NULL, 300000, 'invoice', 16, 0, 19, 1),
(39, '2021-12-24 09:21:50.318', '2021-12-24 09:21:50.318', NULL, 40000, 'bill', 7, 0, 2, 1),
(40, '2021-12-24 09:25:07.014', '2021-12-24 09:25:07.014', NULL, 40000, 'bill', 8, 0, 2, 1),
(41, '2021-12-24 09:32:01.895', '2021-12-24 09:32:01.895', NULL, 40000, 'bill', 9, 0, 2, 1),
(43, '2021-12-29 18:35:28.489', '2021-12-29 18:35:28.489', NULL, 2200000, 'invoice', 18, 0, 2, 1),
(44, '2021-12-29 19:55:36.603', '2021-12-29 19:55:36.603', NULL, 160000, 'invoice', 19, 0, 2, 1),
(46, '2021-12-29 20:56:32.030', '2021-12-29 20:56:32.030', NULL, 75000, 'invoice', 21, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `price` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity_units` varchar(20) DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `department` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `category`, `brand`, `type`, `price`, `quantity`, `quantity_units`, `supplier_id`, `created_by`, `department`) VALUES
(1, '2021-12-31 20:44:01.000', '2021-12-31 00:00:00.000', NULL, 'coke soda\r\n', 'softdrink', 'cocacola', 'soda', 100000, NULL, 'crates', NULL, NULL, NULL),
(5, '2021-12-31 00:00:00.000', '2021-12-31 00:00:00.000', NULL, 'fanta', 'softdrink', 'cocacola', 'soda', 5000, NULL, 'bottles', NULL, NULL, NULL),
(8, '2021-12-31 00:00:00.000', NULL, NULL, 'stoney', 'softdrink', 'cocacola', 'soda', 3000, NULL, 'bottles', NULL, NULL, NULL),
(9, '2021-12-31 00:00:00.000', NULL, NULL, 'sprite', 'soft drink', 'cocacola', 'soda', 3000, NULL, 'bottles', NULL, NULL, NULL),
(12, '2021-12-31 00:00:00.000', NULL, NULL, 'tonic', 'softdrink', 'cocacola', 'soda', 3000, NULL, 'bottles', NULL, NULL, NULL),
(13, '2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 'Cocacola soda', 'drinks', 'cocacola', 'soda', 100000, 60, 'crates', 3, NULL, NULL),
(14, '2021-12-03 00:00:00.000', '2021-12-19 00:00:00.000', NULL, 'Cocacola soda', 'drinks', 'cocacola', 'soda', 5000, 68, 'bottles', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT 1,
  `price` bigint(20) UNSIGNED DEFAULT NULL,
  `service_provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `department` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `category`, `availability`, `price`, `service_provider_id`, `created_by`, `department`) VALUES
(1, '2021-12-12 23:00:00.000', '2021-12-12 23:00:00.000', NULL, 'Massage per hour per Guest', 'in-house', 1, 50000, 1, NULL, NULL),
(2, '2021-12-12 23:03:00.000', '2021-12-12 23:03:00.000', NULL, 'Sauna/Steam per half hour per guest', 'in-house', 1, 20000, 1, NULL, NULL),
(3, '2021-12-12 23:00:00.000', '2021-12-12 23:00:00.000', NULL, 'Swimming per adult (Non resident)', 'in-house', 1, 20000, 1, NULL, NULL),
(4, '2021-12-12 23:04:00.000', '2021-12-12 23:04:00.000', NULL, 'Swimming per Child (Non resident)', 'in-house', 1, 10000, 1, NULL, NULL),
(5, NULL, NULL, NULL, 'Swimming', 'Health Club', 1, 20000, NULL, NULL, NULL),
(6, NULL, NULL, NULL, 'Swimming', 'Health Club', 1, 20000, NULL, NULL, NULL),
(7, NULL, NULL, NULL, 'Swimming', 'Health Club', 1, 20000, NULL, NULL, NULL),
(8, NULL, NULL, NULL, 'Steam bath', 'Health Club', 1, 25000, NULL, NULL, NULL),
(9, NULL, NULL, NULL, 'Steam bath', 'Health Club', 1, 25000, NULL, NULL, NULL),
(10, NULL, NULL, NULL, 'forest walk', 'Health Club', 1, 30000, NULL, NULL, NULL),
(11, NULL, NULL, NULL, 'forest walk', 'Health Club', 1, 30000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `transaction` varchar(8) DEFAULT NULL,
  `product_category` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `new_quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `returned` tinyint(1) DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_transactions`
--

INSERT INTO `stock_transactions` (`id`, `created_at`, `updated_at`, `deleted_at`, `transaction`, `product_category`, `product_id`, `old_quantity`, `quantity`, `new_quantity`, `returned`, `created_by`, `amount`) VALUES
(2, '2021-12-24 10:22:55.665', '2021-12-24 10:22:55.665', NULL, 'add', 'drinks (cocacola soda)', 2, 63, 5, 68, 0, 1, NULL),
(3, '2021-12-24 10:04:39.000', '2021-12-24 10:04:39.000', NULL, 'remove', 'drinks (cocacola soda)', 2, 50, 4, 46, 0, 1, 20000),
(4, '2021-12-24 10:04:39.000', '2021-12-24 10:04:39.000', NULL, 'remove', 'drinks (cocacola soda)', 1, 30, 10, 20, 0, 1, 1000000),
(5, '2021-12-24 10:05:39.000', '2021-12-24 10:05:39.000', NULL, 'add', 'drinks (cocacola soda)', 1, 40, 2, 42, 0, 1, 300000),
(6, '2021-12-25 14:16:10.000', '2021-12-25 14:16:10.000', NULL, 'remove', 'drinks (cocacola soda)', 2, 51, 6, 45, 0, 1, 30000),
(7, '2021-12-25 15:16:10.000', '2021-12-25 15:16:10.000', NULL, 'add', 'drinks (cocacola soda)', 2, 45, 2, 47, 0, 1, 7000),
(8, '2021-12-30 16:51:58.302', '2021-12-30 16:51:58.302', NULL, 'add', 'drinks', 1, 58, 2, 60, 0, 1, 160000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT 'customer',
  `staff_title` varchar(20) DEFAULT NULL,
  `identity_card_number` varchar(20) DEFAULT NULL,
  `identity_card_type` varchar(191) DEFAULT 'EMPLOYEE_ID',
  `nationality` varchar(50) DEFAULT NULL,
  `access_rights` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_picture` varchar(150) DEFAULT 'xxxxx'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`, `firstname`, `lastname`, `phone`, `email`, `address`, `user_type`, `staff_title`, `identity_card_number`, `identity_card_type`, `nationality`, `access_rights`, `created_by`, `profile_picture`) VALUES
(1, '2021-12-31 00:00:00.000', '2021-12-31 00:00:00.000', NULL, 'Jayson', 'Golden88', 'Kabagambe', 'Jackson', '256770444046', 'jacksonkay56@gmail.com', NULL, 'staff', 'System Admin', NULL, 'EMPLOYEE_ID', 'Uganda', 514, 1, 'xxxxx'),
(3, '2021-11-03 00:00:00.000', '2021-11-19 00:00:00.000', NULL, 'lenon', 'lenon', 'Aaron', 'Lenon', '+256706123303', 'aaronlenon@gmail.com', 'London', 'staff', 'footballer', 'SOME-ID-NuMBER', 'EMPLOYEE_ID', 'Ugandan', 256, NULL, 'xxxxx'),
(4, '2021-12-21 00:00:00.000', '2021-12-21 00:00:00.000', NULL, 'opio', 'opio', 'Opio', 'Daniel', '+256781224508', 'opidaniel@anymail.com', 'Gulu', 'customer', NULL, 'CM00889880000TFW', 'NATIONAL_ID', 'Ugandan', 213, NULL, 'xxxxx'),
(5, '2021-12-23 00:00:00.000', '2021-12-23 00:00:00.000', NULL, 'brianmcdizo', 'brian', 'Brian', 'McDizo', '+256706123304', 'brianmcdizo@gmail.com', 'Kampala', 'supplier', 'supplier', 'SOME-ID-NUMBER', 'NATIONAL_ID', 'Ugandan', 256, NULL, 'xxxxx'),
(6, '2021-12-23 21:01:05.763', '2021-12-23 21:01:05.763', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL, 'xxxxx'),
(7, '2021-12-23 21:07:17.923', '2021-12-23 21:07:17.923', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL, 'xxxxx'),
(8, '2021-12-23 21:09:05.327', '2021-12-23 21:09:05.327', NULL, 'robertgreen', 'robert', 'Robert', 'Green', '+256781224508', 'robertgreen@gmail.com', 'Accra', 'customer', '', 'SOME478487474789', 'NATIONAL_ID', 'Ghanian', 234, NULL, 'xxxxx'),
(9, '2021-12-23 21:30:08.243', '2021-12-23 21:30:08.243', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(10, '2021-12-23 21:36:28.910', '2021-12-23 21:36:28.910', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(11, '2021-12-23 21:44:58.768', '2021-12-23 21:44:58.768', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(12, '2021-12-23 22:00:19.489', '2021-12-23 22:00:19.489', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(13, '2021-12-23 22:27:04.120', '2021-12-23 22:27:04.120', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(14, '2021-12-23 22:30:45.188', '2021-12-23 22:30:45.188', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(15, '2021-12-23 22:32:36.982', '2021-12-23 22:32:36.982', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(16, '2021-12-23 22:38:24.251', '2021-12-23 22:38:24.251', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(17, '2021-12-23 22:53:02.501', '2021-12-23 22:53:02.501', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(18, '2021-12-23 22:54:46.384', '2021-12-23 22:54:46.384', NULL, 'tomsimbwa@gmail.com', 'tom', 'Tom', 'Simbwa', '+256781224509', 'tomsimbwa@gmail.com', 'Jinja', 'customer', '', 'SOME478487477849', 'NATIONAL_ID', 'Ugandan', 434, NULL, 'xxxxx'),
(19, '2021-12-23 23:03:31.293', '2021-12-23 23:03:31.293', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL, 'xxxxx'),
(20, '2021-12-23 23:07:12.866', '2021-12-23 23:07:12.866', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL, 'xxxxx'),
(21, '2021-12-24 08:48:54.210', '2021-12-24 08:48:54.210', NULL, 'lllian', 'lillian', 'Lillian', 'Bata', '+256781224510', 'lillianbata@gmail.com', 'Mukono', 'customer', '', 'SOME4784876885030', 'NATIONAL_ID', 'Ugandan', 421, NULL, 'xxxxx'),
(22, '2021-12-31 19:06:11.921', '2021-12-31 19:06:11.921', NULL, '', '', '', '', '', '', '', 'guest', '', '', 'EMPLOYEE_ID', '', 0, 0, 'xxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `user_actions`
--

CREATE TABLE `user_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `action_number` varchar(16) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `on_entity` varchar(20) DEFAULT NULL,
  `specific_entity` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_actions`
--

INSERT INTO `user_actions` (`id`, `created_at`, `updated_at`, `deleted_at`, `action_number`, `user_id`, `description`, `on_entity`, `specific_entity`) VALUES
(3, '2021-12-23 15:31:34.815', '2021-12-23 15:31:34.815', NULL, 'ACN0002/', NULL, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: product'),
(4, '2021-12-23 16:01:43.850', '2021-12-23 16:01:43.850', NULL, 'ACN0002/', NULL, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: product'),
(5, '2021-12-23 16:43:14.437', '2021-12-23 16:43:14.437', NULL, 'ACN0002/5', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: product'),
(6, '2021-12-23 17:31:17.722', '2021-12-23 17:31:17.722', NULL, 'ACN0002/6', NULL, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=0)'),
(7, '2021-12-23 17:36:06.362', '2021-12-23 17:36:06.362', NULL, 'ACN0002/6', NULL, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=2)'),
(8, '2021-12-23 17:54:07.452', '2021-12-23 17:54:07.452', NULL, 'ACN0002/6', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=3)'),
(9, '2021-12-23 18:03:24.386', '2021-12-23 18:03:24.386', NULL, 'ACN0002/7', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=0)'),
(10, '2021-12-23 18:06:25.781', '2021-12-23 18:06:25.781', NULL, 'ACN0002/7', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=2)'),
(11, '2021-12-23 18:09:56.410', '2021-12-23 18:09:56.410', NULL, 'ACN0002/7', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=3)'),
(12, '2021-12-23 20:49:58.324', '2021-12-23 20:49:58.324', NULL, 'ACN0002/6', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=4)'),
(13, '2021-12-23 20:51:22.427', '2021-12-23 20:51:22.427', NULL, 'ACN0002/5', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: '),
(14, '2021-12-23 20:56:22.569', '2021-12-23 20:56:22.569', NULL, 'ACN0002/8', 1, 'Payment received, customer was not registered, new customer info given, no new order by customer', 'Payment', 'New customer registered and paid advance for future orders: payment ID = %!s(uint=0)'),
(15, '2021-12-23 21:01:06.018', '2021-12-23 21:01:06.018', NULL, 'ACN0002/13', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=2) phone: +256781224508'),
(16, '2021-12-23 21:07:18.335', '2021-12-23 21:07:18.335', NULL, 'ACN0002/13', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=2) phone: +256781224508'),
(17, '2021-12-23 21:09:05.505', '2021-12-23 21:09:05.505', NULL, 'ACN0002/13', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=2) phone: +256781224508'),
(18, '2021-12-23 21:30:08.433', '2021-12-23 21:30:08.433', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=7) phone: +256781224509'),
(19, '2021-12-23 21:36:29.121', '2021-12-23 21:36:29.121', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=7) phone: +256781224509'),
(20, '2021-12-23 21:44:59.023', '2021-12-23 21:44:59.023', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=7) phone: +256781224509'),
(21, '2021-12-23 22:00:19.556', '2021-12-23 22:00:19.556', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=10) phone: +256781224509'),
(22, '2021-12-23 22:27:04.254', '2021-12-23 22:27:04.254', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=11) phone: +256781224509'),
(23, '2021-12-23 22:30:45.363', '2021-12-23 22:30:45.363', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=12) phone: +256781224509'),
(24, '2021-12-23 22:32:37.104', '2021-12-23 22:32:37.104', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=13) phone: +256781224509'),
(25, '2021-12-23 22:38:24.385', '2021-12-23 22:38:24.385', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=14) phone: +256781224509'),
(26, '2021-12-23 22:53:02.678', '2021-12-23 22:53:02.678', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=15) phone: +256781224509'),
(27, '2021-12-23 22:54:46.707', '2021-12-23 22:54:46.707', NULL, 'ACN0002/14', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=16) phone: +256781224509'),
(28, '2021-12-23 23:03:31.460', '2021-12-23 23:03:31.460', NULL, 'ACN0002/15', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=17) phone: +256781224510'),
(29, '2021-12-23 23:07:13.089', '2021-12-23 23:07:13.089', NULL, 'ACN0002/15', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=18) phone: +256781224510'),
(30, '2021-12-23 23:27:09.008', '2021-12-23 23:27:09.008', NULL, 'ACN0002/17', 1, 'Payment received, from registered customer, no new order by customer', 'Payment', 'Registered customer (id: %!s(uint=0)) paid for earlier order: %!s(uint=0) payment ID = %!s(uint=32)'),
(31, '2021-12-24 00:02:56.211', '2021-12-24 00:02:56.211', NULL, 'ACN0002/17', 1, 'Payment received, from registered customer, no new order by customer', 'Payment', 'Registered customer (id: %!s(uint=0)) paid for earlier order: %!s(uint=0) payment ID = %!s(uint=33)'),
(32, '2021-12-24 08:48:54.478', '2021-12-24 08:48:54.478', NULL, 'ACN0002/15', 1, 'Payment received, customer not registered, new customer info given, customer ordered for an item, it', 'Payment', 'Customer: %!s(uint=19) phone: +256781224510'),
(33, '2021-12-24 08:55:19.142', '2021-12-24 08:55:19.142', NULL, 'ACN0002/21', NULL, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2, Ordered: 67'),
(34, '2021-12-24 08:59:41.808', '2021-12-24 08:59:41.808', NULL, 'ACN0002/21', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2, Ordered: 68'),
(35, '2021-12-24 09:11:31.991', '2021-12-24 09:11:31.991', NULL, 'ACN0002/21', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2, Ordered: 69'),
(36, '2021-12-24 09:16:59.326', '2021-12-24 09:16:59.326', NULL, 'ACN0002/22', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: %!s(uint=19), Ordered: %!s(uint=16)'),
(37, '2021-12-24 09:21:50.385', '2021-12-24 09:21:50.385', NULL, 'ACN0002/23', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2 Ordered: 7'),
(38, '2021-12-24 09:25:07.180', '2021-12-24 09:25:07.180', NULL, 'ACN0002/23', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2 Ordered: 8'),
(39, '2021-12-24 09:32:01.925', '2021-12-24 09:32:01.925', NULL, 'ACN0002/23', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: 2 Ordered: 9'),
(40, '2021-12-24 10:03:39.632', '2021-12-24 10:03:39.632', NULL, 'ACN0003', 1, 'Stock transaction recorded', 'Stock transaction', 'Transation ID = %!s(uint=1), by: %!s(uint=1), add '),
(41, '2021-12-24 10:22:55.967', '2021-12-24 10:22:55.967', NULL, 'ACN0003', 1, 'Stock transaction recorded', 'Stock transaction', 'Transation ID = 2, by: 1, add drinks'),
(42, '2021-12-29 18:20:36.026', '2021-12-29 18:20:36.026', NULL, 'ACN0002/22', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: %!s(uint=2), Ordered: %!s(uint=17)'),
(43, '2021-12-29 18:35:28.522', '2021-12-29 18:35:28.522', NULL, 'ACN0002/22', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: %!s(uint=2), Ordered: %!s(uint=18)'),
(44, '2021-12-29 19:55:36.636', '2021-12-29 19:55:36.636', NULL, 'ACN0002/22', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: %!s(uint=2), Ordered: %!s(uint=19)'),
(45, '2021-12-29 20:50:50.538', '2021-12-29 20:50:50.538', NULL, 'ACN0002/22', 1, 'Payment received, customer is registered, new customer info not needed, customer ordered for an item', 'Payment', 'Customer: %!s(uint=2), Ordered: %!s(uint=20)'),
(46, '2021-12-29 20:56:32.064', '2021-12-29 20:56:32.064', NULL, 'ACN0002/6', 1, 'Payment received, customer not registered, new customer info not given, customer ordered for an item', 'Payment', 'Unregistered customer oredered and paid: %!s(uint=21)'),
(47, '2021-12-30 16:51:58.397', '2021-12-30 16:51:58.397', NULL, 'ACN0003', 1, 'Stock transaction recorded', 'Stock transaction', 'Transation ID = 8, by: 1, add drinks');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bills_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_bills` (`customer_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_departments_deleted_at` (`deleted_at`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_expenses_deleted_at` (`deleted_at`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_invoices_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_invoices` (`customer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_messages_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_messages` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_notifications` (`user_id`);

--
-- Indexes for table `order_or_bookings`
--
ALTER TABLE `order_or_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_or_bookings_deleted_at` (`deleted_at`),
  ADD KEY `fk_order_or_bookings_customer` (`customer_id`),
  ADD KEY `fk_order_or_bookings_visit` (`visit_id`),
  ADD KEY `fk_invoices_orders` (`invoice_id`),
  ADD KEY `fk_bills_orders` (`bill_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_packages_deleted_at` (`deleted_at`);

--
-- Indexes for table `package_products`
--
ALTER TABLE `package_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_package_products_deleted_at` (`deleted_at`);

--
-- Indexes for table `package_services`
--
ALTER TABLE `package_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_package_services_deleted_at` (`deleted_at`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payments_deleted_at` (`deleted_at`),
  ADD KEY `fk_payments_customer` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_deleted_at` (`deleted_at`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_services_deleted_at` (`deleted_at`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_stock_transactions_deleted_at` (`deleted_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`);

--
-- Indexes for table `user_actions`
--
ALTER TABLE `user_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_actions_deleted_at` (`deleted_at`),
  ADD KEY `fk_users_user_actions` (`user_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_visits_deleted_at` (`deleted_at`),
  ADD KEY `fk_visits_customer` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_or_bookings`
--
ALTER TABLE `order_or_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_products`
--
ALTER TABLE `package_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_services`
--
ALTER TABLE `package_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_actions`
--
ALTER TABLE `user_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_users_bills` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_users_invoices` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_users_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_users_notifications` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_or_bookings`
--
ALTER TABLE `order_or_bookings`
  ADD CONSTRAINT `fk_bills_orders` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `fk_invoices_orders` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_order_or_bookings_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_order_or_bookings_visit` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_actions`
--
ALTER TABLE `user_actions`
  ADD CONSTRAINT `fk_users_user_actions` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `fk_visits_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
