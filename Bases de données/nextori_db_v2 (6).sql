-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 juil. 2026 à 19:30
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
(37, 1, 'UNIVERSITES_CONSULTEES', '2026-07-30 13:14:19');

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
(3, 'Ingénieur Génie Civil', 'Construction de bâtiments et infrastructures', 'L\'ingénieur génie civil conçoit, planifie et supervise la réalisation des infrastructures comme les bâtiments, les routes et les ouvrages publics. Il veille au respect des normes techniques et de sécurité.', 'Conception technique, calculs de structures, AutoCAD, gestion de projet, résistance des matériaux, analyse des plans, travail en équipe', 'Génie Civil', 'Bac+5', 400000.00, 1800000.00, 'RIC', 'En croissance'),
(4, 'Médecin', 'Diagnostic et traitement des patients', 'Le médecin diagnostique, traite et accompagne les patients afin de préserver leur santé. Il utilise ses connaissances scientifiques et médicales pour prévenir et soigner les maladies.', 'Diagnostic médical, connaissances en sciences de la santé, écoute, communication, analyse clinique, prise de décision, éthique professionnelle', 'Santé', 'Bac+7+', 600000.00, 3000000.00, 'ISR', 'Stable'),
(5, 'Avocat', 'Défense juridique et conseils', 'L\'avocat conseille et représente ses clients dans les affaires juridiques. Il analyse les lois, prépare des dossiers et défend les intérêts des personnes ou des organisations devant les institutions compétentes.', 'Connaissance du droit, analyse juridique, argumentation, rédaction juridique, communication, négociation, esprit critique', 'Droit', 'Bac+5', 300000.00, 2000000.00, 'ESA', 'Stable'),
(6, 'Comptable', 'Gestion des finances et comptabilité', 'Le comptable assure la gestion des opérations financières d\'une organisation. Il enregistre les transactions, prépare les documents comptables et contribue au suivi de la situation financière.', 'Comptabilité générale, analyse financière, Excel, logiciels comptables, rigueur, organisation, gestion des chiffres', 'Finance et Comptabilité', 'Bac+3', 250000.00, 1200000.00, 'CER', 'Stable'),
(7, 'Marketeur', 'Stratégies marketing et communication', 'Le marketeur étudie les besoins des consommateurs et développe des stratégies pour promouvoir des produits ou services. Il participe à la communication, à la publicité et au développement commercial.', 'Étude de marché, communication, stratégie marketing, réseaux sociaux, analyse des données, créativité, gestion de projet', 'Marketing et Commerce', 'Bac+3', 250000.00, 1500000.00, 'EAS', 'Forte croissance'),
(8, 'Administrateur Réseau', 'Gestion des réseaux informatiques', 'L\'administrateur réseau installe, configure et assure la maintenance des réseaux informatiques d\'une organisation. Il garantit la disponibilité, la sécurité et la performance des systèmes connectés.', 'Configuration réseau, TCP/IP, cybersécurité, systèmes Linux et Windows, maintenance informatique, résolution de problèmes, surveillance réseau', 'Télécommunications et Réseaux', 'Bac+3', 300000.00, 1400000.00, 'IRC', 'Forte croissance');

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
(360, 19, 117);

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
(19, 1, 1, '2026-07-30 13:13:23', 0, 3, 7, 4, 3, 3, 'AS');

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
(8, 'Ndeye Awa NIANE', 'niane@gmail.com', '$2y$10$OyN4FQz3UggXR3FiBJ3Yv.b.HkinTkuS7.uM07CcrFrZiyrNLHyym', 'Sénégal', 'Licence 2', '2026-07-30 17:28:18');

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
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `metier`
--
ALTER TABLE `metier`
  MODIFY `id_metier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id_reponse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT pour la table `test_riasec`
--
ALTER TABLE `test_riasec`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
