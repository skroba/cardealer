-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2020 at 04:44 PM
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
  `mileage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `maker`, `model`, `fuel`, `volume`, `price`, `year`, `body`, `pictures`, `equipment`, `about`, `door`, `contact`, `added`, `gearchange`, `mileage`) VALUES
(4, 'Alfa Romeo', '147', 'diesel', 1, 1, 2010, 'hatchback', '[\"1581432459\\/124b989e83d5af67e19ff14e380ca35e.jpeg\",\"1581432459\\/8e63ed7a8c1cc4ac23bbd70768850dea.jpeg\",\"1581432459\\/27f92ca93cc22dd9ff5cf88e2616b915.jpeg\",\"1581432459\\/249afc5ba2bee0e8effecca8dc220df0.jpeg\",\"1581432459\\/9c3eaf659cab52cc69a4132e76ba18b9.jpeg\",\"1581432459\\/6711d9ec00c29721bc1229263ab3fa13.jpeg\"]', '[\"Alarm\"]', 'a', '2/3', '1', '', '', 15000),
(5, 'audi', 'a4', 'diesel', 1995, 7000, 2009, 'limousine', '[\"1581432608\\/8bf2d9dbe240fa8c3a054613c6d4aaf2.jpeg\",\"1581432608\\/7d0428c36579d76c1394a201cf6e33bd.jpeg\",\"1581432608\\/a4268637c670ea202a9f7b504262b2bd.jpeg\",\"1581432608\\/b8c2e113f797fc086b1a457a184f42e5.jpeg\",\"1581432608\\/3a395fc975f206c9d5568df40a73de7c.jpeg\",\"1581432608\\/8a7a18d6411f693903ee30d3d5e7e4cf.jpeg\",\"1581432608\\/71b03d072ef3b75dd298a6f6226eceb3.jpeg\",\"1581432608\\/80df612621a5b5ceda904c84fccbe819.jpeg\"]', '[\"Air Condition\"]', 'o kolima...', '4/5', '1', '', '', 0),
(7, 'Alfa Romeo', '147', 'diesel', 1, 1, 2013, 'hatchback', '[\"1581432920\\/6a9d6eccb0ffdb506a3bf62ac1baad4c.jpeg\",\"1581432920\\/1f572ce444cbdee215be7e71e134adb5.jpeg\",\"1581432920\\/a336b13cdbedf6c83c34247c2f1801f0.jpeg\",\"1581432920\\/5cf68d04ec361cb57cf19f16daf3629f.jpeg\",\"1581432920\\/a903cd9a7a43d12888120325eb5b0acf.jpeg\",\"1581432920\\/33392bda52c8e60df8ec120567b17288.jpeg\",\"1581432920\\/38fd28a11f9b3aed4708c0931887a5bd.jpeg\"]', '[\"Isofix\"]', '1', '2/3', '2', '', '', 89000),
(8, 'audi', 'a6', 'diesel', 3000, 45000, 2018, 'limousine', '[\"1581495737\\/aa5d404b480e029ac15adbf897134c9f.jpeg\",\"1581495737\\/9806a7bf1f4ac7ec8c25e248681fde69.jpeg\",\"1581495737\\/7e84e8a92866ca758fa270bbdc8b9f56.jpeg\",\"1581495737\\/657b79e0d2a30279e87869fa61cf5bba.jpeg\",\"1581495737\\/210e883e4227327c7c6673e7538e130f.jpeg\",\"1581495737\\/7a6bf0fbba81c6ceaf5e5e1af7339c23.jpeg\",\"1581495737\\/48d62e888a056cac4f987b3824f9feda.jpeg\",\"1581495737\\/181c43cddf9458a630a85f40a795bd27.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', 'MOTOR PERFEKTAN\r\nVELIKI SERVIS NA 201000 KM 2018 GOD\r\nAUTOMATSKI MENJAC PERFEKTAN\r\nLED I XENON FAROVI PREDNJI\r\nLED FAROVI ZADNJI\r\nPARKING SENZORI\r\nKAMERA ZA VOZNJU U RIKVERC\r\nKOZNI MF VOLAN\r\nTEMPOMAT\r\nSTART STOP\r\n2 KLJUCA\r\nSERVISNA ISTORIJA\r\n12.2011 GOD\r\nUVOZ BELGIJA\r\nMEH. I TEHNICKI PERFEKTAN', '4/5', '2', '', '', 8000000),
(9, 'bmw', '118', 'gasoline', 1599, 8000, 2009, 'hatchback', '[\"1581497490\\/9f92118750075dfd789121d3a7278fb8.jpeg\",\"1581497490\\/0347b68302fcc2535bd942f811158949.jpeg\",\"1581497490\\/dbf090d1d0ed49cebc528a31a6acfda2.jpeg\",\"1581497490\\/b1e97f6be622b41fce9ed89b095d8e11.jpeg\",\"1581497490\\/42989e8aa5821700bbf95a6f10a4a56e.jpeg\",\"1581497490\\/13cd996de1b56b4c375c5c088d67a222.jpeg\",\"1581497490\\/105734ecd0ce16119e9ad7b4fa11d927.jpeg\",\"1581497490\\/812d228ddd574263d7e6a8b9d88e4d02.jpeg\",\"1581497490\\/03353f28f2834a652d3d036ee9e3b103.jpeg\",\"1581497490\\/23ddd5c485bac9be4d54d2b1a8c7badd.jpeg\",\"1581497490\\/c5c8a3f2867c90860bc8171a10aa4ecd.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Naglašavamo da automobil ima prednju vuču i prodaje sa 8 aluminijumskih točkova sa gumama za leto i zimu.\r\nOd velikog paketa opreme izdvajamo:\r\n\r\nProfessional navigacija\r\nHead up display\r\nDVD/TV\r\nAutomatsko sklapanje retrovizora\r\nElektrohrom retrovizori sa automatskim zatamnjenjem\r\nGrejanje sedišta\r\nSistem zaštite pešaka\r\nPark assistent - pomoć pri parkiranju\r\nLed svetla\r\nStart stop\r\n\r\n***GARANTUJEMO***\r\n\r\n• Tehničku ispravnost\r\n\r\n• Legalnost vozila u zemlji i inostranstvu\r\n\r\n• Originalnost propratne dokumentacije\r\n\r\n\r\n***OPIS***\r\n\r\nUVEZEN IZ NEMAČKE\r\n\r\n• Redovno održavan u ovlašćenim servisima.\r\n• Kupcu na uvid SGS izvestaj koji detaljno svedoci o stanju vozila prilikom kupovine od leasing kuce.\r\n\r\n\r\n\r\n\r\n***OSTALE POGODNOSTI***\r\n\r\n• Carina i pdv su plaćeni, vozilo se registruje na ime kupca\r\n\r\n• Na vozilu je izvršen pregled AMSS i plaćeni su svi troškovi, Vama ostaje samo registracija\r\n\r\n• Kompletna usluga registracije vozila od tehničkog pregleda do odlaska u SUP\r\n\r\n• Kompletna organizacija i pomoć pri vađenju probnih tablica\r\n\r\n• Mogućnost provere vozila u ovlašćenom ili servisu po Vašem izboru', '4/5', '2', '', '', 40000),
(10, 'peugeot', '207', 'gasoline', 1400, 4000, 2010, 'hatchback', '[\"1581500529\\/eb6a7807764ab956e2c8e68f25b3575b.jpeg\",\"1581500529\\/1c43861accfb5e153ba6fc48de4c9bb4.jpeg\",\"1581500529\\/457f9c4cc325d1f17b57962fd9d16848.jpeg\",\"1581500529\\/8482b83d111435dbdaf116cee03c4627.jpeg\",\"1581500529\\/742e8637f8b37d58c9c9a9755ac25b99.jpeg\",\"1581500529\\/a8bd86d2ca229fc6d30a23bc2e7c77c6.jpeg\",\"1581500529\\/b6ffbab329325fc05fca34265cdc26b8.jpeg\",\"1581500529\\/fb64782a397336433011bfac758f61da.jpeg\",\"1581500529\\/a9c89884833a3837aedef95f30e7cd40.jpeg\",\"1581500529\\/c90f4c1b7f8001b332d9566a8de1fb5d.jpeg\",\"1581500529\\/e544ce5bc4811414e893ef6c953e0967.jpeg\",\"1581500529\\/2e7770227cde17be79940d67165fb015.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Vozilo iz uvoza sa kompletnom dokumentacijom za registraciju na ime kupca.\r\nVozilo je u odličnom stanju,bez daljih ulaganja,odličan paket opreme sa FABRIČKOM NAVIGACIJOM,kamerom za vožnju u rikverc,park senzorima,tempomatom,hands free uređajem za bežično telefoniranje,smart kee ulazak bez ključa i paljenje bez ključa,digitalna klima,crno nebo,led dnevna svetla,...\r\nDatum prve registracije je 28.05.2015 a godina proizvodnje je 2014 .\r\nZADNJA KLUPA JE SA 3 ODVOJENA SEDIŠTA KOJA SE SVAKO ZA SEBE POSEBNO POMERA I PODEŠAVA KAO PREDNJA,tako da možete podedšavati prtljažni prostor po potrebi.\r\nU zamenu dolazi u obzir vozilo do 2 000 ccm i 50 % vrednosti našeg.', '4/5', '2', '', '', 60000),
(13, 'fiat', 'Stilo', 'gasoline', 2000, 2000, 2005, 'hatchback', '[\"1581501764\\/6c6d6071ef229fb4d204fcb40233bb0d.jpeg\",\"1581501764\\/9245ef7634015b891a06ae8137a6d9f5.jpeg\",\"1581501764\\/80b59f3fe5658beaf32f1afa408ec459.jpeg\",\"1581501764\\/78c47f33f93d897c58d25db1437f74ef.jpeg\",\"1581501764\\/86537b950a1a0825201f76e9a8e3f05a.jpeg\",\"1581501764\\/2148f5bd54bd8e37899edbd79c0af164.jpeg\",\"1581501764\\/fd37683642e8a356347595d65ba12508.jpeg\",\"1581501764\\/b7a928bf81385801ab423753cd01196b.jpeg\",\"1581501764\\/fbd20f4bc5698afb0edf4a339f833e2c.jpeg\",\"1581501764\\/755101e5bcdadb2c4670a2c501232c0e.jpeg\"]', '[\"Alloy wheels\",\"ABS\"]', 'Vozilo iz uvoza sa kompletnom dokumentacijom za registraciju na ime kupca.\r\nVozilo je u odličnom stanju,bez daljih ulaganja,odličan paket opreme sa FABRIČKOM NAVIGACIJOM,kamerom za vožnju u rikverc,park senzorima,tempomatom,hands free uređajem za bežično telefoniranje,smart kee ulazak bez ključa i paljenje bez ključa,digitalna klima,crno nebo,led dnevna svetla,...\r\nDatum prve registracije je 28.05.2015 a godina proizvodnje je 2014 .\r\nZADNJA KLUPA JE SA 3 ODVOJENA SEDIŠTA KOJA SE SVAKO ZA SEBE POSEBNO POMERA I PODEŠAVA KAO PREDNJA,tako da možete podedšavati prtljažni prostor po potrebi.\r\nU zamenu dolazi u obzir vozilo do 2 000 ccm i 50 % vrednosti našeg.', '4/5', '2', '1581501764', '', 120000),
(14, 'Ford', 'S-MAX', 'hybrid', 1500, 12000, 2010, 'estate', '[\"1581504567\\/60b79341575f4bac26175b3271c0e69a.jpeg\",\"1581504567\\/9ded5a76a6f3003007c69946fd7564ba.jpeg\",\"1581504567\\/3a4559a092a4d2bafbe90c7f96b5f913.jpeg\",\"1581504567\\/67844c540d7eaa0d718795c31f68e7af.jpeg\",\"1581504567\\/e7860e97802472a3ebd8a45c18bb09d4.jpeg\",\"1581504567\\/a258e242c53cb97a481939b39730811b.jpeg\",\"1581504567\\/80846b5c807df7ec274c78da482ca95f.jpeg\",\"1581504567\\/f7c86cd0a641499a8886ed9946866436.jpeg\",\"1581504567\\/861f7281991927bd10129cf636f9e082.jpeg\",\"1581504567\\/66134355d163a7f8f719778d13d0a316.jpeg\",\"1581504567\\/7f7c5c25a01b43a32f89381c2a03b444.jpeg\",\"1581504567\\/9a74426ba8cfc574d231e0e64881c4ec.jpeg\",\"1581504567\\/2238d5538872bbd7b66ae4ebe612e316.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\",\"Isofix\",\"Alarm\",\"Sunroof\"]', '*Vozilo je u odlicnom stanju.\r\n\r\n*Redovno servisiran u ovlascenom servisu bez dodatnih ulaganja.\r\n\r\n*Direktna kupovina od partnera iz Francuske, zagarantovano poreklo, kilometraza, na uvid kompletna istorija odrzavanja i fotografije vozila u trenutku kupovine.\r\n\r\n*Detaljan pregled vozila uradjen u nasem servisu po dolasku vozila u Srbiju.\r\n\r\n*Trend + paket opreme: kožni multifunkcionalni volan sa grejanjem volana, navigacija, dnevna svetla, hands free kljuc, elektricni podizaci, parking senzori sa grafickim prikazom napred i pozadi, tempomat, grejanje sedista, multimedija, start stop i jos dosta toga....\r\n\r\n*cena sa placenim porezom na prenos apsolutnih prava (na ime kupca).\r\n\r\n\r\n*** AUTOLAND-POSEBNA PONUDA FINANSIRANJA ***\r\n\r\n\r\n*** ZAKUP VOZILA ---AKCIJA DAJ 999EUR I VOZI: Depozit 999eura, period zakupa od 24 do 48 meseci. Podnošenje zahteva, odobrenje, potpisivanje,registracija i preuzimanje vozila na licu mesta !!!\r\nPonuda važi za fizička lica, pravna lica i preduzetnike.\r\n\r\n\r\n*** FINANSIJSKI LIZING: 25% učešće, 3.49% nominalna FIKSNA kamatna stopa. Ponuda važi za fizička lica, pravna lica i preduzetnike.\r\n\r\n\r\n*** BESKAMATNO finansiranje: 0% kamata, 0% troskovi obrade kredita*** -podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Period finansiranja do 36 meseci, iznos kredita od 1.000 do 5.000 eura u zavisnosti od vozila (informisite se kod prodavca za detalje ). Ponuda važi za fizička lica.\r\n\r\n\r\n***EURSKI kredit sa fiksnom kamatnom stopom od 4,50% sa periodom otplate do 84 meseci, minimalnim ucescem od 30% I troškom obrade kredita od 2,95% uključenim kroz mesečne rate. Podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Ponuda važi za fizička lica.\r\n\r\n\r\n***DINARSKI kredit 0% učešća, do 84 meseca period otplate, sa fiksnom kamatom 7.45% u dinarima I trošak obrade kredita 2.95% ukljucen kroz ratu. Podnosenje zahteva i odobrenje na licu mesta, bez odlaska u banku. Ponuda važi za fizička lica.\r\n\r\n***Kompletnu ponudu možete pogledati i na našem sajtu http://autoland.akkompresor.rs ***\r\n\r\nSva vozila su kupljena u Srbiji, prilikom otkupa detaljno pregledana u servisu .\r\nVozila poseduju kompletnu dokumentaciju, uredne servisne istorije I proverene kilometraže.\r\n\r\n\r\n***PISANA GARANCIJA OD GODINU DANA ILI 10000KM (na motor bez pratećih agregata) ZA SVA NAŠA VOZILA***\r\n\r\nHvala Vam na pregledu oglasa.\r\n\r\n*Kompresor Autoland doo se trudi da pruži maksimalnu tačnost informacija i podataka, s tim da se u potpunosti odriče bilo kakve odgovornosti za tačnost i/ili potpunost svih informacija/opreme jer su moguće nenamerne različitosti stvarnog proizvoda i opisanog na ovim stranicama.', '4/5', '3', '1581504567', '', 200000),
(19, 'Ford', 'focus', 'diesel', 1595, 4300, 2010, 'suv', '[\"1581693872\\/891449cb26847712f1a38209e0718dcb.jpeg\",\"1581693872\\/89132ba92af32573e5905ab5e126e76d.jpeg\",\"1581693872\\/4334e17eb00f8219d51b7157f88d861b.jpeg\",\"1581693872\\/b0b20102d94fb723dbe45ef68fd1611a.jpeg\",\"1581693872\\/d916ae7345617621bfa8dba59e438955.jpeg\",\"1581693872\\/4792eaf4970639d52d97e07af46ed58d.jpeg\",\"1581693872\\/5ba1f9be2994652937e28ec79b70c12c.jpeg\",\"1581693872\\/ec55b6d5a77f35c9c84632f2f0f91bf7.jpeg\",\"1581693872\\/20bdcc70ff976f53b40db315a969feca.jpeg\",\"1581693872\\/46a619a211071ec921bc0fb5472101b5.jpeg\",\"1581693872\\/14096006747038d0bcfb126b17a21ea6.jpeg\",\"1581693872\\/57169d4019bbd61241b32942d8c0c2cc.jpeg\",\"1581693872\\/4d1844b37f16cb620dce7957c7e15b6a.jpeg\",\"1581693872\\/791fa940aee670a87a553cef69927c83.jpeg\"]', '[\"Air Condition\",\"Alloy wheels\",\"ABS\"]', 'Ford focus, prvi vlasnik, kupljen nov u Srbiji', '2/3', '1', '1581693872', 'manual', 130000);

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
('20200213122653', '2020-02-13 12:27:02');

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
(19, 'Alfa Romeo', '156,147,33,159, 177'),
(20, 'Fiat', 'tipo, marea, punto, 500, 500l, 500x, stilo'),
(21, 'Ford', 'focus, kuga, puma, fiesta, fusion'),
(22, 'Peugeot', '205,206,207,306,307,308,406,407'),
(23, 'Citroen', 'c1,c2,c3,c4,c5,ds'),
(24, 'Opel', 'agila, astra, meriva, omega, insignia'),
(25, 'Renault', 'zoe, captur, megane, clio'),
(26, 'Toyota', 'supra, avensis, yaris'),
(27, 'Bmw', '1,2,3,4,5,6'),
(28, 'Seat', 'altea, ibiza,leon');

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
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`, `authenticated`, `telephone`, `address`) VALUES
(1, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$Gxm03fpYzq.GSWYix/Jvqu8nIq7j6rzCF5evny2mHVxPkFe2wOcqG', 'aleksandarskrobic@gmail.com', 'ok', '063654321', 'milutina bojica'),
(2, 'aca', '[]', '$2y$13$oQ9bgPhFNtp3a2ejiWkHv.XKnVpaO/dmfDpA1DUEMZrhxWpqCGVSS', 'aleksandarskrobic@gmail.com', 'ok', '063123456', 'Bulevar mira'),
(3, 'test', '[]', '$2y$13$kuQsBaR6yzH4KAmZdURoSe1oH2m2K9Rqrre1gVROLecSTAZa8KXcu', 'aleksandarskrobic@gmail.com', 'ok', '0637126206', 'Kolo srpskih sestara 3'),
(4, 'olga', '[]', '$2y$13$q7jv3WyviGV03Rrgm6nBHe9mD7gqXGeQw3jhmPQi6Zkw2alcd/tXy', 'aleksandarskrobic@gmail.com', 'ok', '063555555', 'crveni  trg, moskva');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
