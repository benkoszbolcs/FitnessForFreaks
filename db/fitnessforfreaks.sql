-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 10. 13:17
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fitnessforfreaks`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etel`
--

CREATE TABLE `etel` (
  `etelid` int(11) NOT NULL,
  `etelNev` varchar(100) NOT NULL,
  `etelLeiras` text NOT NULL,
  `etelkep` varchar(250) NOT NULL,
  `etelhozzavalok` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhid` int(11) NOT NULL,
  `felhNev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo` varchar(100) NOT NULL,
  `nem` char(1) NOT NULL,
  `szulEv` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhid`, `felhNev`, `email`, `jelszo`, `nem`, `szulEv`) VALUES
(1, 'Benkő Szabolcs', 'benko.szabolcs-2020@keri.mako.hu', '1234Aa', 'M', '2006-02-16');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forum`
--

CREATE TABLE `forum` (
  `forumid` int(11) NOT NULL,
  `forumido` date NOT NULL,
  `felhid` int(11) NOT NULL,
  `tapasztalat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `forum`
--

INSERT INTO `forum` (`forumid`, `forumido`, `felhid`, `tapasztalat`) VALUES
(2, '2025-02-04', 1, 'herhe'),
(3, '2025-02-04', 1, 'dahwufhaiwf');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyakorlat`
--

CREATE TABLE `gyakorlat` (
  `gyakid` int(11) NOT NULL,
  `gyakNev` varchar(100) NOT NULL,
  `gyakVideo` varchar(100) NOT NULL,
  `gyakKep` varchar(100) NOT NULL,
  `gyakLeiras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kartyasfizetes`
--

CREATE TABLE `kartyasfizetes` (
  `kartyaid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `kartyaSzam` bigint(16) NOT NULL,
  `lejaratiDatum` varchar(5) NOT NULL,
  `biztKod` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kerdoiv`
--

CREATE TABLE `kerdoiv` (
  `kerdoivid` int(11) NOT NULL,
  `kerdes1` varchar(50) NOT NULL,
  `kerdes2` varchar(50) NOT NULL,
  `kerdes3` varchar(50) NOT NULL,
  `kerdes4` varchar(50) NOT NULL,
  `kerdes5` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etel`
--
ALTER TABLE `etel`
  ADD PRIMARY KEY (`etelid`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`felhid`),
  ADD KEY `felhid` (`felhid`);

--
-- A tábla indexei `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`forumid`),
  ADD KEY `userid` (`felhid`);

--
-- A tábla indexei `gyakorlat`
--
ALTER TABLE `gyakorlat`
  ADD PRIMARY KEY (`gyakid`);

--
-- A tábla indexei `kartyasfizetes`
--
ALTER TABLE `kartyasfizetes`
  ADD PRIMARY KEY (`kartyaid`);

--
-- A tábla indexei `kerdoiv`
--
ALTER TABLE `kerdoiv`
  ADD PRIMARY KEY (`kerdoivid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etel`
--
ALTER TABLE `etel`
  MODIFY `etelid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `forum`
--
ALTER TABLE `forum`
  MODIFY `forumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `gyakorlat`
--
ALTER TABLE `gyakorlat`
  MODIFY `gyakid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kartyasfizetes`
--
ALTER TABLE `kartyasfizetes`
  MODIFY `kartyaid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kerdoiv`
--
ALTER TABLE `kerdoiv`
  MODIFY `kerdoivid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
