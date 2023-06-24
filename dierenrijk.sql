-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2023 at 07:44 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dierenrijk`
--

-- --------------------------------------------------------

--
-- Table structure for table `dier`
--

CREATE TABLE `dier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dier`
--

INSERT INTO `dier` (`id`, `user_id`, `name`, `description`) VALUES
(2, 2, 'Giraf', 'Giraf is erg lang'),
(5, 1, 'dsds', 'dccdc'),
(6, 2, 'dcdc', 'wewer'),
(8, NULL, 'fucj 2', 'fuck2'),
(10, 1, 'zX', 'ZX'),
(11, 1, 'fuck', 'fuck de alles'),
(12, 1, 'kieker', 'kieker'),
(13, NULL, 'huh', 'jiji');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230621074215', '2023-06-21 09:42:38', 612),
('DoctrineMigrations\\Version20230621074429', '2023-06-21 09:44:50', 138),
('DoctrineMigrations\\Version20230621093302', '2023-06-21 11:33:08', 1140);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `part` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `fname`, `part`) VALUES
(1, 'pleun@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$OxRC90W0/JfZw5P57YUshuiOKYbMioeKkLO9SS9eJc.7AEcOnJh92', 'Pleun', 'PleunDieren\r\n'),
(2, 'harun@gmail.com', '[\"ROLE_ADMIN\"]', ' $2y$13$4x9eUCo5F7kNAVAOK8ZdO.1UcEC1XL99oEHNw/eUhxkqKYKMW8rhS', 'Harun', 'Het deel van Harun'),
(3, 'alex@gmail.com', '[\"ROLE_MEMBER\"]', '$2y$13$B5/uhTxJPv1Uhf.1j1ORUeC540IRZsm.DtrPQGG4ANtMR9wUm9MaG', 'Alex', NULL),
(4, 'sanne@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Vua08Vbgg.0dJ7NesBgPk.qODKvvfqeG61O3aRxtK62mfpZ0A9W6u', 'Sanne', 'Sannetje');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dier`
--
ALTER TABLE `dier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7487C015A76ED395` (`user_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dier`
--
ALTER TABLE `dier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dier`
--
ALTER TABLE `dier`
  ADD CONSTRAINT `FK_7487C015A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
