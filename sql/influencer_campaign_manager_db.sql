-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Maj 2025, 21:29
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
-- Baza danych: `influencer_campaign_manager_db`
--

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
(1, 'Kampania Lato', 'Coca-Cola', '2024-06-01', '2024-07-15', '10000.00', 'Promocja napojów na lato', 'Planned', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'Jesienna Promocja', 'Nike', '2024-09-01', '2024-10-30', '20000.00', 'Nowa kolekcja butów sportowych', 'Ongoing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 'Świąteczne Rabaty', 'Allegro', '2024-12-01', '2024-12-24', '30000.00', 'Zwiększenie sprzedaży przed świętami', 'Completed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'Wiosenny Start', 'Samsung', '2025-03-01', '2025-04-15', '15000.00', 'Promocja nowych smartfonów', 'Cancelled', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(5, 'Wyprzedaż', 'Adidas', '2025-07-22', '2025-08-10', '35000.00', 'Stare kolekcje butów', 'Planned', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

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
(10, 2, 4, 18000, 1200, 70, 40, '2024-10-22'),
(11, 3, 5, 22000, 1600, 90, 60, '2025-04-15'),
(12, 4, 6, 15000, 900, 55, 30, '2025-05-10');

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
(1, 1, 3, '2000.00', 1, 'Prowadzi transmisje live'),
(2, 1, 4, '2500.00', 0, 'W trakcie negocjacji'),
(3, 2, 5, '1800.00', 1, 'Zatwierdzony przez klienta'),
(4, 3, 6, '1500.00', 1, 'Prowadzi transmisje live');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `influencers`
--

CREATE TABLE `influencers` (
  `influencer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `platform` enum('Instagram','YouTube','TikTok','Twitch','Kick','X') DEFAULT NULL,
  `followers_count` int(11) DEFAULT NULL,
  `engagement_rate` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `influencers`
--

INSERT INTO `influencers` (`influencer_id`, `first_name`, `last_name`, `email`, `phone`, `platform`, `followers_count`, `engagement_rate`, `notes`, `user_id`) VALUES
(3, 'Anna', 'Kowalska', 'anna.k@gmail.com', '123456789', 'Instagram', 15000, '3.45', 'Moda i lifestyle', 0),
(4, 'Bartek', 'Nowak', 'bartek.n@gmail.com', '234567891', 'YouTube', 220000, '5.20', 'Gaming', 0),
(5, 'Celina', 'Wiśniewska', 'celina.w@gmail.com', '345678912', 'TikTok', 80000, '4.80', 'Fitness', 0),
(6, 'Daniel', 'Malinowski', 'daniel.m@gmail.com', '456789123', 'Twitch', 50000, '2.90', 'Streaming gier', 0);

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
(5, 3, 1, '2000.00', '2025-05-11', 'Paid'),
(6, 4, 1, '2500.00', '0000-00-00', 'Pending'),
(7, 5, 2, '1800.00', '2025-02-20', 'Paid'),
(8, 6, 3, '1500.00', '2025-01-15', 'Paid');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
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
(7, 'influencer4', 'hashedpassword5', 'influencer4@gmail.com', 'influencer', '2025-05-12 17:42:19', NULL);

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
-- Indeksy dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `influencer_id` (`influencer_id`),
  ADD KEY `campaign_id` (`campaign_id`);

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
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  MODIFY `effect_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `campaign_influencers`
--
ALTER TABLE `campaign_influencers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `influencers`
--
ALTER TABLE `influencers`
  MODIFY `influencer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `campaign_effects`
--
ALTER TABLE `campaign_effects`
  ADD CONSTRAINT `campaign_effects_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_effects_ibfk_2` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE;

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
-- Ograniczenia dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`influencer_id`) REFERENCES `influencers` (`influencer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
