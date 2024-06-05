-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Giu 05, 2024 alle 23:46
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw1`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Carrello`
--

CREATE TABLE `Carrello` (
  `idCarrello` int(11) NOT NULL,
  `codUtente` int(11) NOT NULL,
  `codProdotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Carrello`
--

INSERT INTO `Carrello` (`idCarrello`, `codUtente`, `codProdotto`, `quantita`) VALUES
(10, 5, 19, 1),
(38, 2, 102, 2),
(39, 2, 95, 2),
(40, 2, 92, 5),
(41, 2, 94, 4),
(42, 2, 111, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Categoria`
--

CREATE TABLE `Categoria` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(255) NOT NULL,
  `misura` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Categoria`
--

INSERT INTO `Categoria` (`idCategoria`, `nomeCategoria`, `misura`) VALUES
(1, 'Maglie Gara', 'Home '),
(2, 'Maglia Gara', 'Away'),
(3, 'Maglie Gara', 'Third'),
(4, 'Kit Gara', 'Home '),
(5, 'Kit Gara', 'Away'),
(6, 'Kit Gara', 'Third'),
(7, 'Allenamento', 'Uomo'),
(8, 'Allenamento', 'Donna'),
(9, 'Accessori', ''),
(10, 'Abbigliamento', 'Uomo'),
(11, 'Abbigliamento', 'Donna'),
(12, 'Abbigliamento', 'Ragazzi'),
(13, 'Abbigliamento', 'Bambini'),
(14, 'Abbigliamento', 'Neonati'),
(15, 'Allenamento', 'Ragazzi');

-- --------------------------------------------------------

--
-- Struttura della tabella `Giocatore`
--

CREATE TABLE `Giocatore` (
  `idGiocatore` int(11) NOT NULL,
  `nomeG` varchar(255) NOT NULL,
  `cognomeG` varchar(255) NOT NULL,
  `ruolo` varchar(255) NOT NULL,
  `codImmagine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Giocatore`
--

INSERT INTO `Giocatore` (`idGiocatore`, `nomeG`, `cognomeG`, `ruolo`, `codImmagine`) VALUES
(1, 'Wojciech', 'Szczesny', 'Portiere', 1),
(2, 'Mattia', 'De Sciglio', 'Difensore', 2),
(3, 'Gleison', 'Bremer', 'Difensore', 3),
(4, 'Federico', 'Gatti', 'Difensore', 4),
(5, 'Manuel', 'Locatelli', 'Centrocampista', 5),
(6, 'Luiz Da Silva', 'Danilo', 'Difensore', 6),
(7, 'Federico', 'Chiesa', 'Attaccante', 7),
(8, 'Dusan', 'Vlahovic', 'Attaccante', 8),
(9, 'Paul', 'Pogba', 'Centrocampista', 9),
(10, 'Filip', 'Kostic', 'Attaccante', 10),
(11, 'Alex', 'Sandro', 'Difensore', 11),
(12, 'Arkadiusz', 'Milik', 'Attaccante', 12),
(13, 'Kenan', 'Yildiz', 'Attaccante', 13),
(14, 'Weston', 'Mckennie', 'Centrocampista', 14),
(15, 'Samuel', 'Iling JR', 'Attaccante', 15),
(16, 'Moise', 'Kean', 'Attaccante', 16),
(17, 'Fabio', 'Miretti', 'Centrocampista', 17),
(18, 'Nicolò', 'Fagioli', 'Centrocampista', 18),
(19, 'Timothy', 'Weah', 'Centrocampista', 19),
(20, 'Carlo', 'Pinsoglio', 'Portiere', 20),
(21, 'Daniele', 'Rugani', 'Difensore', 21),
(22, 'Adrien', 'Rabiot', 'Centrocampista', 22),
(23, 'Carlos', 'Alcaraz', 'Centrocampista', 23),
(24, 'Andrea', 'Cambiaso', 'Difensore', 24),
(25, 'Tiago', 'Djalò', 'Difensore', 25),
(26, 'Mattia', 'Perin', 'Portiere', NULL),
(27, 'Hans', 'Nicolussi Caviglia', 'Centrocampista', NULL),
(28, 'Kojiro', 'Hyuga', 'Difensore', NULL),
(29, 'Mattia', 'Perin', 'Portiere', 27);

-- --------------------------------------------------------

--
-- Struttura della tabella `Immagine`
--

CREATE TABLE `Immagine` (
  `idImmagine` int(11) NOT NULL,
  `src` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Immagine`
--

INSERT INTO `Immagine` (`idImmagine`, `src`) VALUES
(1, 'szczesny.jpg'),
(2, 'de sciglio.jpg'),
(3, 'bremer.jpg'),
(4, 'gatti.jpg'),
(5, 'locatelli.jpg'),
(6, 'danilo.jpg'),
(7, 'chiesa.jpg'),
(8, 'vlahovic.jpg'),
(9, 'pogba.jpg'),
(10, 'kostic.jpg'),
(11, 'alex sandro.jpg'),
(12, 'milik.jpg'),
(13, 'yildiz.jpg'),
(14, 'mckennie.jpg'),
(15, 'iling jr.jpg'),
(16, 'kean.jpg'),
(17, 'miretti.jpg'),
(18, 'fagioli.jpg'),
(19, 'weah.jpg'),
(20, 'pinsoglio.jpg'),
(21, 'rugani.jpg'),
(22, 'rabiot.jpg'),
(23, 'alcaraz.jpg'),
(24, 'cambiaso.jpg'),
(25, 'djalo.jpg'),
(27, 'perin.jpg'),
(28, 'uno.jpg'),
(29, 'due.jpg'),
(30, 'tre.jpg'),
(31, 'quattro.jpg'),
(32, 'JuventusMagliaGaraPortiere202324.jpg'),
(33, 'JuventusMagliaGaraThird20232024Donna.jpg'),
(34, 'JuventusMagliaGaraThird20232024.jpg'),
(35, 'JuventusAnthemJacket202324.jpg'),
(36, 'JuventusCalzettoniGaraHomeNeri.jpg'),
(37, 'JuventusCalzettoniGaraHome.jpg'),
(38, 'JuventusMagliaPrePartitaManicheCorte.jpg'),
(39, 'JuventusMagliaPrePartitaManicheLunghe.jpg'),
(40, 'JuventusPantalonciniGaraHome.jpg'),
(41, 'JuventusAnthemJacketAway.jpg'),
(42, 'JuventusCalzettoniGaraAway.jpg'),
(43, 'JuventusMagliaGaraAwayBambino.jpg'),
(44, 'JuventusPantalonciniAway.jpg'),
(45, 'JuventusAnthemJacketThird.jpg'),
(46, 'JuventusCalzettoniGaraThird202324.jpg'),
(47, 'JuventusMagliaGaraThirdAuthentic20232024.jpg'),
(48, 'JuventusPalloneClubThird202324.jpg'),
(49, 'JuventusPantalonciniThird202324.jpg'),
(50, 'JuventusFelpaAllenamentoGialla202324.jpg'),
(51, 'JuventusFelpaAllenamentoNera202324.jpg'),
(52, 'JuventusFelpaAllenamentoPro202324.jpg'),
(53, 'JuventusPantalonciniAllenamentoGialli202324.jpg'),
(54, 'JuventusPantaloniAllenamentoBianchiPro202324.jpg'),
(55, 'JuventusPantaloniAllenamentoNeri202324.jpg'),
(56, 'JuventusPantolonciniAllenamentoPro202324.jpg'),
(57, 'JuventusParkaGetReadyKit202324.jpg'),
(58, 'JuventusPoloRappresentanzaBianca202324.jpg'),
(59, 'JuventusAnthemJacketThird202324.jpg'),
(60, 'JuventusAnthemJacketThird202324.jpg'),
(61, 'JuventusMagliaAllenamento2023724.jpg'),
(62, 'JuventusPantalonciniAllenamentoDonna202324.jpg'),
(63, 'JuventusFelpaAllenamentoBambino202324.jpg'),
(64, 'JuventusFelpaAllenamentoTurquoise.jpg'),
(65, 'JuventusFelpaGirocolloJayNera.jpg'),
(66, 'JuventusMagliaAllenamentoBianca202324.jpg'),
(67, 'JuventusMagliaAllenamentoMagenta.jpg'),
(68, 'JuventusPantaloniPrePartitaBlu.jpg'),
(69, 'JuventusFelpaCappuccioBambinoLogoLapis.jpg'),
(70, 'JuventusFelpaTracktopStarKids.jpg'),
(71, 'JuventusTShirtBambinoLogo3DArancione.png'),
(72, 'JuventusValigettaGiocaColoraEIndossa.jpg'),
(73, 'JuventusCostumeInteroDonna.jpg'),
(74, 'JuventusCostumeInteroRosaDonna.jpg'),
(75, 'JuventusFelpaLogoPailletsDonna.jpg'),
(76, 'JuventusMagliaStoricaHome198485Donna.jpg'),
(77, 'JuventusPantaloneNeroDonna.jpg'),
(78, 'JuventusPerizomaintimoDonnaBianco.jpg'),
(79, 'JuventusPigiamaDonnaconBlusa.jpg'),
(80, 'JuventusShortsCore.jpg'),
(81, 'JuventusSlipBrasiliana.jpg'),
(82, 'JuventusSlipCostumeDonna.jpg'),
(83, 'JuventusSlipIntimoDonnaBianco.jpg'),
(84, 'JuventusTopCostumeDonna.jpg'),
(85, 'JuventusBabyJogger202324.jpg'),
(86, 'JuventusFelpaCappuccioLifesagameNeonato.jpg'),
(87, 'JuventusSet2Bavaglini.jpg'),
(88, 'JuventusTutinaCinigliaLogoRosa.jpg'),
(89, 'JuventusCanottaNeraLogoRagazzo.jpg'),
(90, 'JuventusCostumeSlipRagazzo.jpg'),
(91, 'JuventusFelpaGirocolloNeraBambino.jpg'),
(92, 'JuventusHoodieFullZipPinkLogo.jpg'),
(93, 'JuventusAnthemJacket202324.jpg'),
(94, 'JuventusEssentialGaeenJoggers.jpg'),
(95, 'JuventusEssentialLongSleeveTShirt.jpg'),
(96, 'JuventusFelpaconCappuccioLogo.jpg'),
(97, 'JuventusGiaccaAntivento.jpg'),
(98, 'JuventusGiaccaPrePartitaBianca.jpg'),
(99, 'JuventusGiaccaPrePartitaTurquoise.jpg'),
(100, 'JuventusIconCollegeJacket2023.jpg'),
(101, 'JuventusSSPDownJacket.jpg'),
(102, 'PantaloniJuventusDesignedForGameday.jpg'),
(103, 'JuventusBeauty.jpg'),
(104, 'JuventusBorsaPortaScarpe.jpg'),
(105, 'JuventusCappellino5PBambino.jpg'),
(106, 'JuventusGuantiNeri.jpg'),
(107, 'JuventusSaccaPalestra.jpg'),
(108, 'JuventusSacca.jpg'),
(109, 'JuventusSciarpaBianconera.jpg'),
(110, 'JuventusZaino.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `Preferiti`
--

CREATE TABLE `Preferiti` (
  `idPreferito` int(11) NOT NULL,
  `codUtente` int(11) NOT NULL,
  `codProdotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Preferiti`
--

INSERT INTO `Preferiti` (`idPreferito`, `codUtente`, `codProdotto`) VALUES
(6, 5, 1),
(23, 5, 19),
(36, 2, 82),
(42, 2, 36),
(43, 2, 123),
(47, 2, 101),
(49, 2, 122),
(78, 7, 1),
(79, 7, 85),
(80, 7, 102),
(81, 7, 81),
(82, 7, 82),
(83, 7, 83);

-- --------------------------------------------------------

--
-- Struttura della tabella `Prodotto`
--

CREATE TABLE `Prodotto` (
  `idProdotto` int(11) NOT NULL,
  `nomeP` varchar(255) NOT NULL,
  `taglia` varchar(50) DEFAULT NULL,
  `prezzo` float NOT NULL,
  `quantita` int(50) NOT NULL DEFAULT 0,
  `descrizione` longtext NOT NULL,
  `specifiche` varchar(255) DEFAULT NULL,
  `vestibilita` varchar(255) DEFAULT NULL,
  `codCategoria` int(11) NOT NULL,
  `codImmagine` int(11) DEFAULT NULL,
  `isSconto` tinyint(1) NOT NULL DEFAULT 0,
  `sconto` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Prodotto`
--

INSERT INTO `Prodotto` (`idProdotto`, `nomeP`, `taglia`, `prezzo`, `quantita`, `descrizione`, `specifiche`, `vestibilita`, `codCategoria`, `codImmagine`, `isSconto`, `sconto`) VALUES
(1, 'Juventus Kit Home 2023/24 (18 mesi - 6 Anni)', NULL, 70, 50, 'Vestirsi come i grandi campioni per vivere una passione infinita già dai primi anni. Il completo kids composto da maglia, pantaloncini e calzettoni coordinati si ispira alla nuova divisa Home 2023/24. La maglia Home della Juventus per la stagione 23/24 unisce stile iconico e tecnologie innovative. Ispirata alle divise in bianco e nero del passato, questa maglia rimane fedele al DNA del club. Lo stemma della squadra ricamato e i dettagli in giallo completano il look.', NULL, NULL, 1, 28, 1, 20),
(2, 'Juventus Maglia Gara Away 2023/2024 Donna', NULL, 100, 50, 'La nuova divisa Away della Juventus per la stagione 2023/24 è ispirata al Monte Rosa che svetta su Torino.\r\n\r\nQuesta nuova divisa fa della freschezza il suo punto di forza e vanta un\'estetica accattivante che ricorda le inconfondibili vette innevate delle Alpi. Sulla base bianca, anelli grigi e l\'iconico rosa Juventus danno vita a una grafica frastagliata, omaggio alla parete rocciosa del Monte Rosa che contraddistingue lo skyline della città.\r\n\r\nLa versione della maglia per i tifosi è dotata della tecnologia AEROREADY, che utilizza materiali assorbenti e traspiranti per mantenere il corpo sempre asciutto.\r\n\r\nConcepita per sostenere i giocatori in campo, questa maglia è interamente realizzata con materiali riciclati e testimonia l\'impegno di adidas a mettere fine alla produzione di rifiuti plastici.\r\n', NULL, NULL, 2, 29, 1, 10),
(18, 'Juventus Maglia Gara Away 2023/2024', NULL, 100, 50, '', NULL, NULL, 2, 30, 1, 15),
(19, 'Juventus Maglia Gara Home 2023/24', NULL, 100, 50, 'Mostra la tua passione per la Juventus con la Maglia Home 2023/24.\r\n\r\nLo stile della maglia è caratterizzato dalla celebrazione delle inconfondibili strisce bianconere della Juventus, che evocano immediatamente un senso di orgoglio e di unità fra giocatori e tifosi. Il pattern - che dal 1903 rappresenta il simbolo visivo del club - è stato ricodificato: il motivo triangolare presente in questa stagione è stato ripensato e trasformato in una finitura spazzolata che riproduce il tipico manto di una zebra. Questa tecnica intende celebrare l’individualità e la maestria dei giocatori in campo, mentre l’assonanza delle iconiche strisce zebrate è un richiamo immediato ai colori bianco-neri.\r\nL’audace grafica all over che accomuna tutte le versioni della maglia è evidenziata dal contrasto con i dettagli gialli. Ispirato ad alcune leggendarie divise del passato, questo colore è presente in tutti gli elementi chiave dei capi: dallo scudetto ai loghi degli sponsor, fino alle tre strisce che adornano le spalle. Il risultato è una maglia che affonda le sue radici nell’eredità del club, ma che offre al contempo un inconfondibile design moderno.\r\n\r\nLa versione della maglia per i tifosi è dotata della tecnologia AEROREADY, che utilizza materiali assorbenti e traspiranti per mantenere il corpo sempre asciutto.', 'Realizzata in poliestere 100% riciclato, perfettamente in linea con l’impegno di adidas per porre fine ai rifiuti plastici.', NULL, 1, 31, 1, 15),
(20, 'Juventus Maglia Gara Portiere 2023/24', NULL, 100, 50, 'Maglia gara a manica corta con tecnologia Climalite. Loghi Juventus e adidas. 100% poliestere.', NULL, NULL, 1, 32, 1, 40),
(21, 'Juventus Maglia Gara Third 2023/2024 Donna', NULL, 70, 100, 'Torino, città d’arte, di storia, di cultura, di calcio, ma anche di architettura e di industria. Proprio a questi ultimi due aspetti si ispira il terzo kit 2023/24.\r\nLa nuova divisa incorpora un motivo a coste a maglia, selezionato per riflettere le texture e le superfici che si possono ritrovare nelle strutture architettoniche di Torino. L’omaggio al patrimonio industriale della città è nel colore di base, carbone, che completa un look davvero unico.\r\nNon solo: la scelta della base è un omaggio particolare, che vuole celebrare la lunga tradizione di leggendari portieri della Juventus, andando a riprodurre il colore che è diventato sinonimo delle loro maglie nel corso degli anni. L’idea, particolare e rivoluzionaria, è proprio utilizzare, per ricordarli, la divisa dei ruoli di movimento in campo, mettendo quindi al centro del gioco questo tipo di celebrazione. Il design è completato con un colletto abbottonato tipo “Henry” nero e le famose tre strisce adidas, in grigio, su ogni manica.\r\n\r\nLa maglia presenta la tecnologia AEROREADY, che utilizza materiali traspiranti o assorbenti per mantenere il corpo asciutto.', NULL, NULL, 3, 33, 0, NULL),
(22, 'Juventus Maglia Gara Third 2023/2024', NULL, 70, 50, 'Torino, città d’arte, di storia, di cultura, di calcio, ma anche di architettura e di industria. Proprio a questi ultimi due aspetti si ispira il terzo kit 2023/24.\r\nLa nuova divisa incorpora un motivo a coste a maglia, selezionato per riflettere le texture e le superfici che si possono ritrovare nelle strutture architettoniche di Torino. L’omaggio al patrimonio industriale della città è nel colore di base, carbone, che completa un look davvero unico.\r\nNon solo: la scelta della base è un omaggio particolare, che vuole celebrare la lunga tradizione di leggendari portieri della Juventus, andando a riprodurre il colore che è diventato sinonimo delle loro maglie nel corso degli anni. L’idea, particolare e rivoluzionaria, è proprio utilizzare, per ricordarli, la divisa dei ruoli di movimento in campo, mettendo quindi al centro del gioco questo tipo di celebrazione. Il design è completato con un colletto abbottonato tipo “Henry” nero e le famose tre strisce adidas, in grigio, su ogni manica.\r\n\r\nLa maglia presenta la tecnologia AEROREADY, che utilizza materiali traspiranti o assorbenti per mantenere il corpo asciutto.', NULL, NULL, 3, 34, 0, NULL),
(23, 'Juventus Anthem Jacket 2023/24', NULL, 120, 200, 'Allo stadio o lungo le strade della città, mostra a tutti la tua passione per la Juventus con la nuova giacca Anthem 2023/24.\r\nCreata come simbolo di unità e indossata dai campioni Bianconeri prima delle partite, presenta uno sfondo nero allover con lo stemma del club ricamato.\r\nLa struttura è caratterizzata da una vestibilità regolare, finiture a coste premium, una zip integrale e un collo alto per la massima praticità.\r\nLa tasca con zip su un lato e la tasca aperta sull\'altro ti permettono di tenere al sicuro gli oggetti importanti, così puoi concentrarti solo su quello che conta davvero: sostenere la tua squadra.\r\nVestibilità regolare.', 'Filato doppio, 63% cotone / 37% poliestere riciclato.\r\n\r\nAlmeno il 70% di questo prodotto è costituito da un mix di materiali riciclati e rinnovabili.', 'Il modello indossa la taglia M ed è alto 186 cm.', 4, 35, 1, 15),
(24, 'Juventus Calzettoni Gara Home Neri', NULL, 24, 50, 'Parte integrante della nuova divisa home ispirata al soprannome della Juventus, \"Le Zebre\".\r\nIn campo o sugli spalti, questi calzettoni da calcio adidas assicurano massimo comfort mentre ti muovi.\r\nLa tecnologia antiumidità AEROREADY, l\'ammortizzazione mirata e il supporto dell\'arco plantare sostengono ogni tuo passo.\r\nQuesto prodotto è realizzato con un filato che contiene almeno il 50% di Parley Ocean Plastic, un materiale creato riciclando rifiuti plastici recuperati su isole, spiagge, litorali e presso le comunità costiere prima che possano raggiungere gli oceani.', 'Il modello contiene almeno il 70% di materiali riciclati.\r\nCalzettoni ammortizzati della Juve realizzati in parte con Parley Ocean Plastic.\r\nLunghezza al ginocchio.\r\nMateriali: 85% poliestere riciclato / 10% cotone / 5% elastane.', NULL, 4, 36, 0, NULL),
(25, 'Juventus Calzettoni Gara Home Mini', NULL, 14, 50, 'Il look del piccolo tifoso bianconero si completa con i calzettoni della divisa Home 2023/24. Piede elasticizzato per una migliore calzata. Ammortizzazione anatomica per proteggere e sostenere le zone di elevato stress. Inserti in mesh per migliorare la traspirazione. 69% poliestere, 28% poliammide, 3% elastan.', NULL, NULL, 4, 37, 0, NULL),
(26, 'Juventus Maglia Pre-Partita Maniche Corte', NULL, 70, 100, 'Porta la tua autenticità sul campo da gioco con la maglia Pre-Match Juventus. Nei momenti prima del fischio di inizio l\'euforia è a mille e infinite possibilità si prospettano davanti a te. Questa maglia ti accompagna nella fase di riscaldamento per prepararti a dare il meglio con uno stile impeccabile.\r\n\r\nLo stemma del club ricamato ribadisce la tua passione per la Juve e ti ispira a raggiungere grandi traguardi. Grazie all\'utilizzo di materiali antiumidità e assorbenti, i prodotti adidas AEROREADY mantengono la pelle sempre asciutta. La vestibilità regolare favorisce movimenti liberi per performance stellari. I presupposti per una vittoria memorabile ci sono tutti.\r\n\r\nQuesto prodotto contiene almeno il 60% di materiali riciclati.', '• Girocollo a coste\r\n• Tecnologia AEROREADY\r\n• Interlock,100% poliestere riciclato', 'Vestibilità regolare', 4, 38, 1, 10),
(27, 'Juventus Maglia Pre-Partita Maniche Lunghe', NULL, 110, 50, 'ispirata alla divisa home, questa felpa da calcio adidas della Juventus è caratterizzata da un\'accattivante stampa allover che gioca con il motivo zebrato. La tecnologia AEROREADY assicura calore e comfort anche durante gli esercizi più intensi. Se hai bisogno di maggiore copertura, le asole per i pollici ti consentono di proteggere le mani', '100% materiali riciclati.', 'Il modello indossa la taglia M ed è alto 186 cm.', 4, 39, 1, 20),
(28, 'Juventus Pantaloncini Gara Home', NULL, 45, 100, 'Parte integrante della nuova divisa Home, ispirata al soprannome della squadra, \"Le Zebre\", gli short da calcio Juventus sono stati creati per offrire il massimo comfort ai tifosi.\r\nLa tecnologia AEROREADY ti aiuta a mantenere la pelle asciutta.\r\nLo stemma completa il look con un tocco d\'orgoglio.\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 4, 40, 0, NULL),
(29, 'Juventus Anthem Jacket Away', NULL, 140, 50, 'Un look futuristico per una squadra di calcio che guarda sempre avanti. Mostra la tua passione per la Juventus con questa felpa con cappuccio adidas caratterizzata da dettagli esclusivi. Il tessuto morbido ed elasticizzato e la vestibilità aderente assicurano praticità e versatilità. Lo stemma del club ad alta densità sul petto non lascia dubbi sulla tua fede calcistica.', 'Questo prodotto contiene almeno il 70% di materiali riciclati ed è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', 'Il modello indossa la taglia M ed è alto 186 cm.', 5, 41, 1, 15),
(30, 'Juventus Calzettoni Gara Away', NULL, 24, 50, 'Parte integrante della nuova divisa Away.\r\nIn campo o sugli spalti, questi calzettoni da calcio adidas assicurano massimo comfort mentre ti muovi.\r\nLa tecnologia antiumidità AEROREADY, l\'ammortizzazione mirata e il supporto dell\'arco plantare sostengono ogni tuo passo.\r\nQuesto prodotto è realizzato con un filato che contiene almeno il 50% di Parley Ocean Plastic, un materiale creato riciclando rifiuti plastici recuperati su isole, spiagge, litorali e presso le comunità costiere prima che possano raggiungere gli oceani.\r\nIl modello contiene almeno il 70% di materiali riciclati.\r\nCalzettoni ammortizzati della Juve realizzati in parte con Parley Ocean Plastic.\r\nLunghezza al ginocchio.', 'Materiali: 85% poliestere riciclato / 10% cotone / 5% elastane', NULL, 5, 42, 1, 5),
(31, 'Juventus Maglia Gara Away Bambino', NULL, 75, 50, 'La nuova divisa Away della Juventus per la stagione 2023/24 è ispirata al Monte Rosa che svetta su Torino.\r\n\r\nQuesta nuova divisa fa della freschezza il suo punto di forza e vanta un\'estetica accattivante che ricorda le inconfondibili vette innevate delle Alpi. Sulla base bianca, anelli grigi e l\'iconico rosa Juventus danno vita a una grafica frastagliata, omaggio alla parete rocciosa del Monte Rosa che contraddistingue lo skyline della città.\r\n\r\nLa versione della maglia per i tifosi è dotata della tecnologia AEROREADY, che utilizza materiali assorbenti e traspiranti per mantenere il corpo sempre asciutto.\r\nConcepita per sostenere i giocatori in campo, questa maglia è interamente realizzata con materiali riciclati e testimonia l\'impegno di adidas a mettere fine alla produzione di rifiuti plastici.', NULL, NULL, 5, 43, 0, NULL),
(32, 'Juventus Pantaloncini Away', NULL, 45, 15, 'Parte integrante della nuova divisa Away, gli short da calcio Juventus sono stati creati per offrire il massimo comfort.\r\nLa tecnologia AEROREADY ti aiuta a mantenere la pelle asciutta.\r\nLo stemma completa il look con un tocco d\'orgoglio.\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica', NULL, NULL, 5, 44, 1, 20),
(33, 'Juventus Anthem Jacket Third', NULL, 140, 50, 'Sostieni il club e la sua città. Caratterizzata da colori monocromatici ispirati alla terza divisa della Juventus, questa giacca da calcio adidas è identica al modello indossato dalle stelle della squadra prima delle partite più importanti. La struttura in tela con fodera in mesh assicura il massimo comfort mentre tifi sugli spalti. La vestibilità aderente e la tecnologia antiumidità AEROREADY ti aiutano ad azzerare le distrazioni.', 'Il modello indossa la taglia M ed è alto 186 cm.', 'Vestibilità aderente\r\nZip integrale e collo alto\r\n100% poliestere riciclato\r\nTasche anteriori con zip', 6, 45, 1, 10),
(34, 'Juventus Calzettoni Gara Third 2023/24', NULL, 23, 50, 'Parte integrante della nuova divisa Third.\r\nIn campo o sugli spalti, questi calzettoni da calcio adidas assicurano massimo comfort mentre ti muovi.\r\nLa tecnologia antiumidità AEROREADY, l\'ammortizzazione mirata e il supporto dell\'arco plantare sostengono ogni tuo passo.\r\nQuesto prodotto è realizzato con un filato che contiene almeno il 50% di Parley Ocean Plastic, un materiale creato riciclando rifiuti plastici recuperati su isole, spiagge, litorali e presso le comunità costiere prima che possano raggiungere gli oceani.', NULL, NULL, 6, 46, 0, NULL),
(35, 'Juventus Maglia Gara Third Authentic 2023/2024', NULL, 150, 70, 'Torino, città d’arte, di storia, di cultura, di calcio, ma anche di architettura e di industria. Proprio a questi ultimi due aspetti si ispira il terzo kit 2023/24.\r\nLa nuova divisa incorpora un motivo a coste a maglia, selezionato per riflettere le texture e le superfici che si possono ritrovare nelle strutture architettoniche di Torino. L’omaggio al patrimonio industriale della città è nel colore di base, carbone, che completa un look davvero unico.\r\nNon solo: la scelta della base è un omaggio particolare, che vuole celebrare la lunga tradizione di leggendari portieri della Juventus, andando a riprodurre il colore che è diventato sinonimo delle loro maglie nel corso degli anni. L’idea, particolare e rivoluzionaria, è proprio utilizzare, per ricordarli, la divisa dei ruoli di movimento in campo, mettendo quindi al centro del gioco questo tipo di celebrazione. Il design è completato con un colletto abbottonato tipo “Henry” nero e le famose tre strisce adidas, in grigio, su ogni manica.\r\n\r\nLa versione Authentic è realizzata con la tecnologia HEAT.RDY, ottimizzata per dare comodità ai giocatori mentre si esibiscono sui palcoscenici più importanti.', NULL, NULL, 6, 47, 1, 5),
(36, 'Juventus Pallone Club Third 2023/24', NULL, 20, 100, 'Pallone di misura 5 con loghi Juventus e adidas. 100% gomma naturale.\r\n\r\n', NULL, NULL, 6, 48, 0, NULL),
(37, 'Juventus Pantaloncini Third 2023/24', NULL, 45, 100, 'Parte integrante della nuova divisa Third, gli short da calcio Juventus sono stati creati per offrire il massimo comfort.\r\nLa tecnologia AEROREADY ti aiuta a mantenere la pelle asciutta.\r\nLo stemma completa il look con un tocco d\'orgoglio.\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 6, 49, 1, 10),
(70, 'Juventus Giacca Pre-Partita 2023/24', NULL, 70, 50, 'Stile bianconero anche fuori dal campo. Quando non si allenano e non affrontano gli avversari, i giocatori rappresentano la loro squadra indossando questa giacca adidas realizzata in tessuto ripstop leggero dalla vestibilità ampia e rilassata. La tasca con zip su entrambi i lati ti permette di tenere a portata di mano gli oggetti di valore, mentre lo stemma del club stampato mostra a tutti per chi fai il tifo.\r\n\r\nQuesto prodotto contiene almeno il 70% di materiali riciclati ed è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 8, 98, 0, NULL),
(71, 'Juventus Anthem Jacket Third 2023/24', NULL, 140, 50, 'Allo stadio o lungo le strade della città, mostra a tutti la tua passione per la Juventus con la nuova giacca Anthem 2023/24.\r\nCreata come simbolo di unità e indossata dai campioni Bianconeri prima delle partite, presenta uno sfondo grigio con lo stemma del club applicato a caldo.\r\nLa struttura è caratterizzata da una vestibilità regolare, finiture a coste premium, una zip integrale e un collo alto per la massima praticità.\r\nLe tasche con zip sui lati ti permettono di tenere al sicuro gli oggetti importanti, così puoi concentrarti solo su quello che conta davvero: sostenere la tua squadra.\r\nVestibilità regolare.', NULL, NULL, 8, 60, 1, 15),
(72, 'Juventus Maglia Allenamento 2023/24', NULL, 55, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questa maglia adidas ti aiuta a dare il meglio anche durante gli allenamenti più intensi grazie agli inserti in mesh e alla tecnologia antiumidità AEROREADY. Lo stemma a trasferimento termico sul petto ti ricorda che vale la pena impegnarti per qualcosa in cui credi.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, 'La modella indossa la taglia S.\r\nAltezza Modella: 177 cm', 8, 61, 0, NULL),
(73, 'Juventus Pantaloncini Allenamento Donna 2023/24', NULL, 45, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questi short adidas ti aiutano a dare il massimo durante i rondos e gli sprint grazie alla vestibilità aderente e alla tecnologia antiumidità AEROREADY. Le tasche anteriori con zip ti permettono di tenere gli oggetti importanti a portata di mano.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 8, 62, 1, 20),
(74, 'Juventus Felpa Allenamento Bambino 2023/24', NULL, 55, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questa è la versione junior della maglia indossata dai giocatori adidas durante le fredde sessioni mattutine. I polsini con asole per i pollici assicurano una copertura ottimale, mentre la tecnologia antiumidità AEROREADY ti aiuta a mantenere la pelle asciutta anche durante le fasi più intense.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 15, 63, 1, 15),
(75, 'Juventus Felpa Allenamento Turquoise', NULL, 65, 100, 'Felpa allenamento a manica lunga, collo con zip. Loghi Juventus e adidas. 100% poliestere climalite.', NULL, NULL, 15, 64, 0, NULL),
(76, 'Juventus Felpa Girocollo Jay Nera', NULL, 50, 100, 'Felpa girocollo con loghi Juventus e adidas. 70% cotone, 30% poliestere.', NULL, NULL, 15, 65, 1, 10),
(77, 'Juventus Maglia Allenamento Bianca 2023/24', NULL, 50, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questa maglia adidas ti aiuta a dare il meglio anche durante gli allenamenti più intensi grazie alla vestibilità aderente, agli inserti in mesh e alla tecnologia antiumidità AEROREADY. Lo stemma a trasferimento termico sul petto di questa versione junior ti ricorda che vale la pena impegnarti per qualcosa in cui credi.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 15, 66, 1, 5),
(78, 'Juventus Maglia Allenamento Magenta', NULL, 55, 100, 'Maglia allenamento a maniche corte . Loghi Adidas e Juventus. 100% poliestere climacool®: consente la gestione del calore e dell\'umidità tramite la ventilazione.', NULL, NULL, 15, 67, 0, NULL),
(79, 'Juventus Pantaloni Pre-Partita Blu', NULL, 55, 100, 'Pantaloni pre-partita con girovita elasticizzato e coulisse adattabile. Loghi adidas e Juventus. 100% poliestere climacool®. Vestibilità affusolata.', NULL, NULL, 15, 68, 1, 10),
(80, 'Juventus Felpa Allenamento Gialla 2023/24', NULL, 75, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questa è la maglia indossata dai giocatori adidas durante le fredde sessioni mattutine. I polsini con asole per i pollici assicurano una copertura ottimale, mentre la tecnologia antiumidità AEROREADY ti aiuta a mantenere la pelle asciutta anche durante le fasi più intense.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', '• Collo alto a coste con zip da ¼\r\n• Tecnologia AEROREADY\r\n• Inserti elasticizzati in mesh sui lati\r\n• Piqué, 100% poliestere riciclato', '• Vestibilità aderente\r\n• Il modello è alto 188cm e veste una taglia L.', 7, 50, 1, 10),
(81, 'Juventus Felpa Allenamento Nera 2023/24', NULL, 75, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questa è la maglia indossata dai giocatori adidas durante le fredde sessioni mattutine. I polsini con asole per i pollici assicurano una copertura ottimale, mentre la tecnologia antiumidità AEROREADY ti aiuta a mantenere la pelle asciutta anche durante le fasi più intense.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, 'Altezza modello: 187 cm - Taglia M.', 7, 51, 1, 10),
(82, 'Juventus Felpa Allenamento Pro 2023/24', NULL, 80, 100, 'Le zone funzionali progettate per favorire i movimenti e la tecnologia di ventilazione HEAT.RDY rendono questa maglia da allenamento il massimo in fatto di comfort, anche durante gli scambi più intensi. Lo stemma a trasferimento termico mostra chiaramente da che parte stai.\r\n100% rec. polyester.', NULL, NULL, 7, 52, 1, 10),
(83, 'Juventus Pantaloncini Allenamento Gialli 2023/24', NULL, 45, 100, 'Quando fai parte dell\'élite del calcio, l\'allenamento è l\'unico modo per rimanere sempre in vetta. Parte integrante della divisa da training della Juventus, questi short adidas ti aiutano a dare il massimo durante i rondos e gli sprint grazie alla tecnologia antiumidità AEROREADY. Le tasche anteriori con zip ti permettono di tenere gli oggetti importanti a portata di mano.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', '• Girovita elasticizzato con cordino\r\n• Tecnologia AEROREADY\r\n• Tasche anteriori con zip', '• Vestibilità regolare\r\n• Il modello è alto 185cm e veste una taglia M.', 7, 53, 0, NULL),
(84, 'Juventus Pantaloni Allenamento Bianchi Pro 2023/24', NULL, 90, 100, 'Quando la competizione si fa dura, il più piccolo vantaggio può fare la differenza. Parte integrante della collezione da allenamento premium Tiro 23 Pro della Juventus, questi pantaloni da calcio adidas ti aiutano a volare in campo grazie alla vestibilità aderente e al tessuto elasticizzato. La tecnologia antiumidità AEROREADY consente di mantenere la pelle sempre asciutta.\r\n\r\nQuesto prodotto contiene almeno il 70% di materiali riciclati ed è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 7, 54, 1, 5),
(85, 'Juventus Pantaloni Allenamento Neri 2023/24', NULL, 65, 100, 'Una storia di successi non si costruisce solo in partita: il tempo trascorso in allenamento è prezioso tanto quanto quello di gara. Questi pantaloni adidas Tiro 23 aiutano i giocatori della Juventus a mantenere alti i loro standard mentre perfezionano le loro abilità. La tecnologia antiumidità AEROREADY assicura massima freschezza, la vestibilità aderente e le linee affusolate favoriscono la libertà di movimento.\r\n\r\nQuesto prodotto è realizzato al 100% con materiali riciclati. Questa è solo una delle nostre azioni concrete per contrastare l\'inquinamento causato dalla plastica.', NULL, NULL, 7, 55, 1, 10),
(86, 'Juventus Pantoloncini Allenamento Pro 2023/24', NULL, 70, 100, 'Materiali: 82% rec. polyester/18% Elasthane.', NULL, NULL, 7, 56, 1, 5),
(87, 'Juventus Parka Get Ready Kit 2023/24', NULL, 220, 100, 'Dalle strade di città allo stadio, questo parka da calcio adidas ti ripara dagli elementi. Il tessuto idrorepellente protegge dalla pioggia, mentre l\'imbottitura leggera trattiene il calore. Il cappuccio regolabile ti aiuta a tenere a bada il freddo e le tasche con zip sono perfette per tenere al sicuro gli oggetti di valore. Lo stemma semplice ma d\'effetto della Juve, simbolo del percorso verso la vittoria, aggiunge il tocco finale.', NULL, 'Il modello è alto 183cm e veste una taglia M.', 7, 57, 1, 15),
(88, 'Juventus Polo Rappresentanza Bianca 2023/24', NULL, 55, 100, 'Polo a maniche corte, colletto con bottoni. Loghi adidas e Juventus. 35% cotone, 65% poliestere.\r\n', NULL, NULL, 7, 58, 0, NULL),
(89, 'Juventus Beauty', NULL, 35, 100, 'borsa per contenere prodotti cosmetici', NULL, NULL, 9, 103, 1, 5),
(90, 'Juventus Borsa Porta Scarpe', NULL, 25, 100, 'Borsa portascarpe con chiusura a zip e maniglia per un facile trasporto. Loghi adidas e Juventus. 100% poliestere.', NULL, NULL, 9, 104, 1, 5),
(91, 'Juventus Cappellino 5P - Bambino', NULL, 25, 100, 'Cappellino baseball con fascetta regolabile. Logo Juventus. 100% cotone.', NULL, NULL, 9, 105, 0, NULL),
(92, 'Juventus Guanti Neri', NULL, 25, 100, 'Uno stemma semplice può essere ricco di significato. La lettera \"J\" del logo della Juventus su questi guanti adidas sottolinea tutta la tua passione per il calcio. Realizzati in morbido tessuto leggermente elasticizzato, ti consentono di utilizzare il telefono senza toglierli grazie allo speciale design. 93% poliacrilico, 6% poliestere, 1% elastane.', NULL, NULL, 9, 106, 0, NULL),
(93, 'Juventus Sacca Palestra', NULL, 15, 100, 'Borsa con chiusura regolabile a corde. Loghi adidas e Juventus. 100% poliestere.', NULL, NULL, 9, 107, 0, NULL),
(94, 'Juventus Sacca', NULL, 25, 100, 'Questa pratica sacca da palestra è rifinita con l\'inconfondibile stemma della Juventus al centro. Lo scomparto principale è perfetto per organizzare al meglio i tuoi effetti personali, mentre la tasca laterale con chiusura a zip ti permette di custodire gli oggetti di valore in tutta sicurezza. I cordini doppi sono utilizzabili anche come spallacci per garantire praticità e leggerezza.\r\n100% poliestere.', NULL, NULL, 9, 108, 1, 5),
(95, 'Juventus Sciarpa Bianconera', NULL, 15, 100, 'sciarpa scaldacollo', NULL, NULL, 9, 109, 0, NULL),
(96, 'Juventus Zaino', NULL, 55, 100, 'Ampia apertura principale; 2 tasche laterali; tasca nascosta con cerniera, spallacci regolabili. Divisorio interno. 100% poliestere', NULL, NULL, 9, 110, 1, 5),
(97, 'Juventus Anthem Jacket 2023/24', NULL, 80, 100, 'L’Anthem Jacket da bambino si ispira alla giacca indossata dalla squadra prima del fischio d\'inizio ed è un simbolo dello spirito di appartenenza che accomuna i grandi campioni. Il modello ha un design versatile e accogliente, perfetto da indossare durane il training e il tempo libero. Realizzata in misto cotone, spacer e poliestere riciclato, è un simbolo dell\'impegno etico Juventus per la difesa dell\'ambiente contro l\'inquinamento da plastica.', NULL, NULL, 10, 93, 0, NULL),
(98, 'Juventus Essential Gaeen Joggers', NULL, 59.9, 50, 'Pantaloni tuta realizzati in 80% cotone - 20% poliestere con logo Juventus ricamato tono su tono. Disegnati e prodotti in Italia, con tessuti e materiali di qualità premium.', NULL, 'Il modello indossa la taglia L.\r\nAltezza Modello: 185 cm', 10, 94, 1, 10),
(99, 'Juventus Essential Long Sleeve T-Shirt', NULL, 44.9, 100, 'Maglia t-shirt nera a maniche lunghe realizzata in 100% cotone jersey con logo Juventus stampato lato cuore tono su tono. Disegnata e prodotta in Italia, con tessuti e materiali di qualità premium.', NULL, NULL, 10, 95, 0, NULL),
(100, 'Juventus Felpa con Cappuccio Logo', NULL, 54.9, 100, 'Felpa con cappuccio nera, pratica e funzionale per ogni occasione.', '• Chiusura a zip integrale\r\n• Polsini e orli a coste\r\n• Stampa logo Icon lato cuore', '• Regular\r\n• Il modello è alto 187 cm e indossa la taglia L', 10, 96, 0, NULL),
(101, 'Juventus Giacca Antivento', NULL, 80, 100, 'Giacca antivento a manica lunga, collo alto e cappuccio, zip intera frontale, tasche laterali. Loghi Juventus e adidas. 100% poliestere.', NULL, NULL, 10, 97, 1, 15),
(102, 'Juventus Giacca Pre-Partita Bianca', NULL, 80, 100, 'Track top con zip intera frontale, loghi adidas e Juventus. 100% nylon riciclato.', NULL, NULL, 10, 98, 1, 20),
(103, 'Juventus Giacca Pre-Partita Turquoise', NULL, 80, 100, 'Track top con zip intera frontale, loghi adidas e Juventus. 87% poliestere e 13% cotone.', NULL, NULL, 10, 99, 1, 15),
(104, 'Juventus Icon - College Jacket 2023', NULL, 149.9, 100, 'La college jacket Juventus, il capo di tendenza per ogni occasione, che permette di fondere in modo equilibrato uno stile più classico ad uno più casual perfetto per creare look più dinamici, particolarmente indicato per le mezze stagioni.', '• Tasche laterali\r\n• Colletto alla coreana\r\n• Polsini e fondo a costine bicolori\r\n• Chiusura centrale con bottoni automatici\r\n• Logo Juventus ricamato lato cuore', '• Regular', 10, 100, 0, NULL),
(105, 'Juventus SSP Down Jacket', NULL, 200, 100, 'Uno stile inconfondibile. Questo piumino della Juventus fa parte di una collezione adidas pensata per la tifoseria. La vestibilità ampia e l\'imbottitura in piumino d\'anatra e piuma assicurano calore e comfort mentre sei a bordo campo. I colori della terza divisa mostrano a tutti la tua passione per il grande calcio.', '- Zip integrale e cappuccio regolabile con cordino elasticizzato\r\n- Tasche anteriori applicate\r\n- Tasca interna con chiusura a zip sul petto', '- Oversize', 10, 101, 1, 15),
(106, 'Juventus Costume Intero Donna', NULL, 39.9, 100, 'Questo costume intero è realizzato in poliestere e interamente foderato. Il modello beachwear presenta scollatura rotonda, schiena scoperta e il logo Juventus.\r\n\r\nModello versatile, può essere anche utilizzato come body in abbinamento con degli shorts.', '80% Poliestere 20% Elastan', 'La modella indossa la taglia S.\r\nAltezza Modella: 175 cm', 11, 73, 0, NULL),
(107, 'Juventus Costume Intero Rosa Donna', NULL, 49.9, 100, 'Questo costume intero è realizzato in poliestere e interamente foderato. Il modello beachwear presenta scollatura rotonda, schiena scoperta, il logo Juventus sul fronte e la scritta JUVE sul retro. Disponibile anche in colore nero.\r\n\r\nModello versatile, può essere anche utilizzato come body in abbinamento con degli shorts.', '80% Poliestere 20% Elastan', 'La modella indossa la taglia S.\r\nAltezza Modella: 175 cm', 11, 74, 0, NULL),
(108, 'Juventus Felpa Logo Paillets - Donna', NULL, 54.9, 100, 'Felpa girocollo realizzata in 100% cotone con stampa centrale del logo Juventus con pailletes. Disegnato e prodotto in Italia.', 'La modella indossa la taglia M.\r\nAltezza Modella: 177 cm', NULL, 11, 75, 0, NULL),
(109, 'Juventus Maglia Storica Home 1984/85 Donna', NULL, 59.9, 100, 'In seguito a un modesto quinto posto in Serie A, il focus della stagione 1984-85 per la Juventus diventa l’Europa. Per due volte nell’arco di soli cinque mesi i bianconeri si trovano ad affrontare il Liverpool, prima a Torino per la Supercoppa europea, poi a Bruxelles per la finale della Coppa europea stessa. La Juventus vince entrambe le partite anche se la gioia di diventare i campioni d\'Europa per la prima volta è stata attenuata a causa dei tragici eventi avvenuti fuori dallo stadio Heysel quella sera. Michel Platini rimane la principale fonte di goal del club diventando capocannoniere in Serie A con 18 reti e capocannoniere in Europa con 7 goal. Il francese forma un formidabile trio sul davanti a fianco di Massimo Briaschi e del veterano Paolo Rossi.', NULL, NULL, 11, 76, 0, NULL),
(110, 'Juventus Pantalone Nero Donna', NULL, 34.9, 100, 'Pantalone tuta. 100% cotone', NULL, NULL, 11, 77, 0, NULL),
(111, 'Juventus Perizoma intimo Donna Bianco', NULL, 10, 100, 'Mutande perizoma intimo donna in cotone/elastane, colore bianco con elastico girovita “Juventus”', NULL, NULL, 11, 78, 0, NULL),
(112, 'Juventus Pigiama Donna con Blusa.jpg', NULL, 34.9, 100, 'Pigiama in cotone con blusa a maniche lunghe con tre bottoni. Leggins.', NULL, NULL, 11, 79, 0, NULL),
(113, 'Juventus Shorts Core', NULL, 29.9, 100, 'Shorts da donna che si distinguono per la comodità e praticità, perfetti per le occasioni più sportive abbinati a t-shirt squadrate o al top coordinato.', '• Girovita elasticizzato con coulisse\r\n• Tasche laterali\r\n• Stampa del logo Icon in colore nero su gamba sinistra', '• Regular', 11, 80, 0, NULL),
(114, 'Juventus Slip Brasiliana', NULL, 14.9, 100, 'Slip \" Brasiliana\" in cotone stretch, qualità premium;\r\nconsigliato in abbinato al top \"bralette\" coordinato', NULL, NULL, 11, 81, 0, NULL),
(115, 'Juventus Slip Costume Donna', NULL, 19.9, 100, 'Slip costume donna con logo Juventus stampato. Modello sgambato, vita alta.\r\nPer persone di corporatura snella si consiglia di scegliere una taglia in meno di quella solitamente indossata.\r\nComposizione prodotto: 80% poliammide, 20% elastan.', NULL, NULL, 11, 82, 0, NULL),
(116, 'Juventus Slip Intimo Donna Bianco', NULL, 10, 100, 'Slip intimo donna in misto cotone ed elastane per un tocco stretch. Mutande underwear in tinta unita bianche complete di elastico in vita a contrasto con scritta Juventus.', NULL, NULL, 11, 83, 0, NULL),
(117, 'Juventus Top Costume Donna', NULL, 19.9, 200, 'Top costume donna con logo Juventus stampato. 80% poliammide, 20% elastan.', NULL, NULL, 11, 84, 0, NULL),
(118, 'Juventus Canotta Nera Logo Ragazzo', NULL, 16.9, 100, 'Canottiera girocollo con stampa laterale. 100% cotone.', NULL, NULL, 12, 89, 0, NULL),
(119, 'Juventus Costume Slip Ragazzo', NULL, 22.9, 50, 'Costume da ragazzo con fodera senza coulisse e logo Juventus stampato. 80% poliammide, 20% elastan.', NULL, NULL, 12, 90, 0, NULL),
(120, 'Juventus Felpa Girocollo Nera Bambino', NULL, 55, 50, 'Il DNA della Juve è bianconero. Realizzata nei celebri colori del club, questa felpa da calcio adidas è rifinita sul retro da uno scatto che ritrae il pattern tono su tono della divisa away. La struttura in spugna ti avvolge nel comfort mentre supporti la tua squadra.\r\n70% cotone, 30% poliestere.', NULL, NULL, 12, 91, 0, NULL),
(121, 'Juventus Hoodie Full Zip Pink Logo', NULL, 39, 50, 'Felpa con cappuccio per bambina realizzata in 100% cotone con stampa lato cuore. Disegnato e prodotto in Italia.', NULL, NULL, 12, 92, 0, NULL),
(122, 'Juventus Felpa Cappuccio Bambino Logo Lapis', NULL, 39.9, 100, 'Felpa pratica e comoda adatta ad assolvere ogni funzione, perfetta da utilizzare quotidianamente si distingue per la riproduzione del logo Juventus come se fosse disegnato a matita posto sul fronte della felpa.', NULL, NULL, 13, 69, 0, NULL),
(123, 'Juventus Felpa Tracktop Star - Kids', NULL, 29.9, 50, 'Felpa girocollo realizzata in 100% cotone con stampa centrale.', NULL, NULL, 13, 70, 0, NULL),
(124, 'Juventus T-Shirt Bambino Logo 3D Arancione', NULL, 29.9, 100, 'Tshirt in 100% cotone, in colore nero, caratterizzata dal logo Juventus in versione 3D in colore arancione.', NULL, NULL, 13, 71, 1, 60),
(125, 'Juventus Valigetta Gioca Colora E Indossa', NULL, 29.9, 100, 'Valigetta comprensiva di scatola da 12 pennarelli a punta grossa per tessuti modello FABRIC e una t-shirt da colorare.', NULL, NULL, 13, 72, 0, NULL),
(126, 'Juventus Baby Jogger 2023/24', NULL, 55, 100, 'La passione per il calcio non ha età. Questa tuta adidas infant della Juventus assicura morbidezza e un look vivace. La struttura in tessuto felpato di misto cotone è rifinita con una coppia di stemmi del club applicati a caldo.', NULL, NULL, 14, 85, 1, 10),
(127, 'Juventus Felpa Cappuccio Life\'s a game Neonato', NULL, 29.9, 100, 'Felpa con cappuccio e zip intera frontale, tasche laterali, polsini e fondo top elasticizzati. Logo Juventus sul davanti e stampa sul retro. 100% cotone.', NULL, NULL, 14, 86, 1, 15),
(128, 'Juventus Set 2 Bavaglini', NULL, 19.9, 100, 'Set composto da due bavaglini con grafiche Juventus. 100% cotone.', NULL, NULL, 14, 87, 0, NULL),
(129, 'Juventus Tutina Ciniglia Logo Rosa', NULL, 29.9, 100, 'Tutina neonato a manica lunga con stampa sul davanti. 100% ciniglia.', NULL, NULL, 14, 88, 0, NULL),
(130, 'vivabonfy', NULL, 50, 1, 'fdfdfd', NULL, NULL, 2, 40, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sconto`
--

CREATE TABLE `Sconto` (
  `idSconto` int(11) NOT NULL,
  `nuovoPrezzo` float NOT NULL,
  `dataFineSconto` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `idUtente` int(11) NOT NULL,
  `nomeU` varchar(255) NOT NULL,
  `cognomeU` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipoAccount` int(11) NOT NULL DEFAULT 2,
  `usernameU` varchar(255) NOT NULL,
  `passwordU` varchar(255) NOT NULL,
  `dataUltimaModifica` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Utente`
--

INSERT INTO `Utente` (`idUtente`, `nomeU`, `cognomeU`, `email`, `tipoAccount`, `usernameU`, `passwordU`, `dataUltimaModifica`) VALUES
(2, 'Danilo', 'Villarà', 'danilovillara@gmail.com', 1, 'admin', 'admin', '2024-05-30'),
(3, 'Salvo', 'Villarà', 'salvovillara@gmail.com', 2, 'salvo', 'salvo', '2024-05-30'),
(5, 'Michele', 'Mannelli', 'michelemannelli@gmail.com', 2, 'moky', 'moky', NULL),
(6, 'Diego', 'Leanza', 'diegoleanza@gmail.com', 2, 'diegolnz', '$2y$10$ed0rF2ufYdTx/9t5Vwl7aO7JUNpjuBNyvOcJbiWUCPA3AN3jZwWs2', NULL),
(7, 'Danilo', 'Raeli', 'daniloraeli@gmail.com', 2, 'danilor', '$2y$10$lBVL2WtlsWOCYHr.yC0eaO60T.V4aqBnme4Srj0fRGaRuHD1FM.F2', NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Carrello`
--
ALTER TABLE `Carrello`
  ADD PRIMARY KEY (`idCarrello`),
  ADD KEY `codUtente` (`codUtente`),
  ADD KEY `codProdotto` (`codProdotto`);

--
-- Indici per le tabelle `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indici per le tabelle `Giocatore`
--
ALTER TABLE `Giocatore`
  ADD PRIMARY KEY (`idGiocatore`),
  ADD KEY `codImmagine` (`codImmagine`);

--
-- Indici per le tabelle `Immagine`
--
ALTER TABLE `Immagine`
  ADD PRIMARY KEY (`idImmagine`);

--
-- Indici per le tabelle `Preferiti`
--
ALTER TABLE `Preferiti`
  ADD PRIMARY KEY (`idPreferito`),
  ADD KEY `codUtente` (`codUtente`),
  ADD KEY `codProdotto` (`codProdotto`);

--
-- Indici per le tabelle `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD PRIMARY KEY (`idProdotto`),
  ADD KEY `codCategoria` (`codCategoria`),
  ADD KEY `codImmagine` (`codImmagine`);

--
-- Indici per le tabelle `Sconto`
--
ALTER TABLE `Sconto`
  ADD PRIMARY KEY (`idSconto`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`idUtente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usernameU` (`usernameU`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Carrello`
--
ALTER TABLE `Carrello`
  MODIFY `idCarrello` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT per la tabella `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `Giocatore`
--
ALTER TABLE `Giocatore`
  MODIFY `idGiocatore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `Immagine`
--
ALTER TABLE `Immagine`
  MODIFY `idImmagine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT per la tabella `Preferiti`
--
ALTER TABLE `Preferiti`
  MODIFY `idPreferito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  MODIFY `idProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT per la tabella `Sconto`
--
ALTER TABLE `Sconto`
  MODIFY `idSconto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Utente`
--
ALTER TABLE `Utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Carrello`
--
ALTER TABLE `Carrello`
  ADD CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`codUtente`) REFERENCES `Utente` (`idUtente`),
  ADD CONSTRAINT `carrello_ibfk_2` FOREIGN KEY (`codProdotto`) REFERENCES `Prodotto` (`idProdotto`);

--
-- Limiti per la tabella `Giocatore`
--
ALTER TABLE `Giocatore`
  ADD CONSTRAINT `giocatore_ibfk_1` FOREIGN KEY (`codImmagine`) REFERENCES `Immagine` (`idImmagine`);

--
-- Limiti per la tabella `Preferiti`
--
ALTER TABLE `Preferiti`
  ADD CONSTRAINT `preferiti_ibfk_1` FOREIGN KEY (`codUtente`) REFERENCES `Utente` (`idUtente`),
  ADD CONSTRAINT `preferiti_ibfk_2` FOREIGN KEY (`codProdotto`) REFERENCES `Prodotto` (`idProdotto`);

--
-- Limiti per la tabella `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`codCategoria`) REFERENCES `Categoria` (`idCategoria`),
  ADD CONSTRAINT `prodotto_ibfk_2` FOREIGN KEY (`codImmagine`) REFERENCES `Immagine` (`idImmagine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
