-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jan 11. 13:14
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `2123szft_socialmediaportal`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `comment` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`ID`, `userID`, `postID`, `date`, `comment`) VALUES
(6, 2, 1, '2022-12-20 00:00:00', ''),
(7, 2, 1, '2022-12-20 00:00:00', ''),
(8, 2, 1, '2023-01-11 00:00:00', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emotions`
--

CREATE TABLE `emotions` (
  `ID` int(11) NOT NULL,
  `emoticon` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `emotions`
--

INSERT INTO `emotions` (`ID`, `emoticon`, `name`) VALUES
(1, '<i class=\"bi bi-hand-thumbs-up\"></i>', 'Kedvel'),
(2, '<i class=\"bi bi-hand-thumbs-down\"></i>', 'Nem kedvel'),
(3, '<i class=\"bi bi-heart\"></i>', 'Szeret'),
(4, '<i class=\"bi bi-heartbreak\"></i>', 'Nem szeret'),
(5, '<i class=\"bi bi-emoji-kiss\"></i>', 'Csókol'),
(6, '<i class=\"bi bi-emoji-heart-eyes\"></i>', 'Örül'),
(7, '<i class=\"bi bi-emoji-angry\"></i>', 'Mérges'),
(8, '<i class=\"bi bi-emoji-frown\"></i>', 'Szomorú'),
(9, '<i class=\"bi bi-emoji-laughing\"></i>', 'Nevet'),
(10, '<i class=\"bi bi-emoji-smile\"></i>', 'Mosolyog'),
(11, '<i class=\"bi bi-emoji-sunglasses\"></i>', 'Vagány'),
(12, '<i class=\"bi bi-emoji-wink\"></i>', 'Kacsint'),
(13, '<i class=\"bi bi-emoji-neutral\"></i>', 'Semleges');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `fromID` int(11) NOT NULL,
  `toID` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `message` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pictures`
--

CREATE TABLE `pictures` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `postmessage` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`ID`, `userID`, `date`, `postmessage`) VALUES
(2, 2, '2022-12-20 11:55:51', 'asd'),
(3, 2, '2022-12-20 12:11:05', ''),
(4, 2, '2022-12-20 12:11:10', 'dsg'),
(5, 2, '2022-12-20 12:17:15', 'hgf'),
(6, 2, '2022-12-20 12:17:46', 'fdagd'),
(7, 2, '2022-12-20 12:17:47', 'fdagd'),
(8, 2, '2022-12-20 12:17:47', 'fdagd'),
(9, 2, '2022-12-20 12:19:17', ''),
(10, 2, '0000-00-00 00:00:00', 'sd'),
(11, 2, '0000-00-00 00:00:00', 'valami jó'),
(12, 2, '2022-12-20 12:25:00', 'vlami még jobb');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reactions`
--

CREATE TABLE `reactions` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `emojiID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL COMMENT 'profilkép',
  `reg` datetime NOT NULL DEFAULT current_timestamp(),
  `last` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`, `phone`, `address`, `filename`, `reg`, `last`, `status`) VALUES
(2, 'admin', 'admin@TNF.com', '7af2d10b73ab7cd8f603937f7697cb5fe432c7ff', NULL, NULL, NULL, '2022-12-19 11:31:20', '2023-01-11 12:54:45', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `postID` (`postID`);

--
-- A tábla indexei `emotions`
--
ALTER TABLE `emotions`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fromID` (`fromID`),
  ADD KEY `toID` (`toID`);

--
-- A tábla indexei `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`);

--
-- A tábla indexei `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `postID` (`postID`),
  ADD KEY `emojiID` (`emojiID`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `emotions`
--
ALTER TABLE `emotions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pictures`
--
ALTER TABLE `pictures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `reactions`
--
ALTER TABLE `reactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`fromID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`toID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`emojiID`) REFERENCES `emotions` (`ID`),
  ADD CONSTRAINT `reactions_ibfk_3` FOREIGN KEY (`postID`) REFERENCES `posts` (`ID`),
  ADD CONSTRAINT `reactions_ibfk_4` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
