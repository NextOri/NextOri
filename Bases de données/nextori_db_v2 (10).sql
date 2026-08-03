-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 août 2026 à 17:26
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nextori_db_v2`
--

-- --------------------------------------------------------

--
-- Structure de la table `favori`
--

CREATE TABLE `favori` (
  `id_favori` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL,
  `date_ajout` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id_filiere` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `presentation` text DEFAULT NULL,
  `domaine` varchar(100) NOT NULL,
  `duree` varchar(50) NOT NULL,
  `competences_developpees` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id_filiere`, `nom`, `description`, `presentation`, `domaine`, `duree`, `competences_developpees`) VALUES
(1, 'Informatique', 'Étude des systèmes informatiques, développement et réseaux', 'Formation orientée vers les sciences informatiques, la programmation, les bases de données, les réseaux et le développement de solutions numériques.', 'Sciences & Technologies', '3 ans', 'Programmation, Bases de données, Développement Web, Réseaux, Algorithmique, Résolution de problèmes'),
(2, 'Génie Civil', 'Construction et infrastructures', 'Formation spécialisée dans la conception, la construction et la gestion des infrastructures telles que les bâtiments, les routes et les ponts.', 'Ingénierie', '3 ans', 'Calcul des structures, DAO, Gestion de chantier, Topographie, Résistance des matériaux, Organisation'),
(3, 'Médecine', 'Études médicales et santé humaine', 'Formation dédiée aux sciences médicales, au diagnostic, à la prévention et au traitement des maladies afin d’améliorer la santé des populations.', 'Santé', '6 à 8 ans', 'Diagnostic, Anatomie, Soins médicaux, Communication, Esprit d’analyse, Prise de décision'),
(4, 'Droit', 'Étude des lois et du système juridique', 'Formation permettant de comprendre les règles juridiques, les institutions et les procédures afin de défendre les droits et conseiller les organisations.', 'Droit & Sciences Juridiques', '4 ans', 'Analyse juridique, Argumentation, Plaidoirie, Rédaction, Négociation, Esprit critique'),
(5, 'Gestion', 'Management et administration des entreprises', 'Formation axée sur la gestion des organisations, la planification, le management et la coordination des ressources humaines, matérielles et financières.', 'Économie & Gestion', '3 ans', 'Management, Organisation, Leadership, Gestion de projet, Communication, Planification'),
(6, 'Finance', 'Analyse financière et comptabilité', 'Formation spécialisée dans la gestion financière, les investissements, la comptabilité et l’analyse économique des entreprises.', 'Économie & Gestion', '3 ans', 'Analyse financière, Comptabilité, Gestion budgétaire, Fiscalité, Investissement, Excel'),
(7, 'Marketing', 'Stratégies commerciales et communication', 'Formation consacrée à la compréhension des marchés, du comportement des consommateurs et à la promotion des produits et services.', 'Commerce & Communication', '3 ans', 'Marketing digital, Étude de marché, Communication, Vente, Stratégie commerciale, Créativité'),
(8, 'Électronique', 'Systèmes électroniques et embarqués', 'Formation orientée vers la conception, le développement et la maintenance des systèmes électroniques et des équipements intelligents.', 'Sciences & Technologies', '3 ans', 'Électronique analogique, Électronique numérique, Microcontrôleurs, Maintenance, Automatisation, Électricité');

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `id_historique` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `date_action` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `historique`
--

INSERT INTO `historique` (`id_historique`, `id_user`, `action`, `date_action`) VALUES
(2, 1, 'METIERS_CONSULTES', '2026-07-27 18:06:26'),
(5, 1, 'FORMATION_CONSULTEE', '2026-07-27 18:35:30'),
(6, 1, 'FORMATION_CONSULTEE', '2026-07-27 18:39:22'),
(7, 1, 'UNIVERSITE_CONSULTEE', '2026-07-27 18:48:02'),
(8, 1, 'UNIVERSITE_CONSULTEE', '2026-07-27 18:48:11'),
(9, 1, 'UNIVERSITE_CONSULTEE', '2026-07-27 18:49:01'),
(10, 1, 'FORMATION_CONSULTEE', '2026-07-27 18:50:52'),
(11, 1, 'UNIVERSITE_CONSULTEE', '2026-07-27 18:50:53'),
(12, 1, 'FORMATION_CONSULTEE', '2026-07-27 18:54:15'),
(13, 1, 'UNIVERSITES_CONSULTEES', '2026-07-27 18:54:17'),
(15, 1, 'FORMATION_CONSULTEE', '2026-07-27 19:04:09'),
(16, 1, 'METIERS_CONSULTES', '2026-07-27 19:06:52'),
(17, 1, 'FORMATION_CONSULTEE', '2026-07-27 19:08:20'),
(18, 1, 'UNIVERSITES_CONSULTEES', '2026-07-27 19:08:22'),
(19, 1, 'FORMATION_CONSULTEE', '2026-07-28 16:30:28'),
(20, 1, 'UNIVERSITES_CONSULTEES', '2026-07-28 16:30:31'),
(24, 1, 'FORMATION_CONSULTEE', '2026-07-28 17:46:50'),
(25, 1, 'UNIVERSITES_CONSULTEES', '2026-07-28 17:46:52'),
(27, 1, 'PROFIL_CONSULTE', '2026-07-28 18:56:34'),
(28, 1, 'PROFIL_CONSULTE', '2026-07-29 13:04:05'),
(29, 1, 'FORMATION_CONSULTEE', '2026-07-29 14:52:46'),
(30, 1, 'UNIVERSITES_CONSULTEES', '2026-07-29 14:52:48'),
(31, 1, 'FORMATION_CONSULTEE', '2026-07-29 14:53:33'),
(32, 1, 'FORMATION_CONSULTEE', '2026-07-29 14:53:46'),
(33, 1, 'METIERS_CONSULTES', '2026-07-30 13:13:25'),
(34, 1, 'FORMATION_CONSULTEE', '2026-07-30 13:13:37'),
(35, 1, 'UNIVERSITES_CONSULTEES', '2026-07-30 13:13:40'),
(36, 1, 'FORMATION_CONSULTEE', '2026-07-30 13:14:16'),
(37, 1, 'UNIVERSITES_CONSULTEES', '2026-07-30 13:14:19'),
(38, 1, 'METIERS_CONSULTES', '2026-07-31 13:43:54'),
(39, 1, 'PROFIL_CONSULTE', '2026-07-31 13:44:17'),
(40, 2, 'METIERS_CONSULTES', '2026-07-31 14:31:57'),
(41, 2, 'PROFIL_CONSULTE', '2026-07-31 14:32:01'),
(42, 2, 'FORMATION_CONSULTEE', '2026-07-31 14:32:28'),
(43, 2, 'UNIVERSITES_CONSULTEES', '2026-07-31 14:32:32'),
(44, 2, 'PROFIL_CONSULTE', '2026-07-31 14:35:30'),
(45, 1, 'PROFIL_CONSULTE', '2026-07-31 14:41:17'),
(46, 1, 'PROFIL_CONSULTE', '2026-07-31 14:53:25'),
(47, 1, 'METIERS_CONSULTES', '2026-07-31 15:28:21'),
(48, 1, 'PROFIL_CONSULTE', '2026-07-31 15:28:50'),
(49, 1, 'FORMATION_CONSULTEE', '2026-07-31 15:28:57'),
(50, 1, 'UNIVERSITES_CONSULTEES', '2026-07-31 15:28:59'),
(51, 1, 'METIERS_CONSULTES', '2026-07-31 15:42:42'),
(52, 1, 'FORMATION_CONSULTEE', '2026-07-31 15:42:49'),
(53, 1, 'UNIVERSITES_CONSULTEES', '2026-07-31 15:42:51'),
(54, 11, 'PROFIL_CONSULTE', '2026-07-31 16:28:28'),
(55, 11, 'PROFIL_CONSULTE', '2026-07-31 16:28:29'),
(56, 11, 'PROFIL_CONSULTE', '2026-07-31 16:28:48'),
(57, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:29:54'),
(58, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:29:56'),
(59, 11, 'PROFIL_CONSULTE', '2026-07-31 16:31:33'),
(60, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:31:41'),
(61, 11, 'UNIVERSITES_CONSULTEES', '2026-07-31 16:31:44'),
(62, 11, 'METIERS_CONSULTES', '2026-07-31 16:33:51'),
(63, 11, 'PROFIL_CONSULTE', '2026-07-31 16:45:14'),
(64, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:45:33'),
(65, 11, 'UNIVERSITES_CONSULTEES', '2026-07-31 16:45:39'),
(66, 11, 'METIERS_CONSULTES', '2026-07-31 16:54:45'),
(67, 11, 'PROFIL_CONSULTE', '2026-07-31 16:54:58'),
(68, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:55:15'),
(69, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:55:23'),
(70, 11, 'METIERS_CONSULTES', '2026-07-31 16:57:32'),
(71, 11, 'PROFIL_CONSULTE', '2026-07-31 16:57:45'),
(72, 11, 'FORMATION_CONSULTEE', '2026-07-31 16:57:51'),
(73, 11, 'UNIVERSITES_CONSULTEES', '2026-07-31 16:57:54'),
(74, 11, 'PROFIL_CONSULTE', '2026-07-31 17:02:30'),
(75, 14, 'METIERS_CONSULTES', '2026-07-31 17:17:00'),
(76, 14, 'PROFIL_CONSULTE', '2026-07-31 17:17:45'),
(77, 14, 'FORMATION_CONSULTEE', '2026-07-31 17:18:02'),
(78, 14, 'UNIVERSITES_CONSULTEES', '2026-07-31 17:18:05'),
(79, 8, 'METIERS_CONSULTES', '2026-07-31 17:34:05'),
(80, 8, 'PROFIL_CONSULTE', '2026-07-31 17:34:19'),
(81, 8, 'FORMATION_CONSULTEE', '2026-07-31 17:34:27'),
(82, 8, 'UNIVERSITES_CONSULTEES', '2026-07-31 17:34:29'),
(83, 12, 'METIERS_CONSULTES', '2026-07-31 18:06:43'),
(84, 16, 'METIERS_CONSULTES', '2026-07-31 18:21:15'),
(85, 16, 'PROFIL_CONSULTE', '2026-07-31 18:22:05'),
(86, 16, 'FORMATION_CONSULTEE', '2026-07-31 18:22:58'),
(87, 16, 'FORMATION_CONSULTEE', '2026-07-31 18:23:30'),
(88, 16, 'UNIVERSITES_CONSULTEES', '2026-07-31 18:23:32'),
(89, 17, 'METIERS_CONSULTES', '2026-07-31 18:33:24'),
(90, 17, 'PROFIL_CONSULTE', '2026-07-31 18:35:07'),
(91, 17, 'FORMATION_CONSULTEE', '2026-07-31 18:35:32'),
(92, 17, 'FORMATION_CONSULTEE', '2026-07-31 18:36:01'),
(93, 17, 'UNIVERSITES_CONSULTEES', '2026-07-31 18:36:04'),
(94, 17, 'FORMATION_CONSULTEE', '2026-08-01 13:29:23'),
(95, 17, 'UNIVERSITES_CONSULTEES', '2026-08-01 13:29:26'),
(96, 17, 'METIERS_CONSULTES', '2026-08-03 13:27:32');

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE `metier` (
  `id_metier` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `presentation` text DEFAULT NULL,
  `competences` text DEFAULT NULL,
  `secteur` varchar(100) NOT NULL,
  `niveau_etude` varchar(100) NOT NULL,
  `salaire_min` decimal(12,2) DEFAULT NULL,
  `salaire_max` decimal(12,2) DEFAULT NULL,
  `profil_riasec` varchar(3) NOT NULL,
  `tendance` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id_metier`, `nom`, `description`, `presentation`, `competences`, `secteur`, `niveau_etude`, `salaire_min`, `salaire_max`, `profil_riasec`, `tendance`) VALUES
(1, 'Développeur Web', 'Création de sites et applications web', 'Le développeur web conçoit, développe et maintient des sites internet et des applications web. Il transforme les besoins des utilisateurs en solutions numériques grâce aux technologies du développement web.', 'HTML, CSS, JavaScript, PHP, bases de données, frameworks web, logique de programmation, résolution de problèmes', 'Informatique', 'Bac+3', 300000.00, 1500000.00, 'IRA', 'Forte croissance'),
(2, 'Data Scientist', 'Analyse de données et intelligence artificielle', 'Le data scientist analyse de grandes quantités de données afin d\'extraire des informations utiles et aider les organisations à prendre de meilleures décisions. Il utilise les statistiques, la programmation et l\'intelligence artificielle.', 'Python, statistiques, analyse de données, machine learning, intelligence artificielle, bases de données, visualisation de données', 'Informatique', 'Bac+5', 500000.00, 2000000.00, 'IRC', 'Très forte croissance'),
(3, 'Ingénieur Génie Civil', 'Construction de bâtiments et infrastructures', 'L\'ingénieur génie civil conçoit, planifie et supervise la réalisation des infrastructures comme les bâtiments, les routes et les ouvrages publics. Il veille au respect des normes techniques et de sécurité.', 'Conception technique, calculs de structures, AutoCAD, gestion de projet, résistance des matériaux, analyse des plans, travail en équipe', 'Génie Civil / BTP', 'Bac+5', 400000.00, 1800000.00, 'RIC', 'En croissance'),
(4, 'Médecin', 'Diagnostic et traitement des patients', 'Le médecin diagnostique, traite et accompagne les patients afin de préserver leur santé. Il utilise ses connaissances scientifiques et médicales pour prévenir et soigner les maladies.', 'Diagnostic médical, connaissances en sciences de la santé, écoute, communication, analyse clinique, prise de décision, éthique professionnelle', 'Santé', 'Bac+7+', 600000.00, 3000000.00, 'ISR', 'Stable'),
(5, 'Avocat', 'Défense juridique et conseils', 'L\'avocat conseille et représente ses clients dans les affaires juridiques. Il analyse les lois, prépare des dossiers et défend les intérêts des personnes ou des organisations devant les institutions compétentes.', 'Connaissance du droit, analyse juridique, argumentation, rédaction juridique, communication, négociation, esprit critique', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 300000.00, 2000000.00, 'ESA', 'Stable'),
(6, 'Comptable', 'Gestion des finances et comptabilité', 'Le comptable assure la gestion des opérations financières d\'une organisation. Il enregistre les transactions, prépare les documents comptables et contribue au suivi de la situation financière.', 'Comptabilité générale, analyse financière, Excel, logiciels comptables, rigueur, organisation, gestion des chiffres', 'Comptabilité, Fiscalité et Expertise', 'Bac+3', 250000.00, 1200000.00, 'CER', 'Stable'),
(7, 'Marketeur', 'Stratégies marketing et communication', 'Le marketeur étudie les besoins des consommateurs et développe des stratégies pour promouvoir des produits ou services. Il participe à la communication, à la publicité et au développement commercial.', 'Étude de marché, communication, stratégie marketing, réseaux sociaux, analyse des données, créativité, gestion de projet', 'Commerce, Marketing et Communication', 'Bac+3', 250000.00, 1500000.00, 'EAS', 'Forte croissance'),
(8, 'Administrateur Réseau', 'Gestion des réseaux informatiques', 'L\'administrateur réseau installe, configure et assure la maintenance des réseaux informatiques d\'une organisation. Il garantit la disponibilité, la sécurité et la performance des systèmes connectés.', 'Configuration réseau, TCP/IP, cybersécurité, systèmes Linux et Windows, maintenance informatique, résolution de problèmes, surveillance réseau', 'Télécommunications et Réseaux', 'Bac+3', 300000.00, 1400000.00, 'IRC', 'Forte croissance'),
(9, 'Data Analyst', 'Analyse et interprétation des données pour aider à la prise de décision', 'Le Data Analyst collecte, nettoie, analyse et interprète les données afin de produire des informations utiles aux organisations. Il utilise les statistiques, les outils informatiques et la visualisation de données pour aider les entreprises, administrations et institutions à prendre de meilleures décisions.', 'SQL, Excel avancé, Python, R, statistiques, analyse de données, visualisation de données, Power BI, bases de données', 'Informatique', 'Bac+3', 350000.00, 1500000.00, 'IRC', 'Très forte croissance'),
(10, 'Ingénieur Logiciel', 'Conception et développement de solutions logicielles', 'L’ingénieur logiciel conçoit, développe et maintient des applications informatiques complexes. Il participe à toutes les étapes de création d’un logiciel, depuis l’analyse des besoins jusqu’au déploiement et à l’amélioration des solutions.', 'Programmation, architecture logicielle, Java, Python, JavaScript, bases de données, conception système, tests logiciels', 'Informatique', 'Bac+5', 500000.00, 2000000.00, 'IRC', 'Très forte croissance'),
(11, 'Développeur Mobile', 'Création d’applications mobiles pour smartphones et tablettes', 'Le développeur mobile conçoit et développe des applications destinées aux appareils mobiles. Il transforme des idées et besoins utilisateurs en applications performantes adaptées aux systèmes Android et iOS.', 'Java, Kotlin, Flutter, React Native, développement Android, développement iOS, API, bases de données', 'Informatique', 'Bac+3', 300000.00, 1500000.00, 'IRA', 'Forte croissance'),
(12, 'Développeur Backend', 'Développement de la logique serveur des applications', 'Le développeur backend crée et maintient la partie serveur des applications web et mobiles. Il développe les API, gère les bases de données et assure le bon fonctionnement des échanges entre les différentes parties d’une application.', 'PHP, Python, Java, Node.js, API REST, bases de données, sécurité serveur, architecture backend', 'Informatique', 'Bac+3', 350000.00, 1700000.00, 'IRC', 'Forte croissance'),
(13, 'Développeur Frontend', 'Création des interfaces visibles des applications web', 'Le développeur frontend développe les interfaces avec lesquelles les utilisateurs interagissent. Il transforme les maquettes et besoins graphiques en expériences numériques modernes, rapides et accessibles.', 'HTML, CSS, JavaScript, React, interfaces utilisateur, responsive design, intégration web', 'Informatique', 'Bac+3', 300000.00, 1500000.00, 'IAR', 'Forte croissance'),
(14, 'Expert Cybersécurité', 'Protection des systèmes informatiques contre les menaces numériques', 'L’expert cybersécurité analyse les risques, protège les systèmes informatiques et met en place des solutions pour prévenir les attaques numériques. Il intervient auprès des entreprises, banques, administrations et organisations sensibles.', 'Sécurité informatique, réseaux, Linux, cryptographie, tests d’intrusion, gestion des risques, cybersécurité', 'Informatique', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(15, 'Administrateur Base de Données', 'Gestion et sécurisation des bases de données', 'L’administrateur base de données assure l’installation, la maintenance, l’organisation et la sécurité des bases de données utilisées par les organisations. Il garantit la disponibilité et la fiabilité des informations.', 'SQL, MySQL, PostgreSQL, administration base de données, sauvegarde, sécurité des données, optimisation', 'Informatique', 'Bac+3', 350000.00, 1800000.00, 'ICR', 'Forte croissance'),
(16, 'Ingénieur Cloud et DevOps', 'Gestion des infrastructures numériques et automatisation des déploiements', 'L’ingénieur Cloud et DevOps automatise, déploie et supervise les applications sur des infrastructures modernes. Il améliore la fiabilité, la performance et la disponibilité des services numériques.', 'Cloud computing, Linux, Docker, Kubernetes, CI/CD, AWS, administration système, automatisation', 'Informatique', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(17, 'UX/UI Designer', 'Conception d’expériences et interfaces numériques', 'L’UX/UI Designer conçoit des interfaces numériques simples, accessibles et adaptées aux besoins des utilisateurs. Il travaille sur l’apparence, l’ergonomie et l’expérience globale des applications et plateformes numériques.', 'Figma, design graphique, expérience utilisateur, prototypage, recherche utilisateur, ergonomie, créativité', 'Informatique', 'Bac+3', 250000.00, 1500000.00, 'ASI', 'Forte croissance'),
(18, 'Ingénieur Intelligence Artificielle', 'Conception de systèmes intelligents utilisant les données et les algorithmes', 'L’ingénieur en intelligence artificielle conçoit et développe des solutions capables d’analyser des données, d’apprendre automatiquement et d’automatiser certaines tâches. Il travaille sur des domaines comme la reconnaissance d’images, le traitement du langage, les systèmes prédictifs et les applications intelligentes.', 'Python, machine learning, deep learning, statistiques, mathématiques, intelligence artificielle, TensorFlow, PyTorch, analyse de données', 'Informatique', 'Bac+5', 600000.00, 3000000.00, 'IRC', 'Très forte croissance'),
(19, 'Ingénieur Data / Big Data', 'Gestion et analyse de grandes quantités de données', 'L’ingénieur Data et Big Data conçoit des infrastructures permettant de collecter, stocker et traiter de grands volumes de données. Il travaille avec les entreprises afin de rendre les données exploitables pour la décision stratégique et l’innovation.', 'Python, SQL, Big Data, Hadoop, Spark, bases de données, architecture des données, cloud computing, traitement de données', 'Informatique', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(20, 'Administrateur Systèmes', 'Gestion et maintenance des systèmes informatiques', 'L’administrateur systèmes assure l’installation, la configuration et la maintenance des serveurs et systèmes informatiques d’une organisation. Il garantit la disponibilité, la sécurité et le bon fonctionnement des infrastructures techniques.', 'Linux, Windows Server, administration système, virtualisation, serveurs, sécurité informatique, sauvegarde, supervision', 'Informatique', 'Bac+3', 300000.00, 1800000.00, 'RIC', 'Forte croissance'),
(21, 'Ingénieur Systèmes et Réseaux', 'Conception et supervision des infrastructures informatiques', 'L’ingénieur systèmes et réseaux conçoit, déploie et supervise les infrastructures réseau et système des organisations. Il assure la performance, la disponibilité et la sécurité des équipements informatiques.', 'Réseaux, TCP/IP, routage, commutation, Linux, cybersécurité, administration réseau, infrastructure informatique', 'Informatique', 'Bac+5', 500000.00, 2200000.00, 'RIC', 'Forte croissance'),
(22, 'Technicien Support Informatique', 'Assistance technique et maintenance des équipements informatiques', 'Le technicien support informatique accompagne les utilisateurs dans la résolution de leurs problèmes techniques. Il installe, configure et entretient les équipements informatiques afin d’assurer la continuité des activités.', 'Maintenance informatique, installation logiciels, dépannage, systèmes Windows, réseaux, assistance utilisateur, diagnostic technique', 'Informatique', 'Bac+2', 200000.00, 800000.00, 'RCS', 'Stable'),
(23, 'Analyste Cybersécurité SOC', 'Surveillance et analyse des menaces informatiques', 'L’analyste cybersécurité SOC surveille les systèmes informatiques afin de détecter, analyser et répondre aux incidents de sécurité. Il participe à la protection des organisations contre les attaques numériques.', 'Sécurité informatique, analyse des incidents, SIEM, réseaux, Linux, tests de sécurité, gestion des vulnérabilités, cybersécurité', 'Informatique', 'Bac+3', 400000.00, 2000000.00, 'IRC', 'Très forte croissance'),
(24, 'Pharmacien', 'Préparation, contrôle et dispensation des médicaments', 'Le pharmacien est un professionnel de santé spécialisé dans les médicaments. Il assure leur préparation, leur contrôle, leur distribution et conseille les patients sur leur utilisation. Il peut travailler en pharmacie, dans les hôpitaux, les laboratoires ou l’industrie pharmaceutique.', 'Pharmacologie, sciences médicales, gestion des médicaments, conseil patient, biologie, réglementation sanitaire, communication', 'Santé', 'Bac+5', 400000.00, 2500000.00, 'ICS', 'Stable'),
(25, 'Infirmier', 'Soins médicaux et accompagnement des patients', 'L’infirmier assure les soins aux patients, accompagne leur prise en charge et collabore avec les médecins et les autres professionnels de santé. Il intervient dans les hôpitaux, cliniques, centres de santé et programmes de santé publique.', 'Soins infirmiers, surveillance médicale, hygiène, communication, premiers secours, accompagnement patient, organisation', 'Santé', 'Bac+3', 200000.00, 1000000.00, 'SRC', 'Forte croissance'),
(26, 'Sage-femme', 'Accompagnement médical des femmes enceintes et suivi des naissances', 'La sage-femme accompagne les femmes pendant la grossesse, l’accouchement et la période postnatale. Elle joue un rôle essentiel dans la santé maternelle et infantile.', 'Santé maternelle, suivi grossesse, accouchement, soins du nouveau-né, communication, prévention sanitaire', 'Santé', 'Bac+3', 250000.00, 1200000.00, 'SRC', 'Forte croissance'),
(27, 'Dentiste', 'Diagnostic et traitement des problèmes bucco-dentaires', 'Le dentiste diagnostique et traite les maladies des dents et de la bouche. Il réalise des soins, prévient les problèmes dentaires et accompagne les patients dans leur santé bucco-dentaire.', 'Chirurgie dentaire, diagnostic, anatomie, soins dentaires, communication patient, hygiène médicale', 'Santé', 'Bac+6', 500000.00, 3000000.00, 'IRS', 'Stable'),
(28, 'Biologiste Médical', 'Réalisation et interprétation des analyses médicales', 'Le biologiste médical supervise les analyses réalisées en laboratoire afin d’aider au diagnostic des maladies. Il travaille avec des équipements scientifiques et participe au suivi médical des patients.', 'Biologie médicale, analyses laboratoire, microbiologie, biochimie, recherche, équipements médicaux, qualité', 'Santé', 'Bac+5', 400000.00, 2000000.00, 'ICR', 'Forte croissance'),
(29, 'Technicien de Laboratoire Médical', 'Analyse d’échantillons biologiques en laboratoire', 'Le technicien de laboratoire médical réalise des analyses sur des prélèvements biologiques sous la supervision de professionnels spécialisés. Il contribue au diagnostic et au suivi des patients.', 'Analyses médicales, microbiologie, biologie, équipements laboratoire, prélèvements, procédures qualité', 'Santé', 'Bac+2', 200000.00, 900000.00, 'RIC', 'Forte croissance'),
(30, 'Vétérinaire', 'Prévention et traitement des maladies animales', 'Le vétérinaire assure la santé des animaux, réalise des diagnostics et accompagne les éleveurs dans la prévention des maladies animales. Il joue également un rôle dans la sécurité alimentaire.', 'Médecine animale, diagnostic, élevage, chirurgie animale, santé publique, biologie, communication', 'Santé', 'Bac+6', 400000.00, 2000000.00, 'IRS', 'En croissance'),
(31, 'Psychologue', 'Accompagnement psychologique et analyse du comportement humain', 'Le psychologue accompagne les personnes rencontrant des difficultés émotionnelles, sociales ou psychologiques. Il utilise des méthodes d’écoute et d’analyse afin d’aider les patients à améliorer leur bien-être.', 'Psychologie, écoute, communication, analyse comportementale, accompagnement, entretien clinique', 'Santé', 'Bac+5', 250000.00, 1500000.00, 'SIA', 'Forte croissance'),
(32, 'Nutritionniste / Diététicien', 'Conseil alimentaire et accompagnement nutritionnel', 'Le nutritionniste accompagne les personnes dans l’amélioration de leur alimentation et leur santé. Il intervient dans la prévention des maladies liées à la nutrition et dans l’éducation alimentaire.', 'Nutrition, alimentation, santé publique, conseil, analyse alimentaire, prévention, communication', 'Santé', 'Bac+3', 250000.00, 1500000.00, 'SIC', 'En croissance'),
(33, 'Kinésithérapeute', 'Rééducation physique et récupération fonctionnelle des patients', 'Le kinésithérapeute accompagne les patients dans leur récupération après une blessure, une maladie ou une intervention médicale. Il utilise des techniques de rééducation afin d’améliorer la mobilité et l’autonomie des personnes.', 'Rééducation, anatomie, physiothérapie, exercices thérapeutiques, accompagnement patient, techniques manuelles', 'Santé', 'Bac+3', 300000.00, 1500000.00, 'SRI', 'Forte croissance'),
(34, 'Ingénieur Biomédical', 'Conception, maintenance et gestion des équipements médicaux', 'L’ingénieur biomédical assure le développement, l’installation, la maintenance et l’amélioration des équipements utilisés dans les établissements de santé. Il travaille à l’interface entre les technologies de l’ingénierie et les besoins médicaux afin d’améliorer la qualité des soins.', 'Ingénierie biomédicale, électronique, maintenance médicale, équipements hospitaliers, informatique médicale, gestion de projet, analyse technique', 'Santé', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(35, 'Épidémiologiste', 'Analyse et surveillance des maladies dans les populations', 'L’épidémiologiste étudie la fréquence, les causes et la propagation des maladies afin d’aider à mettre en place des stratégies de prévention et de contrôle sanitaire. Il intervient dans les programmes de santé publique, les organismes de recherche et les institutions sanitaires.', 'Statistiques, analyse de données, santé publique, recherche, méthodologie scientifique, prévention des maladies, collecte de données', 'Santé', 'Bac+5', 400000.00, 2000000.00, 'ICS', 'Forte croissance'),
(36, 'Chercheur en Sciences de la Santé', 'Recherche scientifique dans le domaine médical et biologique', 'Le chercheur en sciences de la santé réalise des travaux scientifiques afin de mieux comprendre les maladies, développer de nouveaux traitements et améliorer les connaissances médicales. Il peut travailler dans les universités, laboratoires et instituts de recherche.', 'Recherche scientifique, biologie, méthodologie expérimentale, analyse scientifique, rédaction scientifique, statistiques, innovation', 'Santé', 'Bac+5/Doctorat', 400000.00, 2000000.00, 'ICA', 'En croissance'),
(37, 'Manipulateur en Imagerie Médicale', 'Réalisation d’examens médicaux utilisant des équipements d’imagerie', 'Le manipulateur en imagerie médicale réalise des examens comme les radiographies, scanners ou autres techniques d’imagerie sous la responsabilité des médecins spécialistes. Il prépare les patients et veille à la qualité des images obtenues.', 'Radiologie, imagerie médicale, scanner, radiographie, équipements médicaux, anatomie, relation patient', 'Santé', 'Bac+3', 300000.00, 1500000.00, 'RIS', 'Forte croissance'),
(38, 'Assistant Médical', 'Accompagnement des professionnels de santé dans la prise en charge des patients', 'L’assistant médical participe à l’organisation des consultations, accompagne les patients et aide les professionnels de santé dans certaines tâches administratives et médicales. Il contribue au bon fonctionnement des structures de soins.', 'Accueil patient, organisation médicale, assistance aux soins, dossiers médicaux, communication, hygiène médicale', 'Santé', 'Bac+2/Bac+3', 200000.00, 900000.00, 'SCR', 'Forte croissance'),
(39, 'Technicien en Pharmacie', 'Gestion et préparation des produits pharmaceutiques', 'Le technicien en pharmacie participe à la préparation, au stockage et à la gestion des produits pharmaceutiques. Il travaille sous la responsabilité des pharmaciens dans les pharmacies, hôpitaux ou structures de distribution.', 'Produits pharmaceutiques, gestion stock, préparation médicaments, réglementation, conseil patient, organisation', 'Santé', 'Bac+2/Bac+3', 200000.00, 900000.00, 'CSR', 'Stable'),
(40, 'Spécialiste Santé Publique', 'Gestion et amélioration des programmes de santé des populations', 'Le spécialiste en santé publique conçoit, coordonne et évalue des programmes visant à améliorer la santé des populations. Il intervient dans les ministères, ONG, organisations internationales et projets sanitaires.', 'Santé publique, gestion de projet, statistiques, prévention, politiques sanitaires, analyse de données, communication', 'Santé', 'Bac+5', 400000.00, 2500000.00, 'SIC', 'Forte croissance'),
(41, 'Architecte', 'Conception et réalisation de projets architecturaux', 'L’architecte imagine, conçoit et supervise la réalisation de bâtiments et d’espaces. Il transforme les besoins des clients en projets adaptés aux contraintes techniques, esthétiques et environnementales.', 'Conception architecturale, dessin technique, AutoCAD, modélisation 3D, créativité, réglementation bâtiment, gestion de projet', 'Génie Civil / BTP', 'Bac+5', 400000.00, 2500000.00, 'AIR', 'Forte croissance'),
(42, 'Conducteur de Travaux', 'Organisation et supervision des chantiers de construction', 'Le conducteur de travaux coordonne les différentes étapes d’un chantier. Il assure le suivi des équipes, des délais, des matériaux et de la qualité des travaux réalisés.', 'Gestion chantier, management équipe, planification, suivi travaux, sécurité, contrôle qualité, lecture de plans', 'Génie Civil / BTP', 'Bac+3/Bac+5', 350000.00, 2000000.00, 'RCE', 'Très forte croissance'),
(43, 'Ingénieur Structures', 'Conception et analyse des structures des bâtiments et ouvrages', 'L’ingénieur structures étudie la résistance et la stabilité des constructions. Il réalise des calculs techniques afin de garantir la sécurité et la durabilité des ouvrages.', 'Calcul structures, résistance des matériaux, béton armé, modélisation, logiciels techniques, analyse plans, normes construction', 'Génie Civil / BTP', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Forte croissance'),
(44, 'Ingénieur Hydraulique', 'Conception des systèmes liés à l’eau et aux infrastructures hydrauliques', 'L’ingénieur hydraulique travaille sur les projets liés à l’eau, l’assainissement et les ouvrages hydrauliques. Il participe à la gestion durable des ressources en eau.', 'Hydraulique, assainissement, gestion eau, calculs hydrauliques, études techniques, logiciels spécialisés', 'Génie Civil / BTP', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(45, 'Géomètre-Topographe', 'Mesure et étude des terrains pour les projets de construction', 'Le géomètre-topographe réalise des mesures précises des terrains afin de préparer les projets de construction, d’aménagement et d’infrastructures.', 'Topographie, cartographie, GPS, AutoCAD, relevés terrain, mesures, analyse spatiale', 'Génie Civil / BTP', 'Bac+2/Bac+3', 250000.00, 1200000.00, 'RIC', 'Forte croissance'),
(46, 'Technicien Génie Civil', 'Suivi technique et contrôle des travaux de construction', 'Le technicien génie civil participe à la réalisation et au suivi des projets de construction. Il aide à la préparation des plans, au contrôle des matériaux et au suivi des chantiers.', 'Lecture plans, contrôle travaux, matériaux construction, dessin technique, suivi chantier, sécurité', 'Génie Civil / BTP', 'Bac+2/Bac+3', 200000.00, 1000000.00, 'RCI', 'Forte croissance'),
(47, 'Dessinateur-Projeteur BTP', 'Réalisation de plans techniques pour les projets de construction', 'Le dessinateur-projeteur réalise les plans et représentations techniques nécessaires aux projets de bâtiment et de travaux publics à l’aide de logiciels spécialisés.', 'AutoCAD, DAO, modélisation 3D, dessin technique, plans bâtiment, logiciels conception', 'Génie Civil / BTP', 'Bac+2/Bac+3', 250000.00, 1200000.00, 'ARC', 'Forte croissance'),
(48, 'Urbaniste', 'Aménagement et organisation des espaces urbains', 'L’urbaniste analyse et participe à la planification des villes et territoires. Il contribue à créer des espaces adaptés aux besoins des populations et au développement durable.', 'Aménagement urbain, analyse territoire, cartographie, urbanisme, développement durable, gestion projet', 'Génie Civil / BTP', 'Bac+5', 400000.00, 2000000.00, 'IAS', 'En croissance'),
(49, 'Ingénieur Environnement et Construction Durable', 'Développement de solutions de construction respectueuses de l’environnement', 'L’ingénieur environnement spécialisé en construction durable accompagne les projets afin de réduire leur impact environnemental et améliorer leur efficacité énergétique.', 'Environnement, construction durable, efficacité énergétique, gestion déchets, normes environnementales, analyse risques', 'Génie Civil / BTP', 'Bac+5', 400000.00, 2000000.00, 'IRA', 'Très forte croissance'),
(50, 'Ingénieur Routes et Transports', 'Conception et gestion des infrastructures routières et de transport', 'L’ingénieur routes et transports participe aux études, à la conception et au suivi des infrastructures routières et des systèmes de transport. Il contribue au développement des réseaux de mobilité.', 'Routes, infrastructures transport, matériaux, études techniques, gestion projet, calculs, normes routières', 'Génie Civil / BTP', 'Bac+5', 400000.00, 2000000.00, 'RIC', 'Très forte croissance'),
(66, 'Chef de Chantier BTP', 'Gestion opérationnelle des équipes et du suivi des travaux sur les chantiers', 'Le chef de chantier organise les activités quotidiennes d’un chantier de construction. Il coordonne les équipes, contrôle l’avancement des travaux et veille au respect des règles de sécurité et de qualité.', 'Organisation chantier, management équipe, lecture plans, suivi travaux, sécurité, contrôle qualité', 'Génie Civil / BTP', 'Bac+2/Bac+3', 250000.00, 1200000.00, 'RCE', 'Très forte croissance'),
(67, 'Ingénieur Géotechnicien', 'Analyse des sols et étude des fondations des ouvrages', 'L’ingénieur géotechnicien étudie les caractéristiques des sols afin de garantir la stabilité des bâtiments, routes et infrastructures. Il intervient dans les études avant la construction des ouvrages.', 'Mécanique des sols, géologie, fondations, études terrain, calculs, analyse risques', 'Génie Civil / BTP', 'Bac+5', 450000.00, 2200000.00, 'IRC', 'Forte croissance'),
(68, 'Métreur / Économiste de la Construction', 'Estimation des coûts et gestion économique des projets de construction', 'Le métreur ou économiste de la construction évalue les quantités de matériaux, prépare les devis et participe à la maîtrise des coûts des projets BTP.', 'Métré, devis, estimation coûts, Excel, calcul quantités, analyse budget, appels offres', 'Génie Civil / BTP', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'CRE', 'Forte croissance'),
(69, 'Électricien Bâtiment', 'Installation et maintenance des équipements électriques des bâtiments', 'L’électricien bâtiment réalise les installations électriques dans les logements, bâtiments professionnels et infrastructures. Il assure le câblage, le dépannage et la conformité des installations.', 'Électricité bâtiment, câblage, maintenance électrique, lecture schémas, sécurité électrique', 'Génie Civil / BTP', 'CAP/BT/Bac+2', 200000.00, 1000000.00, 'RCE', 'Forte croissance'),
(70, 'Ingénieur Électrique / Énergétique', 'Conception et gestion des systèmes électriques et énergétiques', 'L’ingénieur électrique ou énergétique conçoit et supervise des systèmes liés à l’électricité, aux énergies renouvelables et aux infrastructures énergétiques modernes.', 'Électricité, énergie solaire, réseaux électriques, efficacité énergétique, maintenance, études techniques', 'Génie Civil / BTP', 'Bac+5', 400000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(71, 'Géomaticien BTP', 'Analyse des données géographiques pour les projets de construction et d’aménagement', 'Le géomaticien BTP utilise les systèmes d’information géographique et les données spatiales pour accompagner les projets de construction, d’aménagement urbain et d’infrastructures.', 'SIG, QGIS, ArcGIS, cartographie, GPS, télédétection, analyse spatiale, bases données géographiques', 'Génie Civil / BTP', 'Bac+3/Bac+5', 300000.00, 1800000.00, 'IRC', 'Forte croissance'),
(72, 'Logisticien', 'Organisation et optimisation des flux de marchandises et des opérations logistiques', 'Le logisticien organise le transport, le stockage et la distribution des marchandises. Il veille à la bonne circulation des produits entre les fournisseurs, les entreprises et les clients.', 'Gestion des flux, organisation transport, gestion stocks, planification, outils logistiques, analyse problèmes', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'CRE', 'Très forte croissance'),
(73, 'Responsable Logistique', 'Supervision des activités logistiques d’une organisation', 'Le responsable logistique planifie et coordonne les opérations de transport, stockage et distribution afin d’améliorer les délais, les coûts et la qualité du service.', 'Management équipe, gestion transport, optimisation flux, gestion stocks, analyse performance, planification', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+3/Bac+5', 400000.00, 2500000.00, 'ECR', 'Très forte croissance'),
(74, 'Supply Chain Manager', 'Gestion stratégique de la chaîne d’approvisionnement', 'Le supply chain manager pilote l’ensemble de la chaîne logistique, depuis l’approvisionnement jusqu’à la livraison finale, afin d’optimiser la performance des entreprises.', 'Supply chain, analyse données, achats, gestion fournisseurs, stratégie logistique, optimisation coûts', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+5', 600000.00, 3000000.00, 'ECI', 'Très forte croissance'),
(75, 'Responsable Import-Export', 'Gestion des opérations commerciales internationales', 'Le responsable import-export organise les échanges internationaux de marchandises. Il assure le suivi des fournisseurs étrangers, des documents commerciaux et des procédures d’expédition.', 'Commerce international, négociation, réglementation douanière, gestion fournisseurs, langues étrangères, documentation', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+3/Bac+5', 400000.00, 2500000.00, 'ECR', 'Forte croissance'),
(76, 'Agent Transit / Déclarant en Douane', 'Gestion des procédures douanières et du passage des marchandises', 'L’agent transit accompagne les entreprises dans les formalités douanières, l’importation et l’exportation des marchandises.', 'Procédures douanières, réglementation, documents import-export, suivi marchandises, communication', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'CER', 'Forte croissance'),
(77, 'Gestionnaire Transport', 'Organisation des opérations de transport de marchandises', 'Le gestionnaire transport planifie les déplacements des marchandises, optimise les itinéraires et assure le suivi des opérations de livraison.', 'Planification transport, gestion véhicules, suivi livraison, organisation, outils logistiques', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'RCE', 'En croissance'),
(78, 'Responsable Approvisionnement', 'Gestion des achats et de la disponibilité des ressources', 'Le responsable approvisionnement sélectionne les fournisseurs, suit les commandes et garantit la disponibilité des produits nécessaires aux activités de l’entreprise.', 'Achats, négociation fournisseurs, gestion commandes, analyse besoins, gestion stocks', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+3/Bac+5', 350000.00, 2000000.00, 'ECR', 'Forte croissance'),
(79, 'Gestionnaire des Stocks', 'Contrôle et organisation des stocks d’une entreprise', 'Le gestionnaire des stocks assure le suivi des entrées et sorties de marchandises afin d’éviter les ruptures et les pertes.', 'Gestion stocks, inventaire, logiciels gestion, organisation, contrôle qualité', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+2/Bac+3', 200000.00, 1200000.00, 'CER', 'Stable'),
(80, 'Responsable Transport et Distribution', 'Supervision des activités de transport et de distribution', 'Le responsable transport et distribution organise les réseaux de livraison et supervise les opérations permettant d’acheminer les produits vers les clients.', 'Distribution, management, transport, analyse performance, organisation réseau', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+3/Bac+5', 400000.00, 2000000.00, 'ECR', 'Forte croissance'),
(81, 'Analyste Supply Chain', 'Analyse des données pour améliorer les performances logistiques', 'L’analyste supply chain utilise les données pour optimiser les coûts, les délais et les processus de la chaîne d’approvisionnement.', 'Analyse données, Excel, statistiques, tableaux de bord, supply chain, optimisation', 'Transport, Logistique, Commerce International et Supply Chain', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(82, 'Ingénieur Énergétique', 'Conception et gestion des systèmes énergétiques', 'L’ingénieur énergétique conçoit, analyse et améliore les systèmes de production et de consommation d’énergie. Il intervient notamment dans les énergies renouvelables, l’efficacité énergétique et les projets industriels.', 'Énergies renouvelables, solaire, efficacité énergétique, systèmes électriques, analyse énergétique, gestion de projet', 'Énergie, Mines et Industrie', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(83, 'Ingénieur Pétrole et Gaz', 'Gestion des activités liées aux ressources pétrolières et gazières', 'L’ingénieur pétrole et gaz participe à l’exploration, l’exploitation et l’optimisation des ressources pétrolières et gazières. Il travaille sur les installations, les procédés et la sécurité des opérations.', 'Génie pétrolier, géologie, exploitation, forage, analyse technique, sécurité industrielle', 'Énergie, Mines et Industrie', 'Bac+5', 700000.00, 4000000.00, 'IRC', 'Très forte croissance'),
(84, 'Ingénieur Mines et Géologie', 'Analyse et exploitation des ressources minières', 'L’ingénieur mines et géologie étudie les ressources du sous-sol et participe aux opérations d’extraction, d’exploitation et de gestion des sites miniers.', 'Géologie, exploitation minière, cartographie, analyse terrain, gestion projet, environnement', 'Énergie, Mines et Industrie', 'Bac+5', 500000.00, 3000000.00, 'RIC', 'Forte croissance'),
(85, 'Ingénieur Industriel', 'Optimisation des processus industriels', 'L’ingénieur industriel améliore les méthodes de production, l’organisation des entreprises industrielles et la performance des systèmes de fabrication.', 'Gestion production, optimisation processus, qualité, analyse industrielle, gestion projet, amélioration continue', 'Énergie, Mines et Industrie', 'Bac+5', 500000.00, 2500000.00, 'IRC', 'Forte croissance'),
(86, 'Ingénieur Maintenance Industrielle', 'Maintenance et amélioration des équipements industriels', 'L’ingénieur maintenance industrielle assure la disponibilité et la performance des machines et équipements utilisés dans les industries.', 'Mécanique industrielle, maintenance préventive, diagnostic équipements, gestion maintenance, fiabilité', 'Énergie, Mines et Industrie', 'Bac+5', 500000.00, 2500000.00, 'RIC', 'Très forte croissance'),
(87, 'Technicien Maintenance Industrielle', 'Entretien et réparation des équipements industriels', 'Le technicien maintenance industrielle intervient sur les machines et installations afin d’assurer leur fonctionnement et limiter les arrêts de production.', 'Électromécanique, maintenance, diagnostic panne, mécanique, électricité industrielle, sécurité', 'Énergie, Mines et Industrie', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'RCE', 'Forte croissance'),
(88, 'Ingénieur Automatisme Industriel', 'Conception et gestion des systèmes automatisés', 'L’ingénieur automatisme industriel développe et supervise les systèmes permettant d’automatiser les machines et les processus industriels.', 'Automatisme, programmation industrielle, systèmes embarqués, robotique, instrumentation, contrôle industriel', 'Énergie, Mines et Industrie', 'Bac+5', 500000.00, 3000000.00, 'IRC', 'Très forte croissance'),
(89, 'Ingénieur HSE (Hygiène Sécurité Environnement)', 'Gestion de la sécurité et de l’environnement dans les organisations', 'L’ingénieur HSE met en place les politiques de prévention des risques, de sécurité au travail et de protection de l’environnement dans les secteurs industriels.', 'Sécurité industrielle, réglementation HSE, gestion risques, environnement, audit, prévention', 'Énergie, Mines et Industrie', 'Bac+3/Bac+5', 400000.00, 2500000.00, 'CSI', 'Forte croissance'),
(90, 'Responsable Production Industrielle', 'Gestion des opérations de production industrielle', 'Le responsable production industrielle organise et supervise les activités de fabrication afin d’atteindre les objectifs de qualité, coût et délai.', 'Management équipe, gestion production, planification, qualité, organisation industrielle', 'Énergie, Mines et Industrie', 'Bac+3/Bac+5', 400000.00, 2500000.00, 'ECR', 'Forte croissance'),
(91, 'Technicien Électromécanique Industrielle', 'Installation et maintenance des systèmes électromécaniques', 'Le technicien électromécanique industrielle installe, entretient et répare les équipements combinant électricité et mécanique dans les entreprises industrielles.', 'Électromécanique, moteurs, machines industrielles, électricité, maintenance, lecture plans techniques', 'Énergie, Mines et Industrie', 'Bac+2/Bac+3', 250000.00, 1500000.00, 'RCI', 'Forte croissance'),
(92, 'Ingénieur Agronome', 'Amélioration des systèmes de production agricole', 'L’ingénieur agronome accompagne la modernisation de l’agriculture en développant des techniques permettant d’améliorer les rendements, la qualité des productions et la gestion durable des ressources agricoles.', 'Agronomie, production végétale, gestion cultures, techniques agricoles, analyse sols, développement rural', 'Agriculture, Agroalimentaire et Environnement', 'Bac+5', 400000.00, 2000000.00, 'RIC', 'Forte croissance'),
(93, 'Ingénieur Agroalimentaire', 'Transformation et valorisation des produits agricoles', 'L’ingénieur agroalimentaire conçoit et améliore les procédés de transformation des produits agricoles afin de garantir la qualité, la sécurité alimentaire et l’efficacité des industries alimentaires.', 'Génie alimentaire, transformation aliments, qualité, sécurité alimentaire, procédés industriels, innovation', 'Agriculture, Agroalimentaire et Environnement', 'Bac+5', 400000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(94, 'Technicien Agricole', 'Accompagnement technique des exploitations agricoles', 'Le technicien agricole conseille les producteurs, suit les cultures et participe à l’application des techniques modernes de production agricole.', 'Techniques agricoles, suivi cultures, conseil agricole, irrigation, fertilisation, terrain', 'Agriculture, Agroalimentaire et Environnement', 'Bac+2/Bac+3', 200000.00, 1000000.00, 'RSC', 'Forte croissance'),
(95, 'Responsable Production Agricole', 'Gestion des activités de production agricole', 'Le responsable production agricole organise les opérations d’une exploitation, supervise les équipes et optimise l’utilisation des ressources pour améliorer la production.', 'Gestion exploitation, management équipe, planification, production agricole, organisation', 'Agriculture, Agroalimentaire et Environnement', 'Bac+3/Bac+5', 300000.00, 1800000.00, 'REC', 'Forte croissance'),
(96, 'Ingénieur Environnement', 'Gestion et protection des ressources environnementales', 'L’ingénieur environnement analyse les impacts des activités humaines et développe des solutions pour protéger les ressources naturelles et favoriser un développement durable.', 'Gestion environnementale, analyse risques, traitement déchets, développement durable, réglementation', 'Agriculture, Agroalimentaire et Environnement', 'Bac+5', 400000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(97, 'Spécialiste Développement Durable', 'Conception de projets liés au développement durable', 'Le spécialiste en développement durable accompagne les organisations dans la mise en place de stratégies responsables liées à l’environnement, aux ressources et aux impacts sociaux.', 'Développement durable, environnement, gestion projets, analyse impacts, responsabilité sociale', 'Agriculture, Agroalimentaire et Environnement', 'Bac+5', 400000.00, 2000000.00, 'SIA', 'Forte croissance'),
(98, 'Contrôleur Qualité Agroalimentaire', 'Contrôle de la qualité des produits alimentaires', 'Le contrôleur qualité agroalimentaire vérifie la conformité des produits alimentaires aux normes sanitaires et participe à l’amélioration des processus de production.', 'Contrôle qualité, normes alimentaires, hygiène, sécurité alimentaire, analyse laboratoire', 'Agriculture, Agroalimentaire et Environnement', 'Bac+3/Bac+5', 300000.00, 1800000.00, 'CIR', 'Très forte croissance'),
(99, 'Ingénieur Élevage et Productions Animales', 'Amélioration des systèmes d’élevage', 'L’ingénieur élevage travaille à l’amélioration des productions animales, à la gestion des élevages et au développement de solutions adaptées aux besoins agricoles.', 'Zootechnie, élevage, santé animale, production animale, gestion exploitation', 'Agriculture, Agroalimentaire et Environnement', 'Bac+5', 350000.00, 2000000.00, 'RIC', 'En croissance'),
(100, 'Technicien Agroalimentaire', 'Participation aux opérations de transformation alimentaire', 'Le technicien agroalimentaire intervient dans les unités de transformation, assure le suivi des procédés et participe au contrôle des produits alimentaires.', 'Transformation alimentaire, contrôle production, hygiène, procédés industriels, qualité', 'Agriculture, Agroalimentaire et Environnement', 'Bac+2/Bac+3', 250000.00, 1200000.00, 'RCI', 'Forte croissance'),
(101, 'Agripreneur', 'Création et gestion de projets agricoles innovants', 'L’agripreneur développe des activités agricoles, de transformation ou de commercialisation en utilisant des méthodes modernes pour créer de la valeur dans le secteur agricole.', 'Entrepreneuriat, gestion projet, agriculture moderne, commercialisation, innovation', 'Agriculture, Agroalimentaire et Environnement', 'Bac+2/Bac+5', 200000.00, 3000000.00, 'ECR', 'Très forte croissance'),
(102, 'Analyste Financier', 'Analyse des données financières et aide à la décision', 'L’analyste financier étudie la situation financière des entreprises et des organisations afin de produire des analyses utiles à la prise de décision et à l’évaluation des performances.', 'Analyse financière, Excel, modélisation financière, statistiques, comptabilité, analyse données', 'Banque, Finance, Assurance et Gestion', 'Bac+3/Bac+5', 400000.00, 2500000.00, 'IRC', 'Forte croissance'),
(103, 'Contrôleur de Gestion', 'Suivi des performances et contrôle budgétaire', 'Le contrôleur de gestion accompagne les entreprises dans le suivi des budgets, l’analyse des écarts et l’amélioration de la performance financière.', 'Gestion budgétaire, comptabilité analytique, Excel, analyse coûts, reporting, gestion performance', 'Banque, Finance, Assurance et Gestion', 'Bac+5', 400000.00, 2500000.00, 'CER', 'Forte croissance'),
(104, 'Auditeur Financier', 'Contrôle et vérification des informations financières', 'L’auditeur financier examine les comptes et les procédures des organisations afin de garantir leur fiabilité et leur conformité aux normes.', 'Audit, comptabilité, contrôle interne, analyse financière, normes comptables, rigueur', 'Banque, Finance, Assurance et Gestion', 'Bac+5', 400000.00, 3000000.00, 'CIR', 'Forte croissance'),
(105, 'Gestionnaire de Banque', 'Gestion des opérations et services bancaires', 'Le gestionnaire de banque assure le suivi des opérations bancaires, accompagne les clients et participe au développement des services financiers.', 'Produits bancaires, gestion clientèle, finance, analyse dossiers, communication, organisation', 'Banque, Finance, Assurance et Gestion', 'Bac+3/Bac+5', 300000.00, 1800000.00, 'CER', 'En croissance'),
(106, 'Chargé de Clientèle Banque', 'Accompagnement et conseil des clients bancaires', 'Le chargé de clientèle banque conseille les particuliers et entreprises, propose des solutions financières et développe la relation client.', 'Relation client, finance, communication, négociation, analyse besoins, produits bancaires', 'Banque, Finance, Assurance et Gestion', 'Bac+3', 250000.00, 1500000.00, 'ESC', 'Forte croissance'),
(107, 'Actuaire', 'Analyse des risques financiers et assurantiels', 'L’actuaire utilise les mathématiques et les statistiques pour évaluer les risques, prévoir les événements financiers et construire des solutions d’assurance.', 'Statistiques, probabilités, mathématiques financières, modélisation risques, analyse données', 'Banque, Finance, Assurance et Gestion', 'Bac+5', 500000.00, 3000000.00, 'IRC', 'Très forte croissance'),
(108, 'Analyste Crédit', 'Évaluation des demandes de financement', 'L’analyste crédit étudie les dossiers de financement afin d’évaluer les risques et la capacité de remboursement des clients ou entreprises.', 'Analyse crédit, finance, gestion risques, analyse financière, économie, dossiers clients', 'Banque, Finance, Assurance et Gestion', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'ICR', 'Forte croissance'),
(109, 'Gestionnaire Assurance', 'Gestion des contrats et opérations d’assurance', 'Le gestionnaire assurance assure le suivi des contrats, traite les dossiers clients et participe à la gestion des risques assurantiels.', 'Assurance, gestion contrats, relation client, analyse risques, réglementation, organisation', 'Banque, Finance, Assurance et Gestion', 'Bac+3', 250000.00, 1800000.00, 'CER', 'En croissance'),
(110, 'Expert Finance Digitale et Fintech', 'Développement des solutions financières numériques', 'L’expert en finance digitale participe à la création et à l’amélioration des services financiers numériques comme les paiements mobiles et les plateformes financières.', 'Fintech, finance numérique, analyse données, technologies financières, innovation, gestion projet', 'Banque, Finance, Assurance et Gestion', 'Bac+5', 500000.00, 3000000.00, 'IRC', 'Très forte croissance'),
(111, 'Trésorier d’Entreprise', 'Gestion des flux financiers d’une organisation', 'Le trésorier d’entreprise assure la gestion de la trésorerie, le suivi des flux financiers et l’optimisation des ressources financières.', 'Gestion trésorerie, finance, analyse flux, Excel, prévisions financières, gestion risques', 'Banque, Finance, Assurance et Gestion', 'Bac+3/Bac+5', 350000.00, 2200000.00, 'CER', 'Forte croissance'),
(112, 'Juriste d’entreprise', 'Conseil juridique auprès des entreprises et organisations', 'Le juriste d’entreprise accompagne les organisations dans leurs activités juridiques. Il analyse les contrats, veille au respect des lois et conseille les dirigeants sur les aspects réglementaires.', 'Droit des affaires, analyse juridique, rédaction contrats, veille réglementaire, négociation', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 300000.00, 2000000.00, 'ESA', 'Forte croissance'),
(113, 'Magistrat', 'Application du droit et administration de la justice', 'Le magistrat représente l’autorité judiciaire et participe au jugement des affaires conformément aux lois et aux principes de justice.', 'Droit, analyse juridique, raisonnement, décision, éthique professionnelle', 'Administration publique, Économie et Sciences sociales', 'Bac+5/+6', 500000.00, 3000000.00, 'ESA', 'Stable'),
(114, 'Administrateur public', 'Gestion des services et politiques publiques', 'L’administrateur public participe à la gestion des institutions publiques, à l’organisation des services de l’État et à la mise en œuvre des politiques publiques.', 'Administration publique, gestion projet, droit public, organisation, management', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 400000.00, 2500000.00, 'ECR', 'Stable'),
(115, 'Inspecteur des finances publiques', 'Contrôle et gestion des ressources publiques', 'L’inspecteur des finances publiques contrôle l’utilisation des ressources publiques et participe à la bonne gestion financière des administrations.', 'Finance publique, contrôle, fiscalité, audit, analyse financière, réglementation', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 400000.00, 2500000.00, 'CER', 'Stable'),
(116, 'Chargé de projet développement', 'Conception et suivi des projets de développement', 'Le chargé de projet développement accompagne les programmes économiques et sociaux menés par les institutions publiques, ONG et organismes internationaux.', 'Gestion projet, développement local, suivi-évaluation, analyse besoins, coordination', 'Administration publique, Économie et Sciences sociales', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'EAS', 'Forte croissance'),
(117, 'Spécialiste Passation des Marchés Publics', 'Gestion des procédures d’achat public', 'Le spécialiste en passation des marchés publics prépare et suit les procédures d’acquisition des institutions publiques et organisations.', 'Droit public, marchés publics, réglementation, gestion contrats, analyse dossiers', 'Administration publique, Économie et Sciences sociales', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'CER', 'Forte croissance'),
(118, 'Économiste', 'Analyse des phénomènes économiques et aide à la décision', 'L’économiste étudie les mécanismes économiques, analyse les données et produit des recommandations utiles aux entreprises, institutions publiques et organismes de développement.', 'Microéconomie, macroéconomie, statistiques, économétrie, analyse données, recherche', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 400000.00, 2500000.00, 'IRC', 'Forte croissance');
INSERT INTO `metier` (`id_metier`, `nom`, `description`, `presentation`, `competences`, `secteur`, `niveau_etude`, `salaire_min`, `salaire_max`, `profil_riasec`, `tendance`) VALUES
(119, 'Sociologue', 'Analyse des comportements et phénomènes sociaux', 'Le sociologue étudie les sociétés, les comportements humains et les dynamiques sociales afin d’aider à comprendre et résoudre des problématiques collectives.', 'Recherche sociale, enquêtes, analyse données, sociologie, communication, études terrain', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 250000.00, 1500000.00, 'SIA', 'Stable'),
(120, 'Analyste des politiques publiques', 'Évaluation et amélioration des politiques publiques', 'L’analyste des politiques publiques étudie les programmes publics, mesure leurs impacts et propose des améliorations pour les décideurs.', 'Analyse politiques publiques, statistiques, économie, recherche, évaluation programmes', 'Administration publique, Économie et Sciences sociales', 'Bac+5', 400000.00, 2500000.00, 'ISA', 'En croissance'),
(121, 'Gestionnaire de projet humanitaire', 'Organisation de programmes humanitaires et sociaux', 'Le gestionnaire de projet humanitaire coordonne les actions d’aide et de développement menées par les ONG et organisations internationales.', 'Gestion projet, développement international, coordination, communication, suivi-évaluation', 'Administration publique, Économie et Sciences sociales', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'ESA', 'Forte croissance'),
(122, 'Enseignant / Professeur', 'Transmission des connaissances et accompagnement des apprenants', 'L’enseignant ou professeur transmet des connaissances, développe les compétences des élèves et participe à leur formation académique et professionnelle.', 'Pédagogie, communication, gestion classe, préparation cours, évaluation, discipline enseignée', 'Éducation, Formation et Recherche', 'Bac+3/Bac+5', 250000.00, 1500000.00, 'SIA', 'Stable'),
(123, 'Enseignant-chercheur', 'Enseignement supérieur et recherche scientifique', 'L’enseignant-chercheur exerce dans les universités et centres de recherche. Il combine l’enseignement, la production scientifique et l’encadrement des étudiants.', 'Recherche scientifique, enseignement supérieur, publication, analyse, encadrement, innovation', 'Éducation, Formation et Recherche', 'Bac+8', 500000.00, 3000000.00, 'ICA', 'En croissance'),
(124, 'Formateur professionnel', 'Formation des professionnels et développement des compétences', 'Le formateur professionnel accompagne les jeunes et les adultes dans l’acquisition de compétences techniques et professionnelles.', 'Animation formation, pédagogie, communication, accompagnement, conception supports', 'Éducation, Formation et Recherche', 'Bac+3/Bac+5', 250000.00, 1800000.00, 'SIA', 'Forte croissance'),
(125, 'Ingénieur pédagogique', 'Conception et amélioration des systèmes de formation', 'L’ingénieur pédagogique conçoit des méthodes d’apprentissage innovantes, notamment dans les formations numériques et l’enseignement à distance.', 'Ingénierie pédagogique, e-learning, outils numériques, conception cours, analyse besoins', 'Éducation, Formation et Recherche', 'Bac+5', 400000.00, 2500000.00, 'ISA', 'Très forte croissance'),
(126, 'Concepteur pédagogique numérique', 'Création de contenus éducatifs numériques', 'Le concepteur pédagogique numérique développe des ressources d’apprentissage adaptées aux plateformes digitales et aux nouvelles méthodes éducatives.', 'E-learning, création contenus, technologies éducatives, pédagogie, multimédia', 'Éducation, Formation et Recherche', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'ASI', 'Très forte croissance'),
(127, 'Chercheur scientifique', 'Production de connaissances et innovation scientifique', 'Le chercheur scientifique mène des travaux de recherche dans différents domaines afin de produire de nouvelles connaissances et solutions.', 'Méthodologie recherche, analyse données, expérimentation, rédaction scientifique, innovation', 'Éducation, Formation et Recherche', 'Bac+5/Bac+8', 350000.00, 2500000.00, 'ICA', 'En croissance'),
(128, 'Conseiller d’orientation scolaire et professionnelle', 'Accompagnement des choix d’études et de carrière', 'Le conseiller d’orientation aide les élèves et étudiants à mieux comprendre leurs profils, leurs compétences et les possibilités de formation et de métiers.', 'Orientation, psychologie, accompagnement, analyse profils, communication, conseil', 'Éducation, Formation et Recherche', 'Bac+5', 300000.00, 2000000.00, 'SIA', 'Très forte croissance'),
(129, 'Responsable Formation', 'Gestion des programmes de formation', 'Le responsable formation organise les besoins en compétences, développe les plans de formation et accompagne les organisations dans le développement des talents.', 'Gestion formation, analyse besoins, gestion projet, ressources humaines, pédagogie', 'Éducation, Formation et Recherche', 'Bac+5', 400000.00, 2500000.00, 'ESA', 'Forte croissance'),
(130, 'Statisticien chercheur / Chargé d’études', 'Analyse de données pour la recherche et les études', 'Le statisticien chercheur exploite les données pour produire des analyses utiles aux institutions, chercheurs et organisations.', 'Statistiques, analyse données, enquêtes, méthodologie, logiciels statistiques, recherche', 'Éducation, Formation et Recherche', 'Bac+5', 400000.00, 2500000.00, 'IRC', 'Très forte croissance'),
(131, 'Chargé de communication', 'Gestion de la communication interne et externe des organisations', 'Le chargé de communication élabore les stratégies de communication, crée des contenus et assure la diffusion des informations auprès des différents publics.', 'Communication, rédaction, stratégie communication, gestion réseaux sociaux, relations médias, organisation', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 250000.00, 1800000.00, 'EAS', 'Forte croissance'),
(132, 'Journaliste', 'Collecte, analyse et diffusion de l’information', 'Le journaliste recherche, vérifie et présente des informations à travers différents supports comme la presse écrite, la radio, la télévision ou le numérique.', 'Investigation, rédaction, enquête, communication, analyse information, expression orale', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 200000.00, 1500000.00, 'IAS', 'Stable'),
(133, 'Community Manager', 'Gestion de la présence numérique des organisations', 'Le community manager anime les communautés en ligne, crée des contenus numériques et développe l’image des marques ou institutions sur les réseaux sociaux.', 'Réseaux sociaux, création contenu, communication digitale, analyse audience, créativité', 'Communication, Médias, Culture et Création', 'Bac+2/Bac+5', 200000.00, 1500000.00, 'ASI', 'Très forte croissance'),
(134, 'Graphiste Designer', 'Création de contenus visuels et supports graphiques', 'Le graphiste designer conçoit des identités visuelles, affiches, supports numériques et éléments graphiques pour les entreprises et organisations.', 'Design graphique, logiciels création, créativité, identité visuelle, communication visuelle', 'Communication, Médias, Culture et Création', 'Bac+2/Bac+3', 200000.00, 1500000.00, 'AIC', 'Forte croissance'),
(135, 'Designer Multimédia', 'Création de contenus numériques interactifs', 'Le designer multimédia réalise des contenus combinant images, vidéos, animations et éléments interactifs pour les supports numériques.', 'Design numérique, multimédia, audiovisuel, UX, création contenu, outils digitaux', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 250000.00, 2000000.00, 'ASI', 'Très forte croissance'),
(136, 'Réalisateur audiovisuel', 'Conception et réalisation de productions audiovisuelles', 'Le réalisateur audiovisuel dirige la création de films, documentaires, émissions ou contenus vidéo destinés aux médias et plateformes numériques.', 'Production audiovisuelle, scénario, direction artistique, montage, gestion équipe', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 250000.00, 2500000.00, 'AIS', 'En croissance'),
(137, 'Technicien audiovisuel', 'Gestion technique des productions audiovisuelles', 'Le technicien audiovisuel intervient dans la prise de son, l’image, l’éclairage et les équipements techniques utilisés dans les productions médias.', 'Prise de son, vidéo, équipements audiovisuels, montage, maintenance technique', 'Communication, Médias, Culture et Création', 'Bac+2/Bac+3', 200000.00, 1200000.00, 'RAC', 'En croissance'),
(138, 'Responsable événementiel', 'Organisation et gestion d’événements professionnels et culturels', 'Le responsable événementiel planifie et coordonne des événements comme des conférences, salons, manifestations culturelles ou commerciales.', 'Organisation événement, gestion projet, communication, logistique, négociation', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 250000.00, 2000000.00, 'EAS', 'Forte croissance'),
(139, 'Chargé des relations publiques', 'Gestion de l’image et des relations avec les publics', 'Le chargé des relations publiques développe les relations entre une organisation, ses partenaires, les médias et ses différents publics.', 'Relations publiques, communication, négociation, stratégie image, rédaction', 'Communication, Médias, Culture et Création', 'Bac+3/Bac+5', 250000.00, 1800000.00, 'ESA', 'En croissance'),
(140, 'Responsable hôtelier', 'Gestion et supervision des activités d’un établissement hôtelier', 'Le responsable hôtelier organise les services d’un hôtel, supervise les équipes et veille à la qualité de l’accueil et de l’expérience client.', 'Management hôtelier, gestion équipe, relation client, organisation, qualité de service', 'Tourisme, Hôtellerie et Restauration', 'Bac+2/Bac+5', 300000.00, 2000000.00, 'EAS', 'Forte croissance'),
(141, 'Directeur d’hôtel', 'Direction stratégique et opérationnelle d’un établissement hôtelier', 'Le directeur d’hôtel pilote l’ensemble des activités d’un établissement, de la gestion financière à la qualité des services proposés.', 'Leadership, gestion, finance, management, stratégie commerciale, organisation', 'Tourisme, Hôtellerie et Restauration', 'Bac+3/Bac+5', 500000.00, 4000000.00, 'ECR', 'En croissance'),
(142, 'Réceptionniste hôtelier', 'Accueil et accompagnement des clients dans un établissement hôtelier', 'Le réceptionniste hôtelier assure l’accueil des clients, les réservations et la coordination avec les différents services de l’hôtel.', 'Accueil, communication, langues étrangères, gestion réservation, relation client', 'Tourisme, Hôtellerie et Restauration', 'Bac+2', 200000.00, 1000000.00, 'SCE', 'Stable'),
(143, 'Agent de voyage / Conseiller voyage', 'Organisation et conseil dans les prestations touristiques', 'L’agent de voyage accompagne les clients dans la préparation de leurs déplacements, réservations et choix de destinations.', 'Organisation voyage, réservation, conseil client, tourisme, communication', 'Tourisme, Hôtellerie et Restauration', 'Bac+2/Bac+3', 200000.00, 1500000.00, 'ESA', 'En croissance'),
(144, 'Guide touristique professionnel', 'Accompagnement et valorisation du patrimoine touristique', 'Le guide touristique professionnel présente les sites culturels, historiques et naturels aux visiteurs tout en assurant leur accompagnement.', 'Culture, histoire, communication, langues, animation, connaissance territoire', 'Tourisme, Hôtellerie et Restauration', 'Bac+2/Bac+3', 200000.00, 1200000.00, 'ESA', 'En croissance'),
(145, 'Responsable restauration', 'Gestion d’un service ou établissement de restauration', 'Le responsable restauration organise les activités d’un restaurant, supervise les équipes et garantit la qualité des prestations.', 'Gestion restauration, management, organisation, contrôle qualité, gestion coûts', 'Tourisme, Hôtellerie et Restauration', 'Bac+2/Bac+3', 300000.00, 2000000.00, 'ECR', 'Forte croissance'),
(146, 'Chef cuisinier professionnel', 'Préparation et création de prestations culinaires professionnelles', 'Le chef cuisinier professionnel dirige la cuisine d’un établissement et développe des créations culinaires adaptées aux exigences des clients.', 'Cuisine professionnelle, créativité, organisation cuisine, gestion équipe, hygiène alimentaire', 'Tourisme, Hôtellerie et Restauration', 'Bac+1/Bac+2', 200000.00, 2000000.00, 'RAC', 'En croissance'),
(147, 'Pâtissier professionnel', 'Création de produits de pâtisserie dans un cadre professionnel', 'Le pâtissier professionnel réalise des produits sucrés pour les hôtels, restaurants, entreprises alimentaires ou activités entrepreneuriales.', 'Pâtisserie, créativité, précision, hygiène alimentaire, techniques culinaires', 'Tourisme, Hôtellerie et Restauration', 'Bac+1/Bac+2', 200000.00, 1500000.00, 'RAC', 'En croissance'),
(148, 'Assistant comptable', 'Assistance dans la gestion des opérations comptables quotidiennes', 'L’assistant comptable participe à la saisie des opérations, au suivi des documents financiers et à la préparation des travaux comptables.', 'Saisie comptable, logiciels comptables, organisation, contrôle documents, rigueur', 'Comptabilité, Fiscalité et Expertise', 'Bac+2/Bac+3', 200000.00, 1000000.00, 'CER', 'Stable'),
(149, 'Expert-comptable', 'Expertise avancée en comptabilité et conseil financier', 'L’expert-comptable accompagne les entreprises dans la tenue des comptes, la conformité financière et le conseil en gestion.', 'Comptabilité supérieure, normes comptables, fiscalité, conseil, analyse financière', 'Comptabilité, Fiscalité et Expertise', 'Bac+5/Bac+8', 500000.00, 4000000.00, 'IRC', 'Forte croissance'),
(150, 'Fiscaliste', 'Spécialiste de la fiscalité des entreprises et organisations', 'Le fiscaliste conseille les entreprises sur leurs obligations fiscales et optimise leur situation dans le respect de la réglementation.', 'Droit fiscal, fiscalité entreprise, analyse réglementation, conseil', 'Comptabilité, Fiscalité et Expertise', 'Bac+5', 350000.00, 2500000.00, 'CER', 'Forte croissance'),
(151, 'Comptable public', 'Gestion comptable dans les administrations publiques', 'Le comptable public assure le suivi des opérations financières des organismes publics et le respect des règles budgétaires.', 'Comptabilité publique, finances publiques, contrôle administratif, gestion budget', 'Comptabilité, Fiscalité et Expertise', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'CER', 'Stable'),
(152, 'Collaborateur de cabinet comptable', 'Accompagnement des entreprises dans leurs missions comptables', 'Le collaborateur de cabinet comptable réalise des missions de tenue comptable, déclarations fiscales et accompagnement des clients.', 'Comptabilité, fiscalité, relation client, logiciels comptables, analyse documents', 'Comptabilité, Fiscalité et Expertise', 'Bac+2/Bac+5', 250000.00, 2000000.00, 'CER', 'Forte croissance'),
(153, 'Spécialiste normes comptables IFRS', 'Expert des normes comptables internationales', 'Le spécialiste IFRS accompagne les organisations dans l’application des normes comptables internationales et la conformité financière.', 'Normes IFRS, comptabilité internationale, analyse financière, reporting', 'Comptabilité, Fiscalité et Expertise', 'Bac+5', 500000.00, 3000000.00, 'IRC', 'En croissance'),
(154, 'Spécialiste marketing digital', 'Développement des stratégies marketing utilisant les outils numériques.', 'Le spécialiste marketing digital accompagne les organisations dans leur visibilité en ligne, la promotion des produits et l’analyse des comportements des clients.', 'Marketing digital, réseaux sociaux, publicité en ligne, analyse données, stratégie numérique', 'Commerce, Marketing et Communication', 'Bac+3/Bac+5', 250000.00, 2000000.00, 'EAS', 'Très forte croissance'),
(155, 'Commercial', 'Développement des ventes et gestion de la relation client.', 'Le commercial représente une entreprise auprès des clients, présente ses produits ou services et développe son portefeuille commercial.', 'Vente, négociation, prospection, communication, relation client', 'Commerce, Marketing et Communication', 'Bac+2/Bac+3', 200000.00, 1500000.00, 'ECS', 'Stable'),
(156, 'Business developer', 'Création de nouvelles opportunités commerciales pour les entreprises.', 'Le business developer recherche de nouveaux marchés, développe des partenariats et participe à la croissance des organisations.', 'Développement commercial, négociation, stratégie, entrepreneuriat, analyse marché', 'Commerce, Marketing et Communication', 'Bac+3/Bac+5', 300000.00, 2500000.00, 'ECR', 'Très forte croissance'),
(157, 'Spécialiste e-commerce', 'Gestion et développement des activités commerciales en ligne.', 'Le spécialiste e-commerce développe les ventes sur internet et accompagne les entreprises dans leur transformation commerciale numérique.', 'Commerce électronique, plateformes web, marketing digital, gestion produits, analyse ventes', 'Commerce, Marketing et Communication', 'Bac+3/Bac+5', 250000.00, 2000000.00, 'EAS', 'Très forte croissance'),
(158, 'Communicateur commercial', 'Création de stratégies de communication orientées vers les objectifs commerciaux.', 'Le communicateur commercial conçoit des messages et supports destinés à promouvoir les produits, services et marques.', 'Communication, création contenu, image de marque, stratégie commerciale', 'Commerce, Marketing et Communication', 'Bac+3/Bac+5', 250000.00, 1800000.00, 'ESA', 'Forte croissance'),
(159, 'Entrepreneur / Consultant en développement commercial', 'Création ou accompagnement des activités commerciales.', 'Ce professionnel développe des projets commerciaux, accompagne les entreprises et contribue à leur croissance.', 'Entrepreneuriat, stratégie commerciale, gestion projet, innovation, négociation', 'Commerce, Marketing et Communication', 'Bac+3/Bac+5', 0.00, 3000000.00, 'ECR', 'Très forte croissance'),
(160, 'Ingénieur télécommunications', 'Conception et gestion des infrastructures de télécommunications.', 'L’ingénieur télécommunications développe, déploie et supervise les réseaux de communication fixes et mobiles.', 'Télécommunications, réseaux, transmission, communication numérique, résolution de problèmes', 'Télécommunications et Réseaux', 'Bac+5', 400000.00, 3500000.00, 'IRC', 'Très forte croissance'),
(161, 'Technicien réseaux et télécommunications', 'Installation et maintenance des équipements réseaux et télécoms.', 'Le technicien intervient sur les infrastructures réseau, les équipements de communication et les systèmes de transmission.', 'Maintenance réseau, câblage, configuration équipements, diagnostic technique', 'Télécommunications et Réseaux', 'Bac+2/Bac+3', 200000.00, 1200000.00, 'RIC', 'En croissance'),
(162, 'Ingénieur réseaux mobiles (4G/5G)', 'Conception et optimisation des réseaux de téléphonie mobile.', 'Ce professionnel participe au déploiement et à l’amélioration des réseaux mobiles nouvelle génération.', 'Réseaux mobiles, télécommunications, radio, optimisation réseau', 'Télécommunications et Réseaux', 'Bac+5', 450000.00, 4000000.00, 'IRC', 'Très forte croissance'),
(163, 'Architecte réseaux', 'Conception des architectures réseaux des organisations.', 'L’architecte réseaux définit les infrastructures permettant de garantir la performance, la sécurité et la disponibilité des réseaux.', 'Architecture réseau, cybersécurité, infrastructures, administration réseau', 'Télécommunications et Réseaux', 'Bac+5', 500000.00, 4500000.00, 'IRC', 'Très forte croissance'),
(164, 'Technicien fibre optique', 'Installation et maintenance des réseaux en fibre optique.', 'Le technicien fibre optique assure le déploiement et la maintenance des infrastructures de fibre optique.', 'Fibre optique, installation, maintenance, câblage, diagnostic', 'Télécommunications et Réseaux', 'Bac+2', 200000.00, 1000000.00, 'RIC', 'Forte croissance'),
(165, 'Administrateur télécom', 'Administration des systèmes et équipements de télécommunications.', 'L’administrateur télécom supervise les équipements de communication et garantit leur bon fonctionnement.', 'Administration télécom, maintenance, réseaux, sécurité', 'Télécommunications et Réseaux', 'Bac+3/Bac+5', 300000.00, 2000000.00, 'IRC', 'En croissance'),
(166, 'Ingénieur transmission', 'Conception et supervision des systèmes de transmission de données.', 'L’ingénieur transmission assure la fiabilité des échanges de données sur les infrastructures de télécommunications.', 'Transmission de données, réseaux, télécommunications, analyse technique', 'Télécommunications et Réseaux', 'Bac+5', 400000.00, 3500000.00, 'IRC', 'Très forte croissance'),
(167, 'Gestionnaire des ressources humaines', 'Gestion administrative et humaine des organisations.', 'Le gestionnaire des ressources humaines accompagne les organisations dans la gestion du personnel, le développement des compétences et l’application du droit du travail.', 'Gestion RH, droit du travail, organisation, communication, administration', 'Ressources Humaines et Développement Organisationnel', 'Bac+3/Bac+5', 300000.00, 2500000.00, 'ESA', 'Forte croissance'),
(168, 'Consultant en ressources humaines', 'Conseil et accompagnement des organisations dans leur politique RH.', 'Le consultant RH accompagne les entreprises dans le recrutement, la gestion des talents et le développement organisationnel.', 'Conseil, RH, gestion des talents, communication, audit organisationnel', 'Ressources Humaines et Développement Organisationnel', 'Bac+5', 400000.00, 3000000.00, 'ESA', 'En croissance'),
(169, 'Psychologue du travail', 'Analyse du comportement humain dans le monde professionnel.', 'Le psychologue du travail intervient sur le bien-être, la motivation, les risques psychosociaux et l’amélioration des conditions de travail.', 'Psychologie, écoute, analyse, accompagnement, relations humaines', 'Ressources Humaines et Développement Organisationnel', 'Bac+5', 350000.00, 2500000.00, 'SIA', 'En croissance'),
(170, 'Coach professionnel', 'Accompagnement des personnes dans leur développement professionnel.', 'Le coach professionnel aide les salariés, managers ou entrepreneurs à développer leurs compétences et atteindre leurs objectifs.', 'Coaching, communication, accompagnement, leadership, développement personnel', 'Ressources Humaines et Développement Organisationnel', 'Bac+3/Bac+5', 300000.00, 2500000.00, 'ESA', 'En croissance'),
(171, 'Spécialiste développement organisationnel', 'Amélioration des performances et de l’organisation des entreprises.', 'Le spécialiste en développement organisationnel accompagne les entreprises dans la transformation, la gestion du changement et l’amélioration des performances.', 'Organisation, management, stratégie, gestion du changement, analyse', 'Ressources Humaines et Développement Organisationnel', 'Bac+5', 400000.00, 3000000.00, 'EAI', 'Très forte croissance');

-- --------------------------------------------------------

--
-- Structure de la table `metier_filiere`
--

CREATE TABLE `metier_filiere` (
  `id_metier` int(11) NOT NULL,
  `id_filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier_filiere`
--

INSERT INTO `metier_filiere` (`id_metier`, `id_filiere`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 7),
(8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

CREATE TABLE `proposition` (
  `id_proposition` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `lettre` enum('A','B','C','D','E','F') NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `type_riasec` enum('R','I','A','S','E','C') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `proposition`
--

INSERT INTO `proposition` (`id_proposition`, `id_question`, `lettre`, `libelle`, `type_riasec`) VALUES
(1, 1, 'A', 'Réparer ou assembler des objets', 'R'),
(2, 1, 'B', 'Aider des personnes autour de moi', 'S'),
(3, 1, 'C', 'Résoudre des problèmes logiques', 'I'),
(4, 1, 'D', 'Ranger et organiser mes affaires', 'C'),
(5, 1, 'E', 'Dessiner ou créer quelque chose', 'A'),
(6, 1, 'F', 'Organiser une sortie ou une activité de groupe', 'E'),
(7, 2, 'A', 'Créer une œuvre artistique ou visuelle', 'A'),
(8, 2, 'B', 'Construire ou fabriquer un objet concret', 'R'),
(9, 2, 'C', 'Améliorer la vie des autres', 'S'),
(10, 2, 'D', 'Lancer une entreprise ou un projet commercial', 'E'),
(11, 2, 'E', 'Analyser un problème complexe', 'I'),
(12, 2, 'F', 'Créer un système organisé et structuré', 'C'),
(13, 3, 'A', 'Celui qui dirige et prend les décisions', 'E'),
(14, 3, 'B', 'Celui qui agit et fait le travail concret', 'R'),
(15, 3, 'C', 'Celui qui organise et structure le travail', 'C'),
(16, 3, 'D', 'Celui qui propose des idées créatives', 'A'),
(17, 3, 'E', 'Celui qui soutient et écoute les autres', 'S'),
(18, 3, 'F', 'Celui qui analyse et trouve les solutions', 'I'),
(19, 4, 'A', 'Un bureau organisé et structuré', 'C'),
(20, 4, 'B', 'Un environnement dynamique et compétitif', 'E'),
(21, 4, 'C', 'Un laboratoire ou un environnement d’analyse', 'I'),
(22, 4, 'D', 'Un studio créatif ou artistique', 'A'),
(23, 4, 'E', 'Un environnement humain et collaboratif', 'S'),
(24, 4, 'F', 'Un atelier ou un lieu pratique', 'R'),
(25, 5, 'A', 'Technologie, sciences physiques appliquées ou technique industrielle', 'R'),
(26, 5, 'B', 'Mathématiques, sciences physiques ou SVT', 'I'),
(27, 5, 'C', 'Arts plastiques, littérature ou philosophie', 'A'),
(28, 5, 'D', 'Sciences humaines, langues ou éducation civique', 'S'),
(29, 5, 'E', 'Économie, management ou sciences commerciales', 'E'),
(30, 5, 'F', 'Comptabilité, gestion ou droit', 'C'),
(31, 6, 'A', 'Un stage en laboratoire de recherche', 'I'),
(32, 6, 'B', 'Un stage dans une ONG ou service social', 'S'),
(33, 6, 'C', 'Un stage dans un atelier technique ou industriel', 'R'),
(34, 6, 'D', 'Un stage en administration ou bureau organisé', 'C'),
(35, 6, 'E', 'Un stage dans un studio créatif ou design', 'A'),
(36, 6, 'F', 'Un stage en entreprise ou start-up', 'E'),
(37, 7, 'D', 'Aider quelqu’un à résoudre ses difficultés', 'S'),
(38, 7, 'F', 'Organiser un système ou améliorer une méthode', 'C'),
(39, 7, 'A', 'Résoudre un problème concret ou technique', 'R'),
(40, 7, 'C', 'Créer quelque chose d’unique ou artistique', 'A'),
(41, 7, 'B', 'Comprendre un problème complexe ou scientifique', 'I'),
(42, 7, 'E', 'Atteindre un objectif ambitieux ou gagner', 'E'),
(43, 8, 'A', 'Outils manuels ou machines', 'R'),
(44, 8, 'B', 'Outils de communication et d’aide', 'S'),
(45, 8, 'C', 'Ordinateur pour analyser des données', 'I'),
(46, 8, 'D', 'Logiciels de création graphique ou audio', 'A'),
(47, 8, 'E', 'Tableurs et logiciels d’organisation', 'C'),
(48, 8, 'F', 'Outils de gestion de projet ou business', 'E'),
(49, 9, 'A', 'Créer un projet qui a de l’impact ou du profit', 'E'),
(50, 9, 'B', 'Organiser des tâches pour que tout soit efficace', 'C'),
(51, 9, 'C', 'Comprendre comment fonctionne un système ou une idée', 'I'),
(52, 9, 'D', 'Créer quelque chose d’artistique ou original', 'A'),
(53, 9, 'E', 'Réparer ou construire quelque chose de concret', 'R'),
(54, 9, 'F', 'Aider directement des personnes en difficulté', 'S'),
(55, 10, 'A', 'Guides d’organisation ou de gestion', 'C'),
(56, 10, 'B', 'Livres scientifiques ou d’analyse', 'I'),
(57, 10, 'C', 'Livres pratiques ou techniques', 'R'),
(58, 10, 'D', 'Histoires humaines ou sociales', 'S'),
(59, 10, 'E', 'Romans, art ou contenus créatifs', 'A'),
(60, 10, 'F', 'Livres sur la réussite et l’entrepreneuriat', 'E'),
(61, 11, 'A', 'Gérer les relations humaines et l’équipe', 'S'),
(62, 11, 'B', 'Analyser les données et stratégies', 'I'),
(63, 11, 'C', 'Créer l’image et le design de l’entreprise', 'A'),
(64, 11, 'D', 'Diriger et prendre les décisions importantes', 'E'),
(65, 11, 'E', 'Organiser la gestion et les procédures', 'C'),
(66, 11, 'F', 'Fabriquer ou produire un produit concret', 'R'),
(67, 12, 'A', 'Un travail avec des responsabilités et des objectifs', 'E'),
(68, 12, 'B', 'Un travail manuel ou technique concret', 'R'),
(69, 12, 'C', 'Un travail de réflexion et d’analyse', 'I'),
(70, 12, 'D', 'Un travail structuré et organisé', 'C'),
(71, 12, 'E', 'Un travail créatif et artistique', 'A'),
(72, 12, 'F', 'Un travail basé sur l’aide aux autres', 'S'),
(73, 13, 'A', 'Rechercher des informations et analyser les données', 'I'),
(74, 13, 'B', 'Organiser les tâches et respecter le planning', 'C'),
(75, 13, 'C', 'Construire ou réaliser la partie technique du projet', 'R'),
(76, 13, 'D', 'Diriger le groupe et prendre les décisions', 'E'),
(77, 13, 'E', 'Créer la présentation ou les éléments visuels', 'A'),
(78, 13, 'F', 'Aider et coordonner les membres du groupe', 'S'),
(79, 14, 'A', 'Faire une activité manuelle ou sportive', 'R'),
(80, 14, 'B', 'Ranger ou organiser mon espace', 'C'),
(81, 14, 'C', 'Dessiner, écouter de la musique ou créer', 'A'),
(82, 14, 'D', 'Passer du temps avec des amis ou aider quelqu’un', 'S'),
(83, 14, 'E', 'Parler de projets ou d’idées ambitieuses', 'E'),
(84, 14, 'F', 'Lire ou réfléchir sur un sujet intéressant', 'I'),
(85, 15, 'A', 'Résoudre des problèmes logiques ou scientifiques', 'I'),
(86, 15, 'B', 'Suivre des procédures claires et structurées', 'C'),
(87, 15, 'C', 'Prendre des décisions importantes', 'E'),
(88, 15, 'D', 'Créer ou imaginer quelque chose de nouveau', 'A'),
(89, 15, 'E', 'Travailler avec des personnes', 'S'),
(90, 15, 'F', 'Travailler avec des outils ou objets concrets', 'R'),
(91, 16, 'A', 'Avoir créé quelque chose d’unique et artistique', 'A'),
(92, 16, 'B', 'Avoir construit ou réparé quelque chose de concret', 'R'),
(93, 16, 'C', 'Avoir trouvé une solution à un problème complexe', 'I'),
(94, 16, 'D', 'Avoir organisé quelque chose parfaitement', 'C'),
(95, 16, 'E', 'Avoir réussi un projet ambitieux ou une entreprise', 'E'),
(96, 16, 'F', 'Avoir aidé beaucoup de personnes', 'S'),
(97, 17, 'A', 'En travaillant en groupe et en échangeant avec les autres', 'S'),
(98, 17, 'B', 'En pratiquant directement avec des outils ou des exercices', 'R'),
(99, 17, 'C', 'En étant motivé par des objectifs et des défis', 'E'),
(100, 17, 'D', 'En comprenant les théories et les concepts', 'I'),
(101, 17, 'E', 'En utilisant des méthodes créatives ou visuelles', 'A'),
(102, 17, 'F', 'En suivant des étapes structurées et organisées', 'C'),
(103, 18, 'A', 'Mon habileté manuelle ou technique', 'R'),
(104, 18, 'B', 'Ma capacité à analyser et résoudre des problèmes', 'I'),
(105, 18, 'C', 'Mon sens de l’organisation et de la rigueur', 'C'),
(106, 18, 'D', 'Ma créativité et mon imagination', 'A'),
(107, 18, 'E', 'Mon sens de l’aide et de l’écoute', 'S'),
(108, 18, 'F', 'Mon leadership et ma capacité à convaincre', 'E'),
(109, 19, 'A', 'Travaillant dans un domaine créatif ou artistique', 'A'),
(110, 19, 'B', 'Travaillant dans un métier manuel ou technique', 'R'),
(111, 19, 'C', 'Travaillant dans l’aide ou le social', 'S'),
(112, 19, 'D', 'Travaillant dans la recherche ou l’analyse', 'I'),
(113, 19, 'E', 'Dans un métier structuré et organisé', 'C'),
(114, 19, 'F', 'À la tête d’un projet ou d’une entreprise', 'E'),
(115, 20, 'A', 'L’organisation et la planification efficace du travail', 'C'),
(116, 20, 'B', 'La pratique et l’application concrète des connaissances', 'R'),
(117, 20, 'C', 'La réflexion et l’analyse approfondie des problèmes', 'I'),
(118, 20, 'D', 'La réussite et la reconnaissance dans son domaine', 'E'),
(119, 20, 'E', 'La créativité et l’innovation dans le travail', 'A'),
(120, 20, 'F', 'L’aide et le soutien aux autres dans leur travail', 'S');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id_question` int(11) NOT NULL,
  `id_questionnaire` int(11) NOT NULL,
  `texte` text NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_question`, `id_questionnaire`, `texte`, `ordre`) VALUES
(1, 1, 'Quelle activité préfères-tu faire pendant ton temps libre ?', 1),
(2, 1, 'Quel type de projet aimerais-tu réaliser ?', 2),
(3, 1, 'Dans un groupe, quel rôle prends-tu naturellement ?', 3),
(4, 1, 'Quel environnement de travail préfères-tu ?', 4),
(5, 1, 'Quelle matière préfères-tu à l\'école ?', 5),
(6, 1, 'Si tu pouvais choisir un stage aujourd\'hui, lequel choisirais-tu ?', 6),
(7, 1, 'Quel type de défi te motive le plus ?', 7),
(8, 1, 'Quel outil utiliserais-tu le plus volontiers ?', 8),
(9, 1, 'Quelle activité te semble la plus utile ?', 9),
(10, 1, 'Quel type de livre ou de contenu préfères-tu ?', 10),
(11, 1, 'Si tu créais une entreprise, quel serait ton rôle durant la mise en place ?', 11),
(12, 1, 'Quel type de travail te procure le plus de satisfaction ?', 12),
(13, 1, 'Lors d\'un projet scolaire, quel rôle préfères-tu ?', 13),
(14, 1, 'Quelle activité te détend le plus ?', 14),
(15, 1, 'Qu\'est-ce qui te stresse le moins ?', 15),
(16, 1, 'Quel type de réussite te rendrait le plus fier(ère) ?', 16),
(17, 1, 'Comment préfères-tu apprendre ?', 17),
(18, 1, 'Quelle qualité apprécies-tu le plus chez toi ?', 18),
(19, 1, 'Dans 10 ans, tu te vois...', 19),
(20, 1, 'Qu\'est-ce qui est le plus important pour toi dans une carrière ?', 20);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id_questionnaire` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `version` varchar(20) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id_questionnaire`, `nom`, `description`, `version`, `actif`, `date_creation`) VALUES
(1, 'Test RIASEC Standard', 'Questionnaire d\'orientation professionnelle basé sur la théorie de John Holland et adapté au contexte africain.', '1.0', 1, '2026-07-23 12:51:37');

-- --------------------------------------------------------

--
-- Structure de la table `recommandation`
--

CREATE TABLE `recommandation` (
  `id_recommandation` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL,
  `compatibilite` decimal(5,2) NOT NULL,
  `type` enum('top','secondaire') NOT NULL,
  `date_recommandation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id_reponse` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  `id_proposition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `id_test`, `id_proposition`) VALUES
(1, 2, 5),
(2, 2, 12),
(3, 2, 18),
(4, 2, 23),
(5, 2, 30),
(6, 2, 35),
(7, 2, 38),
(8, 2, 48),
(9, 2, 54),
(10, 2, 59),
(11, 2, 65),
(12, 2, 71),
(13, 2, 77),
(14, 2, 83),
(15, 2, 89),
(16, 2, 94),
(17, 2, 102),
(18, 2, 108),
(19, 2, 114),
(20, 2, 118),
(21, 3, 5),
(22, 3, 12),
(23, 3, 16),
(24, 3, 23),
(25, 3, 29),
(26, 3, 35),
(27, 3, 42),
(28, 3, 47),
(29, 3, 54),
(30, 3, 60),
(31, 3, 66),
(32, 3, 71),
(33, 3, 77),
(34, 3, 83),
(35, 3, 89),
(36, 3, 94),
(37, 3, 99),
(38, 3, 105),
(39, 3, 112),
(40, 3, 118),
(41, 4, 6),
(42, 4, 11),
(43, 4, 17),
(44, 4, 23),
(45, 4, 29),
(46, 4, 36),
(47, 4, 42),
(48, 4, 48),
(49, 4, 54),
(50, 4, 59),
(51, 4, 66),
(52, 4, 72),
(53, 4, 77),
(54, 4, 83),
(55, 4, 90),
(56, 4, 95),
(57, 4, 101),
(58, 4, 108),
(59, 4, 114),
(60, 4, 119),
(61, 5, 5),
(62, 5, 10),
(63, 5, 16),
(64, 5, 22),
(65, 5, 28),
(66, 5, 34),
(67, 5, 42),
(68, 5, 47),
(69, 5, 54),
(70, 5, 58),
(71, 5, 65),
(72, 5, 70),
(73, 5, 77),
(74, 5, 83),
(75, 5, 88),
(76, 5, 94),
(77, 5, 99),
(78, 5, 105),
(79, 5, 112),
(80, 5, 118),
(81, 6, 6),
(82, 6, 11),
(83, 6, 16),
(84, 6, 23),
(85, 6, 30),
(86, 6, 35),
(87, 6, 42),
(88, 6, 47),
(89, 6, 53),
(90, 6, 59),
(91, 6, 65),
(92, 6, 71),
(93, 6, 77),
(94, 6, 83),
(95, 6, 88),
(96, 6, 95),
(97, 6, 101),
(98, 6, 108),
(99, 6, 114),
(100, 6, 116),
(101, 7, 5),
(102, 7, 11),
(103, 7, 16),
(104, 7, 23),
(105, 7, 28),
(106, 7, 35),
(107, 7, 37),
(108, 7, 46),
(109, 7, 53),
(110, 7, 59),
(111, 7, 64),
(112, 7, 71),
(113, 7, 75),
(114, 7, 82),
(115, 7, 88),
(116, 7, 95),
(117, 7, 99),
(118, 7, 106),
(119, 7, 114),
(120, 7, 116),
(121, 8, 6),
(122, 8, 11),
(123, 8, 18),
(124, 8, 23),
(125, 8, 28),
(126, 8, 35),
(127, 8, 42),
(128, 8, 46),
(129, 8, 52),
(130, 8, 58),
(131, 8, 64),
(132, 8, 70),
(133, 8, 76),
(134, 8, 82),
(135, 8, 88),
(136, 8, 94),
(137, 8, 100),
(138, 8, 106),
(139, 8, 112),
(140, 8, 118),
(141, 9, 6),
(142, 9, 10),
(143, 9, 18),
(144, 9, 22),
(145, 9, 28),
(146, 9, 35),
(147, 9, 38),
(148, 9, 48),
(149, 9, 53),
(150, 9, 59),
(151, 9, 65),
(152, 9, 71),
(153, 9, 77),
(154, 9, 83),
(155, 9, 89),
(156, 9, 96),
(157, 9, 102),
(158, 9, 107),
(159, 9, 113),
(160, 9, 119),
(161, 10, 5),
(162, 10, 11),
(163, 10, 17),
(164, 10, 24),
(165, 10, 29),
(166, 10, 35),
(167, 10, 38),
(168, 10, 47),
(169, 10, 53),
(170, 10, 58),
(171, 10, 65),
(172, 10, 71),
(173, 10, 76),
(174, 10, 83),
(175, 10, 89),
(176, 10, 95),
(177, 10, 101),
(178, 10, 108),
(179, 10, 113),
(180, 10, 119),
(181, 11, 6),
(182, 11, 12),
(183, 11, 17),
(184, 11, 23),
(185, 11, 28),
(186, 11, 35),
(187, 11, 37),
(188, 11, 46),
(189, 11, 52),
(190, 11, 58),
(191, 11, 64),
(192, 11, 71),
(193, 11, 77),
(194, 11, 82),
(195, 11, 88),
(196, 11, 94),
(197, 11, 99),
(198, 11, 106),
(199, 11, 112),
(200, 11, 118),
(201, 12, 5),
(202, 12, 11),
(203, 12, 18),
(204, 12, 24),
(205, 12, 29),
(206, 12, 35),
(207, 12, 37),
(208, 12, 47),
(209, 12, 54),
(210, 12, 57),
(211, 12, 65),
(212, 12, 71),
(213, 12, 76),
(214, 12, 83),
(215, 12, 87),
(216, 12, 94),
(217, 12, 100),
(218, 12, 106),
(219, 12, 112),
(220, 12, 118),
(221, 13, 5),
(222, 13, 11),
(223, 13, 16),
(224, 13, 22),
(225, 13, 28),
(226, 13, 33),
(227, 13, 37),
(228, 13, 46),
(229, 13, 52),
(230, 13, 58),
(231, 13, 64),
(232, 13, 70),
(233, 13, 76),
(234, 13, 82),
(235, 13, 88),
(236, 13, 95),
(237, 13, 101),
(238, 13, 106),
(239, 13, 112),
(240, 13, 119),
(241, 14, 6),
(242, 14, 12),
(243, 14, 17),
(244, 14, 20),
(245, 14, 29),
(246, 14, 34),
(247, 14, 42),
(248, 14, 46),
(249, 14, 52),
(250, 14, 58),
(251, 14, 64),
(252, 14, 71),
(253, 14, 75),
(254, 14, 82),
(255, 14, 88),
(256, 14, 94),
(257, 14, 100),
(258, 14, 107),
(259, 14, 114),
(260, 14, 119),
(261, 15, 2),
(262, 15, 10),
(263, 15, 14),
(264, 15, 19),
(265, 15, 25),
(266, 15, 34),
(267, 15, 38),
(268, 15, 48),
(269, 15, 54),
(270, 15, 60),
(271, 15, 66),
(272, 15, 72),
(273, 15, 78),
(274, 15, 84),
(275, 15, 90),
(276, 15, 96),
(277, 15, 102),
(278, 15, 108),
(279, 15, 114),
(280, 15, 118),
(281, 16, 5),
(282, 16, 10),
(283, 16, 17),
(284, 16, 21),
(285, 16, 28),
(286, 16, 33),
(287, 16, 37),
(288, 16, 45),
(289, 16, 51),
(290, 16, 58),
(291, 16, 62),
(292, 16, 70),
(293, 16, 76),
(294, 16, 81),
(295, 16, 86),
(296, 16, 95),
(297, 16, 97),
(298, 16, 103),
(299, 16, 111),
(300, 16, 120),
(301, 17, 5),
(302, 17, 10),
(303, 17, 17),
(304, 17, 24),
(305, 17, 28),
(306, 17, 33),
(307, 17, 37),
(308, 17, 46),
(309, 17, 53),
(310, 17, 58),
(311, 17, 63),
(312, 17, 70),
(313, 17, 75),
(314, 17, 84),
(315, 17, 89),
(316, 17, 94),
(317, 17, 102),
(318, 17, 106),
(319, 17, 114),
(320, 17, 119),
(321, 18, 5),
(322, 18, 11),
(323, 18, 16),
(324, 18, 23),
(325, 18, 28),
(326, 18, 34),
(327, 18, 42),
(328, 18, 48),
(329, 18, 53),
(330, 18, 59),
(331, 18, 66),
(332, 18, 72),
(333, 18, 76),
(334, 18, 83),
(335, 18, 89),
(336, 18, 95),
(337, 18, 99),
(338, 18, 106),
(339, 18, 114),
(340, 18, 119),
(341, 19, 6),
(342, 19, 12),
(343, 19, 17),
(344, 19, 22),
(345, 19, 27),
(346, 19, 34),
(347, 19, 38),
(348, 19, 46),
(349, 19, 51),
(350, 19, 59),
(351, 19, 64),
(352, 19, 71),
(353, 19, 77),
(354, 19, 82),
(355, 19, 89),
(356, 19, 96),
(357, 19, 101),
(358, 19, 108),
(359, 19, 112),
(360, 19, 117),
(361, 20, 5),
(362, 20, 10),
(363, 20, 16),
(364, 20, 22),
(365, 20, 28),
(366, 20, 35),
(367, 20, 38),
(368, 20, 46),
(369, 20, 53),
(370, 20, 60),
(371, 20, 64),
(372, 20, 71),
(373, 20, 76),
(374, 20, 83),
(375, 20, 89),
(376, 20, 95),
(377, 20, 102),
(378, 20, 106),
(379, 20, 113),
(380, 20, 118),
(381, 21, 5),
(382, 21, 11),
(383, 21, 17),
(384, 21, 22),
(385, 21, 28),
(386, 21, 35),
(387, 21, 42),
(388, 21, 47),
(389, 21, 53),
(390, 21, 59),
(391, 21, 65),
(392, 21, 71),
(393, 21, 77),
(394, 21, 82),
(395, 21, 89),
(396, 21, 95),
(397, 21, 101),
(398, 21, 107),
(399, 21, 113),
(400, 21, 119),
(401, 22, 5),
(402, 22, 12),
(403, 22, 17),
(404, 22, 23),
(405, 22, 29),
(406, 22, 34),
(407, 22, 37),
(408, 22, 45),
(409, 22, 54),
(410, 22, 58),
(411, 22, 64),
(412, 22, 71),
(413, 22, 77),
(414, 22, 82),
(415, 22, 89),
(416, 22, 96),
(417, 22, 102),
(418, 22, 107),
(419, 22, 114),
(420, 22, 120),
(421, 23, 6),
(422, 23, 11),
(423, 23, 17),
(424, 23, 23),
(425, 23, 30),
(426, 23, 35),
(427, 23, 37),
(428, 23, 46),
(429, 23, 53),
(430, 23, 60),
(431, 23, 65),
(432, 23, 71),
(433, 23, 77),
(434, 23, 84),
(435, 23, 89),
(436, 23, 96),
(437, 23, 101),
(438, 23, 108),
(439, 23, 113),
(440, 23, 120),
(441, 24, 5),
(442, 24, 11),
(443, 24, 17),
(444, 24, 23),
(445, 24, 30),
(446, 24, 35),
(447, 24, 42),
(448, 24, 46),
(449, 24, 53),
(450, 24, 58),
(451, 24, 65),
(452, 24, 71),
(453, 24, 78),
(454, 24, 83),
(455, 24, 88),
(456, 24, 96),
(457, 24, 101),
(458, 24, 107),
(459, 24, 113),
(460, 24, 120),
(461, 25, 5),
(462, 25, 10),
(463, 25, 16),
(464, 25, 24),
(465, 25, 28),
(466, 25, 35),
(467, 25, 42),
(468, 25, 46),
(469, 25, 53),
(470, 25, 59),
(471, 25, 66),
(472, 25, 68),
(473, 25, 75),
(474, 25, 80),
(475, 25, 86),
(476, 25, 93),
(477, 25, 99),
(478, 25, 105),
(479, 25, 111),
(480, 25, 118),
(481, 26, 6),
(482, 26, 11),
(483, 26, 16),
(484, 26, 21),
(485, 26, 27),
(486, 26, 32),
(487, 26, 37),
(488, 26, 45),
(489, 26, 52),
(490, 26, 57),
(491, 26, 62),
(492, 26, 69),
(493, 26, 75),
(494, 26, 82),
(495, 26, 87),
(496, 26, 93),
(497, 26, 99),
(498, 26, 103),
(499, 26, 110),
(500, 26, 118),
(501, 27, 4),
(502, 27, 11),
(503, 27, 17),
(504, 27, 23),
(505, 27, 28),
(506, 27, 34),
(507, 27, 42),
(508, 27, 48),
(509, 27, 52),
(510, 27, 57),
(511, 27, 64),
(512, 27, 71),
(513, 27, 76),
(514, 27, 79),
(515, 27, 87),
(516, 27, 94),
(517, 27, 99),
(518, 27, 104),
(519, 27, 109),
(520, 27, 117),
(521, 28, 4),
(522, 28, 11),
(523, 28, 16),
(524, 28, 21),
(525, 28, 28),
(526, 28, 33),
(527, 28, 41),
(528, 28, 45),
(529, 28, 52),
(530, 28, 59),
(531, 28, 64),
(532, 28, 69),
(533, 28, 73),
(534, 28, 84),
(535, 28, 88),
(536, 28, 93),
(537, 28, 99),
(538, 28, 105),
(539, 28, 114),
(540, 28, 120),
(541, 29, 4),
(542, 29, 10),
(543, 29, 15),
(544, 29, 22),
(545, 29, 29),
(546, 29, 33),
(547, 29, 40),
(548, 29, 46),
(549, 29, 53),
(550, 29, 57),
(551, 29, 65),
(552, 29, 70),
(553, 29, 77),
(554, 29, 81),
(555, 29, 89),
(556, 29, 94),
(557, 29, 99),
(558, 29, 106),
(559, 29, 113),
(560, 29, 118),
(561, 30, 5),
(562, 30, 12),
(563, 30, 18),
(564, 30, 22),
(565, 30, 28),
(566, 30, 35),
(567, 30, 38),
(568, 30, 46),
(569, 30, 51),
(570, 30, 56),
(571, 30, 63),
(572, 30, 70),
(573, 30, 73),
(574, 30, 82),
(575, 30, 88),
(576, 30, 94),
(577, 30, 99),
(578, 30, 106),
(579, 30, 113),
(580, 30, 120),
(581, 31, 1),
(582, 31, 12),
(583, 31, 18),
(584, 31, 24),
(585, 31, 29),
(586, 31, 36),
(587, 31, 38),
(588, 31, 48),
(589, 31, 53),
(590, 31, 59),
(591, 31, 65),
(592, 31, 71),
(593, 31, 78),
(594, 31, 84),
(595, 31, 90),
(596, 31, 96),
(597, 31, 102),
(598, 31, 108),
(599, 31, 114),
(600, 31, 120),
(601, 32, 6),
(602, 32, 8),
(603, 32, 16),
(604, 32, 23),
(605, 32, 26),
(606, 32, 34),
(607, 32, 40),
(608, 32, 46),
(609, 32, 51),
(610, 32, 58),
(611, 32, 62),
(612, 32, 70),
(613, 32, 77),
(614, 32, 84),
(615, 32, 86),
(616, 32, 93),
(617, 32, 101),
(618, 32, 107),
(619, 32, 111),
(620, 32, 118);

-- --------------------------------------------------------

--
-- Structure de la table `test_riasec`
--

CREATE TABLE `test_riasec` (
  `id_test` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_questionnaire` int(11) NOT NULL,
  `date_test` datetime NOT NULL DEFAULT current_timestamp(),
  `score_R` int(11) NOT NULL DEFAULT 0,
  `score_I` int(11) NOT NULL DEFAULT 0,
  `score_A` int(11) NOT NULL DEFAULT 0,
  `score_S` int(11) NOT NULL DEFAULT 0,
  `score_E` int(11) NOT NULL DEFAULT 0,
  `score_C` int(11) NOT NULL DEFAULT 0,
  `profil_dominant` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_riasec`
--

INSERT INTO `test_riasec` (`id_test`, `id_user`, `id_questionnaire`, `date_test`, `score_R`, `score_I`, `score_A`, `score_S`, `score_E`, `score_C`, `profil_dominant`) VALUES
(2, 1, 1, '2026-07-23 13:39:06', 0, 1, 5, 3, 5, 6, 'CA'),
(3, 1, 1, '2026-07-23 14:05:38', 1, 1, 5, 3, 6, 4, 'EA'),
(4, 1, 1, '2026-07-23 14:19:42', 2, 1, 4, 4, 9, 0, 'EA'),
(5, 1, 1, '2026-07-23 14:43:37', 0, 1, 5, 3, 5, 6, 'CA'),
(6, 1, 1, '2026-07-23 15:17:16', 2, 1, 7, 1, 6, 3, 'AE'),
(7, 1, 1, '2026-07-23 15:29:00', 3, 1, 8, 4, 4, 0, 'AS'),
(8, 1, 1, '2026-07-23 16:11:18', 0, 4, 5, 4, 5, 2, 'AE'),
(9, 1, 1, '2026-07-23 16:34:16', 1, 1, 6, 4, 4, 4, 'AS'),
(10, 1, 1, '2026-07-23 16:55:10', 2, 1, 5, 3, 5, 4, 'AE'),
(11, 1, 1, '2026-07-23 18:45:58', 0, 1, 7, 6, 4, 2, 'AS'),
(12, 1, 1, '2026-07-23 18:49:28', 2, 4, 4, 2, 5, 3, 'EI'),
(13, 1, 1, '2026-07-23 19:10:24', 1, 2, 9, 4, 3, 1, 'AS'),
(14, 1, 1, '2026-07-23 19:12:49', 1, 1, 5, 4, 6, 3, 'EA'),
(15, 1, 1, '2026-07-24 14:14:12', 4, 1, 0, 5, 6, 4, 'ES'),
(16, 1, 1, '2026-07-26 00:21:29', 2, 4, 2, 7, 3, 2, 'SI'),
(17, 1, 1, '2026-07-27 18:06:25', 4, 1, 5, 5, 2, 3, 'AS'),
(18, 1, 1, '2026-07-27 19:06:50', 2, 1, 5, 4, 7, 1, 'EA'),
(19, 1, 1, '2026-07-30 13:13:23', 0, 3, 7, 4, 3, 3, 'AS'),
(20, 1, 1, '2026-07-31 13:43:52', 1, 0, 7, 2, 7, 3, 'AE'),
(21, 2, 1, '2026-07-31 14:31:55', 1, 1, 8, 5, 2, 3, 'AS'),
(22, 1, 1, '2026-07-31 15:28:19', 0, 1, 3, 10, 3, 3, 'SA'),
(23, 11, 1, '2026-07-31 15:42:40', 1, 2, 5, 6, 3, 3, 'SA'),
(24, 11, 1, '2026-07-31 16:33:50', 1, 1, 6, 7, 2, 3, 'SA'),
(25, 11, 1, '2026-07-31 16:54:44', 5, 1, 5, 2, 4, 3, 'RA'),
(26, 11, 1, '2026-07-31 16:57:30', 4, 6, 3, 3, 4, 0, 'IR'),
(27, 14, 1, '2026-07-31 17:16:59', 2, 3, 3, 3, 6, 3, 'EI'),
(28, 8, 1, '2026-07-31 17:34:04', 1, 8, 4, 2, 3, 2, 'IA'),
(29, 12, 1, '2026-07-31 18:06:41', 3, 0, 6, 1, 4, 6, 'AC'),
(30, 16, 1, '2026-07-31 18:21:13', 0, 4, 7, 3, 1, 5, 'AC'),
(31, 17, 1, '2026-07-31 18:33:22', 4, 2, 2, 3, 5, 4, 'ER'),
(32, 17, 1, '2026-08-03 13:27:31', 1, 5, 5, 4, 2, 3, 'IA');

-- --------------------------------------------------------

--
-- Structure de la table `universite`
--

CREATE TABLE `universite` (
  `id_universite` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `type` enum('publique','privee') NOT NULL,
  `pays` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `region` varchar(100) DEFAULT NULL,
  `site_web` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `universite`
--

INSERT INTO `universite` (`id_universite`, `nom`, `description`, `type`, `pays`, `ville`, `region`, `site_web`, `logo`) VALUES
(1, 'UCAD', 'Université Cheikh Anta Diop de Dakar, la plus grande université du Sénégal', 'publique', 'Sénégal', 'Dakar', 'Dakar', 'https://www.ucad.sn', '/assets/logos/ucad.png'),
(2, 'UGB', 'Université Gaston Berger de Saint-Louis', 'publique', 'Sénégal', 'Saint-Louis', 'Saint-Louis', 'https://www.ugb.sn', '/assets/logos/ugb.png'),
(3, 'UIDT', 'Université Iba Der Thiam de Thiès', 'publique', 'Sénégal', 'Thiès', 'Thiès', 'https://www.uidt.sn', '/assets/logos/uidt.png'),
(4, 'ESP', 'École Supérieure Polytechnique de Dakar', 'publique', 'Sénégal', 'Dakar', 'Dakar', 'https://www.esp.sn', '/assets/logos/esp.png'),
(5, 'SUPDECO', 'Institut privé spécialisé en management et commerce', 'privee', 'Sénégal', 'Dakar', 'Dakar', 'https://www.supdeco.sn', '/assets/logos/supdeco.png');

-- --------------------------------------------------------

--
-- Structure de la table `universite_detail`
--

CREATE TABLE `universite_detail` (
  `id_detail` int(11) NOT NULL,
  `id_universite` int(11) NOT NULL,
  `presentation` text DEFAULT NULL,
  `conditions_admission` text DEFAULT NULL,
  `bourses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `universite_detail`
--

INSERT INTO `universite_detail` (`id_detail`, `id_universite`, `presentation`, `conditions_admission`, `bourses`) VALUES
(1, 1, 'L\'Université Cheikh Anta Diop de Dakar (UCAD) est l\'une des principales universités publiques du Sénégal. Créée en 1957, elle propose des formations dans plusieurs domaines comme les sciences, la santé, le droit, l\'économie, les lettres et les technologies.', 'L\'admission se fait généralement après l\'obtention du baccalauréat. Certaines formations peuvent avoir des conditions particulières comme une sélection sur dossier, un concours ou des critères spécifiques selon les facultés.', 'Les étudiants peuvent bénéficier de bourses nationales attribuées selon les critères du ministère de l\'Enseignement supérieur et de la Recherche.'),
(2, 2, 'L\'Université Gaston Berger de Saint-Louis (UGB) est une université publique créée en 1990. Elle est reconnue pour ses formations en sciences, technologies, économie, gestion, lettres et sciences humaines.', 'L\'accès se fait principalement après le baccalauréat. Certaines filières peuvent appliquer des critères de sélection selon la capacité d\'accueil et les exigences pédagogiques.', 'Les étudiants peuvent bénéficier de bourses publiques selon les critères nationaux définis par les autorités de l\'enseignement supérieur.'),
(3, 3, 'L\'Université Iba Der Thiam de Thiès (UIDT) est une université publique située dans la région de Thiès. Elle développe des formations orientées vers les sciences, technologies, ingénierie, économie et autres domaines professionnels.', 'L\'admission est généralement ouverte aux titulaires du baccalauréat. Certaines formations peuvent demander des conditions spécifiques ou une sélection selon la filière choisie.', 'Les étudiants peuvent accéder aux dispositifs de bourses nationales selon les conditions établies par les organismes compétents.'),
(4, 4, 'L\'École Supérieure Polytechnique (ESP) de Dakar est une grande école publique spécialisée dans les formations scientifiques, techniques et d\'ingénierie. Elle forme des professionnels dans plusieurs domaines liés à l\'industrie et aux technologies.', 'L\'admission peut se faire après le baccalauréat ou après certains diplômes selon le niveau de formation. Plusieurs parcours utilisent une sélection sur dossier ou concours.', 'Les étudiants peuvent bénéficier de bourses publiques selon leur situation et les critères nationaux.'),
(5, 5, 'Le Groupe Supdeco Dakar est un établissement privé d\'enseignement supérieur spécialisé dans les domaines du management, de la gestion, du commerce, de la finance et du marketing.', 'L\'admission se fait généralement sur étude de dossier après le baccalauréat ou selon le niveau d\'études pour les formations avancées.', 'L\'établissement peut proposer des aides financières, réductions ou facilités de paiement selon les programmes et les conditions internes.');

-- --------------------------------------------------------

--
-- Structure de la table `universite_filiere`
--

CREATE TABLE `universite_filiere` (
  `id_universite` int(11) NOT NULL,
  `id_filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `universite_filiere`
--

INSERT INTO `universite_filiere` (`id_universite`, `id_filiere`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 5),
(3, 1),
(3, 2),
(3, 4),
(4, 1),
(4, 2),
(5, 5),
(5, 7);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `niveau_etude` varchar(100) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `nom`, `email`, `mot_de_passe`, `pays`, `niveau_etude`, `date_creation`) VALUES
(1, 'Utilisateur Test', 'test@nextori.com', '$2y$10$abcdefghijklmnopqrstuv123456789012345678901234567890', 'Sénégal', 'Licence 2', '2026-07-23 13:37:00'),
(2, 'Laurent Test', 'laurent.test@gmail.com', '$2y$10$155JCoTkU8I.ATABJ08OoeBPSrK8ZOgWFtn0d.oCIlkGgynE8h3x2', 'Sénégal', 'Licence 2', '2026-07-30 14:43:51'),
(3, 'Nouvel Utilisateur', 'nouveau@gmail.com', '$2y$10$V2kTNRyyq8QOgRiMb0c/CO8Z5oQsGc.lAtQ2KYO5iIRaNHQ4hLA2a', 'Sénégal', 'Licence 2', '2026-07-30 15:16:42'),
(4, 'Test Front', 'front@test.com', '$2y$10$kktLTDJ7HCR1RYtUTU3.ZOH6DTZNNVJalKsdQxlcppFQ/oA3Gyy5G', 'Sénégal', 'Licence 2', '2026-07-30 15:51:58'),
(7, 'Utilisateur Auto', 'auto@test.com', '$2y$10$5Zy2NS0UroqBYSfy3OhG7Op.LXPB6oizpiK95RsuleZChI3BJCVjy', 'Sénégal', 'Licence 2', '2026-07-30 17:22:25'),
(8, 'Ndeye Awa NIANE', 'niane@gmail.com', '$2y$10$OyN4FQz3UggXR3FiBJ3Yv.b.HkinTkuS7.uM07CcrFrZiyrNLHyym', 'Sénégal', 'Licence 2', '2026-07-30 17:28:18'),
(9, 'Laurent Massoya', 'laurent@gmail.com', '$2y$10$YMPWrly6OfTJUPBJD2f.r.bjcQI9xrNbtp5s84Dlqf5zOQaoCILne', 'Sénégal', 'Licence 2', '2026-07-31 12:04:10'),
(10, 'Barth Mendy', 'barth55@gmail.con', '$2y$10$4HDw7lL7i.O7ZMmYa7OckuZgaQuq9/MFAHfM0shSlWmrpwJ7fdIhm', 'Sénégal', 'Bac', '2026-07-31 13:02:24'),
(11, 'Denise Mendy', 'niza5343@gmail.com', '$2y$10$d90XWTg60.JKn3cgOm3cNuKJT0fDIbEBUBP.dR2cgxzCpnyreyX42', 'Sénégal', 'Baccalauréat', '2026-07-31 13:11:04'),
(12, 'Fanta Diallo', 'diallofanta353@gmail.com', '$2y$10$sRQHt4.NLFv2kMGRBvWrt.J2cIrzxMD720wqQcV.92erS0xjp42Iu', 'Guinée', 'Terminale', '2026-07-31 17:00:49'),
(13, 'Badou Diop', 'badou5354@gmail.com', '$2y$10$m5O6KzhZUUMvZd3JQOLOy.r3s.YwCJOJ2Pkf318fL7HvndP8dzXle', 'Sénégal', 'Master 2', '2026-07-31 17:08:14'),
(14, 'ndiaye Lo', 'ndiayelo645@gmail.com', '$2y$10$35f5ubGGXEiDZIm0h6/3TuKiRvd/4XyHV0iR1UEyZzSQexMmQZ9WC', 'Sénégal', 'Première', '2026-07-31 17:15:10'),
(15, 'Antoine Gomis', 'antoine3553@gmail.com', '$2y$10$yzRHGDDPhLw0VXxDGupDiO3ZtEKWWaoczmPYJEUeKx5KCc3ZI4oW6', 'Sénégal', 'Licence 2', '2026-07-31 17:19:41'),
(16, 'Laurent Massoya', 'laurent56766@gmail.com', '$2y$10$N6zG3/JMYTp5.wgB1dPUYebgboOq7gp5rnT0g31Oe53CF9htQiisS', 'Sénégal', 'Licence 2', '2026-07-31 18:18:35'),
(17, 'Laurent Massoya', 'laur3245@gmail.com', '$2y$10$COOPwYXekgMWSyvmiaW.x.RxP3XYD696wgw3i4wh2MV1/JLz1XbiK', 'Sénégal', 'Licence 2', '2026-07-31 18:31:57');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `favori`
--
ALTER TABLE `favori`
  ADD PRIMARY KEY (`id_favori`),
  ADD UNIQUE KEY `uk_favori` (`id_user`,`id_metier`),
  ADD KEY `fk_favori_metier` (`id_metier`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id_filiere`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`id_historique`),
  ADD KEY `fk_historique_user` (`id_user`);

--
-- Index pour la table `metier`
--
ALTER TABLE `metier`
  ADD PRIMARY KEY (`id_metier`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `metier_filiere`
--
ALTER TABLE `metier_filiere`
  ADD PRIMARY KEY (`id_metier`,`id_filiere`),
  ADD KEY `fk_metier_filiere_filiere` (`id_filiere`);

--
-- Index pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD PRIMARY KEY (`id_proposition`),
  ADD KEY `fk_proposition_question` (`id_question`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `fk_question_questionnaire` (`id_questionnaire`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`id_questionnaire`);

--
-- Index pour la table `recommandation`
--
ALTER TABLE `recommandation`
  ADD PRIMARY KEY (`id_recommandation`),
  ADD KEY `fk_recommandation_test` (`id_test`),
  ADD KEY `fk_recommandation_metier` (`id_metier`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id_reponse`),
  ADD UNIQUE KEY `uk_reponse` (`id_test`,`id_proposition`),
  ADD KEY `fk_reponse_proposition` (`id_proposition`);

--
-- Index pour la table `test_riasec`
--
ALTER TABLE `test_riasec`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_user` (`id_user`),
  ADD KEY `fk_test_questionnaire` (`id_questionnaire`);

--
-- Index pour la table `universite`
--
ALTER TABLE `universite`
  ADD PRIMARY KEY (`id_universite`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `universite_detail`
--
ALTER TABLE `universite_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_universite` (`id_universite`);

--
-- Index pour la table `universite_filiere`
--
ALTER TABLE `universite_filiere`
  ADD PRIMARY KEY (`id_universite`,`id_filiere`),
  ADD KEY `fk_universite_filiere_filiere` (`id_filiere`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `favori`
--
ALTER TABLE `favori`
  MODIFY `id_favori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `historique`
--
ALTER TABLE `historique`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT pour la table `metier`
--
ALTER TABLE `metier`
  MODIFY `id_metier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `proposition`
--
ALTER TABLE `proposition`
  MODIFY `id_proposition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `id_questionnaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `recommandation`
--
ALTER TABLE `recommandation`
  MODIFY `id_recommandation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id_reponse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=621;

--
-- AUTO_INCREMENT pour la table `test_riasec`
--
ALTER TABLE `test_riasec`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `universite`
--
ALTER TABLE `universite`
  MODIFY `id_universite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `universite_detail`
--
ALTER TABLE `universite_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favori`
--
ALTER TABLE `favori`
  ADD CONSTRAINT `fk_favori_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favori_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `fk_historique_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `metier_filiere`
--
ALTER TABLE `metier_filiere`
  ADD CONSTRAINT `fk_metier_filiere_filiere` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_metier_filiere_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`) ON DELETE CASCADE;

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `fk_proposition_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON DELETE CASCADE;

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_question_questionnaire` FOREIGN KEY (`id_questionnaire`) REFERENCES `questionnaire` (`id_questionnaire`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recommandation`
--
ALTER TABLE `recommandation`
  ADD CONSTRAINT `fk_recommandation_metier` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recommandation_test` FOREIGN KEY (`id_test`) REFERENCES `test_riasec` (`id_test`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `fk_reponse_proposition` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id_proposition`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reponse_test` FOREIGN KEY (`id_test`) REFERENCES `test_riasec` (`id_test`) ON DELETE CASCADE;

--
-- Contraintes pour la table `test_riasec`
--
ALTER TABLE `test_riasec`
  ADD CONSTRAINT `fk_test_questionnaire` FOREIGN KEY (`id_questionnaire`) REFERENCES `questionnaire` (`id_questionnaire`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_test_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `universite_detail`
--
ALTER TABLE `universite_detail`
  ADD CONSTRAINT `universite_detail_ibfk_1` FOREIGN KEY (`id_universite`) REFERENCES `universite` (`id_universite`) ON DELETE CASCADE;

--
-- Contraintes pour la table `universite_filiere`
--
ALTER TABLE `universite_filiere`
  ADD CONSTRAINT `fk_universite_filiere_filiere` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_universite_filiere_universite` FOREIGN KEY (`id_universite`) REFERENCES `universite` (`id_universite`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
