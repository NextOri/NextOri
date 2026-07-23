-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 23 juil. 2026 à 15:00
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
  `domaine` varchar(100) NOT NULL,
  `duree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id_filiere`, `nom`, `description`, `domaine`, `duree`) VALUES
(1, 'Informatique', 'Étude des systèmes informatiques, développement et réseaux', 'Sciences & Technologies', '3 ans'),
(2, 'Génie Civil', 'Construction et infrastructures', 'Ingénierie', '3 ans'),
(3, 'Médecine', 'Études médicales et santé humaine', 'Santé', '6 à 8 ans'),
(4, 'Droit', 'Étude des lois et du système juridique', 'Sciences Juridiques', '4 ans'),
(5, 'Gestion', 'Management et administration des entreprises', 'Économie & Gestion', '3 ans'),
(6, 'Finance', 'Analyse financière et comptabilité', 'Économie & Gestion', '3 ans'),
(7, 'Marketing', 'Stratégies commerciales et communication', 'Commerce', '3 ans'),
(8, 'Électronique', 'Systèmes électroniques et embarqués', 'Technologie', '3 ans');

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

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE `metier` (
  `id_metier` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `secteur` varchar(100) NOT NULL,
  `niveau_etude` varchar(100) NOT NULL,
  `salaire_min` decimal(12,2) DEFAULT NULL,
  `salaire_max` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id_metier`, `nom`, `description`, `secteur`, `niveau_etude`, `salaire_min`, `salaire_max`) VALUES
(1, 'Développeur Web', 'Création de sites et applications web', 'Informatique', 'Licence / Master', 300000.00, 1500000.00),
(2, 'Data Scientist', 'Analyse de données et intelligence artificielle', 'Informatique', 'Master', 500000.00, 2000000.00),
(3, 'Ingénieur Génie Civil', 'Construction de bâtiments et infrastructures', 'BTP', 'Master', 400000.00, 1800000.00),
(4, 'Médecin', 'Diagnostic et traitement des patients', 'Santé', 'Doctorat', 600000.00, 3000000.00),
(5, 'Avocat', 'Défense juridique et conseils', 'Droit', 'Master', 300000.00, 2000000.00),
(6, 'Comptable', 'Gestion des finances et comptabilité', 'Finance', 'Licence', 250000.00, 1200000.00),
(7, 'Marketeur', 'Stratégies marketing et communication', 'Commerce', 'Licence / Master', 250000.00, 1500000.00),
(8, 'Administrateur Réseau', 'Gestion des réseaux informatiques', 'Informatique', 'Licence / Master', 300000.00, 1400000.00);

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

-- --------------------------------------------------------

--
-- Structure de la table `test_riasec`
--

CREATE TABLE `test_riasec` (
  `id_test` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_test` datetime NOT NULL DEFAULT current_timestamp(),
  `score_R` int(11) NOT NULL DEFAULT 0,
  `score_I` int(11) NOT NULL DEFAULT 0,
  `score_A` int(11) NOT NULL DEFAULT 0,
  `score_S` int(11) NOT NULL DEFAULT 0,
  `score_E` int(11) NOT NULL DEFAULT 0,
  `score_C` int(11) NOT NULL DEFAULT 0,
  `profil_dominant` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `site_web` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `universite`
--

INSERT INTO `universite` (`id_universite`, `nom`, `description`, `type`, `pays`, `ville`, `site_web`) VALUES
(1, 'UCAD', 'Université Cheikh Anta Diop de Dakar, la plus grande université du Sénégal', 'publique', 'Sénégal', 'Dakar', 'https://www.ucad.sn'),
(2, 'UGB', 'Université Gaston Berger de Saint-Louis', 'publique', 'Sénégal', 'Saint-Louis', 'https://www.ugb.sn'),
(3, 'UIDT', 'Université Iba Der Thiam de Thiès', 'publique', 'Sénégal', 'Thiès', 'https://www.uidt.sn'),
(4, 'ESP', 'École Supérieure Polytechnique de Dakar', 'publique', 'Sénégal', 'Dakar', 'https://www.esp.sn'),
(5, 'SUPDECO', 'Institut privé spécialisé en management et commerce', 'privee', 'Sénégal', 'Dakar', 'https://www.supdeco.sn');

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
  ADD KEY `fk_test_user` (`id_user`);

--
-- Index pour la table `universite`
--
ALTER TABLE `universite`
  ADD PRIMARY KEY (`id_universite`),
  ADD UNIQUE KEY `nom` (`nom`);

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
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_reponse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_riasec`
--
ALTER TABLE `test_riasec`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `universite`
--
ALTER TABLE `universite`
  MODIFY `id_universite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_test_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

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
