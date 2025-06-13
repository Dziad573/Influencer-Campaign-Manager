-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Cze 2025, 22:01
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `icm_bd`
--
CREATE DATABASE IF NOT EXISTS `icm_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `icm_bd`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaigns`
--

CREATE TABLE `campaigns` (
  `campaign_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `client` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(12,2) NOT NULL,
  `goal_description` text DEFAULT NULL,
  `status` enum('Planned','Ongoing','Completed','Cancelled') NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `name`, `client`, `start_date`, `end_date`, `budget`, `goal_description`, `status`, `description`) VALUES
(1, 'Kampania Lato', 'Coca-Cola', '2024-06-01', '2024-07-15', '10000.00', 'Promocja napojów na lato', 'Completed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'Jesienna Promocja', 'Nike', '2024-09-01', '2024-10-30', '20000.00', 'Nowa kolekcja butów sportowych', 'Ongoing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 'Świąteczne Rabaty', 'Allegro', '2024-12-01', '2024-12-24', '30000.00', 'Zwiększenie sprzedaży przed świętami', 'Completed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'Wiosenny Start', 'Samsung', '2025-03-01', '2025-04-15', '15000.00', 'Promocja nowych smartfonów', 'Cancelled', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(5, 'Wyprzedaż', 'Adidas', '2025-07-22', '2025-08-10', '35000.00', 'Stare kolekcje butów', 'Planned', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(6, 'Letnia Promocja', 'Firma', '2025-06-01', '2025-07-01', '15000.00', 'Zwiększenie widoczności', 'Planned', 'Kampania letnia dla młodych'),
(7, 'Wiosenne Inspiracje', 'BrandX', '2025-06-01', '2025-06-30', '50000.00', 'Zwiększenie rozpoznawalności', 'Ongoing', 'Kampania sezonowa na Instagramie'),
(8, 'Tech Showcase Q2', 'TechCorp', '2025-08-15', '2025-09-15', '75000.00', 'Prezentacja nowych gadżetów', 'Planned', 'Seria recenzji na YouTube'),
(9, 'Muzyczna Rewolucja', 'MusicLive', '2025-11-01', '2025-11-25', '60000.00', 'Promocja nowego albumu', 'Planned', 'Challenge na TikToku z tańcem');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaign_effects`
--

CREATE TABLE `campaign_effects` (
  `effect_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `shares` int(11) NOT NULL,
  `report_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaign_effects`
--

INSERT INTO `campaign_effects` (`effect_id`, `campaign_id`, `influencer_id`, `views`, `likes`, `comments`, `shares`, `report_date`) VALUES
(9, 1, 3, 12000, 800, 45, 20, '2024-09-20'),
(10, 2, 4, 23500, 1237, 79, 45, '2024-10-22'),
(11, 3, 5, 22000, 1600, 90, 60, '2025-04-15'),
(12, 4, 6, 15000, 900, 55, 30, '2025-05-10'),
(13, 6, 7, 200000, 15000, 1300, 500, '2025-07-02'),
(14, 6, 6, 150000, 12000, 1200, 400, '2025-07-02'),
(15, 7, 8, 500000, 25000, 1800, 1200, '2025-06-15'),
(16, 7, 10, 450000, 21000, 1600, 900, '2025-10-16'),
(17, 8, 9, 800000, 45000, 3000, 2000, '2025-11-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaign_influencers`
--

CREATE TABLE `campaign_influencers` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `agreed_fee` decimal(10,2) NOT NULL,
  `contract_signed` tinyint(1) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaign_influencers`
--

INSERT INTO `campaign_influencers` (`id`, `campaign_id`, `influencer_id`, `agreed_fee`, `contract_signed`, `notes`) VALUES
(4, 3, 6, '1500.00', 1, 'Prowadzi transmisje live'),
(5, 6, 7, '5000.00', 1, NULL),
(6, 6, 6, '3300.00', 1, NULL),
(7, 7, 8, '1200.00', 1, 'Publikacje 4x w miesiącu'),
(8, 8, 9, '2000.00', 0, 'Czekamy na podpisanie umowy'),
(9, 7, 10, '900.00', 1, '3 posty + Stories'),
(10, 9, 10, '1500.00', 1, 'Challenge #MusicRevolution');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `influencers`
--

CREATE TABLE `influencers` (
  `influencer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `engagement_rate` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `influencers`
--

INSERT INTO `influencers` (`influencer_id`, `first_name`, `last_name`, `email`, `phone`, `engagement_rate`, `notes`, `user_id`) VALUES
(6, 'Daniel', 'Malinowski', 'daniel.m@gmail.com', '456789123', '2.90', 'Streaming gier', 6),
(7, 'Janek', 'Kowalski', 'janek@example.com', '123456789', '3.45', NULL, 8),
(8, 'Alice', 'Kowalska', 'alice@insta.com', '+48123123123', '4.70', 'Lifestyle & travel', 9),
(9, 'Bob', 'Nowak', 'bob@yt.com', '+48789123456', '5.20', 'Tech reviews', 10),
(10, 'Carol', 'Wiśniewska', 'carol@tiktok.com', '+48555111222', '7.10', 'Dance & music', 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `influencer_platforms`
--

CREATE TABLE `influencer_platforms` (
  `influencer_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `account_url` varchar(255) NOT NULL,
  `platform_username` varchar(255) NOT NULL,
  `joined_date` date DEFAULT NULL,
  `follows` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `influencer_platforms`
--

INSERT INTO `influencer_platforms` (`influencer_id`, `platform_id`, `account_url`, `platform_username`, `joined_date`, `follows`) VALUES
(8, 1, 'https://instagram.com/alice', 'alice', '2020-03-15', 125000),
(9, 2, 'https://youtube.com/bobchan', 'bobchan', '2019-07-01', 89000),
(10, 3, 'https://tiktok.com/@carol', 'carol', '2021-11-10', 150000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `status` enum('Pending','Paid','Failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `payments`
--

INSERT INTO `payments` (`payment_id`, `influencer_id`, `campaign_id`, `amount`, `payment_date`, `status`) VALUES
(1, 8, 1, '120000.00', '2025-06-05', 'Paid'),
(2, 10, 1, '90000.00', '2025-10-10', 'Pending'),
(3, 9, 2, '150000.00', '2025-12-01', 'Pending'),
(8, 6, 3, '1500.00', '2025-01-15', 'Paid');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platforms`
--

CREATE TABLE `platforms` (
  `platform_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url_template` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `platforms`
--

INSERT INTO `platforms` (`platform_id`, `name`, `url_template`, `description`) VALUES
(1, 'Instagram', 'https://instagram.com/%s', 'Platforma służąca do publikacji zdjęć i krótkich filmów'),
(2, 'YouTube', 'https://youtube.com/%s', 'Platforma wideo i livestream'),
(3, 'TikTok', 'https://tiktok.com/@%s', 'Platforma do krótkich, dynamicznych filmów'),
(4, 'Nazwa_test', 'https://link.com', 'opis opis opis');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(320) NOT NULL,
  `role` enum('admin','manager','influencer','viewer') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `email`, `role`, `created_at`, `icon`) VALUES
(1, 'admin1', 'hashedpassword111', 'admin1@gmail.com', 'admin', '2025-05-12 17:42:19', NULL),
(2, 'manager1', 'hashedpassword22', 'manager1@gmail.com', 'manager', '2025-05-12 17:42:19', NULL),
(3, 'viewer1', 'hashedpassword3123', 'viewer1@gmail.com', 'viewer', '2025-05-12 17:42:19', NULL),
(4, 'influencer1', 'hashedpassword55', 'influencer1@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(5, 'influencer2', 'hashedpassword51', 'influencer2@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(6, 'influencer3', 'hashedpassword123', 'influencer3@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(7, 'influencer4', 'hashedpassword5', 'influencer4@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(8, 'janekinflur', 'hashedpassword123', 'janek@example.com', 'influencer', '2025-05-27 17:21:30', NULL),
(9, 'alice', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'alice@example.com', 'influencer', '2025-06-11 13:28:25', NULL),
(10, 'bob', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'bob@example.com', 'influencer', '2025-06-11 13:28:25', NULL),
(11, 'carol', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'carol@example.com', 'influencer', '2025-06-11 13:28:25', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`campaign_id`);

--
-- Indeksy dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  ADD PRIMARY KEY (`effect_id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `influencer_id` (`influencer_id`);

--
-- Indeksy dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `influencer_id` (`influencer_id`);

--
-- Indeksy dla tabeli `influencers`
--
ALTER TABLE `influencers`
  ADD PRIMARY KEY (`influencer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `influencer_platforms`
--
ALTER TABLE `influencer_platforms`
  ADD PRIMARY KEY (`influencer_id`,`platform_id`),
  ADD KEY `platform_id` (`platform_id`);

--
-- Indeksy dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `influencer_id` (`influencer_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indeksy dla tabeli `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`platform_id`),
  ADD UNIQUE KEY `ux_platform_name` (`name`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  MODIFY `effect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `influencers`
--
ALTER TABLE `influencers`
  MODIFY `influencer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `platforms`
--
ALTER TABLE `platforms`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  ADD CONSTRAINT `campaign_effects_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  ADD CONSTRAINT `campaign_influencers_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_influencers_ibfk_2` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `influencers`
--
ALTER TABLE `influencers`
  ADD CONSTRAINT `influencers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `influencer_platforms`
--
ALTER TABLE `influencer_platforms`
  ADD CONSTRAINT `influencer_platforms_ibfk_1` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `influencer_platforms_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`platform_id`);

--
-- Ograniczenia dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);
--
-- Baza danych: `influ`
--
CREATE DATABASE IF NOT EXISTS `influ` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influ`;
--
-- Baza danych: `influencercamp`
--
CREATE DATABASE IF NOT EXISTS `influencercamp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influencercamp`;
--
-- Baza danych: `influencer_campaign_manager`
--
CREATE DATABASE IF NOT EXISTS `influencer_campaign_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influencer_campaign_manager`;
--
-- Baza danych: `influencer_campaign_manager_database`
--
CREATE DATABASE IF NOT EXISTS `influencer_campaign_manager_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influencer_campaign_manager_database`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaign_effects`
--

CREATE TABLE `campaign_effects` (
  `effect_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `shares` int(11) NOT NULL,
  `report_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaign_effects`
--

INSERT INTO `campaign_effects` (`effect_id`, `campaign_id`, `influencer_id`, `views`, `likes`, `comments`, `shares`, `report_date`) VALUES
(9, 1, 3, 12000, 800, 45, 20, '2024-09-20'),
(10, 2, 4, 23500, 1237, 79, 45, '2024-10-22'),
(11, 3, 5, 22000, 1600, 90, 60, '2025-04-15'),
(12, 4, 6, 15000, 900, 55, 30, '2025-05-10'),
(13, 6, 7, 200000, 15000, 1300, 500, '2025-07-02'),
(14, 6, 6, 150000, 12000, 1200, 400, '2025-07-02'),
(15, 7, 8, 500000, 25000, 1800, 1200, '2025-06-15'),
(16, 7, 10, 450000, 21000, 1600, 900, '2025-10-16'),
(17, 8, 9, 800000, 45000, 3000, 2000, '2025-11-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaign_influencers`
--

CREATE TABLE `campaign_influencers` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `agreed_fee` decimal(10,2) NOT NULL,
  `contract_signed` tinyint(1) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaign_influencers`
--

INSERT INTO `campaign_influencers` (`id`, `campaign_id`, `influencer_id`, `agreed_fee`, `contract_signed`, `notes`) VALUES
(4, 3, 6, '1500.00', 1, 'Prowadzi transmisje live'),
(5, 6, 7, '5000.00', 1, NULL),
(6, 6, 6, '3300.00', 1, NULL),
(7, 7, 8, '1200.00', 1, 'Publikacje 4x w miesiącu'),
(8, 8, 9, '2000.00', 0, 'Czekamy na podpisanie umowy'),
(9, 7, 10, '900.00', 1, '3 posty + Stories'),
(10, 9, 10, '1500.00', 1, 'Challenge #MusicRevolution');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `influencers`
--

CREATE TABLE `influencers` (
  `influencer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `engagement_rate` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `influencers`
--

INSERT INTO `influencers` (`influencer_id`, `first_name`, `last_name`, `email`, `phone`, `engagement_rate`, `notes`, `user_id`) VALUES
(6, 'Daniel', 'Malinowski', 'daniel.m@gmail.com', '456789123', '2.90', 'Streaming gier', 6),
(7, 'Janek', 'Kowalski', 'janek@example.com', '123456789', '3.45', NULL, 8),
(8, 'Alice', 'Kowalska', 'alice@insta.com', '+48123123123', '4.70', 'Lifestyle & travel', 9),
(9, 'Bob', 'Nowak', 'bob@yt.com', '+48789123456', '5.20', 'Tech reviews', 10),
(10, 'Carol', 'Wiśniewska', 'carol@tiktok.com', '+48555111222', '7.10', 'Dance & music', 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `influencer_platforms`
--

CREATE TABLE `influencer_platforms` (
  `influencer_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `account_url` varchar(255) NOT NULL,
  `platform_username` varchar(255) NOT NULL,
  `joined_date` date DEFAULT NULL,
  `follows` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `influencer_platforms`
--

INSERT INTO `influencer_platforms` (`influencer_id`, `platform_id`, `account_url`, `platform_username`, `joined_date`, `follows`) VALUES
(8, 1, 'https://instagram.com/alice', 'alice', '2020-03-15', 125000),
(9, 2, 'https://youtube.com/bobchan', 'bobchan', '2019-07-01', 89000),
(10, 3, 'https://tiktok.com/@carol', 'carol', '2021-11-10', 150000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `influencer_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `status` enum('Pending','Paid','Failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `payments`
--

INSERT INTO `payments` (`payment_id`, `influencer_id`, `campaign_id`, `amount`, `payment_date`, `status`) VALUES
(1, 8, 1, '120000.00', '2025-06-05', 'Paid'),
(2, 10, 1, '90000.00', '2025-10-10', 'Pending'),
(3, 9, 2, '150000.00', '2025-12-01', 'Pending'),
(8, 6, 3, '1500.00', '2025-01-15', 'Paid');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platforms`
--

CREATE TABLE `platforms` (
  `platform_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url_template` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `platforms`
--

INSERT INTO `platforms` (`platform_id`, `name`, `url_template`, `description`) VALUES
(1, 'Instagram', 'https://instagram.com/%s', 'Platforma służąca do publikacji zdjęć i krótkich filmów'),
(2, 'YouTube', 'https://youtube.com/%s', 'Platforma wideo i livestream'),
(3, 'TikTok', 'https://tiktok.com/@%s', 'Platforma do krótkich, dynamicznych filmów');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(320) NOT NULL,
  `role` enum('admin','manager','influencer','viewer') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `email`, `role`, `created_at`, `icon`) VALUES
(1, 'admin1', 'hashedpassword111', 'admin1@gmail.com', 'admin', '2025-05-12 17:42:19', NULL),
(2, 'manager1', 'hashedpassword22', 'manager1@gmail.com', 'manager', '2025-05-12 17:42:19', NULL),
(3, 'viewer1', 'hashedpassword3123', 'viewer1@gmail.com', 'viewer', '2025-05-12 17:42:19', NULL),
(4, 'influencer1', 'hashedpassword55', 'influencer1@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(5, 'influencer2', 'hashedpassword51', 'influencer2@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(6, 'influencer3', 'hashedpassword123', 'influencer3@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(7, 'influencer4', 'hashedpassword5', 'influencer4@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL),
(8, 'janekinflur', 'hashedpassword123', 'janek@example.com', 'influencer', '2025-05-27 17:21:30', NULL),
(9, 'alice', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'alice@example.com', 'influencer', '2025-06-11 13:28:25', NULL),
(10, 'bob', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'bob@example.com', 'influencer', '2025-06-11 13:28:25', NULL),
(11, 'carol', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'carol@example.com', 'influencer', '2025-06-11 13:28:25', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  ADD PRIMARY KEY (`effect_id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `influencer_id` (`influencer_id`);

--
-- Indeksy dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `influencer_id` (`influencer_id`);

--
-- Indeksy dla tabeli `influencers`
--
ALTER TABLE `influencers`
  ADD PRIMARY KEY (`influencer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `influencer_platforms`
--
ALTER TABLE `influencer_platforms`
  ADD PRIMARY KEY (`influencer_id`,`platform_id`),
  ADD KEY `platform_id` (`platform_id`);

--
-- Indeksy dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `influencer_id` (`influencer_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indeksy dla tabeli `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`platform_id`),
  ADD UNIQUE KEY `ux_platform_name` (`name`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  MODIFY `effect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `influencers`
--
ALTER TABLE `influencers`
  MODIFY `influencer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `platforms`
--
ALTER TABLE `platforms`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  ADD CONSTRAINT `campaign_effects_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `influencer_campaign_manager_db`.`campaigns` (`campaign_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  ADD CONSTRAINT `campaign_influencers_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `influencer_campaign_manager_db`.`campaigns` (`campaign_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_influencers_ibfk_2` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `influencers`
--
ALTER TABLE `influencers`
  ADD CONSTRAINT `influencers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ograniczenia dla tabeli `influencer_platforms`
--
ALTER TABLE `influencer_platforms`
  ADD CONSTRAINT `influencer_platforms_ibfk_1` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `influencer_platforms_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`platform_id`);

--
-- Ograniczenia dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `influencer_campaign_manager_db`.`campaigns` (`campaign_id`);
--
-- Baza danych: `influencer_campaign_manager_db`
--
CREATE DATABASE IF NOT EXISTS `influencer_campaign_manager_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influencer_campaign_manager_db`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `campaigns`
--

CREATE TABLE `campaigns` (
  `campaign_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `client` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(12,2) NOT NULL,
  `goal_description` text DEFAULT NULL,
  `status` enum('Planned','Ongoing','Completed','Cancelled') NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `name`, `client`, `start_date`, `end_date`, `budget`, `goal_description`, `status`, `description`) VALUES
(1, 'Kampania Lato', 'Coca-Cola', '2024-06-01', '2024-07-15', '10000.00', 'Promocja napojów na lato', 'Completed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'Jesienna Promocja', 'Nike', '2024-09-01', '2024-10-30', '20000.00', 'Nowa kolekcja butów sportowych', 'Ongoing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 'Świąteczne Rabaty', 'Allegro', '2024-12-01', '2024-12-24', '30000.00', 'Zwiększenie sprzedaży przed świętami', 'Completed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'Wiosenny Start', 'Samsung', '2025-03-01', '2025-04-15', '15000.00', 'Promocja nowych smartfonów', 'Cancelled', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(5, 'Wyprzedaż', 'Adidas', '2025-07-22', '2025-08-10', '35000.00', 'Stare kolekcje butów', 'Planned', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(6, 'Letnia Promocja', 'Firma', '2025-06-01', '2025-07-01', '15000.00', 'Zwiększenie widoczności', 'Planned', 'Kampania letnia dla młodych'),
(7, 'Wiosenne Inspiracje', 'BrandX', '2025-06-01', '2025-06-30', '50000.00', 'Zwiększenie rozpoznawalności', 'Ongoing', 'Kampania sezonowa na Instagramie'),
(8, 'Tech Showcase Q2', 'TechCorp', '2025-08-15', '2025-09-15', '75000.00', 'Prezentacja nowych gadżetów', 'Planned', 'Seria recenzji na YouTube'),
(9, 'Muzyczna Rewolucja', 'MusicLive', '2025-11-01', '2025-11-25', '60000.00', 'Promocja nowego albumu', 'Planned', 'Challenge na TikToku z tańcem');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`campaign_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Baza danych: `influencer_campaign_manager_db2`
--
CREATE DATABASE IF NOT EXISTS `influencer_campaign_manager_db2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `influencer_campaign_manager_db2`;
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"influencer_campaign_manager_db\",\"table\":\"campaigns\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-11 11:06:28', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pl\",\"NavigationWidth\":365}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
