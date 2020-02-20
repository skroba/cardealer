-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 20, 2020 at 04:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `maker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pictures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pictures`)),
  `equipment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`equipment`)),
  `about` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `door` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gearchange` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mileage` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hp` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `euro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `security` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`security`)),
  `seats` int(11) NOT NULL,
  `aircon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `maker`, `model`, `fuel`, `volume`, `price`, `year`, `body`, `pictures`, `equipment`, `about`, `door`, `contact`, `added`, `gearchange`, `mileage`, `label`, `hp`, `color`, `insurance`, `euro`, `drive`, `security`, `seats`, `aircon`) VALUES
(5, 'Audi', 'a4', 'diesel', 1995, 7000, 2009, 'limousine', '[\"1581432608\\/8bf2d9dbe240fa8c3a054613c6d4aaf2.jpeg\",\"1581432608\\/7d0428c36579d76c1394a201cf6e33bd.jpeg\",\"1581432608\\/a4268637c670ea202a9f7b504262b2bd.jpeg\",\"1581432608\\/b8c2e113f797fc086b1a457a184f42e5.jpeg\",\"1581432608\\/3a395fc975f206c9d5568df40a73de7c.jpeg\",\"1581432608\\/8a7a18d6411f693903ee30d3d5e7e4cf.jpeg\",\"1581432608\\/71b03d072ef3b75dd298a6f6226eceb3.jpeg\",\"1581432608\\/80df612621a5b5ceda904c84fccbe819.jpeg\"]', '[\"Air Condition\"]', 'o kolima...', '4/5', '1', '', '5 shift manual', 0, '', 123, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(7, 'Alfa Romeo', '147', 'diesel', 1595, 1600, 2013, 'hatchback', '[\"1581432920\\/6a9d6eccb0ffdb506a3bf62ac1baad4c.jpeg\",\"1581432920\\/1f572ce444cbdee215be7e71e134adb5.jpeg\",\"1581432920\\/a336b13cdbedf6c83c34247c2f1801f0.jpeg\",\"1581432920\\/5cf68d04ec361cb57cf19f16daf3629f.jpeg\",\"1581432920\\/a903cd9a7a43d12888120325eb5b0acf.jpeg\",\"1581432920\\/33392bda52c8e60df8ec120567b17288.jpeg\",\"1581432920\\/38fd28a11f9b3aed4708c0931887a5bd.jpeg\"]', '[\"Isofix\"]', '1', '2/3', '2', '', '5 shift manual', 89000, '', 136, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(8, 'Audi', 'a6', 'diesel', 3000, 45000, 2018, 'limousine', '[\"1581495737\\/aa5d404b480e029ac15adbf897134c9f.jpeg\",\"1581495737\\/9806a7bf1f4ac7ec8c25e248681fde69.jpeg\",\"1581495737\\/7e84e8a92866ca758fa270bbdc8b9f56.jpeg\",\"1581495737\\/657b79e0d2a30279e87869fa61cf5bba.jpeg\",\"1581495737\\/210e883e4227327c7c6673e7538e130f.jpeg\",\"1581495737\\/7a6bf0fbba81c6ceaf5e5e1af7339c23.jpeg\",\"1581495737\\/48d62e888a056cac4f987b3824f9feda.jpeg\",\"1581495737\\/181c43cddf9458a630a85f40a795bd27.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'MOTOR PERFEKTAN\r\nVELIKI SERVIS NA 201000 KM 2018 GOD\r\nAUTOMATSKI MENJAC PERFEKTAN\r\nLED I XENON FAROVI PREDNJI\r\nLED FAROVI ZADNJI\r\nPARKING SENZORI\r\nKAMERA ZA VOZNJU U RIKVERC\r\nKOZNI MF VOLAN\r\nTEMPOMAT\r\nSTART STOP\r\n2 KLJUCA\r\nSERVISNA ISTORIJA\r\n12.2011 GOD\r\nUVOZ BELGIJA\r\nMEH. I TEHNICKI PERFEKTAN', '4/5', '2', '', '5 shift manual', 8000000, '', 55, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(9, 'Bmw', '118', 'gasoline', 1599, 8000, 2009, 'hatchback', '[\"1581497490\\/9f92118750075dfd789121d3a7278fb8.jpeg\",\"1581497490\\/0347b68302fcc2535bd942f811158949.jpeg\",\"1581497490\\/dbf090d1d0ed49cebc528a31a6acfda2.jpeg\",\"1581497490\\/b1e97f6be622b41fce9ed89b095d8e11.jpeg\",\"1581497490\\/42989e8aa5821700bbf95a6f10a4a56e.jpeg\",\"1581497490\\/13cd996de1b56b4c375c5c088d67a222.jpeg\",\"1581497490\\/105734ecd0ce16119e9ad7b4fa11d927.jpeg\",\"1581497490\\/812d228ddd574263d7e6a8b9d88e4d02.jpeg\",\"1581497490\\/03353f28f2834a652d3d036ee9e3b103.jpeg\",\"1581497490\\/23ddd5c485bac9be4d54d2b1a8c7badd.jpeg\",\"1581497490\\/c5c8a3f2867c90860bc8171a10aa4ecd.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Naglašavamo da automobil ima prednju vuču i prodaje sa 8 aluminijumskih točkova sa gumama za leto i zimu.\r\nOd velikog paketa opreme izdvajamo:\r\n\r\nProfessional navigacija\r\nHead up display\r\nDVD/TV\r\nAutomatsko sklapanje retrovizora\r\nElektrohrom retrovizori sa automatskim zatamnjenjem\r\nGrejanje sedišta\r\nSistem zaštite pešaka\r\nPark assistent - pomoć pri parkiranju\r\nLed svetla\r\nStart stop\r\n\r\n***GARANTUJEMO***\r\n\r\n• Tehničku ispravnost\r\n\r\n• Legalnost vozila u zemlji i inostranstvu\r\n\r\n• Originalnost propratne dokumentacije\r\n\r\n\r\n***OPIS***\r\n\r\nUVEZEN IZ NEMAČKE\r\n\r\n• Redovno održavan u ovlašćenim servisima.\r\n• Kupcu na uvid SGS izvestaj koji detaljno svedoci o stanju vozila prilikom kupovine od leasing kuce.\r\n\r\n\r\n\r\n\r\n***OSTALE POGODNOSTI***\r\n\r\n• Carina i pdv su plaćeni, vozilo se registruje na ime kupca\r\n\r\n• Na vozilu je izvršen pregled AMSS i plaćeni su svi troškovi, Vama ostaje samo registracija\r\n\r\n• Kompletna usluga registracije vozila od tehničkog pregleda do odlaska u SUP\r\n\r\n• Kompletna organizacija i pomoć pri vađenju probnih tablica\r\n\r\n• Mogućnost provere vozila u ovlašćenom ili servisu po Vašem izboru', '4/5', '2', '', '5 shift manual', 40000, '', 69, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(10, 'Peugeot', '207', 'gasoline', 1400, 4000, 2010, 'hatchback', '[\"1581500529\\/eb6a7807764ab956e2c8e68f25b3575b.jpeg\",\"1581500529\\/1c43861accfb5e153ba6fc48de4c9bb4.jpeg\",\"1581500529\\/457f9c4cc325d1f17b57962fd9d16848.jpeg\",\"1581500529\\/8482b83d111435dbdaf116cee03c4627.jpeg\",\"1581500529\\/742e8637f8b37d58c9c9a9755ac25b99.jpeg\",\"1581500529\\/a8bd86d2ca229fc6d30a23bc2e7c77c6.jpeg\",\"1581500529\\/b6ffbab329325fc05fca34265cdc26b8.jpeg\",\"1581500529\\/fb64782a397336433011bfac758f61da.jpeg\",\"1581500529\\/a9c89884833a3837aedef95f30e7cd40.jpeg\",\"1581500529\\/c90f4c1b7f8001b332d9566a8de1fb5d.jpeg\",\"1581500529\\/e544ce5bc4811414e893ef6c953e0967.jpeg\",\"1581500529\\/2e7770227cde17be79940d67165fb015.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Vozilo iz uvoza sa kompletnom dokumentacijom za registraciju na ime kupca.\r\nVozilo je u odličnom stanju,bez daljih ulaganja,odličan paket opreme sa FABRIČKOM NAVIGACIJOM,kamerom za vožnju u rikverc,park senzorima,tempomatom,hands free uređajem za bežično telefoniranje,smart kee ulazak bez ključa i paljenje bez ključa,digitalna klima,crno nebo,led dnevna svetla,...\r\nDatum prve registracije je 28.05.2015 a godina proizvodnje je 2014 .\r\nZADNJA KLUPA JE SA 3 ODVOJENA SEDIŠTA KOJA SE SVAKO ZA SEBE POSEBNO POMERA I PODEŠAVA KAO PREDNJA,tako da možete podedšavati prtljažni prostor po potrebi.\r\nU zamenu dolazi u obzir vozilo do 2 000 ccm i 50 % vrednosti našeg.', '4/5', '2', '', '5 shift manual', 60000, '', 145, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(13, 'Fiat', 'Stilo', 'gasoline', 2000, 2000, 2005, 'hatchback', '[\"1581501764\\/6c6d6071ef229fb4d204fcb40233bb0d.jpeg\",\"1581501764\\/9245ef7634015b891a06ae8137a6d9f5.jpeg\",\"1581501764\\/80b59f3fe5658beaf32f1afa408ec459.jpeg\",\"1581501764\\/78c47f33f93d897c58d25db1437f74ef.jpeg\",\"1581501764\\/86537b950a1a0825201f76e9a8e3f05a.jpeg\",\"1581501764\\/2148f5bd54bd8e37899edbd79c0af164.jpeg\",\"1581501764\\/fd37683642e8a356347595d65ba12508.jpeg\",\"1581501764\\/b7a928bf81385801ab423753cd01196b.jpeg\",\"1581501764\\/fbd20f4bc5698afb0edf4a339f833e2c.jpeg\",\"1581501764\\/755101e5bcdadb2c4670a2c501232c0e.jpeg\"]', '[\"Alloy wheels\",\"ABS\"]', 'Vozilo iz uvoza sa kompletnom dokumentacijom za registraciju na ime kupca.\r\nVozilo je u odličnom stanju,bez daljih ulaganja,odličan paket opreme sa FABRIČKOM NAVIGACIJOM,kamerom za vožnju u rikverc,park senzorima,tempomatom,hands free uređajem za bežično telefoniranje,smart kee ulazak bez ključa i paljenje bez ključa,digitalna klima,crno nebo,led dnevna svetla,...\r\nDatum prve registracije je 28.05.2015 a godina proizvodnje je 2014 .\r\nZADNJA KLUPA JE SA 3 ODVOJENA SEDIŠTA KOJA SE SVAKO ZA SEBE POSEBNO POMERA I PODEŠAVA KAO PREDNJA,tako da možete podedšavati prtljažni prostor po potrebi.\r\nU zamenu dolazi u obzir vozilo do 2 000 ccm i 50 % vrednosti našeg.', '4/5', '2', '1581501764', '5 shift manual', 120000, '', 212, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic'),
(14, 'Ford', 'S-MAX', 'hybrid', 1500, 12000, 2010, 'estate', '[\"1581504567\\/60b79341575f4bac26175b3271c0e69a.jpeg\",\"1581504567\\/9ded5a76a6f3003007c69946fd7564ba.jpeg\",\"1581504567\\/3a4559a092a4d2bafbe90c7f96b5f913.jpeg\",\"1581504567\\/67844c540d7eaa0d718795c31f68e7af.jpeg\",\"1581504567\\/e7860e97802472a3ebd8a45c18bb09d4.jpeg\",\"1581504567\\/a258e242c53cb97a481939b39730811b.jpeg\",\"1581504567\\/80846b5c807df7ec274c78da482ca95f.jpeg\",\"1581504567\\/f7c86cd0a641499a8886ed9946866436.jpeg\",\"1581504567\\/861f7281991927bd10129cf636f9e082.jpeg\",\"1581504567\\/66134355d163a7f8f719778d13d0a316.jpeg\",\"1581504567\\/7f7c5c25a01b43a32f89381c2a03b444.jpeg\",\"1581504567\\/9a74426ba8cfc574d231e0e64881c4ec.jpeg\",\"1581504567\\/2238d5538872bbd7b66ae4ebe612e316.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', '*Vozilo je u odlicnom stanju.\r\n\r\n*Redovno servisiran u ovlascenom servisu bez dodatnih ulaganja.\r\n\r\n*Direktna kupovina od partnera iz Francuske, zagarantovano poreklo, kilometraza, na uvid kompletna istorija odrzavanja i fotografije vozila u trenutku kupovine.\r\n\r\n*Detaljan pregled vozila uradjen u nasem servisu po dolasku vozila u Srbiju.\r\n\r\n*Trend + paket opreme: kožni multifunkcionalni volan sa grejanjem volana, navigacija, dnevna svetla, hands free kljuc, elektricni podizaci, parking senzori sa grafickim prikazom napred i pozadi, tempomat, grejanje sedista, multimedija, start stop i jos dosta toga....\r\n\r\n*cena sa placenim porezom na prenos apsolutnih prava (na ime kupca).\r\n\r\n\r\n*** AUTOLAND-POSEBNA PONUDA FINANSIRANJA ***\r\n\r\n\r\n*** ZAKUP VOZILA ---AKCIJA DAJ 999EUR I VOZI: Depozit 999eura, period zakupa od 24 do 48 meseci. Podnošenje zahteva, odobrenje, potpisivanje,registracija i preuzimanje vozila na licu mesta !!!\r\nPonuda važi za fizička lica, pravna lica i preduzetnike.\r\n\r\n\r\n*** FINANSIJSKI LIZING: 25% učešće, 3.49% nominalna FIKSNA kamatna stopa. Ponuda važi za fizička lica, pravna lica i preduzetnike.\r\n\r\n\r\n*** BESKAMATNO finansiranje: 0% kamata, 0% troskovi obrade kredita*** -podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Period finansiranja do 36 meseci, iznos kredita od 1.000 do 5.000 eura u zavisnosti od vozila (informisite se kod prodavca za detalje ). Ponuda važi za fizička lica.\r\n\r\n\r\n***EURSKI kredit sa fiksnom kamatnom stopom od 4,50% sa periodom otplate do 84 meseci, minimalnim ucescem od 30% I troškom obrade kredita od 2,95% uključenim kroz mesečne rate. Podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Ponuda važi za fizička lica.\r\n\r\n\r\n***DINARSKI kredit 0% učešća, do 84 meseca period otplate, sa fiksnom kamatom 7.45% u dinarima I trošak obrade kredita 2.95% ukljucen kroz ratu. Podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Ponuda važi za fizička lica.\r\n\r\n***Kompletnu ponudu možete pogledati i na našem sajtu http://autoland.akkompresor.rs ***\r\n\r\nSva vozila su kupljena u Srbiji, prilikom otkupa detaljno pregledana u servisu .\r\nVozila poseduju kompletnu dokumentaciju, uredne servisne istorije I proverene kilometraže.\r\n\r\n\r\n***PISANA GARANCIJA OD GODINU DANA ILI 10000KM (na motor bez pratećih agregata) ZA SVA NAŠA VOZILA***\r\n\r\nHvala Vam na pregledu oglasa.\r\n\r\n*Kompresor Autoland doo se trudi da pruži maksimalnu tačnost informacija i podataka, s tim da se u potpunosti odriče bilo kakve odgovornosti za tačnost i/ili potpunost svih informacija/opreme jer su moguće nenamerne različitosti stvarnog proizvoda i opisanog na ovim stranicama.', '4/5', '3', '1581504567', '5 shift manual', 200000, '', 145, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(19, 'Ford', 'focus', 'diesel', 1595, 4300, 2010, 'suv', '[\"1581693872\\/891449cb26847712f1a38209e0718dcb.jpeg\",\"1581693872\\/89132ba92af32573e5905ab5e126e76d.jpeg\",\"1581693872\\/4334e17eb00f8219d51b7157f88d861b.jpeg\",\"1581693872\\/b0b20102d94fb723dbe45ef68fd1611a.jpeg\",\"1581693872\\/d916ae7345617621bfa8dba59e438955.jpeg\",\"1581693872\\/4792eaf4970639d52d97e07af46ed58d.jpeg\",\"1581693872\\/5ba1f9be2994652937e28ec79b70c12c.jpeg\",\"1581693872\\/ec55b6d5a77f35c9c84632f2f0f91bf7.jpeg\",\"1581693872\\/20bdcc70ff976f53b40db315a969feca.jpeg\",\"1581693872\\/46a619a211071ec921bc0fb5472101b5.jpeg\",\"1581693872\\/14096006747038d0bcfb126b17a21ea6.jpeg\",\"1581693872\\/57169d4019bbd61241b32942d8c0c2cc.jpeg\",\"1581693872\\/4d1844b37f16cb620dce7957c7e15b6a.jpeg\",\"1581693872\\/791fa940aee670a87a553cef69927c83.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Ford focus, prvi vlasnik, kupljen nov u Srbiji', '2/3', '1', '1581693872', '5 shift manual', 130000, '', 203, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(20, 'Alfa Romeo', '159', 'diesel', 1995, 10000, 2012, 'limousine', '[\"1582013563\\/5aa4cff7621c050e53a9764ebb422591.jpeg\",\"1582013563\\/10d9799b2d6ef103898213b1bef002dc.jpeg\",\"1582013563\\/f35f6771ef609f8bf781a2e12d040e86.jpeg\",\"1582013563\\/7dc96c53724304b5672f3aa2a8c1bc96.jpeg\",\"1582013563\\/f5ec73d9d9ab557b14437e29108b65ee.jpeg\",\"1582013563\\/fc838e216d1877a893b9901a12fe7f9a.jpeg\",\"1582013563\\/8deace6f666b84a29fd6e579b8357aff.jpeg\",\"1582013563\\/333ec603e70fc75949ea3dabb8f6d531.jpeg\",\"1582013563\\/96753c8607b2e0bf868cdd5320b7fda2.jpeg\",\"1582013563\\/5f9917b160a8a79a970a04a1d5532a48.jpeg\",\"1582013563\\/2e028a7e6d72984408572a81c90cb8d4.jpeg\",\"1582013563\\/6ec297380e0a7c811626b865cc839f55.jpeg\",\"1582013563\\/b629f122256cca8499d6e2a3404c3d01.jpeg\",\"1582013563\\/d6b0e9394eb45d2e7db1c94d35dc7235.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'alfa romeo 159 20 jtdm 170 ks uvezen na tockovima auto u odlicnom stanju uradjena zamena ulja i filtera ociscena usisna grana i eger ventil do zamene kaisa preostalo 35000 km pregledano sve na autu , tako da nema nikakvih ulaganja sedi i vozi sve 4 zimske gume 17ice i drugi set letnji guma na alu felnama 18ice/prvih par slika za vise informacija pozovi , Molim osobe sa viskom vremena i besplatnih sms da me zaobidju na sms ne odgovaram hvala,cena je sa jednim setom tockova drugi set uz doplatu', '4/5', '1', '1582013563', '5 shift manual', 128000, '', 100, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(21, 'Alfa Romeo', '159', 'diesel', 1995, 8900, 2008, 'limousine', '[\"1582013637\\/0f305781193a04313b85375f9feaa95e.jpeg\",\"1582013637\\/c40e6521c6ea7292d8a602c1cc68b8ea.jpeg\",\"1582013637\\/1d3c1fd5511fdb43c0067f6e565c62f4.jpeg\",\"1582013637\\/7e37f4b6e2e12fa63be1e5432e5d5ea1.jpeg\",\"1582013637\\/63996fdf0ab7392f6e2613dcde104dcc.jpeg\",\"1582013637\\/552ab7d7b17dbf9aea5cc1f26f1c3e3f.jpeg\",\"1582013637\\/149343550631b27f92f53e28c552b6f5.jpeg\",\"1582013637\\/c11d469ffdcec17877c9c112657f46c5.jpeg\",\"1582013637\\/9db8dd87436903dcfe35103c3e013625.jpeg\",\"1582013637\\/37cfcf082e1813e05bfb5294f2e021d9.jpeg\",\"1582013637\\/f9069a403becf9bc149fc8da7825f7b6.jpeg\",\"1582013637\\/b33b3b367cba224dd6c99e6d8c07166f.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\"]', 'Auto kupljen iz uvoza 2013, i od tada je u mom vlasništvu. Što se tiče mehanike auto je odličan, bez ulaganja (kupljeni su zadnji diskovi i pločice koji će biti zamenjeni ovih dana). Limarijski, na mestima su vidljive ogrebotine i manja oštećena, sve od gradske vožnje (vidite slike). Auto redovno održavan, poslednji veliki servis rađen na 200.000, a mali na 223.000 km. Na autu je zamenjen plivajući zamajac, stavljen original LUK-ov (1.000 EUR), što znači da ne treba da brinete i strepite o najskupljoj popravci. U poslednjih 7 godina, ne uzimajući u obzir potrošne delove, zamenjen je još samo EGR ventil.\r\n\r\nUz auto još dolaze poprečni nosači koji su na slikama i letnje gume (Tigar UHP).\r\n\r\nZa više informacija nazovite.', '4/5', '1', '1582013637', '5 shift manual', 140000, '', 100, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic'),
(22, 'Alfa Romeo', '159', 'diesel', 1595, 5600, 2009, 'limousine', '[\"1582013721\\/8feb9d1b3522cbfbd1b5c6c7f6aeb861.jpeg\",\"1582013721\\/29df2b8e80094e54c84313e16a39c1f1.jpeg\",\"1582013721\\/b9bc19e907b5e2226c1c3304a83e5346.jpeg\",\"1582013721\\/8d80aa12b0559ca031389254bd129995.jpeg\",\"1582013721\\/35a7dfc5c38c3b1768da0fdfc9f75c4a.jpeg\",\"1582013721\\/892e029b4607bb45723c4c02c5a18371.jpeg\",\"1582013721\\/fe33ab0f7935582880332e3f0264a54c.jpeg\",\"1582013721\\/e7ad807a4b6e65be78b2513136f0c747.jpeg\",\"1582013721\\/1445e177fb8e1f98a975319d820b8877.jpeg\",\"1582013721\\/67ba98d47af41519f4e67903b40a8f0e.jpeg\",\"1582013721\\/cc4de517bfb5372b0f76c90459ee30e8.jpeg\",\"1582013721\\/9041a2273426457efb8d9e646606a269.jpeg\",\"1582013721\\/cdc4a2c20c3ac1a0d6e45aff990b7937.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\"]', 'ALFA 159 2.0jtdM 170ks 2011god.-NAJNOVIJI MOTOR ZADNJE GENERACIJE-ODLIČNO STANJE .....GUME SVE 4 ODLIČNE....NOV AKUMULATOR.....MOTOR,TRAP I MENJAČ U ODLIČNOM STANJU......POSEDUJEM SLIKE PRI KUPOVINI U ITALIJI....2 KLJUČA.....CENA JE VEĆ SPUŠTENA I FIXNA !!!!!', '4/5', '1', '1582013721', '5 shift manual', 160000, '', 136, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(23, 'Alfa Romeo', '159', 'gasoline', 2995, 4400, 2010, 'estate', '[\"1582013879\\/a1ce27debf48cb4b646b44a301c62fb1.jpeg\",\"1582013879\\/4d008cbae1fff6e84c1f1bf2d92a203c.jpeg\",\"1582013879\\/4d47fad1b86a37d266eb98e315f11be9.jpeg\",\"1582013879\\/7863afc720443716a1c57b32ce32e2d3.jpeg\",\"1582013879\\/6b97cb7800970dc6255d069badc70c7a.jpeg\",\"1582013879\\/25f4a23f3a2bc1a14a3554c2972df128.jpeg\",\"1582013879\\/78369dcd7eaf7ac8bc3dfe03157c215f.jpeg\",\"1582013879\\/7a1b70e1103ac2fb4b6b464315031b4a.jpeg\",\"1582013879\\/7d1bf1b6a79709b19ffb6d7831535982.jpeg\",\"1582013879\\/446a2616c9f47ed7dad2309b3debd56e.jpeg\",\"1582013879\\/0a20a51c0e14cf3364db7db11079e290.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\"]', 'Alfa je korišćena u porodične svrhe, uglavnom za duža putovanja i maksimalno se vodilo računa o održavanju.U prilog tome ide i servisna knjižica, sva prateća dokumentacija, kao i posedovanje dva originalna ključa u funkciji.\r\n*Na 192350 km je kompletno pregledan auto: trap, kočnice, grejači, upravljački deo i tom prilikom uradjen je mali servis (svi filteri sa uljem) i kupljene su dve nove letnje gume za 16\" aluminijumske felne.Prilikom paljenja i gašenja ne čuje se zamajac i menjač savršeno radi.Budući vlasnik nema dodatnih ulaganja, jer do sledećeg servisa ima još 6000 km.\r\n*Pored standardne opreme (digitalne klime, ASP, ASR, Tempomata, el.podizača za sva stakla...), alfa ima i krovne nosače, fabričke parking senzore, hilholder(pomoc pri kretanju uzbrdo), prednje i zadnje maglenke, Usb priključak za slušanje muzike koji je povezan sa MP3 muzikom i Mf volanom, rashladnu pregradu ispod naslona za ruku, led osvetljenje table, kao i originalne Alfine patosnice.Unutrašnjost je maksimalno sačuvana, nepušački auto, svako dugme je u funkciji.\r\n*Sve u svemu odlično očuvan auto, atraktivne boje, za prave ljubitelje ovoga Italijanskoga modela.\r\nPrenos je obavezan.Srećna kupovina!', '4/5', '1', '1582013879', '5 shift manual', 202000, '', 121, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(24, 'Peugeot', '308', 'diesel', 1595, 3999, 2011, 'estate', '[\"1582014014\\/256ea951c23e2d8c5aace3873e4af38a.jpeg\",\"1582014014\\/0e2efe3045365888846006d0f2da1a5d.jpeg\",\"1582014014\\/012ed570a567e58de8825f6e1e039f44.jpeg\",\"1582014014\\/f482461b70840eee5a0bf565cc7b2424.jpeg\",\"1582014014\\/e74f674977f749afead7820bc81c7e6a.jpeg\",\"1582014014\\/6eca77a56bdf1dd972e5e6b9173b23c2.jpeg\",\"1582014014\\/36ccb56bcd07e712e78d0381a54c3805.jpeg\",\"1582014014\\/9fb794921d5cc419bce15f4d5984017d.jpeg\",\"1582014014\\/8527a2de9501e03991eeb6d986177e3d.jpeg\",\"1582014014\\/bedd42d01a083e87314193680e8c1806.jpeg\",\"1582014014\\/c03dcf4f010a282a9a774abcd5f219af.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', '*** Peugeot 308 1.6 blue HDi je u besprekornom stanju u svim segmentima !!! ***\r\n\r\n** Vozilo je uvezeno iz Nemačke.\r\n\r\n** Prodaje se na ime kupca, svi troskovi su placeni tako da kupcu ostaje samo registracija.\r\n\r\n** Ocarinjen na 146285km originalnih km.\r\n\r\n** 22.07.2014. datum prve registracije.\r\n\r\n** Datum proizvodnje 2014.godina, model za 2015.godinu!\r\n\r\n** Euro 6 norma\r\n\r\n** 2 kljuca\r\n\r\n** Odlican paket opreme\r\n~Navigacija sa mapama Srbije i ostatka evrope\r\n~Parkign senzori napred i pozadi\r\n~Led dioda napred i pozadi\r\n~Panorama\r\n~4x el.podizaci stakala\r\n~Tempmat\r\n~Mf.kozni volan\r\nitd\r\n\r\n** Izuzetno mali potrosac 5.1l/100km GRAD!!!\r\n\r\n** VOZILO JE APSOLUTNO ZA SVAKU PREPORUKU!\r\n\r\n** Za kupce iz Novog Sada pruzamo uslugu registracije vozila, a za kupce izvan Novog Sada obezbedjujemo probne tablice.\r\n\r\n** Za vise informacija pozovite eVerest AUTOMOBILE\r\n\r\n// Kontakt podaci //\r\n\r\neVerest Automobili\r\n\r\nGenerala Vasica 30\r\nVeternik - Novi Sad', '4/5', '1', '1582014014', '6 shift manual', 120000, '', 105, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(25, 'Peugeot', '308', 'diesel', 1995, 3998, 2013, 'hatchback', '[\"1582014100\\/816e73bc543a56e7f13617c1061173e9.jpeg\",\"1582014100\\/71a9ae11b51c77f51d6f09a72c9aee8a.jpeg\",\"1582014100\\/8d23d25d912837712c11dda42ab19936.jpeg\",\"1582014100\\/90f3c794ca567befff7737c851f1afbe.jpeg\",\"1582014100\\/ee706a0401354ea4b64c2a55f0038a29.jpeg\",\"1582014100\\/b65860e28bbe4d4d6113259b1f1e662a.jpeg\",\"1582014100\\/9d48967e4fa3155d48f77a61aab64185.jpeg\",\"1582014100\\/2717135e1cf03976d7daaca5b114a7fb.jpeg\",\"1582014100\\/8c307f68e674792ee1b9a4796f66872c.jpeg\",\"1582014100\\/104b5a0892b5176da9f7d42a8e83c568.jpeg\",\"1582014100\\/3cea022dd960ea327c589347579bb40d.jpeg\",\"1582014100\\/d84b9747c00e11be839552c7ff84a4b1.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Sunroof\"]', 'Auto u besprekornom stanju, bez ikakvih ostecenja ili bilo kakvih dodatnih ulaganja. Motor 1.6HDI sa 90ks i BEZ PLIVAJUCEG ZAMAJCA. Jako mali potrosac sa svega 5.5l gradske voznje. Busines paket opreme;\r\n- panorama krov\r\n- tonirana stakla\r\n- led dnevna svetla\r\n- gps - navigacija- usb- aux- sd\r\n- mape cele evrope i Srbije\r\n- hill holder kotrol\r\n- digitalna dvozonska klima\r\n- el retrovizori, podizaci\r\n- bluetooth\r\n- touch screen monitor\r\n- parking senzori sa vizuelizacijom prepreka\r\nI jos dosta opreme. Carina, porez i AMS sve zavrseno kupcu ostaje samo registracija. U istom danu kupcu obezbedjujemo svu potrebnu dokumentaciju za registraciju vozila i proba table.', '4/5', '1', '1582014100', '5 shift manual', 132222, '', 140, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic'),
(26, 'Peugeot', '308', 'diesel', 1995, 5600, 2012, 'hatchback', '[\"1582014170\\/6cbbc3c506d6a1801827618c7cd1e24c.jpeg\",\"1582014170\\/9e17ea4a1ed27e763ba050ffc2550c1c.jpeg\",\"1582014170\\/b1c71ba399cb6b355bc1dd3d1df1e667.jpeg\",\"1582014170\\/dff7fcce31f1d06c33ca6f9de35d6d20.jpeg\",\"1582014170\\/6d3340b54ed6d48f6e91f64a42b81ef6.jpeg\",\"1582014170\\/21fa0628a3439014ee1cb3ad6ccb80f1.jpeg\",\"1582014170\\/056582939a14b7b03d589bc7a6c0d294.jpeg\",\"1582014170\\/ca925cc9431c255d589a972efb1c38d8.jpeg\",\"1582014170\\/905323df6c8ba8d954f941b254550cc8.jpeg\",\"1582014170\\/e4d92e15f01e8e0952422515599f17a8.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'Auto uvežen iz Belgije,urađen mali i veliki servis, potpuno ispravan, dva seta dobrih guma apsolutno bez ikakvih ulaganja.', '4/5', '1', '1582014170', 'automatic', 129995, '', 140, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(27, 'Opel', ' astra', 'gasoline', 1599, 7000, 2013, 'estate', '[\"1582108451\\/59d8b323555e31f77e1a4bdb854f100b.jpeg\",\"1582108451\\/e9de421958093f050af4a6cfb3172764.jpeg\",\"1582108451\\/305da63262c0ad3ff119671ff0dd5c90.jpeg\",\"1582108451\\/198e568857482ac6f841db1a7cd07d3c.jpeg\",\"1582108451\\/24b8c73e275d548f3abce56a16c65b25.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'Vozilo je iz uvoza , placeni su svi troskovi tako da kupcu ostaje registracija .\r\nVozilo je u prvoj ( fabrickoj ) boji , bez ikakvih ostecenja .\r\nBoja vozila je jedinstvena , nijanse se prelamaju na suncu .\r\nEnterijer vozila je kao nov , cosmo .\r\n* na vozilu je uradjen mali servis ( naredni za 15000 km ) .\r\n* veliki servis ( naredni za 80000 km )\r\n* zamenjen je lanac sa setom ( naredna zamena izmedju 150000-200000km )\r\nSvi ugradjeni delovi su iz orginala .\r\nUradjena je kontrola ostalog .\r\nStavljene su nove , zimske gume .\r\nTako da na vozilu nema apsolutno nikakvog dodatnog ulaganja .\r\nMogucnost prevoza vozila na adresu kupca .\r\nMogucnost izdavanja probnih tablica u najkracem roku .\r\nMogucnost prodaje vozila na rate bez kamate .\r\nZa vise informacija nas kontaktirajte', '4/5', '1', '1582014468', '5 shift manual', 99000, '', 250, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(30, 'Opel', ' insignia', 'diesel', 1959, 12000, 2016, 'limousine', '[\"1582041443\\/a8ad1cfafa77438abfe0ef68b1fc1139.jpeg\",\"1582041443\\/9d8809195b9b0f191379b3f4898e6fcc.jpeg\",\"1582041443\\/512ff59fd3d63d079e11c6bbeed66c4f.jpeg\",\"1582041443\\/5082a9c84a8b9347b27d1d149a25714a.jpeg\",\"1582041443\\/e76518088a7fc1cfd87775649d0c2271.jpeg\",\"1582041443\\/c821bc2d0f632381dd26c35ff4e11580.jpeg\",\"1582041443\\/785b0bfed68eff5f2e84e5965c64936e.jpeg\",\"1582041443\\/253b968893c4c3bad80c26c8cdc3f3cf.jpeg\",\"1582041443\\/fe34ee93fd020684690177efd6e623a3.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\"]', 'Bla bla', '4/5', '2', '1582041443', '5 shift manual', 150000, '', 88, '', '04/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(31, 'Opel', ' insignia', 'diesel', 1595, 7400, 2010, 'limousine', '[\"1582100476\\/ea971763d2d436bf900eee1e8eb15084.jpeg\",\"1582100476\\/2129bf6edf649609d71a396564522e14.jpeg\",\"1582100476\\/6a1df9ed36b3037921c7d5aed659812c.jpeg\",\"1582100476\\/311b42f16db729038d781a1d0423f83a.jpeg\",\"1582100476\\/f5f4691de75f849dca2e13297aeb71b1.jpeg\",\"1582100476\\/8e160f4d0937706de8fc2b8c278e1a5e.jpeg\",\"1582100476\\/53d8a5b8efbfa5c1da492e412f0e46b7.jpeg\",\"1582100476\\/da11fa63cfc4d9beee96e1f036c9832d.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\"]', 'SAMO 176290 KILOMETARA SA DVA KODIRANA KLJUCA, SERVISNOM KNJIZICOM I KOMPLETNOM\r\nDOKUMENTACIJOM ODRZAVAN I SERVISIRAN U VOLKSVAGENOVOM PREDSTAVNISTVU U SVAJCARSKOJ...\r\n\r\nNA AUTU SVE BESPREKORNO FUNKCIONISE, BEZ IKAKVIH HAVARIJA, OGREBOTINA I ULAGANJA, BUKVALNO JE KAO NOV...\r\n\r\nAUTOMATSKA KLIMA, TEMPOMAT, RADIO CD FABRICKI, ALUMINIJUMNSKE FELNE I JOS MNOGO TOGA...\r\n\r\n103 KW - 140 PS - 6 BRZINA MANUELNI\r\n\r\nAUTO JE OCARINJENO, PLACEN PDV I POSEDUJE UVERENJE IZ AMSS...\r\nPLACENI SU SVI TROSKOVI CARINE + PDV + AMSS...\r\nKUPCU PREOSTAJE SAMO REGISTRACIJA BEZ IKAKVIH DODATNIH TROSKOVA...\r\n\r\nSVAKA PREPORUKA ZA OVAJ AUTO...\r\n\r\nGARANTOVANA LEGALNOST AUTA I MOGUCA JE SVAKA VRSTA PROVERE...\r\n\r\nSVA NASA AUTA U PONUDI DOVEZENA SU LICNO I NA TOCKOVIMA...\r\n\r\nMEHANICKI I OPTICKI JE U TOP STANJU...\r\n\r\nPRI KUPOVINI AUTO KOD NAS PREVOZ DO 100 KILOMETARA JE O NASEM TROSKU...\r\n\r\nVRSIMO USLUZNI PREVOZ AUTOMOBILA IZ SVAJCARSKE DO BILO KOG GRADA U SRBIJI SA NASOM CARINOM I AMSS ILI VASOM CARINOM, SVE PO VASOJ ZELJI...\r\nBRZO, EFIKASNO, POVOLJNO....', '4/5', '2', '1582100476', '5 shift manual', 155000, '', 87, '', '07/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(32, 'Opel', ' insignia', 'diesel', 1999, 6200, 2014, 'limousine', '[\"1582100945\\/f52d2732601c637f41bc837a59926d2f.jpeg\",\"1582100945\\/7c415b391b7f59a7cb2d62e712a42559.jpeg\",\"1582100945\\/a91cc7a18fcc2b44d4f4a91877db915c.jpeg\",\"1582100945\\/cde92daba2229863a64fdcccb0af05d5.jpeg\",\"1582100945\\/aab5812e48cf24bdcf39d77db091b965.jpeg\",\"1582100945\\/4f14138fc089c3789aea5b0b265c6eda.jpeg\",\"1582100945\\/57ae0fc4feb2a475b2a7eae468f04c5d.jpeg\",\"1582100945\\/d086cf8519a5a3e117a06e9f813f54c3.jpeg\",\"1582100945\\/1eea9c7bb99d9d0eed5ec24ff4f4c516.jpeg\",\"1582100945\\/e135c94349ca6acd21ec5b25d5b7e57a.jpeg\",\"1582100945\\/df5443939ddb99b67c397537c4d5280c.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Alarm\"]', 'HITNO....Opel  je u odlicnom stanju, prvi sam vlasnik u srbiji, pre 10.000 km sam mu uradio veliki servis, jako ocuvan....za ostale informacije me pozovite.....HITNO', '4/5', '2', '1582100945', '6 shift manual', 160000, '', 67, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic'),
(33, 'Alfa Romeo', '159', 'diesel', 1595, 4000, 2008, 'estate', '[\"1582101317\\/363bea99b71583ad28c5860794ef0689.jpeg\",\"1582101317\\/ea53636b6bc15322e5e9da2d7f6e172c.jpeg\",\"1582101317\\/4a10f348dc9486e44e68b5e6c7442aa3.jpeg\",\"1582101317\\/3c3e2f6b58ec807070bcbe4c71147c4c.jpeg\",\"1582101317\\/fda4af13ba7f8c4b10717cfc8e486c65.jpeg\",\"1582101317\\/bc95aa19c40d03865dc3c3ed1ab0eb03.jpeg\",\"1582101317\\/4b0eb44dd7e33889b585b8939c4328fd.jpeg\",\"1582101317\\/997511a1270a9919b9d756b3e9b0d147.jpeg\",\"1582101317\\/03a2eb894485a2eb6c0080ce19f113c4.jpeg\",\"1582101317\\/0b0dec814a6066a0eb519bbdec49d0fc.jpeg\",\"1582101317\\/81e7afccc07012d8ee7a1238d87569f2.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', '• Auto je u odlicnom stanju.\r\n• Četiri nova diska stavljena pre 25.000 km.\r\n• Veliki servis urađen pre 20.000 km, mali servis urađen pre 5.000 km.\r\n• Nov akumulator sa garancijom od 3 godine.\r\n• Redovno održavan, servisna knjižica, mali potrošač.\r\n• Uz auto ide set dobrih zimskih guma.\r\n\r\nMoguća korekcija cene.', '4/5', '2', '1582101317', '5 shift manual', 141000, '', 130, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(34, 'Peugeot', '207', 'diesel', 1399, 5400, 2014, 'hatchback', '[\"1582108783\\/f4534c4557fb661f669855a7893816ba.jpeg\",\"1582108783\\/af91d384b0baeba2ae8aff3134c2a8e6.jpeg\",\"1582108783\\/c4bbfa09b24a15de59389dfa8176a76c.jpeg\",\"1582108783\\/535a1629a2c8319dc6e7dd76bd5accf7.jpeg\",\"1582108783\\/7862aab4c3c983cd52f5d656049612ec.jpeg\",\"1582108783\\/50f3e20cff2ef8433f75eb2e22ac790e.jpeg\",\"1582108783\\/7a0735d7896365619b427a2e4daed589.jpeg\",\"1582108783\\/7a7bfdfe4489cf9244d9b380ddecc6f7.jpeg\",\"1582108783\\/3327501e664decb84ba787bcc2a3fe08.jpeg\",\"1582108783\\/235683ceb4fb86f02ec678c914598c6a.jpeg\",\"1582108783\\/aa2deebfb6bcb72a7b4e4dad5d3d1dc1.jpeg\",\"1582108783\\/2df9fd0d834a802327849e2ae9364f80.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\"]', '• Auto je u odlicnom stanju.\r\n• Četiri nova diska stavljena pre 25.000 km.\r\n• Veliki servis urađen pre 20.000 km, mali servis urađen pre 5.000 km.\r\n• Nov akumulator sa garancijom od 3 godine.\r\n• Redovno održavan, servisna knjižica, mali potrošač.\r\n• Uz auto ide set dobrih zimskih guma.\r\n\r\nMoguća korekcija cene.', '4/5', '1', '1582108700', '5 shift manual', 32000, '', 120, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(35, 'Opel', 'corsa', 'LPG', 1199, 3500, 2011, 'hatchback', '[\"1582121622\\/bfbde9ca8fc97e616a170aa8ed82869f.jpeg\",\"1582121622\\/cb9611c24a5da91042854910a35bf8e9.jpeg\",\"1582121622\\/43ca1708d3b9d530974ede3e1e63f9b5.jpeg\",\"1582121622\\/7d0c4543ae5685886f6bc0c1214bc379.jpeg\",\"1582121622\\/78702f0c2bfc9e45e0cf9be86562b849.jpeg\",\"1582121622\\/2b06b78900bd89ba52f37cb78956c9df.jpeg\",\"1582121622\\/4c01bcf011af001e361c20bae60e471e.jpeg\",\"1582121622\\/aff748f037f8118ef3a90a35abbf348a.jpeg\",\"1582121622\\/c8b25137f9c9b2b2f17728ccb603ad34.jpeg\",\"1582121622\\/873b7f073fbf092d6d964720f9e99cd9.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\"]', '***OPEL CORSA D\r\n\r\n***1.2\r\n\r\n***FABRICKI PLIN --TNG\r\n\r\n***ATEST DO 01.07.2023.GODINE\r\n\r\n***AUTO U PERFEKTNOM STANJU\r\n\r\n***LED PREDNJA SVETLA\r\n\r\n***LED ZADNJA SVETLA\r\n\r\n***DNEVNA SVETLA\r\n\r\n***ALUMINIJUMSKE FELNE\r\n\r\n***PARKING SENZORI\r\n\r\n***HROM DETALJI\r\n\r\n***MAGLENKE\r\n\r\n***MANUELNI MENJAC-5-BRZINA\r\n\r\n***63 KW/86 KS\r\n\r\n***VELIKI DISPLEJ\r\n\r\n***MANUELNA KLIMA\r\n\r\n***KOZNI VOLAN\r\n\r\n***KOMANDE NA VOLANU\r\n\r\n***DVA KLJUCA\r\n\r\n***ENTERIJER PERFEKTAN\r\n\r\n***SPOLJASNOST BEZ OSTECENJA\r\n\r\n*** AUTO SA ODLICNIM PERFORMANSAMA\r\n\r\n***IZUZETNO MALI POTROSAC\r\n\r\n***JEFTIN ZA REGISTRACIJU-EURO 5 MOTOR\r\n\r\n***LAK ZA ODRZAVANJE\r\n\r\n***AUTO RADI I NA BENZIN I NA PLIN SAVRSENO', '2/3', '6', '1582121622', '5 shift manual', 180000, '', 100, '', '12/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(36, 'Ford', ' fiesta', 'gasoline', 1242, 6600, 2016, 'hatchback', '[\"1582127117\\/1a73e6d5e5fa395d6aab5aaade2845e7.jpeg\",\"1582127117\\/12d28761666bed204b8403df465dc51f.jpeg\",\"1582127117\\/43bf2fb1724ec16934bad88630bb0b73.jpeg\",\"1582127117\\/0579afa1f4b70fc0ba73232149196170.jpeg\",\"1582127117\\/5d56b55793727ebe5f129603fff66394.jpeg\",\"1582127117\\/863102209d154f9ec6a698c4ccd07a26.jpeg\",\"1582127117\\/4cb834db872c212ed93497a12678275c.jpeg\",\"1582127117\\/16a5230f0c12302cc86b9105aeea638a.jpeg\",\"1582127117\\/9c3b716c11aaf0a9972b1feb1e67e53f.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Prvi vlasnik\r\nKupljen nov u Srbiji\r\nGaražiran\r\nServisna knjiga\r\nRezervni ključ', '4/5', '2', '1582127117', '5 shift manual', 123000, '', 92, '', '02/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic'),
(37, 'Ford', ' fiesta', 'diesel', 1499, 13999, 2020, 'hatchback', '[\"1582187698\\/54894f40f686bada31ce3f104069e3b7.jpeg\",\"1582187698\\/9d79c3d2ad9414c17bc86bd5aef0c8d3.jpeg\",\"1582187698\\/7cf61e9cac2f6cf6d246fe4605ec0a43.jpeg\",\"1582187698\\/a8691c45d8af64d131f5515d3995e42c.jpeg\",\"1582187698\\/699f2ed97662ba2dfd2bdd9d882cf5a4.jpeg\",\"1582187698\\/3a6fa679ff47360644287694238d39e0.jpeg\",\"1582187698\\/c3e6b92f2fc2a5f4fc72d99352fb543e.jpeg\",\"1582187698\\/48b32ab2403622e7bea8a64d925cc9e3.jpeg\",\"1582187698\\/00d08c58e916828dd7cbe470029ee130.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'Oprema na vozilu – uračunato u cenu:\r\nABS; ESP; HLA; MBA; TMPS sa senzorom pritiska u pneumaticima, prednji i bočni vazdušni jastuci za vozača i suvozača, vazdušne zavese i vazdušni jastuk za kolena vozača, nasloni za glavu na svim sedištima, centralno zaključavanje sa dva daljinska ključa, Child lock, funkcija ograničenja brzine, sistem za sprečavanje napuštanja saobraćajne trake, upozorenje u slučaju napuštanja saobraćajne trake, putni računar, elektro podizači prednjih stakala, branici i elektropodesivi retrovizori u boji karoserije, hromirani okvir maske hladnjaka, dnevna svetla, krovni spojler u boji karoserije, čelični naplaci 6x15\" sa 195/60R15 pneumaticima, centralna konzola sa dva držača za čaše napred i jednim pozadi , vozačevo sedište podesivo u 4 pravca, tekstilne patosnice, utičnica od 12V, deljiva zadnja sedišta 60:40.\r\nDodatna oprema:\r\nCool & Sound Pack 1 – Manuelna klima, ICE Pack 15 ( FM/AM radio, 4,2\" displej u boji, komande na volanu, Bluetooh, 2x USB, 6 zvučnika, My Ford Dock ), Driver Assistance Pack 7 - Tempomat sa funkcijom ograničenja brzine, rezervni točak čelični 14\" sa 175/65R14 pneumatikom, kožni volan, kožna obloga ručne kočnice i kožna obloga ručice menjača, crvena pastelna boja.', '4/5', '1', '1582187698', '5 shift manual', 0, '', 120, '', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(38, 'Renault', ' megane', 'diesel', 1460, 5100, 2011, 'hatchback', '[\"1582188801\\/9e1f9ff654ad8ce353c5c8fe8ed3fe99.jpeg\",\"1582188801\\/a299f46eef7e19e445b71e1c962b4913.jpeg\",\"1582188801\\/6c02fe86444cc4fead4f991af62225f4.jpeg\",\"1582188801\\/ae7a9ed4004a2c2f202608ae63c555e9.jpeg\",\"1582188801\\/9b25fdaf52bcaa695ce012751135a962.jpeg\",\"1582188801\\/05e7b9b8435b8503c1be689738e295f2.jpeg\",\"1582188801\\/f11e26961006fb4682918bb4f7101b3b.jpeg\",\"1582188801\\/42ff033b3709a8fd715e98ea2e21b4f1.jpeg\",\"1582188801\\/c9d3185e5afaf167695190a44bcdbd54.jpeg\",\"1582188801\\/a16f33fd8ccfe78c47ed9d597063545b.jpeg\",\"1582188801\\/ab1b92bf04d5b2560c5915f57f6f43a9.jpeg\",\"1582188801\\/2ec9301ba43a784853fb382e7f6c80b0.jpeg\",\"1582188801\\/0dacee10044ebc6dc23d12e1a173bf04.jpeg\",\"1582188801\\/08a8e8be493bf15e279e26a8d1e805aa.jpeg\",\"1582188801\\/419a59b3800b5ab540860d03de30f99f.jpeg\",\"1582188801\\/5db9fa38555d738f917097bc7f119ff7.jpeg\",\"1582188801\\/73ab4c8c55e0c929fe10e40fbac14bf7.jpeg\",\"1582188801\\/e38ba5a35abd843df54ba5a899261cda.jpeg\",\"1582188801\\/3de9a57cecfa971cf66c5ff7c2a833bd.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\"]', '*** GARANTUJEMO DA JE VOZILO UVEZENO SA ORIGINALNIM BROJEM MOTORA !!!\r\n\r\n*UVOZ BELGIJA !!!\r\n\r\n*FABRIČKA TOMTOM NAVIGACIJA !!!\r\n\r\n*1.5 DCI euro 5 standard\r\n\r\n*78kw\r\n\r\n* 6 brzina\r\n\r\n* VOZILO SE PRODAJE NA IME KUPCA , U CENU JE URACUNAT PDV I PREGLED OD STRANE AGENCIJE ZA BEZBEDNOST SAOBRACAJA\r\n\r\n*ZA KUPCE VAN NOVOG SADA OBEZBEĐUJEMO PROBNE TABLICE\r\n\r\n*Klikom na \"KOMPLETNA PONUDA\" pogledajte sva nasa vozila.\r\n\r\n* Kontakt Telefon: 064 036 4 036\r\n\r\n* Radno Vreme: Pon-petak: 09-17h, subotom 09-14h\r\n\r\n*ZA SVE OSTALE INFORMACIJE SLOBODNO POZOVITE', '4/5', '1', '1582188801', 'automatic', 120000, '', 100, '', 'without', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'manual'),
(40, 'Ford', 'focus', 'diesel', 1995, 2350, 2007, 'estate', '[\"1582200679\\/7c2ccf1c5f8712dcf71d2351ca844fe1.jpeg\",\"1582200679\\/0050d34d2c135be40d6de4d55f9dec93.jpeg\",\"1582200679\\/0af7f457b65953cf1654c101403fcddc.jpeg\",\"1582200679\\/0c2ed117902df927b83173fcbcdc2164.jpeg\",\"1582200679\\/5438486bbb41a06c7dc1c7e92fe63a05.jpeg\",\"1582200679\\/0f19ebd68b99664aea9351e69122aaf8.jpeg\",\"1582200679\\/3640f014a4211f55e83cb683f4f3cb72.jpeg\",\"1582200679\\/33bd11fbe9702b137d549b2bbc744393.jpeg\",\"1582200679\\/b740e3b36a9ec0772378ca3d851b3528.jpeg\",\"1582200679\\/58fee4f312d87e395235fb3f0e37acee.jpeg\",\"1582200679\\/0ad5d87edf8acb06356568be98c5b340.jpeg\",\"1582200679\\/2dfe2ff95316dd2b641d499313276eb0.jpeg\",\"1582200679\\/fea89f5e22e7e1bf2291385832096c1c.jpeg\",\"1582200679\\/3849f748ff00fe671ce068de6ea99129.jpeg\",\"1582200679\\/afa21bfb5638fd734834a5c2a36664c1.jpeg\",\"1582200679\\/d7359cd460b0c5745227c2cb6ebda13a.jpeg\",\"1582200679\\/1e2df75ef8ed270aacfc5fe6a849e444.jpeg\"]', '[\"Alloy wheels\",\"Radio\",\"Board computer\",\"Isofix\"]', 'Auto kuca Milenkovic bavi se prodajom odlicnih vozila po veoma povoljnim cenama\r\n- Garantujemo za LEGALNOST i POREKLO VOZILA\r\n- Nudimo mogucnost svake provere vozila od strane kupca\r\n\r\n- FORD FOCUS 2.0 TDCI /Titanium/\r\n\r\n- Auto je u odlicnom stanju, besprekorno je ocuvan kako spolja tako i unutra, kupljen od vlasnika u Svajcarskoj\r\n- Datum prve registracije. 20.11.2005. god\r\n- Odlican 2.0 dizel motor sa odlicnim manuelnim sestostepenim menjacem\r\n- Titanium oprema\r\n- Digitalna klima\r\n- Tempomat\r\n- Svetla za maglu\r\n- Odlicne gume jos dosta opreme\r\n- Auto je za svaku preporuku\r\ni bez ikakvih ulaganja\r\n- Placena carina i porez kupcu ostaje samo registracija\r\n\r\n- U sastavu auto kuce posedujemo i slep sluzbu, tako da smo u mogucnosti da Vam dostavimo auto na kucnu adresu bez troskova prevoza\r\n\r\n- Za kupce iz okoline Nisa pruzamo mogucnost registracije vozila na cekove i putem administrativne zabranjen\r\n\r\n- Posetite nas i uverite se u kvalitet nase ponude,\r\nVasa AUTO KUCA MILENKOVIC', '4/5', '1', '1582200679', '5 shift manual', 220000, 'TDCI/Titanium/CH', 136, 'blue', '03/2020', 'euro4', 'fwd', '[\"Alarm\",\"Airbags\",\"ABS\",\"Esp\"]', 5, 'automatic');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `seen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `receiver`, `ad`, `text`, `timestamp`, `seen`) VALUES
(1, '4', '1', '5', 'hello from message controller', '2020-02-18 10:37:07', 1),
(6, '1', '1', '19', 'lorem ipsum', '2020-02-18 11:00:43', 1),
(9, '1', '2', '8', 'K\'o i svaka alfa', '2020-02-18 13:45:56', 0),
(10, '1', '1', '20', 'K\'o i svaka alfa', '2020-02-18 13:46:58', 1),
(11, '1', '1', '21', 'test test', '2020-02-18 15:26:12', 0),
(14, '5', '1', '29', 'Opaka masina', '2020-02-18 15:44:13', 1),
(15, '1', '1', '19', 'Svidja mi se automobil, kada bih mogao da ga pogledam?', '2020-02-18 16:51:20', 1),
(16, '1', '2', '13', 'test poruka broj 13424', '2020-02-19 09:12:30', 1),
(17, '1', '1', '19', 'test poruka broj 123456', '2020-02-19 10:17:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200211130650', '2020-02-11 13:06:55'),
('20200212094558', '2020-02-12 09:46:34'),
('20200212102054', '2020-02-12 10:21:12'),
('20200213122653', '2020-02-13 12:27:02'),
('20200218092724', '2020-02-18 09:27:33'),
('20200218122645', '2020-02-18 12:26:52'),
('20200220113337', '2020-02-20 11:33:46'),
('20200220115406', '2020-02-20 11:54:12'),
('20200220135724', '2020-02-20 13:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `maker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `maker`, `model`) VALUES
(18, 'Audi', 'a1,a2,a3,a4,a5,a6'),
(19, 'Alfa Romeo', '33,147,156,159,177,brera,gt,mito'),
(20, 'Fiat', ' 500, 500l, 500x, marea, punto, stilo,tipo'),
(21, 'Ford', ' fiesta, fusion, kuga, puma,focus'),
(22, 'Peugeot', '205,206,207,306,307,308,406,407'),
(23, 'Citroen', 'c1,c2,c3,c4,c5,ds'),
(24, 'Opel', 'agila,astra,meriva,omega, insignia,corsa'),
(25, 'Renault', 'zoe, captur, megane, clio'),
(26, 'Toyota', ' avensis, yaris,aygo,supra'),
(27, 'Bmw', '1,2,3,4,5,6'),
(28, 'Seat', 'altea, ibiza,leon'),
(31, 'Hyundai', 'getz,i10,i20,i30,ix35,sonata');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `favorites` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`, `authenticated`, `telephone`, `address`, `favorites`) VALUES
(1, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$Gxm03fpYzq.GSWYix/Jvqu8nIq7j6rzCF5evny2mHVxPkFe2wOcqG', 'aleksandarskrobic@gmail.com', 'ok', '063654321', 'milutina bojica', '19,30,30,31,5,26,36,10'),
(2, 'aca', '[]', '$2y$13$oQ9bgPhFNtp3a2ejiWkHv.XKnVpaO/dmfDpA1DUEMZrhxWpqCGVSS', 'aleksandarskrobic@gmail.com', 'ok', '06311111', 'Ulica cveca  21, Novi Sad', ''),
(3, 'test', '[]', '$2y$13$kuQsBaR6yzH4KAmZdURoSe1oH2m2K9Rqrre1gVROLecSTAZa8KXcu', 'aleksandarskrobic@gmail.com', 'ok', '0637126206', 'Kolo srpskih sestara 3', ''),
(4, 'olga', '[]', '$2y$13$q7jv3WyviGV03Rrgm6nBHe9mD7gqXGeQw3jhmPQi6Zkw2alcd/tXy', 'aleksandarskrobic@gmail.com', 'ok', '063555555', 'crveni  trg, moskva', ''),
(5, 'ceca', '[]', '$2y$13$JhyV3L0a7i3izTncziHoEOqhvzQLotJmgB.6kmN1FeMg64r89Cq5G', 'aleksandarskrobic@gmail.com', 'ok', '063555666', 'cecina ulica, Novi  sad', ''),
(6, 'sava', '[]', '$2y$13$k7otWqw8Y1TlIigKnIknGe2elRo.aWUXSEjpiTRXtxqYTSyRSa0AK', 'aleksandarskrobic@gmail.com', 'ok', '064454545', 'Savina ulica1,Pozega', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
