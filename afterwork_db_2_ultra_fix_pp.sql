-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 05 mai 2022 à 10:44
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `afterwork_db_2`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `contenu` text NOT NULL,
  `id_employe` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_rubrique` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`contenu`, `id_employe`, `titre`, `date_creation`, `id_rubrique`, `id_article`) VALUES
('Un contenu intéressant', 1, 'Un titre absolu', '2022-01-05 15:55:51', 1, 1),
('qdqdq', 1, 'Test', '2022-01-05 16:53:21', 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`nom`, `description`, `id_categorie`) VALUES
('Racine', '', 1),
('Boutique', '', 2),
('Infusion', '<p><span style=\"color:#363a41;font-family:\'Open Sans\', Helvetica, Arial, sans-serif;font-size:12.8px;\">La Brûlerie Comtoise vous propose une sélection d\'infusions...<br />Classiques, fruitées, épicées il y en a pour tous les goûts... A consommer aussi bien chaudes que glacées elles sauront vous accompagner toute au long de la journée et au fil des saisons... </span></p>', 10),
('Infusettes', '<p>La Brûlerie Comtoise vous fait découvrir sa large de gamme d\'infusions en sachet individuel. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France.</p>', 11),
('Infusion vrac', '<p>La Brûlerie Comtoise vous propose une sélection d\'infusions.<br />Classiques, fruitées, épicées il y en a pour tous les goûts... A consommer aussi bien chaudes que glacées elles sauront vous accompagner tout au long de la journée et au fil des saisons...</p>', 12),
('Thé', 'Description de la catégorie thé', 13),
('Café', '', 14),
('Infusettes', '<p>La Brûlerie Comtoise vous fait découvrir sa large gamme de thés en sachets individuels. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France. </p>', 15),
('Thé vrac', '<p>Découvrez la sélection de thés vrac de la Brûlerie Comtoise. <br />Amateurs de grandes origines, de mélanges aromatisés, fruités ou épicés... Sur une base de thé blanc, de thé vert ou de thé noir... il y a de quoi ravir tous les palais...</p>', 16),
('Café capsule', '<p style=\"text-align:right;\"><img src=\"https://www.labruleriecomtoise.fr/img/cms/capsules.jpg\" alt=\"\" width=\"275\" height=\"207\" style=\"float:left;\" /></p>\n<blockquote>\n<p style=\"text-align:justify;\">La Brûlerie Comtoise a développé sa sélection de capsules compatibles Nespresso®. Après avoir été torréfié le café est transformé et mis en capsule dans notre manufacture de la Grande rue de Dole. Étant basée sur la même gamme que notre sélection de café en grain, les capsules bénéficient des mêmes labels : Rainforest, issu de l\'agriculture biologique. De plus, elles sont labellisées « Made in Jura », label qui valorise la production artisanale et locale. </p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\">La production se veut intégralement Made in France. La machine qui permet de concevoir les capsules, ainsi que les capsules elles-mêmes sont fabriquées en France. Élaborées dans des matières biodégradables, la dosette est en amidon de maïs et l\'opercule en canne à sucre. Elles illustrent pleinement la volonté de l\'entreprise de préserver l\'environnement et de limiter la production de déchets. </p>\n</blockquote>\n<p align=\"justify\" style=\"margin-bottom:0cm;text-align:justify;\"></p>', 17),
('Café grain', '', 18),
('Café grain & moulu', '<p style=\"text-align:justify;\">Le cœur du métier de la Brûlerie Comtoise est sa torréfaction 100% doloise. Du sourcing, à la réception des échantillons, aux séances de tasting et pour finir à la transformation du grain vert... tout se passe entre les quatre mûrs de la manufacture de la Grande rue de Dole. </p>\n<p style=\"text-align:justify;\">Attirés par les effluves du café grillé, les passants du centre ville peuvent assister aux séances de torréfaction et écouter les histoires et les conseils de Yoann sur le café. </p>\n<p style=\"text-align:justify;\">Torréfacteur et diplômé du Q Arabica Grader, Yoann Bride gère la sélection et la production du café de la Brûlerie Comtoise. Il choisit lui-même les producteurs avec lesquels il veut collaborer afin de veiller que leurs plantations leur assurent une rémunération correcte. Dans un souci de qualité, de préservation de l\'environnement le choix des grains se porte sur des origines labellisées. Issue de l\'agriculture biologique, labellisée Rainforest (préservation de la forêt) la gamme proposée se veut au plus près de la nature. </p>\n<p style=\"text-align:justify;\">La sélection de Yoann, sera un voyage à chaque tasse. Destination l\'Afrique avec un café d\'Éthiopie ou du Burundi. L\'Amérique du Sud avec le café aux notes chocolatées du Pérou ou de Colombie, suaves du Honduras, des notes de fruits rouges dans le Brésil ou le déca du Mexique. </p>\n<p style=\"text-align:justify;\">Le traditionnel Mélange Italien avec son assemblage d\'arabica et de robusta et le Blend de la Brûlerie entièrement élaboré par Yoann complètent la gamme. Vous y trouverez des cafés intenses, corsés, fruités, acidulés, gourmands, doux et fleuris. Palais de grand amateur, de débutant ou d\'épicurien qui aime les bonnes choses il y aura forcément un café pour vous. </p>\n<p style=\"text-align:justify;\">Nous vous proposons également un café expérimental, unique au monde, vieilli en fût de Sauternes 1er grand cru classé. Ce café issu du travail de 3 amis, Simon Verger, MOF Maître d\'hôtel et directeur du Skiff club, 2 étoilés Michelin, de Jean Compeyrot du Château Sigalas Rabaud, 1er grand cru classé et de notre torréfacteur Yoann.</p>', 19),
('Rooibos', '<p>La Brûlerie Comtoise propose une gamme de rooibos parfumés. Issu d\'Afrique du Sud, faible en tanin, sans théine et aux vertus antioxydantes, le rooibos accompagnera volontiers toutes vos soirées. </p>', 20),
('Accompagnements', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme de confiseries... à grignoter, à tartiner ou à déguster... </p>', 21),
('Machine & Accessoire', '', 22),
('Les Chocolats de Damien Benetot', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>', 23),
('Coffret', '', 24),
('Pâques - Moulage', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>', 25),
('Chocolats, macarons et divers', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>', 26),
('Epicerie', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme Épicerie fine... à grignoter, à tartiner ou à déguster... </p>\n<p>Pour vous satisfaire du mieux possible nous avons élaboré une gamme de produits artisanaux, locaux si possible mais surtout MADE IN FRANCE. Nous avons à cœur de proposer des produits de qualité qui sauront accompagner vos instants de dégustation.</p>', 27),
('Confiseries', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme de confiseries... à grignoter, à tartiner ou à déguster... </p>', 28),
('Thé & Infusion', '', 29),
('Vrac', '<p><span style=\"color:#ffffff;\">Découvrez la sélection de thés et infusions vrac de la Brûlerie Comtoise. </span></p>\n<p><span style=\"color:#ffffff;\">Amateurs de grandes origines, de mélanges aromatisés, fruités ou épicés... Sur une base de thé blanc, vert ou noir, de fruits ou de plantes ... Il y a de quoi ravir tous les palais ...  </span></p>', 30),
('Sachet', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"color:#ffffff;\"><span style=\"font-family:\'Times New Roman\', serif;font-size:medium;\">La Brûlerie Comtoise vous fait découvrir sa large gamme de thés et infusions en sachets individuels. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France.</span></span></p>', 31);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `prenom` text NOT NULL,
  `nom` text NOT NULL,
  `mail` text NOT NULL,
  `adresse` text NOT NULL,
  `cp` text NOT NULL,
  `ville` text NOT NULL,
  `tel` text NOT NULL,
  `mot_de_passe` text NOT NULL,
  `newsletter` binary(1) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `roles_jwt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `prenom`, `nom`, `mail`, `adresse`, `cp`, `ville`, `tel`, `mot_de_passe`, `newsletter`, `uuid`, `roles_jwt`) VALUES
(1, 'John', 'DOE', 'john.doe@gmail.com', '18 rue de Bruxelle', '25000', 'Besançon', '0684365230', '$2y$13$Z.lpkjsZ.j1jyQlD7oYaweXXxOj2AJD8W41B8gJRxAlYBQH7lPhmy', 0x01, 'a5a88d79-3e3a-4db1-af58-1a42fa581ae6', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_table` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_table`, `id_statut`, `date`, `id_commande`) VALUES
(14, 1, '2022-05-01 09:37:29', 3);

-- --------------------------------------------------------

--
-- Structure de la table `commande_declinaison`
--

CREATE TABLE `commande_declinaison` (
  `id_commande_declinaison` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `prix_ht` int(11) NOT NULL,
  `id_produit_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande_declinaison`
--

INSERT INTO `commande_declinaison` (`id_commande_declinaison`, `quantite`, `id_commande`, `prix_ht`, `id_produit_declinaison`) VALUES
(1, 5, 3, 35, 1),
(2, 2, 3, 15, 5);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `id_client` int(11) NOT NULL,
  `titre` text NOT NULL,
  `description` text NOT NULL,
  `id_produit_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `declinaison`
--

CREATE TABLE `declinaison` (
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `id_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `declinaison`
--

INSERT INTO `declinaison` (`nom`, `description`, `id_declinaison`) VALUES
('250 g', '', 1),
('Filtre', '', 2),
('Piston', '', 3),
('Italienne', '', 4),
('Espresso', '', 5),
('500 g', '', 6),
('1 kg', '', 7),
('sachet 100 g', '', 21),
('boîte 100 g ', '', 22),
('Grain', '', 24),
('Boîte 100 g ', '', 25),
('Sachet 100g', '', 26),
('Boîte 50g', '', 27),
('Sachet 50g', '', 28),
('15', '', 30),
('50', '', 31),
('100', '', 32);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `nom` text NOT NULL,
  `id_role` int(11) NOT NULL,
  `prenom` text NOT NULL,
  `adresse` text NOT NULL,
  `ville` text NOT NULL,
  `cp` text NOT NULL,
  `date_embauche` date NOT NULL,
  `mot_de_passe` text NOT NULL,
  `mail` text NOT NULL,
  `roles_jwt` text NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `image` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id_employe`, `nom`, `id_role`, `prenom`, `adresse`, `ville`, `cp`, `date_embauche`, `mot_de_passe`, `mail`, `roles_jwt`, `uuid`, `image`) VALUES
(1, 'DOE', 1, 'John2', '8 chemin des brouettes', 'Besançon', '25000', '2021-12-16', '$2y$13$Z.lpkjsZ.j1jyQlD7oYaweXXxOj2AJD8W41B8gJRxAlYBQH7lPhmy', 'john2.doe@gmail.com', '[]', '8272124e-4c1f-43df-980f-b736fbb0bb3b', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `nom` text NOT NULL,
  `id_tva` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `description` text NOT NULL,
  `prix_unitaire` double NOT NULL,
  `image` text NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`nom`, `id_tva`, `id_categorie`, `description`, `prix_unitaire`, `image`, `id_produit`) VALUES
('Symphonie - 15 infusettes', 1, 31, 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes', 0, '', 128),
('Cerise sauvage - 15 infusettes', 1, 11, 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes', 0, '', 129),
('Digestive - 15 infusettes', 1, 31, 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit', 0, '', 130),
('Au clair de la Lune - 15 infusettes', 1, 31, 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante', 0, '', 131),
('Camomille - 15 infusettes', 1, 31, 'Camomille Bio', 0, '', 132),
('Infusion Tilleul - 15 infusettes', 1, 31, 'Tilleul', 0, '', 133),
('Infusion Verveine - 15 infusettes', 1, 31, 'Verveine Bio', 0, '', 134),
('La délicieuse - 15 infusettes', 1, 31, 'Verveine, Menthe Poivrée, Mélisse, Réglisse', 0, '', 135),
('Tisane de Noël - 15 infusettes', 1, 31, 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome', 0, '', 147),
('Transit - 15 infusettes', 1, 31, '<p>Anis Vert, Menthe Douce, Citronnelle</p>', 0, '', 148),
('Zen', 1, 11, 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot', 0, '', 149),
('Infusion Camomille - 50g', 1, 30, '', 0, '', 150),
('Infusion Fruits rouges - 100g', 1, 30, '', 0, '', 151),
('Infusion Mangue - 100g', 1, 30, '', 0, '', 152),
('Infusion Menthe - 50g', 1, 30, '', 0, '', 153),
('Thé noir caramel beurre salé - 100g', 1, 30, '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Du caramel fondant et doux accompagné d\'un soupçon de sel de perles africaines ajoutés aux morceaux de crème et d\'amandes... Il n\'en fallait pas plus pour inventer cette noble création gourmande.</span></p>', 0, '', 154),
('Darjeeling First Flush - 100g', 1, 30, '<p>Signifiant \"pays des orages\" en langue tibétaine. Plantation de thé noir issue de la région d\'Inde portant le même nom, elle est la seule à bénéficier d\'une Indication Géographique Protégée (IGP) pour lutter contre les nombreuses contrefaçons existantes.</p>\n<p>Le thé peut être récolté jusqu\'à 4 fois par an, celle du printemps, la première récolte, ou \"First Flush\" est très attendue des amateurs qui la qualifient de \"Champagne du thé\".</p>\n<p>Elle offre un thé léger et délicat aux notes fraîches et intenses, merveilleusement élaboré et présentant un caractère frais, légèrement épicé. </p>', 0, '', 155),
('English Breakfast - 100g', 1, 30, '<p style=\"text-align:justify;\">Ce mélange So British de culture biologique contrôlée est composé essentiellement de thés Assam. D\'abord réservée à l\'élite anglaise, la consommation du \"five o\'clock tea\" se démocratise au XIXe siècle. Depuis l\'époque coloniale, les Britanniques ont pour habitude de consommer des thés noirs plus corsés le matin comme ce ENGLISH BREAKFAST. Ce thé, à la fois puissant et aromatique, révèle une tasse foncée d\'un brun cuivré et un bouquet plein et épicé. </p>', 0, '', 156),
('Roiboos bergamote - 100g', 1, 30, '', 0, '', 165),
('Rooibos aloe vera melon', 1, 30, '', 0, '', 166),
('Rooibos Cranberry vanille - 100g', 1, 30, '', 0, '', 167),
('Rooibos Rhubarbe framboise - 100g', 1, 30, '', 0, '', 168),
('Thé blanc Chine - 50g', 1, 30, '<h3>Ce thé du Yunnan est cultivé à une altitude comprise entre 1300 et 2000m d\'altitude et à des températures allant de 12 à 23°C. Ses grandes feuilles ouvertes vert clair et la large proportion de pointes argentées laissent un bouquet doux et fleuri en bouche. La liqueur a un parfum fleuri dont la couleur rappelle le lever du soleil.<br />Le THE BLANC est celui qui nécessite le temps d\'infusion le moins long, l\'eau la moins chaude et est celui qui subit le moins de transformation.</h3>', 0, '', 169),
('Thé noir Ceylan - 100g', 1, 30, '<p>Jusqu’au milieu du XIXème siècle, on consommait à Ceylan exclusivement du café. Cependant, dans les années 1850, un parasite ravagea les plantations de café de l’île, ce qui obligea les cultivateurs anglais à recourir à une autre plante : les théiers. C’est ainsi que le thé fit son apparition au Sri Lanka.</p>\n<p>Ce Ceylan organique provient de la vallée de Bogawantalwa dans l\'ouest du Sri Lanka. Les feuilles courtes et foncées d\'un brun rouillé développent une tasse brillante de couleur cuivrée et une infusion rouge vif. Le bouquet vous impressionnera par son goût plein et un arôme doux et épicé, qui laisse un arrière-goût très riche.  </p>', 0, '', 170),
('Thé noir Chine - 100g', 1, 30, '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">La qualité supérieure de ce thé noir du Yunnan se présente magnifiquement avec beaucoup de grandes pointes de feuilles brun doré et une infusion brun cuivré foncé avec un goût bien équilibré et des notes légèrement douces et épicées. Elle vous laissera avec une touche finale douce et légèrement fumée. </span></p>', 0, '', 171),
('Thé noir fruits rouges - 100g', 1, 30, '<p style=\"text-align:justify;\"><span id=\"s2_1\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">L’ardeur du printemps se transforme en amour estival.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_3\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Les fleurs de pavot, le souci et la rose sont les annonciateurs de l’été.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_4\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Le bonheur peut durer un moment de plus sur cette prairie fruitée et douce de fleurs. </span></p>\n<p></p>\n<p></p>\n<p></p>', 0, '', 172),
('Thé noir Inde - 100g', 1, 30, '<p><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé noir du Sud de l\'Inde du jardin Thiashola a une saveur fraîche et légèrement tranchante avec un certain corps. Une feuille multicolore et inégale avec des tâches vertes. La couleur de coupe d\'un rouge cuivre offre un parfum de fleurs fraîches. </span></p>', 0, '', 173),
('Thé noir mangue - 100g', 1, 30, '', 0, '', 174),
('Thé noir orange - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Aussi rafraîchissant et vitaminé qu\'un jus d\'orange pressé, ce thé noir, frais et vif, sera votre allié pour démarrer votre journée du bon pied ! </span></p>', 0, '', 175),
('Thé noir pêche - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Ce thé de Ceylan doux décoré avec les couleurs de différentes fleurs et le bleu profond et scintillant de fleurs de bleuet est une promesse de détente complète. Cet arôme est composé des fruits les plus exotiques au monde et d\'un soupçon de crème douce qui fait errer vos pensées, vous permettant de profiter d’un moment de relaxation parfait et de recueillir de nouvelles forces. </span></p>', 0, '', 176),
('Thé vert citron jasmin - 100g', 1, 30, '', 0, '', 177),
('Thé vert fraise litchi - 100g', 1, 30, '', 0, '', 178),
('Thé vert Inde - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Au cours des dernières années, la plantation Nagri Farm, qui se trouve dans la vallée de Rongbong, a acquis une réputation exceptionnelle pour la production de thé vert. La plantation est répartie sur une superficie de 571 hectares à des altitudes allant jusqu’à 1400 m et a une production annuelle d’environ 190000 kg de thé. Les buissons poussent lentement dans l’air frais de la montagne et l’arôme et les feuilles peuvent se développer parfaitement dans ces conditions idéales. La feuille verte régulière a quelques pointes argentées et présente son caractère classique, rond et doux dans une tasse jaune citron. </span></p>', 0, '', 179),
('Thé vert Japon - 50g', 1, 30, '', 0, '', 180),
('Thé vert jasmin - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Avec une tasse légèrement jaune et le parfum expressif et typique de jasmin ainsi qu\'une légère note fruitée-acidulée, ce thé au jasmin est un compagnon idéal pour chaque repas et un vrai désaltérant. Selon la qualité de l’eau, le thé peut être infusé plus d’une fois</span></p>', 0, '', 181),
('Thé vert mangue ananas - 100g', 1, 30, '', 0, '', 182),
('Thé vert poire - 100g', 1, 30, '', 0, '', 183),
('Thé vert Vanille jasmin - 100g', 1, 30, '', 0, '', 184),
('Thé vert Vietnam - 100g', 1, 30, '', 0, '', 185),
('Brésil', 1, 17, '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, '', 197),
('Ethiopie Yrgacheffe', 1, 17, '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, '', 198),
('Mexique Décaféiné', 1, 17, '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, '', 201),
('Pérou El Palto', 1, 17, '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, '', 202),
('Blend de la Brûlerie', 1, 17, '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, '', 203),
('Mélange italien', 1, 17, '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, '', 204),
('Colombie', 1, 18, 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves', 0, '', 206),
('Brésil', 1, 18, 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, '', 207),
('Ethiopie Yrgacheffe', 1, 18, 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, '', 208),
('Ethiopie Guji', 1, 19, '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, '', 210),
('Mexique Décaféiné', 1, 18, 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, '', 211),
('Pérou El Palto', 1, 18, 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant  la construction d\'école Label : Bio', 0, '', 212),
('Blend de la Brûlerie', 1, 18, 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, '', 213),
('Mélange italien', 1, 18, 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, '', 214),
('Colombie', 1, 19, '<p>Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves</p>', 0, '', 216),
('Brésil', 1, 19, '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, '', 217),
('Ethiopie Yrgacheffe', 1, 19, '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, '', 218),
('Guji Ethiopie naturel', 1, 19, '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, '', 220),
('Mexique Décaféiné', 1, 19, '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, '', 221),
('Pérou El Palto', 1, 19, '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, '', 222),
('Blend de la Brûlerie', 1, 19, '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, '', 223),
('Mélange italien', 1, 19, '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, '', 224),
('Infusion Noix de coco aloé vera - 100g', 1, 30, '', 0, '', 225),
('Infusion Pina Colada -100g', 1, 30, '', 0, '', 226),
('Infusion Poire cannelle - 100g', 1, 30, '', 0, '', 227),
('Infusion Tilleul - 50g', 1, 30, '', 0, '', 228),
('Thé blanc Bai Mu Dan - 15 infusettes', 1, 15, 'Thé blanc de Chine', 0, '', 229),
('Earl Grey - 15 infusettes', 1, 15, 'Thé noir romatisé à la bergamote', 0, '', 230),
('Lendemain de fête - 15 infusettes', 1, 15, 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse', 0, '', 231),
('English Breakfast - 15 infusettes', 1, 15, 'Thé noir', 0, '', 232),
('Secret d\'Antan - 15 infusettes', 1, 15, 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose', 0, '', 233),
('Peps - 15 infusettes', 1, 15, 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus', 0, '', 234),
('Sencha douce saveur - 15 infusettes', 1, 15, 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise', 0, '', 235),
('Thé vert bio - 15 infusettes', 1, 15, 'Thé vert Bio', 0, '', 236),
('Thé vert citron - 15 infusettes', 1, 15, 'Thé vert (90%), Citron écorce (10%)', 0, '', 237),
('Detox Automne hiver - 15 infusettes', 1, 15, 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine', 0, '', 238),
('Thé vert menthe - 15 infusettes', 1, 15, 'Thé vert (60%), Menthe Douce (40%)', 0, '', 239),
('Thé vert pêche - 100g', 1, 30, '', 0, '', 240),
('Thé vert mirabelle - 100g', 1, 30, '', 0, '', 241),
('Thé vert figue baies rouges - 100g', 1, 30, '', 0, '', 242),
('Thé vert pomme gingembre - 100g', 1, 30, '', 0, '', 243),
('Thé vert cerise - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé vert est une invitation au voyage... L\'excellente base abondamment décorée de pétales de rose, et son parfum fruité de cerise n\'est pas sans rappeler les magnifiques jardins japonais durant la saison de floraison des cerisiers... </span></p>', 0, '', 244),
('Oolong Vietnam - 100g', 1, 30, '<h3 class=\"PreformattedText\" style=\"text-align:justify;\"><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">Thé désigné sous le nom de « bleu vert » à mi chemin entre le thé vert non oxydé et le thé noir </span><span style=\"font-size:14.6667px;\">complétement</span><span style=\"font-size:11pt;\"> oxydé. Qualifié de thé semi-oxydé, faible en théine il sera à déguster tout au long de la journée. Issu de la ville de Bao Loc, où sont produits des Oolong en utilisant les méthodes taïwanaises anciennes. Les </span></span><span style=\"color:#9b9b9b;\"><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">feuilles</span></span><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\"> </span></span></span><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">de thé fraîchement cueillies sont séchées puis écrasées pour commencer la fermentation. Après avoir atteint le niveau de fermentation souhaité, le thé est séché à basse température. La tasse verte rayonnante caresse les papilles de chacun avec sa saveur fleurie et sucrée. </span></span></h3>', 0, '', 245),
('Honduras', 1, 17, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 246),
('Honduras', 1, 18, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 247),
('Honduras', 1, 19, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 248),
('Orangette chocolat noir  - 100g', 1, 27, '', 0, '', 254),
('Caramel à l\'O - 230g', 1, 27, '<p>Elaboré par la Confiserie Lou Sucrèu St Haon-le-Châtel avec l\'eau Thermale de Salins les Bains, Jura</p>\n<p>Ingrédients : crème, sucre, glucose, beurre, sel 1,2%.</p>\n<p><strong>Sans huile de palme</strong></p>', 0, '', 255),
('Nougatine amandes - 150g', 1, 27, '<p>Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p>Ingrédients : glucose, sucre, <span>amandes</span>, beurre</p>', 0, '', 256),
('Miel forêt - 250g', 1, 27, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 259),
('Machine Automatique Mélitta Solo Noir', 1, 22, 'Machine automatique avec moulin intégré, réservoir d\'eau + 1kg de café offert Pérou Bio Commerce équitable', 0, '', 297),
('cafetière', 1, 22, 'Machine à café vendue avec 3 adaptateurs : Café moulu, Capsules Nespresso et Capsules Dolce Gusto. Une machine compact et facile d\'utilisation. Fournit avec un tampeur et une cuillère doseuse.', 0, '', 311),
('Nougatine noisettes - 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, <span>noisettes</span>, beurre</p>', 0, '', 314),
('Nougatine sésame - 150g', 1, 27, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, lin,  sésame, beurre</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"><span>Traces possibles de fruits à coque</span></p>', 0, '', 315),
('Miel Tilleul - 250g', 1, 28, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 317),
('Miel acacia - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 318),
('Indonésie', 1, 17, '', 0, '', 320),
('Papouasie Nouvelle Guinée', 1, 17, '<p>Ce café a été récolté par 3113 petits exploitants agricoles travaillant avec Greenco Coffee et qui livrent leur production à la centrale de lavage de Nemba. Greenco achète les cerises de café aux exploitants plus cher que la moyenne des achats dans le secteur. </p>', 0, '', 321),
('Eau tonique nature', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE NATURE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs. </span></span></p>', 0, '', 322),
('Eau tonique concombre', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CONCOMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 323),
('Eau tonique gingembre', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE GINGEMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 324),
('Eau tonique citron', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CITRON HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 326),
('Eau tonique fleur de sureau', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE FLEUR DE SUREAU HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 328),
('Miel sapin - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 331),
('Miel fleurs sauvages - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 332),
('Cranberry enrobée - 120g', 1, 2, '<p>Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 333),
('Guimauve vanille', 1, 2, '', 0, '', 334),
('Dragée fruitée - abricot 150g', 1, 2, '<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"></p>\n<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>', 0, '', 335),
('Dragée fruitée - framboise 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 336),
('Dragée fruitée - poire 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 337),
('Dragée fruitée - assortiment 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 338),
('Amande chocolat noir - 100g', 1, 2, '', 0, '', 339),
('Bille croustillante chocolat lait - 100g', 1, 2, '', 0, '', 340),
('Le Café Sigalas - 150g', 1, 2, '', 0, '', 345),
('Le Café Sigalas - 10 capsules', 1, 17, '', 0, '', 347),
('Filtre x100', 1, 2, '', 0, '', 352),
('Valrhona - Jivara 40%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Jivara, par sa douceur cacaotée et maltée, est un chocolat chaleureux comme les rayons dorés du soleil à l\'aube d\'un matin d\'été.</span></p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Développé en 1995, Valrhona fait évoluer les codes du chocolat au lait avec Jivara, premier chocolat au lait à proposer une telle force gustative, avec un véritable goût de cacao. Pour atteindre ce goût singulier, Jivara est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques d\'Equateur et du Ghana. </span></p>', 0, '', 353),
('Valrhona - Dulcey 35%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Dulcey, par sa douceur biscuitée très légèrement salée et son goût de lait caramélisé, à ce don de nus renvoyer en enfance, de nousf aire voyager dans un tourbillon de souvenirs délicieux propres à chacun.</span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">En 2012, Valrhona invente la quatrième couleur de chocolat : le blond. Laissant du chocolat blanc au bain-marie trop longtemps, Frédéric Bau découvre un surprenant résultat, le chocolat est devenu blond et laisse échapper une douce odeur. Dulcey est une ode à la créativité et à l\'audace qui révolutionne le monde de la pâtisserie pour offrir de nouvelles émotions grâce à a couleur son goût et sa texture. </span></p>', 0, '', 354),
('Valrhona - Ivoire 35%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Les notes réconfortantes de lait cuit de chocolat blanc Ivoire font écho aux éclats de rire d\'enfants qui partagent ensemble leurs plus grands moments de bonheur. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Avec Ivoire, Valrhona se démarque de l\'univers traditionnel des chocolats blancs, grâce à sa note sucrée tout en légèreté et sa couleur subtilement nacrée. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référence iconique, Ivoire est devenu le mot générique parmi les professionnels de la gastronomie pour désigner le chocolat blanc.</span></p>', 0, '', 355),
('Valrhona - Caraïbe 66%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Caraïbe, avec ses notes amères intenses et ses accents boisés et de fruits secs grillés, fait rêver à une danse envoûtante à l\'ombre des cacaoyers. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référent des chocolats équilibrés depuis 1988, Caraïbe est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques de République Dominicaine, Equateur, Jamaïque et Togo pour atteindre ce goût singulier. Caraïbe est ainsi nommé car il rend hommage à la diversité des îles Caraïbes, dont les fèves ont inspiré sa création. </span></p>', 0, '', 356),
('Thé noir Par Amour - 100g', 1, 2, '<p><span style=\"color:#ffffff;\">Un thé noir aux saveurs de cerise parsemé de pétales de rose et de cœur en sucre. </span></p>\n<p><span style=\"color:#ffffff;\">Une façon gourmande et délicate de dire</span> <strong><span style=\"color:#d0121a;\">JE T\'AIME</span> </strong><span style=\"color:#ffffff;\">à ceux qui sont chers à notre cœur... </span></p>\n<p><span style=\"color:#ffffff;\">A la fois fruité, parfumé et sucré ce thé saura mettre vos pailles en extase. Les pétales de rose qu\'il contient remplaceront volontiers le traditionnel bouquet de fleurs de la Saint Valentin... </span></p>', 0, '', 357),
('Valrhona - Oriado 60% 1kg', 1, 2, '<p>La douceur onctueuse et vanillée d\'Oriado invite à une sieste sur le sable chaud, avec la caresse enveloppante du soleil sur la peau. </p>\n<p>Créé en 2015, Oriado se distingue à la dégustation par sa légèreté et son équilibre. Issu de la gamme certifée, Oriado est l\'expression visible de l\'engagement de Valrhona, pour sa qualité et la traçabilité de la filière cacao. </p>\n<p>Oriado est réalisé exclusivement à partir des meilleures matières premières biologiques, issues du commerce équitable (certifié Fairtrade/ Max Havelaar et issu de l\'Agriculture Biologique)</p>', 0, '', 358),
('GEISHA DU PANAMA - 150g', 1, 2, '', 0, '', 360),
('Thé vert citron - 15 infusettes', 1, 2, '', 0, '', 361),
('Delonghi Dinamica 3515B', 1, 2, '<p>Système Boissons lactées : Buse vapeur simple</p>\n<p>Boissons réalisable : Expresso, Café Long (Lungo), Café, Café Filtre (basse pression), Mousse de lait manuel, Eau chaude</p>\n<p>Trappe à moulu : Oui</p>\n<p>Nombre de réglages du Broyeur : 13 positions</p>\n<p>Réglage intensité café : 5</p>\n<p>Température de percolation programmable : 3 niveaux</p>\n<p>Interface : Touches tactiles</p>\n<p>Type d\'écran : Écran à texte LCD</p>\n<p>Type de Broyeur<span style=\"white-space:pre;\"> </span>Acier</p>\n<p>2 cafés simultanés : Oui</p>\n<p>Rinçage des buses : Automatique</p>\n<p>Entretien du Groupe Café<span style=\"white-space:pre;\"> </span>Manuel : groupe café extractible</p>\n<p>Pression de la pompe : 15 Bars</p>\n<p>Garantie : 3 ans</p>\n<p>Coloris : Noir</p>\n<p>Matériau(x) : ABS Mat</p>\n<p>Volume du réservoir à eau : 1.8 l</p>\n<p>Volume du bac à grain : 300 g</p>\n<p>Nombre de bac à grains  : 1 bac</p>\n<p>Volume du bac à marcs : 14 galettes</p>\n<p>Dimensions (LxPxH) : 236 x 429 x 348 mm</p>\n<p>Poids<span style=\"white-space:pre;\"> </span> : 9.5 Kg</p>\n<p>Puissance (en Watts) : 1450 W</p>\n<p>Capacité journalière : jusqu\'à 30 cafés/jour</p>', 0, '', 362),
('Infuseur Gladys', 1, 2, '', 0, '', 363),
('Infuseur hippopotame', 1, 2, '', 0, '', 364),
('Dragée Reyanud - Mûre 150g', 1, 2, '', 0, '', 365),
('Amande crème de nougat - 140g', 1, 2, '', 0, '', 366),
('Détartrant Delonghi', 1, 2, '', 0, '', 367),
('Cartouche filtrante Delonghi', 1, 2, '', 0, '', 368),
('Rooibos caramel - 100g', 1, 2, '', 0, '', 369),
('Earl Grey - 15 infusettes', 1, 2, '', 0, '', 370),
('Secret d\'Antan - 15 infusettes', 1, 2, '', 0, '', 371),
('Peps - 15 infusettes', 1, 2, '', 0, '', 372),
('Gyokuro - 100g', 1, 2, '', 0, '', 374),
('Honeybush chocolat - 100g', 1, 2, '', 0, '', 376),
('Maté latino - 100g', 1, 2, '', 0, '', 377),
('Infusion Yetchuno - 100g', 1, 2, '', 0, '', 378),
('Croisière sur le Nil - 100g', 1, 30, '', 0, '', 379),
('Infusion Tout en douceur - 50g', 1, 29, '', 0, '', 380),
('Namas\'thé 100g', 1, 2, '', 0, '', 381),
('Infusion d\'antan - 100g', 1, 2, '', 0, '', 382),
('Thé blanc grenade cassis aloe 100g', 1, 2, '', 0, '', 383),
('Thé blanc framboise tonka 50g', 1, 2, '', 0, '', 384),
('L\'ambroisie du dragon 100g', 1, 30, '', 0, '', 385),
('Maté della Melagrana - 100g', 1, 30, '', 0, '', 386),
('Papouasie Nouvelle Guinée', 1, 2, '', 0, '', 388),
('Bonbon d\'anis 100g', 1, 2, '', 0, '', 389),
('Bâton de réglisse 100g', 1, 30, '', 0, '', 390),
('Thé vert menthe - 15 infusettes', 1, 2, '', 0, '', 391),
('Zen - 15 infusettes', 1, 2, '', 0, '', 392),
('La délicieuse - 15 infusettes', 1, 2, '', 0, '', 393),
('Croisière sur le Nil - 15 infusettes', 1, 2, '', 0, '', 394),
('Thé vert menthe - 100g', 1, 2, '', 0, '', 395),
('Thé vert citron - 100g', 1, 30, '', 0, '', 396),
('Thé vert coco ananas - 100g', 1, 30, '', 0, '', 397),
('Thé vert ananas fraise - 100g', 1, 30, '', 0, '', 398),
('Earl Grey - 100g', 1, 30, '', 0, '', 399),
('Infusion Chaï - 100g', 1, 30, '', 0, '', 400),
('Infusion verveine - 50g', 1, 2, '', 0, '', 401),
('Maté - 100g', 1, 30, '', 0, '', 402),
('Lapsang Souchong - 100g', 1, 30, '', 0, '', 403),
('Pu Erh - 100g', 1, 2, '', 0, '', 404),
('English Breakfast - 15 infusettes', 1, 31, '', 0, '', 405),
('Detox automne hiver - 15 infusettes', 1, 31, '', 0, '', 406),
('Lendemain de fête - 15 infusettes', 1, 31, '', 0, '', 407),
('Doux nectar - 100g', 1, 30, '', 0, '', 409),
('Thé vert cactus ananas - 100g', 1, 30, '', 0, '', 410),
('Tea maker 0.5l', 1, 22, '', 0, '', 412),
('Pu erh - 100g', 1, 30, '', 0, '', 413),
('Infusion Verveine - 50g', 1, 2, '', 0, '', 414);

-- --------------------------------------------------------

--
-- Structure de la table `produit_declinaison`
--

CREATE TABLE `produit_declinaison` (
  `id_produit_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_declinaison`
--

INSERT INTO `produit_declinaison` (`id_produit_declinaison`, `id_produit`, `id_declinaison`) VALUES
(1, 150, 27),
(2, 150, 28),
(3, 151, 25),
(4, 151, 26),
(5, 152, 25),
(6, 152, 26),
(7, 153, 27),
(8, 153, 28),
(9, 154, 25),
(10, 154, 26),
(11, 155, 25),
(12, 155, 26),
(13, 156, 25),
(14, 156, 26),
(15, 165, 25),
(16, 165, 26),
(17, 166, 25),
(18, 166, 26),
(19, 167, 25),
(20, 167, 26),
(21, 168, 25),
(22, 168, 26),
(23, 169, 27),
(24, 169, 28),
(25, 170, 21),
(26, 170, 22),
(27, 171, 25),
(28, 171, 26),
(29, 172, 25),
(30, 172, 26),
(31, 173, 25),
(32, 173, 26),
(33, 174, 25),
(34, 174, 26),
(35, 175, 25),
(36, 175, 26),
(37, 176, 25),
(38, 176, 26),
(39, 177, 25),
(40, 177, 26),
(41, 178, 25),
(42, 178, 26),
(43, 179, 25),
(44, 179, 26),
(45, 180, 25),
(46, 180, 26),
(47, 181, 25),
(48, 181, 26),
(49, 182, 25),
(50, 182, 26),
(51, 183, 25),
(52, 183, 26),
(53, 184, 25),
(54, 184, 26),
(55, 185, 25),
(56, 185, 26),
(57, 197, 30),
(58, 197, 31),
(59, 197, 32),
(60, 198, 30),
(61, 198, 31),
(62, 198, 32),
(63, 201, 30),
(64, 201, 31),
(65, 201, 32),
(66, 202, 30),
(67, 202, 31),
(68, 202, 32),
(69, 203, 30),
(70, 203, 31),
(71, 203, 32),
(72, 204, 30),
(73, 204, 31),
(74, 204, 32),
(75, 206, 1),
(76, 206, 6),
(77, 206, 7),
(78, 207, 1),
(79, 207, 6),
(80, 207, 7),
(81, 208, 1),
(82, 208, 6),
(83, 208, 7),
(84, 210, 1),
(85, 210, 2),
(86, 210, 3),
(87, 210, 4),
(88, 210, 5),
(89, 210, 6),
(90, 210, 7),
(91, 210, 24),
(92, 211, 1),
(93, 211, 6),
(94, 211, 7),
(95, 212, 1),
(96, 212, 6),
(97, 212, 7),
(98, 213, 1),
(99, 213, 6),
(100, 213, 7),
(101, 214, 1),
(102, 214, 6),
(103, 214, 7),
(104, 216, 1),
(105, 216, 2),
(106, 216, 3),
(107, 216, 4),
(108, 216, 5),
(109, 216, 6),
(110, 216, 7),
(111, 216, 24),
(112, 217, 1),
(113, 217, 2),
(114, 217, 3),
(115, 217, 4),
(116, 217, 5),
(117, 217, 6),
(118, 217, 7),
(119, 217, 24),
(120, 218, 1),
(121, 218, 2),
(122, 218, 3),
(123, 218, 4),
(124, 218, 5),
(125, 218, 6),
(126, 218, 7),
(127, 218, 24),
(128, 220, 1),
(129, 220, 2),
(130, 220, 3),
(131, 220, 4),
(132, 220, 5),
(133, 220, 6),
(134, 220, 7),
(135, 220, 24),
(136, 221, 1),
(137, 221, 2),
(138, 221, 3),
(139, 221, 4),
(140, 221, 5),
(141, 221, 6),
(142, 221, 7),
(143, 221, 24),
(144, 222, 1),
(145, 222, 2),
(146, 222, 3),
(147, 222, 4),
(148, 222, 5),
(149, 222, 6),
(150, 222, 7),
(151, 222, 24),
(152, 223, 1),
(153, 223, 2),
(154, 223, 3),
(155, 223, 4),
(156, 223, 5),
(157, 223, 6),
(158, 223, 7),
(159, 223, 24),
(160, 224, 1),
(161, 224, 2),
(162, 224, 3),
(163, 224, 4),
(164, 224, 5),
(165, 224, 6),
(166, 224, 7),
(167, 224, 24),
(168, 225, 25),
(169, 225, 26),
(170, 226, 25),
(171, 226, 26),
(172, 227, 25),
(173, 227, 26),
(174, 228, 27),
(175, 228, 28),
(176, 240, 25),
(177, 240, 26),
(178, 241, 25),
(179, 241, 26),
(180, 242, 25),
(181, 242, 26),
(182, 243, 25),
(183, 243, 26),
(184, 244, 25),
(185, 244, 26),
(186, 245, 25),
(187, 245, 26),
(188, 246, 30),
(189, 246, 31),
(190, 246, 32),
(191, 247, 1),
(192, 247, 2),
(193, 247, 3),
(194, 247, 4),
(195, 247, 5),
(196, 247, 6),
(197, 247, 7),
(198, 247, 24),
(199, 248, 1),
(200, 248, 2),
(201, 248, 3),
(202, 248, 4),
(203, 248, 5),
(204, 248, 6),
(205, 248, 7),
(206, 248, 24),
(207, 320, 30),
(208, 320, 31),
(209, 320, 32),
(210, 321, 30),
(211, 321, 31),
(212, 321, 32),
(213, 345, 2),
(214, 345, 3),
(215, 345, 4),
(216, 345, 5),
(217, 345, 24),
(218, 353, 7),
(219, 354, 7),
(220, 355, 1),
(221, 355, 7),
(222, 356, 7),
(223, 357, 25),
(224, 357, 26),
(225, 360, 2),
(226, 360, 3),
(227, 360, 4),
(228, 360, 5),
(229, 360, 24),
(230, 369, 21),
(231, 369, 22),
(232, 374, 21),
(233, 374, 22),
(234, 376, 21),
(235, 376, 22),
(236, 377, 21),
(237, 377, 22),
(238, 378, 21),
(239, 378, 22),
(240, 379, 21),
(241, 379, 22),
(242, 380, 21),
(243, 380, 22),
(244, 381, 21),
(245, 381, 22),
(246, 382, 21),
(247, 382, 22),
(248, 383, 21),
(249, 383, 22),
(250, 384, 27),
(251, 384, 28),
(252, 385, 21),
(253, 385, 22),
(254, 386, 21),
(255, 386, 22),
(256, 388, 1),
(257, 388, 2),
(258, 388, 3),
(259, 388, 4),
(260, 388, 5),
(261, 388, 6),
(262, 388, 7),
(263, 388, 24),
(264, 389, 21),
(265, 389, 22),
(266, 390, 21),
(267, 390, 22),
(268, 395, 21),
(269, 395, 22),
(270, 396, 21),
(271, 396, 22),
(272, 397, 21),
(273, 397, 22),
(274, 398, 21),
(275, 398, 22),
(276, 399, 21),
(277, 399, 22),
(278, 400, 21),
(279, 400, 22),
(280, 401, 21),
(281, 401, 22),
(282, 402, 21),
(283, 402, 22),
(284, 403, 21),
(285, 403, 22),
(286, 404, 21),
(287, 404, 22),
(288, 409, 21),
(289, 409, 22),
(290, 410, 21),
(291, 410, 22),
(292, 413, 21),
(293, 413, 22),
(294, 414, 21),
(295, 414, 22);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nom` text NOT NULL,
  `power` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom`, `power`) VALUES
(1, 'Admin', 10),
(2, 'Rédacteur', 2),
(3, 'Visiteur', 0);

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `id_rubrique` int(11) NOT NULL,
  `titre` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`id_rubrique`, `titre`, `description`) VALUES
(1, 'Rub1', 'Desc de fou');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `nom`, `description`) VALUES
(1, 'En attente de validation', 'La commande vient d\'être passée'),
(2, 'En préparation...', 'La commande est en cours de traitement...'),
(3, 'Terminée', 'La commande est terminée'),
(4, 'Annulée', 'La commande a été annulée');

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `id_tva` int(11) NOT NULL,
  `pourcentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id_tva`, `pourcentage`) VALUES
(1, 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `fkIdx_145` (`id_employe`),
  ADD KEY `fkIdx_153` (`id_rubrique`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fkIdx_95` (`id_statut`);

--
-- Index pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  ADD PRIMARY KEY (`id_commande_declinaison`),
  ADD KEY `FK_221` (`id_produit_declinaison`),
  ADD KEY `FK_242` (`id_commande`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `fkIdx_215` (`id_produit_declinaison`),
  ADD KEY `fkIdx_83` (`id_client`);

--
-- Index pour la table `declinaison`
--
ALTER TABLE `declinaison`
  ADD PRIMARY KEY (`id_declinaison`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`),
  ADD KEY `fkIdx_113` (`id_role`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fkIdx_124` (`id_tva`),
  ADD KEY `fkIdx_49` (`id_categorie`);

--
-- Index pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD PRIMARY KEY (`id_produit_declinaison`),
  ADD KEY `FK_234` (`id_produit`),
  ADD KEY `FK_237` (`id_declinaison`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id_rubrique`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id_tva`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  MODIFY `id_commande_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `declinaison`
--
ALTER TABLE `declinaison`
  MODIFY `id_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  MODIFY `id_produit_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id_rubrique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tva`
--
ALTER TABLE `tva`
  MODIFY `id_tva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_143` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `FK_151` FOREIGN KEY (`id_rubrique`) REFERENCES `rubrique` (`id_rubrique`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_93` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Contraintes pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  ADD CONSTRAINT `FK_218` FOREIGN KEY (`id_produit_declinaison`) REFERENCES `produit_declinaison` (`id_produit_declinaison`),
  ADD CONSTRAINT `FK_240` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_212` FOREIGN KEY (`id_produit_declinaison`) REFERENCES `produit_declinaison` (`id_produit_declinaison`),
  ADD CONSTRAINT `FK_81` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `FK_111` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_122` FOREIGN KEY (`id_tva`) REFERENCES `tva` (`id_tva`),
  ADD CONSTRAINT `FK_47` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD CONSTRAINT `FK_232` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `FK_235` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
