-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 12. 11:46
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
-- Tábla szerkezet ehhez a táblához `reggelik`
--

CREATE TABLE `reggelik` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) DEFAULT NULL,
  `kep` varchar(500) DEFAULT NULL,
  `figyelemfelkeltes` text DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `hozzavalok` text DEFAULT NULL,
  `elkeszites` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- A tábla adatainak kiíratása `reggelik`
--

INSERT INTO `reggelik` (`id`, `nev`, `kep`, `figyelemfelkeltes`, `leiras`, `hozzavalok`, `elkeszites`) VALUES
(1, 'Málnás-Fehérjés Tejberizs', 'malnasFeherjesTejberizs.jpg', 'Ebben a málnás tejberizsben rengeteg a fehérje. Imádni fogod a krémes állagot valamint az édes vaníliás kása és a kissé savanykás málna ízkombinációját.', 'Mit készítsünk reggelire? Ha klasszikus zabkását szoktál enni, most próbálj meg változtatni, és a zabpelyhet rizzsel helyettesíteni. Bár az elkészítése kicsit több id?t vesz igénybe, garantáljuk, hogy az eredmény megéri. A krémes, vaníliás rizs fehérjében sem szenved hiányt. És ha még málnát is teszel rá, kész a tökéletes reggeli.', '• 300 ml víz\n• 150 ml zsírszegény tej\n• 60 g természetes jázmin rizs\n• 60 g fagyasztott málna\n• 60 g vaníliás fehérjepor\n• 30 ml Agavé szirup\n• vanília aroma ízlés szerint', 'Öblítsük le a jázmin rizst folyó vízben. Majd forraljunk fel 300 ml vizet egy lábasban, és adjuk hozzá a rizst, és közepes lángon f?zzük, amíg a rizs majdnem az összes vizet felszívja. Ez nagyjából 10-15 perc.'),
(2, 'Lédús almás szelet fehérjével', 'almásSzelet.jpg', 'Ez a puha édes finomság minden desszertimádónak ízleni fog. A szaftos alma és a fehérjetészta keveréke szó szerint mennyország a szájban.', 'Ez a csodásan édes desszert az alma minden szerelmesét rabul ejti. Elkészítése egyszer?, az eredmény pedig téged is levesz a lábadról. A ropogós tészta, a reszelt alma és a tojásfehérjével kevert krémtúró együttesen az ízek tökéletes harmóniáját teremti meg. Ha olyan finomságot keresel, amelyet kávé mellé, nassolnivalóként vagy egészséges reggeli részeként is fogyaszthatsz, az almás morzsasüti a tökéletes választás számodra.', '• 220 g teljes ki?rlés? tönkölybúzaliszt\n• 70 g eritrit\n• 50 g ghí\n• 30 g vaníliás fehérjepor\n• 4-5 ev?kanál tej\n• 1 tojás\n• 1 teáskanál süt?por\n• 600 g alma\n• 30 g vaníliás fehérjepor\n• 2 teáskanál fahéj', 'Kezdjük a tészta el?készítésével. Egy nagyobb tálban keverjük össze az összes száraz hozzávalót, tehát a lisztet, a fehérjét, az eritritet és a süt?port. Adjuk hozzá az olvasztott és kih?lt ghít, a tojásokat és a tejet. Ezután kézzel dolgozzunk bel?le sima és nem ragadós tésztát. Ha túl ragacsos, szórjunk hozzá még egy kis lisztet. Ha szétmorzsolódik, adjunk hozzá még egy kis tejet. Tegyük a tésztát a h?t?be és kb. 15 percig pihentessük. Közben elkészíthetjük az almatölteléket.\n\nHámozzuk meg és reszeljük durvára az összes almát. Hagyjuk egy kicsit pihenni, majd nyomkodjuk ki a felesleges levet. Ezután adjuk hozzá a fehérjét és a fahéjat majd alaposan keverjük össze. Vegyük ki a tésztát a h?t?b?l, osszuk két részre, és nyújtsuk ki téglalap alakúra, a süt?forma méretére. A receptben 25×30 cm-es tepsit használtunk.\n\nBéleljük ki a forma alját süt?papírral, majd helyezzük bele az egyik téglalap alakú tésztát és nyomkodjuk is ki a szélére.\n\nOszlassuk el az el?készített almát egyenletesen a tésztán.\n\nEzután jöhet rá a tészta második fele, nyomkodjuk le a széleket is. Amikor mindent el?készítettünk, tegyük 180°C-ra el?melegített süt?be, és 35-40 perc alatt süssük aranybarnára. Sütés után hagyjuk kih?lni, ideális esetben másnap reggelig, majd tálaljuk.'),
(3, 'Réteges almás sütemény', 'retegesAlmásSütemény.jpg', 'Ez a réteges almás sütemény olyan hihetetlen finom is, mint amilyennek látszik. A pihe-puha, nedves piskóta, a lédús alma, valamint a krémes túróréteg és a tejszínes krém keverékét mindenki imádni fogja. De vigyázat, mert gyorsan elt?nik az asztalról!', 'Mit?l lesz tökéletes egy sütemény? Egy puha, könnyed piskóta az alapja, amely már önmagában is csodálatos íz?. Erre kerül egy lédús almás réteg, majd egy túrós és tejszínes réteg, és máris kész a desszert, amely szinte elolvad a szádban. Nemcsak desszertként, hanem reggelire vagy uzsonnára is tökéletes.', '• 60 g sima liszt\n• 70 g barna cukor\n• 20 ml olívaolaj\n• 2 tojás\n• 1 ev?kanál langyos víz\n• 1 teáskanál süt?por\n• egy csipet só\n• 300 ml almalé\n• 200 g hámozott alma\n• 20 g vaníliás pudingpor\n• 150 ml habtejszín\n• 150 g zsírszegény túró\n• 20 g porcukor\n• 20 g étcsokoládé', 'Verjük fel a tojássárgáját barna cukorral amíg a keverék bes?r?södik és halványul. Adjuk hozzá a vizet és az olajat, és keverjük jól össze, hogy minden összeálljon. Szitáljuk át a sima lisztet, adjuk hozzá a süt?port, majd óvatosan keverjük bele a tojássárgájás keverékbe, hogy s?r? tésztát kapjunk. A tojásfehérjét egy csipetnyi sóval kemény habbá verjük, és keverjük óvatosan a tésztához, hogy megmaradjon a könny?sége. Tegyünk egy süt?formába (mi 20×20 cm-eset használtunk) süt?papírt, és óvatosan öntsük bele a tésztát. Tegyük be a 180°C-ra el?melegített süt?be és kb. 20 percig süssük.\n\nKözben kockázzuk fel a meghámozott almát, majd cukorral és 100 ml almalével kb. 10 perc alatt f?zzük puhára. Keverjük el a pudingport a maradék almalével, majd adjuk az almához, és f?zzük egy rövid ideig, amíg bes?r?södik. Ezt a keveréket oszlassuk el egyenletesen a kih?lt piskótalapon, és hagyjuk teljesen kih?lni.\n\nMár csak az utolsó réteget kell elkészíteni. Verjünk kemény habot a tejszínb?l és a porcukorból, majd óvatosan dolgozzuk bele a túrót. Ezt a krémes keveréket kell a kih?lt almás rétegre kenni. Tegyük h?t?be az egész süteményt legalább 2 órára. Reszeljünk étcsokoládét a tetejére közvetlenül tálalás el?tt. Vágj egy szeletet és élvezd!'),
(4, 'Rebarbarás crumble torta', 'rebarbarasTorta.jpg', 'Ha szereted az édes finomságokat, akkor ezt a tortát imádni fogod. A nedves piskóta, a zsenge rebarbara és a ropogós morzsás feltét kombinációja egyszer?en verhetetlen.', 'Az eper-, banán- és almatortát a legtöbben ismerjük. De miért ne próbálnánk ki valami kevésbé hagyományosat, és cserélnénk a gyümölcsöt rebarbarára? Sütés közben a rebarbara gyönyör?en megpuhul, és minden édesszájú embert elvarázsol az ízével. Puha piskótával és ropogós morzsával a tetején párosítva igazán kiemelkedik a többi torta közül.', '• 120 g 12% zsírtartalmú tejföl\r\n    • 100 g sima liszt\r\n    • 110 g barna cukor\r\n    • 90 g teljes ki?rlés? tönkölybúzaliszt\r\n    • 60 ml félzsíros tej\r\n    • 30 ml olívaolaj\r\n    • 1 tojás\r\n    • 1 tk. süt?por\r\n    • egy csipet só\r\n    • 350 g rebarbara\r\n    • 30 g finomszem? zabpehely\r\n    • 30 g vaj (használhatsz helyette ghít is)\r\n    • ½ tk. fahéj', 'Kezdjük a morzsás feltét elkészítésével. Keverjük össze a barna cukrot (40 g), a tönkölylisztet (30 g), a zabot és a fahéjat. Adjuk hozzá a hideg vajat, és az ujjainkkal gyúrjuk bele a száraz hozzávalókba, hogy morzsalékos keveréket kapjunk.\r\n    \r\n    Ezután készítsük el a tortatésztát. Egy tálban keverjük össze a tejfölt az olajjal, a tojással és a tejjel. Fokozatosan keverjük bele a cukrot, az átszitált sima és tönkölybúzalisztet, a süt?port, és egy csipet sót. Öntsük a tésztát egy kerek tortaformába (a miénk 20 cm átmér?j? volt). Az apróra vágott rebarbarát egyenletesen eloszlatjuk a tésztán (néhány darabot kissé belenyomhatunk a tésztába). Szórjuk a morzsás feltétet egyenletesen a rebarbarára. \r\n    \r\n    Süssük 180°C-on körülbelül 30 percig. Szeletelés és tálalás el?tt hagyjuk kih?lni a süteményt.'),
(5, 'Fehérjés gofri', 'feherjesGofri.jpg', 'A gofri kit?n? módja, hogy jól indítsd a reggelt. És ha egy jó adag fehérjét is adsz hozzá, bármelyik fitneszrajongót leny?gözheted vele. Már csak azt kell eldöntened, hogyan fogod díszíteni.', 'Szeretnéd feldobni a reggeleidet? Akkor ez a gofri a tökéletes recept számodra! Mi egy adag fehérjeport is adunk hozzá, így fitneszrajongók számára is remek választás, a banán pedig arról gondoskodik, hogy puha és habkönny? legyen. Ez a gyors és könny? recept téged is garantáltan rabul ejt!', '• 100 g (kb. 1 darab) érett banán\n• 30 g (1 adagolókanálnyi) vaníliás fehérjepor\n• 20 g zabpehely\n• 1 tojás\n• 1/2 tk. süt?por\n• repceolaj f?z?spray\n• görög joghurt\n• friss gyümölcs\n• kókuszszirup', 'Els? lépésként robotgépben ?röld meg a zabpelyhet. Azután a banánból és a tojásból készíts sima keveréket, és add hozzá a meg?rölt zabpehelyhez. Ezután mehet hozzá a fehérjepor és a süt?por is. Melegítsd fel a gofrisüt?t, és fújd be olajjal. Egyenletesen oszlasd el benne a tésztát, és készíts 4 gofrit. Addig süsd, amíg aranybarna és finom ropogós nem lesz.\n\nIsmételd meg ezt a lépést, amíg el nem fogy a tészta. Ha kész vagy, helyezed a gofrit egy tányérra, és jöhet a feltét ízlés szerint. Mi a klasszikus görög joghurtos, gyümölcsös, kókuszszirupos megoldást választottuk, de nem hibázhatsz ZERO önteteinkkel, vajainkkal és liofilizált gyümölcseinkkel sem.'),
(6, 'Sós, fehérjés palacsinta spenóttal, lazaccal és tükörtojással töltve', 'extraPalacsinta.jpg', 'A spenóttal, lazaccal és tükörtojással töltött palacsinta tökéletes választás mindazoknak, akik szeretik a sós reggeliket. Megfelel? mennyiség? fehérjét biztosít, ami praktikus edzés el?tt vagy után.', 'Mi imádjuk a lekvárral, túróval vagy mogyoróvajjal töltött palacsintát. A palacsintát azonban akkor is élvezheted, ha nem rajongsz az édes finomságokért. Erre az esetre készítettünk egy spenóttal, lazaccal és tükörtojással töltött palacsinta receptet. Tele van fehérjével, finom az íze, így reggelire és ebédre is tökéletes.', '• 100 ml zsírszegény tej\n• 50 g gluténmentes zabliszt\n• 30 g ízesítés nélküli fehérjepor\n• 1 tojás\n• egy csipet szárított bazsalikom\n• egy csipet fekete bors\n• egy csipet só\n• f?z?olaj spray a serpeny? zsírozásához\n• 250 g bébispenót\n• 100 g füstölt lazac (lazac konzervet is használhatsz)\n• 2 tojás\n• 2 gerezd fokhagyma\n• egy csipet só\n• egy csipet fekete bors', 'Egy tálban keverjük össze a lisztet a fehérjeporral, sóval, fekete borssal és bazsalikommal. Ezután adjuk hozzá a tojást és a tejet a száraz hozzávalókhoz és keverjük össze alaposan.\n\nEzután készítsük el? a serpeny?t, fújjuk be egy kis olívaolaj f?z?spray-vel, és melegítsük, amíg forró nem lesz. Ezután süssük a tésztát mindkét oldalán aranybarnára (ismételjük meg, szóval két palacsintánk lesz az egész keverékb?l).\n\nHa elkészült a palacsinta, elkezdhetjük elkészíteni a tölteléket. Egy serpeny?ben alacsony h?fokon megpároljuk a bébispenótot. Amikor a spenót elkezdi kiadni a levét, adjuk hozzá a zúzott fokhagymát, és f?szerezzük egy csipet sóval és borssal. F?zzük még egy kis ideig, hogy az ízek összeérjenek.\n\nA tojásokat külön készítsük el egy serpeny?ben, tükörtojás stílusban (ízlés szerint sózzuk és borsozzuk). Ezután hozzáláthatunk a palacsinta töltéséhez. Terítsük szét a palacsintát, el?ször helyezzük rá a párolt spenótot, majd a lazacot, végül a tükörtojást.\n\nIsmételjük meg a folyamatot, hogy 2 adag készüljön el, és máris fogyaszthatjuk. Remekül illik hozzá egy adag saláta.'),
(7, 'Fehérjés banántorta pohárban', 'poharBananTorta.jpg', 'Tippeket keresel nassolnivalókra vagy luxus reggelikre? Itt egy tökéletes édes finomság, amely az ízlel?bimbóidat is gyönyörködteti és az izmaidat táplálja. Ideális minden édesszájú számára.', 'Ma ennek a csodálatos édességnek a receptjét készítettük el neked. A pohárdesszert alapja banán íz? piskóta, amelyet tökéletesen kiegészít a vaníliakrémes töltelék. Ez a fehérjében gazdag kombináció elnyeri az ízlel?bimbóid tetszését és az izmaidat is gyönyörködtetni fogja. Javasoljuk, hogy a poharakat már egy nappal korábban készítsd el, majd egyszer?en vedd ki ?ket a h?t?szekrényb?l. Egy luxus reggeli vagy nassolnivaló, amely karnyújtásnyira lesz.', '• 110 g finom tönkölybúzaliszt\n• 50 g xilit (édesít?szer)\n• 50 g vaj\n• 80 g vaníliás ízesítés? fehérjepor\n• 6 g süt?por\n• 1 tojás\n• 1 banán\n• egy csipet só\n• olajspray a tepsi kikenéséhez\n• 500 ml alacsony zsírtartalmú tej\n• 40 g vaníliás puding', 'Tegyük a xilitet, a tojást és a megpuhult vajat egy tálba, és alaposan keverjük össze. Ezután adjuk hozzá az összes száraz hozzávalót, vagyis a fehérjeport, a süt?port, a lisztet és egy csipetnyi sót, majd keverjük jól össze. Pépesítsünk egy banánt sima pürévé, és óvatosan keverjük bele a tésztába. Készítsük el? a tepsit, fújjuk be olajjal, és öntsük bele a tésztát, egyenletesen eloszlatva. Tegyük a 180 °C-ra el?melegített süt?be 30-40 percre, és süssük meg. A piskótát egy fapálcikával megszurkálva vizsgáljuk meg. Ha száraznak t?nik, a tortaalap elkészült. Ha nedves, akkor süssük tovább. Ha a piskóta elkészült, vegyük ki a süt?b?l, majd fejjel lefelé fordítva fordítsuk ki a tepsib?l, és hagyjuk kih?lni.\n\nMost már elkészíthetjük a krémtölteléket. Forraljunk fel 400 ml tejet a t?zhelyen. A maradék 100 ml tejben keverjük el a pudingport, majd ezt a keveréket öntsük a forró tejbe. Fokozatosan adjuk hozzá a fehérjeport, és óvatosan keverjük össze, és f?zzük egy darabig. Figyeljünk oda, hogy a krémtöltelékben ne legyenek csomók.\n\nA megsült piskótalapot apró kockákra vágjuk.\n\nMost már elkezdhetjük a rétegek elkészítését. Készítsünk el? három poharat, és készítsünk rétegeket a piskótakockák és a krémtöltelék váltakozásával, amíg az összes hozzávaló el nem fogy. Ha kész, hagyjuk a poharakat legalább egy órán át a h?t?ben állni. Ezután tálalhatjuk és fogyaszthatjuk is.\n\nTippünk: Ha egy éjszakán át a h?t?szekrényben hagyjuk a poharakat, a krémtölteléknek lesz elég ideje, hogy beszívódjon a piskótába, és simábbá tegye azt. A tetejét Zero sziruppal, diófélékkel vagy liofilizált gyümölcsökkel szórhatjuk meg.'),
(8, 'Spenótos tojásrántotta', 'spenototsRantotta.jpg', 'A tojás sokak, köztük a fitneszrajongók által kedvelt reggeli alapdarab. Ma megmutatunk egy egyszer? módszert, amellyel ezt az ízletes klasszikust egy teljesen új szintre emelheted.', 'Hogyan lehet feldobni a rántottát? Ma egy egyszer? csavarral, mindössze két további hozzávalóval luxus reggeli élménnyé varázsoltuk ezt a hétköznapi ételt. Esetünkben a spenótot és a parmezánt választottuk. Az eredmény igazán elragadó – gy?z?dj meg róla a saját szemeddel.', '• 3 tojás\n• 2 nagy marék bébispenót\n• 10 g parmezán\n• 1 ev?kanál olívaolaj\n• só ízlés szerint\n• ?rölt fekete bors ízlés szerint\n• friss zöldségek\n• kenyér', 'Melegítsük fel az olívaolajat egy serpeny?ben, és 2-3 percig pároljuk a bébispenótot. Ezután törjünk fel és verjük fel a tojást, majd adjuk a spenóthoz. F?zzük alacsony h?fokon, folyamatosan kevergetve, amíg a tojás be nem s?r?södik. Végül sózzuk és borsozzuk, szórjuk rá a reszelt parmezánt, és keverjük meg alaposan. Ha kész, az étel azonnal tálalható.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sportok`
--

CREATE TABLE `sportok` (
  `id` int(11) NOT NULL,
  `megnevezes` varchar(30) NOT NULL,
  `rovid_leiras` varchar(500) NOT NULL,
  `reszletes_leiras` varchar(3000) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `video` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `sportok`
--

INSERT INTO `sportok` (`id`, `megnevezes`, `rovid_leiras`, `reszletes_leiras`, `kep`, `video`) VALUES
(1, 'Erőemelés', 'Az erőemelés egy súlyemelő sport, amelyben a versenyzők három különböző gyakorlatban mérik össze erejüket: fekvenyomás, guggolás és felhúzás. A cél, hogy mindhárom gyakorlatban a lehető legnagyobb súlyt emeljék. A verseny során minden sportolónak három próbálkozása van mindegyik gyakorlatra, és az összesített legnagyobb sikeres emelt súly alapján dől el a győztes.', 'Az erőemelés egy súlyemelő sport, ahol a versenyzők három gyakorlatban – fekvenyomás, guggolás és felhúzás – mérik össze erejüket. A cél, hogy minden gyakorlatban a lehető legnagyobb súlyt emeljék. Minden sportolónak három próbálkozása van mindegyik gyakorlatra, és a legnagyobb sikeresen emelt súlyok alapján dől el a győztes.\r\nAz erőemelés a maximális erő fejlesztésére összpontosít, és a sportolók szigorú technikai szabályok szerint végzik a gyakorlatokat. A versenyek során a sportolóknak nemcsak a fizikai erejük, hanem a precíz technikai tudásuk is kulcsfontosságú. A versenyek során minden próbálkozás során a sportolóknak pontosan be kell tartaniuk a szabályokat, különben a próbálkozás érvénytelen lehet. Az erőemelés a fizikális felkészültségen túl mentális erőt is igényel, mivel a versenyzőknek képesnek kell lenniük koncentrálni és kezelni a nagy súlyok emelésével járó stresszt.', 'bench_press.jpg', 'powerlifting.mp4'),
(2, 'Testépítés', 'A testépítés egy olyan sport, amely a test izomtömegének növelésére és formálására összpontosít. A sportolók súlyzós edzésekkel dolgoznak a különböző izomcsoportokon, miközben figyelnek a táplálkozásra és a pihenésre is, hogy elősegítsék az izmok regenerálódását és növekedését. A testépítés célja nemcsak az erő növelése, hanem a test esztétikai megjelenésének javítása is.', 'A testépítés egy olyan sport és életmód, amely az izomtömeg növelésére és az izomformák kiemelésére összpontosít. A testépítők különböző súlyzós edzésekkel dolgoznak, hogy fokozzák az izomfejlődést, miközben figyelmet fordítanak a megfelelő táplálkozásra, pihenésre és regenerációra. Az edzés során a célzott izmok erősítésére használt technikák közé tartoznak a sorozatok, ismétlések, valamint a különböző súlyzós gyakorlatok, mint például a fekvenyomás, guggolás, felhúzás, bicepsz- és tricepszgyakorlatok.\r\nA testépítés nem csupán a fizikai erő növelésére irányul, hanem az esztétikai célok elérésére is, mint például a test szimmetriájának és izomtónusának javítása. A sportolók az edzések mellett speciális diétát követnek, amely gazdag fehérjékben és más tápanyagokban, amelyek elősegítik az izomépítést és a regenerációt. A pihenés és a megfelelő alvás szintén kulcsfontosságú, mivel az izmok növekedése az edzés utáni regenerációs időszakban történik.', 'lat_pulldown.jpg', 'testepites.mp4'),
(3, 'Erősember', 'Az erősember sport egy extrém erőnléti versenysport, amelyben a versenyzők különféle kihívásokkal mérik össze fizikai erejüket. A sportban a versenyzők olyan feladatokat hajtanak végre, amelyek az egész test erejét igénylik, például óriási súlyok emelése, hatalmas sziklák, fák vagy autók mozgatása, illetve különböző nehéz tárgyak, mint például homokzsákok vagy kerekek cipelése.', 'Az erősember sport egy extrém erőnléti versenysport, amelyben a versenyzők különféle kihívásokkal mérik össze fizikai erejüket. A sportban a versenyzők olyan feladatokat hajtanak végre, amelyek az egész test erejét igénylik, például óriási súlyok emelése, hatalmas sziklák, fák vagy autók mozgatása, illetve különböző nehéz tárgyak, mint például homokzsákok vagy kerekek cipelése.\r\nA versenyek során különböző próbákat alkalmaznak, például a kocsihúzás, farönk cipelés, golyók emelése vagy teherautó húzása. Az erősember sport a maximális erő kifejlesztésére és alkalmazására összpontosít, és a versenyzőknek rendkívüli fizikai felkészültségre, erőnlétre, valamint mentális kitartásra van szükségük a sikerhez.\r\nA sportág rendkívül népszerű a világ számos országában, és nagy figyelmet kap, mivel az erősember versenyekben bemutatott teljesítmények gyakran extrém és elképesztő méretűek, ami lenyűgözi a közönséget.', 'sa_shoulder_press2.jpg', 'strongman.mp4'),
(4, 'Kézilabda', 'A kézilabda egy csapatsport, amelyben két csapat, mindegyik 7 játékossal, próbálja meg dobni a labdát az ellenfél kapujába. A mérkőzés célja, hogy több gólt szerezzenek, mint az ellenfél. A játékot egy szabályos méretű pályán játsszák, ahol a játékosok kézzel irányítják a labdát, és különböző passzokkal és lövésekkel próbálnak gólt szerezni. Olvass róla többet és próbáld ki te is!', 'A kézilabda egy dinamikus csapatsport, ahol két csapat (7 játékos mindkét oldalon) próbálja meg dobni a labdát az ellenfél kapujába. A játék célja, hogy több gólt szerezzenek, mint az ellenfél. A mérkőzés 2 félidőből áll, mindegyik 30 perces, és egy 20x40 méteres pályán zajlik.\r\n\r\nA játékosok kézzel irányítják a labdát, passzolnak és lövik a kaput. A támadók célja, hogy minél jobb helyzetekből szerezzenek gólt, míg a védekezők a támadók megakadályozására törekednek. A kapus speciális védőfelszerelést visel, és ő védi a kaput.\r\n\r\nA mérkőzés alatt szabálytalanságok esetén szabaddobásokat vagy hétméteres dobásokat ítélhetnek. A győztes az a csapat, amely több gólt szerez a mérkőzés végére, döntetlen esetén hosszabbítás következhet.', 'szabiDob.jpg', 'kezilabda.mp4');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tizoraik`
--

CREATE TABLE `tizoraik` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `kep` varchar(255) DEFAULT NULL,
  `figyelemfelkeltes` text NOT NULL,
  `leiras` text NOT NULL,
  `hozzavalok` text NOT NULL,
  `elkeszites` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- A tábla adatainak kiíratása `tizoraik`
--

INSERT INTO `tizoraik` (`id`, `nev`, `kep`, `figyelemfelkeltes`, `leiras`, `hozzavalok`, `elkeszites`) VALUES
(1, 'Bulgursaláta pulykahússal', 'bulgurpulyka.jpg', 'Ha egy könnyen elkészíthet?, ízletes saláta receptet keresel, amelyben optimális arányban vannak makrotápanyagok is, akkor ezt az ízletes ételt ki kell próbálnod. Ebédre és vacsorára is tökéletes.', 'Egy salátának sosem kell unalmasnak lennie. És ez a recept remek példa is erre! Bulgur az alapja, amely nagyszer? szénhidrátforrás. De adtunk hozzá zöldségeket, pulykát és balkáni sajtot is. Így egy ízletes, az összes makrotápanyag tökéletes egyensúlyát biztosító ételt kapunk. Kiváló, táplálkozási szempontból kiegyensúlyozott ebéd vagy vacsora.', '• 250 g cseresznyeparadicsom\n• 155 g pulykamell saját levében\n• 100 g bulgur\n• 100 g fekete olajbogyó\n• 100 g balkáni sajt\n• 4 aszalt paradicsom\n• 1 uborka\n• friss bazsalikom ízlés szerint\n• só ízlés szerint\n• fehér joghurt\n• tejföl', 'Kezdjük a bulgurral. Öblítsük le és tegyük egy kis fazékba 300 ml vízben. Sózzuk meg, forraljuk fel, és f?zzük puhára kb. 15 perc alatt. Ne felejtsük el id?nként megkeverni, hogy ne ragadjon le az aljára. Közben el?készítjük a többi hozzávalót. Mossuk meg és vágjuk fel az uborkát és a paradicsomot. A cseresznyeparadicsomokat elég csak félbe vágni, az uborkát pedig apró kockákra. Ezután vágjuk az olajbogyót is félbe, a napon aszalt paradicsomot és a Balkáni sajtot pedig szintén apróra.\r\nTegyük az el?készített hozzávalókat egy tálba, és adjuk hozzá a f?tt és lesz?rt bulgurt. Sz?rjük le a vizet a pulykahúsról is. Ezután szeleteljük fel, és adjuk hozzá a tálban lév? többi hozzávalóhoz az apróra vágott bazsalikommal együtt. Keverjünk össze mindent, majd ízlés szerint sózzuk, és tálaljuk.\r\nTippünk: Ha a könnyedebb ételeket kedveled, a salátát f?szeres joghurttal, tejföllel vagy light majonéz öntettel is tálalhatod.');

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
-- A tábla indexei `reggelik`
--
ALTER TABLE `reggelik`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `sportok`
--
ALTER TABLE `sportok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tizoraik`
--
ALTER TABLE `tizoraik`
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
-- AUTO_INCREMENT a táblához `reggelik`
--
ALTER TABLE `reggelik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `sportok`
--
ALTER TABLE `sportok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `tizoraik`
--
ALTER TABLE `tizoraik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
