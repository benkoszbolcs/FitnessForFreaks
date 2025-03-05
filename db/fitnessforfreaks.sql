-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 05. 13:22
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
(1, 'Fekvenyomás', 'bench_press.mp4', 'bench_press.jpg', 'Általános gyakorlat ezek közül az egyenes (vízszintes) padon végzett, kétkezes súlyzóval (rúddal) végzett gyakorlat. A személy hanyatt fekszik a gyakorlat céljára szolgáló különleges padon, a fekvenyomópadon, talpai a talajon vannak. A feltámasztott súlyzórudat két kezével megfogja (vállainál szélesebb fogással), kézfeje az arca felé néz. A rudat kiemeli a támasztékról, karjait kinyújtja, ez a kiinduló állás. A rudat a mellére engedi, körülbelül a mellbimbóhoz, közben levegőt vesz. A súlyt ezután kinyomja karja nyújtott állapotáig, közben a levegőt kifújja. A szabályos végrehajtás kimért és fegyelmezett, nincs lendítés és hirtelen mozdulat, nem mozog a csípő, a hát nem hajlik, a talpak is stabilan a földön vannak.'),
(2, 'Bicepsz hajlítás rúddal', 'bicep_curl.mp4', 'biceps_curl.jpg', 'Állj egyenesen, vállszélességű fogással a kétkezes súlyzón, a tenyerek előre néznek. A teljes mozgás folyamán a felkarod maradjon szorosan törzsed mellett. A mozgás kiinduló pozíciójában a kar egyenes, és a súlyzó keresztben fekszik a combodon.\r\nCsak alkart mozgatva hajlítsd be a karodat, és mozgasd a súlyzót felfelé, félkörívben az állad irányába. Lassan ereszd vissza a súlyzót ugyanezen félkörív mentén a kiindulási ponthoz, majd ismételd a mozdulatot.Tartsd mozdulatlanul felsőtestedet, míg mozgatod a súlyzót. A mozgás hatásosságát szinte teljesen eltünteti, ha a felsőtest mozog, vagy besegítesz a hátaddal. Felemelés után a súlyzót engedd le teljesen (karok egyenesen lefelé lógjanak). Minden ismétléskor használd ki a teljes mozgástartományt.'),
(3, 'Felhúzás', 'deadlift.mp4\r\n', 'deadlift.jpg\r\n', 'A gyakorlat a hát alsó és középső részének izomzatát, a csípő izmait, a combizmokat és csuklyás izmot is stimulálja. A fogást is erősíti.A felhúzás rúddal végzendő gyakorlat minden esetben. Állj úgy, hogy lábszárcsont éppen érintse a súlyzót. Hajolj előre természetesen, és ragadd meg a rudat az egyik kezedet előre-, a másik kezedet hátrafordítva (a fogóerő növelésére). Egyenesedj ki, természetesen használva lábad és hátad együttes erejét. Az emelés kezdetétől tartsd a rudat a testedhez a lehető legközelebb. Elképzelhető hogy a rúd felhorzsolja a bokádat... ez ilyen. Tekintsd harci sebnek!'),
(4, 'Tolódzkodás', 'dips.mp4\r\n', 'dips2.jpg\r\n', 'Engedd le magad olyan mélyre, amennyire csak bírod, a kinyomás végén pedig nyújtsd ki a karodat. Ügyelj rá hogy a könyék ne legyen kiakasztva a csúcsponton. A mozgás legyen végig kontrollált, ne rugózz az alsó ponton, és ne végezd túl gyorsan a gyakorlatot.A szélesebbre állított korláton végzett gyakorlattal a mell külső része edzhető. Minél szűkebb a fogás, annál inkább a tricepszre helyeződik a hangsúly. A tolódzkodás gépen is végezhető, itt vagy a tested részleges tehermentesítésén keresztül könnyítik a gyakorlatot, vagy egyszerűen más mechanikája lesz az egésznek, ami koncentráltabb végrehajtást tesz lehetővé.'),
(5, 'Archoz húzás', 'face_pull.mp4\r\n', 'face_pull.jpg\r\n', 'Állj kissé berogyasztott térdekkel, stabilan. A terhelés mértéke legyen moderált, ez nem az a gyakorlat, ahol nagy súlyt kell használni. A karjaid legyenek teljesen kinyújtva, innen kezd el a face pull-t. A köteleket nagyjából az orrod/szemed vonalába húzd hátra és oldalra, amíg a felkarod vízszintes nem lesz. A csúcsösszehúzódásnál feszíts rá a hát-, és vállizmaidra, koncentrálj a lapockáid összehúzására, és tartsd ki egy-másfél másodpercig a holtpontot. Innen lassan engedd vissza a köteleket a kiinduló pozícióba.'),
(6, 'Kalapács karhajlítás', 'hammer_curl.mp4\r\n', 'hammer_curl.jpg\r\n', 'Ragadj meg mindkét kezedben egy-egy kézisúlyzót, és tartsd őket a tested mellett, a tenyereid nézzenek a tested irányába. Ha lehet, könyöködet egy helyben tartva, lassan és egyenletesen emeld az egyik súlyzót a válladhoz. Ereszd vissza, és a másik karral is ismételd a mozdulatot. Ügyelj rá, hogy a könyököd ne mozogjon ki oldalra. Végezheted egyszerre a két karoddal is a gyakorlatot. A gyakorlatot végezheted állva és ülve is, mindkét karral egyszerre vagy felváltva.'),
(7, 'Ferde pados fekvenyomás', 'incline_db_press.mp4\r\n', 'incline_db_press.jpg\r\n', 'Döntött padon háton fekve, a dőlés 35-45 fokra állítva. Vedd le a rudat a tartójáról vállszélességnél kissé szélesebb fogásvétellel. Lélegezz be, és ereszd le mellkasod legmagasabb pontjára. Szünet nélkül - kilélegzés közben - nyomd ki, de ügyelj rá hogy ne akasszad ki a könyöködet. Ha szélesebb fogást veszel, és kulcscsontodra ereszted le a rudat, a mellkasodban erősebb lesz a bedurranás. A fekvenyomás ferdepadon a klasszikus fekvenyomáshoz képest ideálisabb gyakorlat lehet számodra abban az esetben, ha a mellizom vállövi letapadásai kevésbé fejlettek. Helyettesítheted a gyakorlatot a kézisúlyzós ferdepados nyomással is. Ez főként akkor hasznos, ha aszimmetrikus a mellizmaid fejlettsége.'),
(8, 'Lehúzás', 'lat_pulldown.mp4\r\n', 'lat_pulldown.jpg\r\n', 'Ragadd meg a rudat úgy, hogy a tenyereid magad felé nézzenek. A fogásszélesség ne legyen nagyobb a vállszélességnél. Húzd le a rudat a mellkasodhoz, majd miután megérintette azt, engedd vissza, ügyelve arra hogy a hátizmok szépen megnyúljanak a mozdulat során.Koncentrálj a könyököd lehúzására, ne a rúd lehúzására! Ha a rúdra figyelsz, könnyebben fogod bicepszből húzni a súlyt, azonban ha a könyöködet \"akarod\" lehúzni, akkor könnyebben fogod munkára a hátizmokat. A gyakorlat helyettesíthető szűk fogású húzódzkodással, ebben az esetben külső fogással végezd azt.'),
(9, 'Oldalemelés', 'lateral_raise.mp4\r\n', 'lateral_raise.jpg\r\n', 'Állj kiegyenesedve, tarts hajlított könyökkel egy-egy egykezes súlyzót mindkét kezedben. A súlyzókat egyszerre emeld ki oldalra a tested mellől addig, amíg vállmagasságnál egy kicsit fentebb nem kerül a súly. Engedd vissza lassan, és ismételd meg a gyakorlatot. Ügyelj a kisujjadra! Mit jelent ez? A kisujjad a felső ponton legyen magasabban, mint a hüvelykujjad, mintha egy kannából akarnál vizet önteni. Ezzel az apró kis mozdulattal még több stimulációt tudsz az oldalsó deltaizmokra helyezni. Ezt a gyakorlatot többféle módon lehet végezni. Álló vagy pad szélén ülő helyzetben egyaránt hatásosan végezhető, a cél az oldalsó deltaizmok megterhelése. Ha már nagyon erőlködsz, próbálj meg előrehajolni, \"bedőlni\" a gyakorlatba, és nem hátrahajolni (mert úgy az amúgy is erős elülső deltaizmokat terheled). De ez nem azt jelenti, hogy előre-hátra kell ingáznod, ezzel elvész a gyakorlat lényege! A gyakorlatot végezheted váltott karral is, ha csak egyetlen súlyzó áll rendelkezésedre.'),
(10, 'Lábtolás', 'leg_press.mp4\r\n', 'leg_press.jpg\r\n', 'Ülj a gépbe vállszélességű terpeszben. Nyújtsd ki a lábad, de ne akaszd ki a térded. Engedd be a térdedet amennyire csak tudod, majd kontrollált mozgással nyújtsd ki, de ebben az esetben se akaszd ki a térdedet. Ha szélesebb terpeszt alkalmazol, akkor a comb belső része kap nagyobb terhelést, ha egészen szűken tartod a lábad, akkor a külső ívet tudod kihangsúlyozni (haladó szinten természetesen - amíg nincs megfelelő tömeg a combodon, felesleges ezzel foglalkoznod).\r\nÜgyelj rá, hogy ne ejtsd be a súlyt a negatív szakaszban, és ne akasszad ki a térdedet, mert mindkét esetben a térdízületed bánhatja a dolgot. A hátad legyen belefeszítve a támlába, akkor se emelkedjen el a csípőd, amikor beengeded a súlyt, mert ez az alsó hátra nézve veszélyes lehet!'),
(11, 'Egykezes evezés', 'onearm_seated_row.mp4', 'onearm_seated_row.jpg', 'Ülj be az evezőgépbe, támaszd meg a mellkasodat a támlán. Ragadd meg a karokat picivel a vállmagasságnál lejjebb. Ha szélesebben fogod a karokat, akkor a hátad belső része kapja a terhelés javát, míg ha szűkebben fogod meg őket, akkor a hátizom külsőbb régióit fogod tudni hatékonyabban megdolgoztatni.'),
(12, 'Tricepsznyújtás fej felett', 'overhead_tricep.mp4', 'overhead_tricep.jpg', 'Tarts a fejed fölött két kézzel egy kézisúlyzót a tárcsák alatt fogva úgy, hogy a felkarjaid a lehető legközelebb legyenek a füledhez. Franciarúddal is végezheted a gyakorlatot. Ereszd hátra a súlyzót a hátad mögé, majd újra emeld vissza fel, a karod kinyújtott állapotáig. Felkarjaid eközben végig maradjanak függőleges helyzetben, mozdulatlanul. A gyakorlathoz használható egy speciálisan meghajlított ún. kétkezes tricepsz-rúd is, ez a nagyobb súlyok használatakor biztosabb fogást tesz lehetővé. Vigyázz, hogy a negatív szakasz ne legyen túl gyors, mivel ez könnyen húzódáshoz vezethet. Emellett ha közeleg a teljes kifáradás (bukás) akkor jó ha állnak mögötted segíteni, nehogy a fejeden landoljon a súlyzó - a tricepsz ereje nagyon hirtelen tud egyszer csak elfogyni teljesen!'),
(13, 'Tárogatás', 'pec_fly.mp4', 'pec_fly.jpg', 'Ülj le kényelmesen az ülő mellgépre. Az alkarodat felfelé tartva fogd meg a gép fogantyúit. Ha fogantyús gépen dolgozol akkor egyszerűen fogd meg a fogantyúkat úgy, hogy a csuklód kb vállmagasságban legyen. A mellizom megfeszítésével nyomd össze a karokat. Lassú, ellenőrzött mozgással engedd vissza a karokat a kiinduló helyzetbe. Más típusú, nem kartámlás gépeken a kart nyújtva, vagy ahhoz közeli állapotban kell tartani, és a két kezedet kell közelíteni egymáshoz. A tárogatás gépen annyiból tud többet, azaz mást, mint a kézisúlyzós változat, hogy itt a csúcsösszehúzódás pillanatában is terhelve van a mellizom. Kipróbálhatod egy karral is a gyakorlatot - így jobban keresztbe tudod húzni a karodat, és még erősebb összehúzódást tudsz így elérni!'),
(14, 'Húzódzkodás', 'pullup.mp4', 'pullup.jpg', 'Fogd meg a rudat a vállszélességnél nem szélesebb fogással, a tenyered nézzen magad felé. Használhatsz háromszög fogantyút is - amennyiben a hátad erősítése a fő cél, és nem a bicepszedé, akkor ez a megoldás még jobb is. Engedd teljesen megnyúlni a hátizmokat, majd a hátad erejével húzd fel magad, amennyire csak lehetséges. Legjobb ha a mellkasod megérinti a rudat. Utána lassan engedd vissza magad, ügyelve a hátizom megnyúlására. Ez a gyakorlat valamennyivel könnyebb, mint a széles fogással végzett húzódzkodás, így célszerű előbb szélesen, majd utána szűken húzódzkodni az edzéseden - hacsak nem kifejezetten gyengéd a gyakorlat, ilyenkor veheted az edzésed elejére is. Ha a húzódzkodás fejlesztése a célod, mert saját testsúllyal még nem vagy képes szabályosan végrehajtani a gyakorlatot, vagy hasonló hatású alternatívát keresel, helyettesítheted azt szűk fogású mellhez húzással.'),
(15, 'Evezés', 'row.mp4', 'row.jpg', 'A lábad legyen kb. vállszélességnyire terpeszben, és hajolj előre minimum 45 fokos szögig, de ha bírod derékkal, akkor a törzsed vízszintes pozíciójáig is előrehajolhatsz. Hajlítsd be kissé a térdeidet, hogy a hát alsó részében lévő szükségtelen feszültség eltűnjön. Ragadd meg a rudat vállszélességben úgy, hogy a tenyered befelé nézzen. A karodnak egyenesen kell lógnia a mozgás kezdetekor.Húzd fel a rudat a hasad/mellkasod irányába oly módon, hogy a könyöködre koncentrálsz a mozdulat egész ideje alatt. Ez fog segíteni abban, hogy kikapcsold a mozgásból a bicepszedet amennyire lehet. Amikor a rúd megérintette a törzsedet, lassan engedd vissza a kiinduló pozícióba. Semmiképpen se segíts e a törzseddel a mozgásba - ez a hatékonyságot is csökkenti, ellenben a sérülésveszélyt jelentősen megnöveli. inkább csökkentsd a súlyt, ha másképp nem megy.'),
(16, 'Egykezes vállbólnyomás', 'single_arm_shoulder_press.mp4', 'sa_shoulder_press2.jpg', 'Tarts egy pár egykezes súlyzót vállmagasságban, állj kis terpeszállásba, egyenes háttal, miközben egyenesen előre nézel. Nyomd ki a súlyzókat a fejed fölé, majd engedd vissza a súlyzókat a kiinduló helyzetbe. A felső ponton ne akaszd ki a könyöködet, tehát a karjaidat ne nyújst ki teljesen a mozgástartomány felső holtpontján! A gyakorlat ülve is végezhető, kevésbé terheli a hátat. Alaposan melegítsd be a törzsedet, mielőtt ezt a gyakorlatot végzed. Ez a gyakorlat nagyobb mozgástartományt tesz lehetővé, mint a mellről nyomás, ezért fokozottan figyeljünk a helyes kivitelezésre, a súlyok helyes megválasztására az esetleges sérülések elkerülése érdekében. A túl nagy súlyok használata könnyen kizökkenthet minket a nyomás párhuzamosságából.'),
(17, 'Guggolás', 'squat.mp4', 'squat.jpg', 'Állj kiegyenesedve egy kétkezes súlyzó rúdját egyensúlyozva a nyakad mögött a hátadon keresztben, és a recézett rúdrészt a súlytárcsák közelében fogva. Tedd sarkaidat egymástól 30-50 cm-re úgy, hogy lábfejeid kissé kifelé mutassanak. Szemeddel nézz egy pontra magad elé, szemmagasságnál kicsit feljebb, és tartsd tekintetedet azon a ponton az egész mozgás során. Ezután lassan hajlítsd be térdedet, és ereszd le tested teljes guggolásba. Tartsd a törzsedet kihúzva, a hátadat egyenesen, és fejedet felfelé (a szem egy ponton való rögzítése segíti ezt) az egész mozgás folyamán. Ha combjaid a padlóval való vízszintes helyzeten túlhaladtak már, akkor lassan emelked fel a kiinduló helyzetbe. Igyekezz a sarkadat mindig a padlón tartani. Ha nem elég rugalmas a bokád, akkor nagyon nehéznek fogod találni a guggolás közbeni egyensúlyozást. Fokozni tudja az egyensúlyozás biztonságát, ha a sarkaddal egy 5x10 cm-es deszkára állsz.'),
(18, 'Tricepsz letolás csigán', 'tricep_pushdown.mp4', 'tricep_pushdown.jpg', 'A csigás letolás az egyik legelterjedtebb tricepsz-fejlesztő gyakorlat, bár sokan megkérdőjelezik hatásosságát. Kiválóan képes hangsúlyozni a jellegzetes \"lópatkót\". Elsősorban izolációs gyakorlatként érdemes rá tekinteni. Kiinduláskor úgy fogd meg a készülék rúdját, hogy kezeid 5-20 cm-re legyenek egymástól. Nyomd le a rudat egészen addig, amíg a karjaid ki nem egyenesednek. Engedd vissza a súlyt, és ismételd meg a mozdulatot. A legtöbben e gyakorlat során a könyöküket szorosan az oldalukhoz szorítják, de néhányan viszont oldalt kinyomják és \"belehajolnak\" a mozdulatba. Fontos azonban, hogy a könyök mozdulatlan legyen.'),
(19, 'Kábeles evezés', 'seated_row.mp4', 'seated_row.jpg', 'Ezt a gyakorlatot hosszú kábeles géppel kell végezni. Rögzítsd a lábadat a készüléken, majd húzd a fogantyút a tested középső része felé, vízszintes irányban. Maradj ebben a helyzetben egy másodpercig, majd engedd a karodat lassan kiegyenesedni, amíg a széles hátizmok meg nem nyúlnak teljesen. Húzd be a fogantyút újból, és ismételd a mozdulatot. A karok kinyúlásakor próbálj meg arra törekedni, hogy a hátizom is megnyúljon, ne csak a karodat nyújtsd ki. A gyakorlat végezhető egykezes változatban is, így maximálisan rá tudunk koncentrálni a célizomra, és nem mellékesen, még hátrébb tudjuk húzni a fogantyút, ami még erőteljesebb izom összehúzódást eredményez. A kábeles evezés szűken az erre alkalmas fogantyúval végezve főleg a hátizom alsó részeit terheli, azonban a fogás szélességével tetszőlegesen dolgoztathatjuk meg az edzeni kívánt részeket.'),
(20, 'Vállból nyomás ülve', 'shoulder_press.mp4', 'seated_shoulder_press.jpg', 'Ülő helyzetben tarts két kézisúlyzót a vállaid magasságánál kicsit fentebb. Egyenes háttal, emelt fejjel ülj. Nyomd ki mind a két súlyzót egyszerre a fejed fölé. A gyakorlat végzése közben ne dőlj hátra. Engedd vissza a súlyokat, és folytasd a gyakorlatot egyenletes ütemben. Próbálj meg nem túlzottan homorítani a gyakorlat végzése közben, mivel ez sérülésveszélyes a hátra nézve. A karodat ne \"\"akaszd ki\", ne nyújtsd ki teljesen a mozdulat végén. Felesleges terhelés a könyöknek és a tricepsznek, miközben a vállizom munkája már jelentéktelen. Érdemes ügyelni továbá arra, hogy az alsó holtponton ne engedd túl mélyre a súlyt, mivel ez felesleges igénybevételnek teszi ki a vállad ízületeit. Mivel elég sérülékeny területről beszélünk, célszerű preventív jelleggel valamilyen ízületvédő készítményt alkalmazni, mielőtt nagyobb súlyok használatára adjuk a fejünket. A gyakorlat helyettesíthető mellről nyomással, vállgépen nyomással.'),
(21, 'Vállból nyomás állva rúddal', 'standing_shoulder_press.mp4', 'shoulder_press.jpg', 'Vállszélességű fogást vegyél fel a kétkezes súlyzón úgy, hogy a tenyered kifelé mutat, és a rúd keresztben fekszik vállad elülső részén. Nyomd egyenesen fel a súlyzót az arcod előtt, egészen addig, míg a karod kiegyenesedik, és a súlyzó közvetlenül a fejed fölött van. Lassan engedd vissza a kiinduló helyzetbe a súlyzót, és ismételd meg a mozgást az előírt ismétlésszámmal. Vigyázz, nehogy hátra hajolj, miközben a súlyzót felfelé nyomod. Ez könnyebbé teszi a mozgást, de megfosztja a válladat azon teher egy részétől, amit kapna, és a gerincedre is felesleges terhelést ró. Soha ne tartsd vissza a lélegzetedet! Mindig viselj súlyemelőövet is a derekad stabilitása érdekében. A gyakorlat helyetteesíthető mellről nyomással ülve, kézisúlyzós vállból nyomással.'),
(22, 'Letolás egyenes karral', 'upright_row.mp4', 'upright_row.jpg', 'Állj meg a felső csiga előtt szemben. Egy kétkezes egyenes rudat, vagy egy kötelet is használhatsz a gyakorlathoz. Dőlj előre kb 45 fokban. Nyújtott karral ragadd meg a rudat vagy kötelet. Merev karral a hátizom erejével húzd le magad elé (vagy mellé, ha kötelet használsz) a karodat, és amikor az alsó ponthoz értél, feszíts rá a hátadra. Lassan engedd vissza a karjaidat, és hagyd, hogy a hátizom teljesen megnyúljon. Magas ismétlésszámot alkalmazva egészen másféle érzetet kelt a mozdulat a hátadban, mint a többi hátgyakorlat. A gyakorlat kivitelezhető váltott karos verzióban is.'),
(23, 'Zercher pin guggolás', 'zercher_squat.mp4', 'zercher_squat.jpg', 'Melyik mozgásra hasonlít ez a guggolás?\r\nFelemeled a rönköt a földről magadhoz szorítod felállsz vele és elviszed a táborhelyre tüzet rakni');

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sportok`
--

CREATE TABLE `sportok` (
  `id` int(11) NOT NULL,
  `megnevezes` varchar(30) NOT NULL,
  `rovid_leiras` varchar(100) NOT NULL,
  `reszletes_leiras` varchar(500) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `video` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `sportok`
--

INSERT INTO `sportok` (`id`, `megnevezes`, `rovid_leiras`, `reszletes_leiras`, `kep`, `video`) VALUES
(1, 'Kézilabda', 'A kézilabda egy labdajáték. A labdát csak kézzel szabad dobni, a kapus kivételével lábbal nem szabad', 'A kézilabdapálya 40x20 méteres, téglalap alakú, körülötte biztonsági zónákkal. A kapuelőtér 6 méterre a kaputól van, csak a kapus tartózkodhat benne. A szaggatott szabaddobási vonal 9 méterre, a hétméteres vonal 7 méterre a kaputól van. A középvonal a pályát két részre osztja, az oldalvonalak hosszabbak. A cserevonal 4,5 méterre a felezővonalról húzódik.\r\n\r\nA játékidő 16 éven felül 2x30 perc, fiatalabbaknál rövidebb, 10 perces szünettel. A játékidőt megszakítások alatt is mérik, de ha hosszabb s', 'szabiDob.jpg', 'kezilabda.mp4'),
(2, 'Erőemelés', 'Az erőemelés (powerlifting) egy olyan erőnléti sport, amely a három alapvető gyakorlat köré épül: gu', 'Az erőemelés (powerlifting) egy erőnléti sport, amely három alapgyakorlatra épül: guggolás, fekvenyomás és felhúzás. A sportolók célja, hogy mindhárom gyakorlatban a lehető legnagyobb súlyt emeljék, és az összesített legnagyobb súly alapján dől el a verseny. Minden versenyző három próbát végezhet minden gyakorlatból, és az eredményét a legnagyobb sikeres emelés határozza meg.\r\n\r\nAz edzések a három alapgyakorlatra építenek, a helyes technika és a mentális felkészültség kulcsfontosságú. Az erőemel', 'bench_press.jpg', 'powerlifting.mp4'),
(3, 'Testépítés', 'A testépítés olyan sportág, amely a test izomtömegének növelésére és formálására összpontosít. A spo', 'A testépítés egy olyan sport, amely a test izomtömegének növelésére és formálására összpontosít, elsősorban súlyzós edzésekkel. A sportolók célja, hogy a megfelelő edzésmódszerekkel és étrenddel növeljék az izomtömeget, miközben csökkentik a testzsírt, hogy izmaik jól láthatóvá váljanak. A testépítés nemcsak az erőn, hanem az esztétikai célnak is nagy szerepe van, az izmok formálására és részletgazdag kidolgozására helyezve a hangsúlyt. Az edzések mellett a sportolók speciális diétát követnek, a', 'lat_pulldown.jpg', 'testepites.mp4'),
(4, 'Erősember', 'Az erősember sportág egy erőnléti verseny, amelyben a versenyzők különböző kihívások során mérik öss', 'Az erősember sportág egy extrém erőnléti verseny, amelyben a versenyzők különböző, a mindennapi életben előforduló nehéz feladatokat végeznek el, de olyan mértékben megterhelve, hogy valódi erőpróbát jelentenek. A sportágban a versenyzők súlyos tárgyakat emelnek, cipelnek, húznak, forgatnak vagy más módon mozgatnak, gyakran nemcsak a tiszta erő, hanem az állóképesség és a technikai tudás is szerepet kap. A versenyek során előfordulhatnak olyan feladatok, mint autóemelés, óriási kősziklák cipelés', 'sa_shoulder_press2.jpg', 'strongman.mp4');

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
-- A tábla indexei `sportok`
--
ALTER TABLE `sportok`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `gyakid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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

--
-- AUTO_INCREMENT a táblához `sportok`
--
ALTER TABLE `sportok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
