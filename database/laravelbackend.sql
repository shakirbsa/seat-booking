-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 05:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelbackend`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_26_172546_create_seats_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_number` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `is_booked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `row_number`, `seat_number`, `is_booked`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:31'),
(2, 1, 2, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:50'),
(3, 1, 3, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:50'),
(4, 1, 4, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:50'),
(5, 1, 5, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:50'),
(6, 1, 6, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:50'),
(7, 1, 7, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:11'),
(8, 2, 1, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(9, 2, 2, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(10, 2, 3, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(11, 2, 4, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(12, 2, 5, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(13, 2, 6, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(14, 2, 7, 1, '2024-11-27 02:28:30', '2024-11-27 10:09:40'),
(15, 3, 1, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:04'),
(16, 3, 2, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:04'),
(17, 3, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(18, 3, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(19, 3, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(20, 3, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(21, 3, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(22, 4, 1, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(23, 4, 2, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(24, 4, 3, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(25, 4, 4, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(26, 4, 5, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(27, 4, 6, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(28, 4, 7, 1, '2024-11-27 02:28:30', '2024-11-27 10:10:18'),
(29, 5, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(30, 5, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(31, 5, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(32, 5, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(33, 5, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(34, 5, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(35, 5, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(36, 6, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(37, 6, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(38, 6, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(39, 6, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(40, 6, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(41, 6, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(42, 6, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(43, 7, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(44, 7, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(45, 7, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(46, 7, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(47, 7, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(48, 7, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(49, 7, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(50, 8, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(51, 8, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(52, 8, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(53, 8, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(54, 8, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(55, 8, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(56, 8, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(57, 9, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(58, 9, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(59, 9, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(60, 9, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(61, 9, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(62, 9, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(63, 9, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(64, 10, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(65, 10, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(66, 10, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(67, 10, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(68, 10, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(69, 10, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(70, 10, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(71, 11, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(72, 11, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(73, 11, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(74, 11, 4, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(75, 11, 5, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(76, 11, 6, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(77, 11, 7, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(78, 12, 1, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(79, 12, 2, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07'),
(80, 12, 3, 0, '2024-11-27 02:28:30', '2024-11-27 10:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
