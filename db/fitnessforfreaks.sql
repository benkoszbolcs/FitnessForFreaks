-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 25. 11:51
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
  `forumido` datetime NOT NULL,
  `felhid` int(11) NOT NULL,
  `tapasztalat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `forum`
--

INSERT INTO `forum` (`forumid`, `forumido`, `felhid`, `tapasztalat`) VALUES
(1, '2025-02-21 11:58:08', 1, 'bakfitty'),
(2, '2025-02-21 11:58:26', 1, 'asdadkű');

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

--
-- A tábla adatainak kiíratása `gyakorlat`
--

INSERT INTO `gyakorlat` (`gyakid`, `gyakNev`, `gyakVideo`, `gyakKep`, `gyakLeiras`) VALUES
(1, 'Fekvenyomás', '../media/video/bench_press.mp4', '../media/image/bench_press.jpg', 'Általános gyakorlat ezek közül az egyenes (vízszintes) padon végzett, kétkezes súlyzóval (rúddal) végzett gyakorlat. A személy hanyatt fekszik a gyakorlat céljára szolgáló különleges padon, a fekvenyomópadon, talpai a talajon vannak. A feltámasztott súlyzórudat két kezével megfogja (vállainál szélesebb fogással), kézfeje az arca felé néz. A rudat kiemeli a támasztékról, karjait kinyújtja, ez a kiinduló állás. A rudat a mellére engedi, körülbelül a mellbimbóhoz, közben levegőt vesz. A súlyt ezután kinyomja karja nyújtott állapotáig, közben a levegőt kifújja. A szabályos végrehajtás kimért és fegyelmezett, nincs lendítés és hirtelen mozdulat, nem mozog a csípő, a hát nem hajlik, a talpak is stabilan a földön vannak.'),
(2, 'Bicepsz hajlítás rúddal', '../media/video/bicep_curl.mp4', '../media/image/biceps_curl.jpg', 'Állj egyenesen, vállszélességű fogással a kétkezes súlyzón, a tenyerek előre néznek. A teljes mozgás folyamán a felkarod maradjon szorosan törzsed mellett. A mozgás kiinduló pozíciójában a kar egyenes, és a súlyzó keresztben fekszik a combodon.\r\nCsak alkart mozgatva hajlítsd be a karodat, és mozgasd a súlyzót felfelé, félkörívben az állad irányába. Lassan ereszd vissza a súlyzót ugyanezen félkörív mentén a kiindulási ponthoz, majd ismételd a mozdulatot.Tartsd mozdulatlanul felsőtestedet, míg mozgatod a súlyzót. A mozgás hatásosságát szinte teljesen eltünteti, ha a felsőtest mozog, vagy besegítesz a hátaddal. Felemelés után a súlyzót engedd le teljesen (karok egyenesen lefelé lógjanak). Minden ismétléskor használd ki a teljes mozgástartományt.'),
(3, 'Felhúzás', '../media/video/deadlift.mp4\r\n', '../media/image/deadlift.jpg\r\n', 'A gyakorlat a hát alsó és középső részének izomzatát, a csípő izmait, a combizmokat és csuklyás izmot is stimulálja. A fogást is erősíti.A felhúzás rúddal végzendő gyakorlat minden esetben. Állj úgy, hogy lábszárcsont éppen érintse a súlyzót. Hajolj előre természetesen, és ragadd meg a rudat az egyik kezedet előre-, a másik kezedet hátrafordítva (a fogóerő növelésére). Egyenesedj ki, természetesen használva lábad és hátad együttes erejét. Az emelés kezdetétől tartsd a rudat a testedhez a lehető legközelebb. Elképzelhető hogy a rúd felhorzsolja a bokádat... ez ilyen. Tekintsd harci sebnek!'),
(4, 'Tolódzkodás', '../media/video/dips.mp4\r\n', '../media/image/dips2.jpg\r\n', 'Engedd le magad olyan mélyre, amennyire csak bírod, a kinyomás végén pedig nyújtsd ki a karodat. Ügyelj rá hogy a könyék ne legyen kiakasztva a csúcsponton. A mozgás legyen végig kontrollált, ne rugózz az alsó ponton, és ne végezd túl gyorsan a gyakorlatot.A szélesebbre állított korláton végzett gyakorlattal a mell külső része edzhető. Minél szűkebb a fogás, annál inkább a tricepszre helyeződik a hangsúly. A tolódzkodás gépen is végezhető, itt vagy a tested részleges tehermentesítésén keresztül könnyítik a gyakorlatot, vagy egyszerűen más mechanikája lesz az egésznek, ami koncentráltabb végrehajtást tesz lehetővé.'),
(5, 'Archoz húzás', '../media/video/face_pull.mp4\r\n', '../media/image/face_pull.jpg\r\n', 'Állj kissé berogyasztott térdekkel, stabilan. A terhelés mértéke legyen moderált, ez nem az a gyakorlat, ahol nagy súlyt kell használni. A karjaid legyenek teljesen kinyújtva, innen kezd el a face pull-t. A köteleket nagyjából az orrod/szemed vonalába húzd hátra és oldalra, amíg a felkarod vízszintes nem lesz. A csúcsösszehúzódásnál feszíts rá a hát-, és vállizmaidra, koncentrálj a lapockáid összehúzására, és tartsd ki egy-másfél másodpercig a holtpontot. Innen lassan engedd vissza a köteleket a kiinduló pozícióba.'),
(6, 'Kalapács karhajlítás', '../media/video/hammer_curl.mp4\r\n', '../media/image/hammer_curl.jpg\r\n', 'Ragadj meg mindkét kezedben egy-egy kézisúlyzót, és tartsd őket a tested mellett, a tenyereid nézzenek a tested irányába. Ha lehet, könyöködet egy helyben tartva, lassan és egyenletesen emeld az egyik súlyzót a válladhoz. Ereszd vissza, és a másik karral is ismételd a mozdulatot. Ügyelj rá, hogy a könyököd ne mozogjon ki oldalra. Végezheted egyszerre a két karoddal is a gyakorlatot. A gyakorlatot végezheted állva és ülve is, mindkét karral egyszerre vagy felváltva.'),
(7, 'Ferde pados fekvenyomás', '../media/video/incline_db_press.mp4\r\n', '../media/image/incline_db_press.jpg\r\n', 'Döntött padon háton fekve, a dőlés 35-45 fokra állítva. Vedd le a rudat a tartójáról vállszélességnél kissé szélesebb fogásvétellel. Lélegezz be, és ereszd le mellkasod legmagasabb pontjára. Szünet nélkül - kilélegzés közben - nyomd ki, de ügyelj rá hogy ne akasszad ki a könyöködet. Ha szélesebb fogást veszel, és kulcscsontodra ereszted le a rudat, a mellkasodban erősebb lesz a bedurranás. A fekvenyomás ferdepadon a klasszikus fekvenyomáshoz képest ideálisabb gyakorlat lehet számodra abban az esetben, ha a mellizom vállövi letapadásai kevésbé fejlettek. Helyettesítheted a gyakorlatot a kézisúlyzós ferdepados nyomással is. Ez főként akkor hasznos, ha aszimmetrikus a mellizmaid fejlettsége.'),
(8, 'Lehúzás', '../media/video/lat_pulldown.mp4\r\n', '../media/image/incline_db_press.jpg\r\n', 'Ragadd meg a rudat úgy, hogy a tenyereid magad felé nézzenek. A fogásszélesség ne legyen nagyobb a vállszélességnél. Húzd le a rudat a mellkasodhoz, majd miután megérintette azt, engedd vissza, ügyelve arra hogy a hátizmok szépen megnyúljanak a mozdulat során.Koncentrálj a könyököd lehúzására, ne a rúd lehúzására! Ha a rúdra figyelsz, könnyebben fogod bicepszből húzni a súlyt, azonban ha a könyöködet \"akarod\" lehúzni, akkor könnyebben fogod munkára a hátizmokat. A gyakorlat helyettesíthető szűk fogású húzódzkodással, ebben az esetben külső fogással végezd azt.'),
(9, 'Oldalemelés', '../media/video/lateral_raise.mp4\r\n', '../media/image/lateral_raise.jpg\r\n', 'Állj kiegyenesedve, tarts hajlított könyökkel egy-egy egykezes súlyzót mindkét kezedben. A súlyzókat egyszerre emeld ki oldalra a tested mellől addig, amíg vállmagasságnál egy kicsit fentebb nem kerül a súly. Engedd vissza lassan, és ismételd meg a gyakorlatot. Ügyelj a kisujjadra! Mit jelent ez? A kisujjad a felső ponton legyen magasabban, mint a hüvelykujjad, mintha egy kannából akarnál vizet önteni. Ezzel az apró kis mozdulattal még több stimulációt tudsz az oldalsó deltaizmokra helyezni. Ezt a gyakorlatot többféle módon lehet végezni. Álló vagy pad szélén ülő helyzetben egyaránt hatásosan végezhető, a cél az oldalsó deltaizmok megterhelése. Ha már nagyon erőlködsz, próbálj meg előrehajolni, \"bedőlni\" a gyakorlatba, és nem hátrahajolni (mert úgy az amúgy is erős elülső deltaizmokat terheled). De ez nem azt jelenti, hogy előre-hátra kell ingáznod, ezzel elvész a gyakorlat lényege! A gyakorlatot végezheted váltott karral is, ha csak egyetlen súlyzó áll rendelkezésedre.'),
(10, 'Lábtolás', '../media/video/leg_press.mp4\r\n', '../media/image/leg_press.jpg\r\n', 'Ülj a gépbe vállszélességű terpeszben. Nyújtsd ki a lábad, de ne akaszd ki a térded. Engedd be a térdedet amennyire csak tudod, majd kontrollált mozgással nyújtsd ki, de ebben az esetben se akaszd ki a térdedet. Ha szélesebb terpeszt alkalmazol, akkor a comb belső része kap nagyobb terhelést, ha egészen szűken tartod a lábad, akkor a külső ívet tudod kihangsúlyozni (haladó szinten természetesen - amíg nincs megfelelő tömeg a combodon, felesleges ezzel foglalkoznod).\r\nÜgyelj rá, hogy ne ejtsd be a súlyt a negatív szakaszban, és ne akasszad ki a térdedet, mert mindkét esetben a térdízületed bánhatja a dolgot. A hátad legyen belefeszítve a támlába, akkor se emelkedjen el a csípőd, amikor beengeded a súlyt, mert ez az alsó hátra nézve veszélyes lehet!');

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
  MODIFY `forumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `gyakorlat`
--
ALTER TABLE `gyakorlat`
  MODIFY `gyakid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
