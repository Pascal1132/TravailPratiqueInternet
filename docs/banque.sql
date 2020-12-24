-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 23 déc. 2020 à 20:21
-- Version du serveur :  10.3.24-MariaDB-2
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `banque`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptes`
--

CREATE TABLE `comptes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_compte_id` int(10) UNSIGNED NOT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comptes`
--

INSERT INTO `comptes` (`id`, `type_compte_id`, `utilisateur_id`, `nom`, `created_at`, `updated_at`) VALUES
(23, 1, 5, 'Hellow', '2020-11-24 00:25:05', '2020-12-23 19:57:36'),
(29, 4, 5, 'NomCompte', '2020-12-22 19:27:04', '2020-12-22 19:32:35'),
(30, 1, 5, 'test', '2020-12-23 20:01:22', '2020-12-24 06:20:20');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `fichier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `name`, `language`, `created_at`, `updated_at`) VALUES
(1, NULL, 'fr', '2020-10-17 21:50:14', '2020-10-17 21:50:14'),
(2, NULL, 'en', NULL, NULL),
(3, NULL, 'es', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_08_29_200844_create_languages_table', 1),
(2, '2018_08_29_205156_create_translations_table', 1),
(3, '2020_09_04_182446_create_ref__types__compte_table', 1),
(4, '2020_09_04_182555_create_ref__types__transaction_table', 1),
(5, '2020_09_04_182555_create_ref_roles_utilisateur_table', 1),
(6, '2020_09_04_183205_create_utilisateurs_table', 1),
(7, '2020_09_04_183216_create_comptes_table', 1),
(8, '2020_09_04_183237_create_transactions_table', 1),
(9, '2020_09_04_183238_create_images_table', 1),
(10, '2020_09_04_183310_create_password_resets_table', 1),
(11, '2020_09_29_181103_create_roles_assignations_table', 1),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(20, '2016_06_01_000004_create_oauth_clients_table', 2),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ref_roles_utilisateur`
--

CREATE TABLE `ref_roles_utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_roles_utilisateur`
--

INSERT INTO `ref_roles_utilisateur` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'customer', NULL, NULL),
(2, 'cashier', NULL, NULL),
(3, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ref_types_compte`
--

CREATE TABLE `ref_types_compte` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_types_compte`
--

INSERT INTO `ref_types_compte` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'check', NULL, NULL),
(2, 'saving', NULL, NULL),
(3, 'tfsa', NULL, NULL),
(4, 'rrsp', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ref_types_transaction`
--

CREATE TABLE `ref_types_transaction` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estMontantNegatif` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_types_transaction`
--

INSERT INTO `ref_types_transaction` (`id`, `type`, `estMontantNegatif`, `created_at`, `updated_at`) VALUES
(1, 'deposit', 0, NULL, NULL),
(2, 'check_deposit', 0, NULL, NULL),
(3, 'withdrawal', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `roles_assignations`
--

CREATE TABLE `roles_assignations` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_role_utilisateur_id` int(10) UNSIGNED NOT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles_assignations`
--

INSERT INTO `roles_assignations` (`id`, `ref_role_utilisateur_id`, `utilisateur_id`, `created_at`, `updated_at`) VALUES
(6, 3, 5, NULL, NULL),
(7, 3, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `compte_id` int(10) UNSIGNED NOT NULL,
  `type_transaction_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `compte_id`, `type_transaction_id`, `description`, `montant`, `created_at`, `updated_at`) VALUES
(25, 23, 1, 'Virement entre comptes', 50, '2020-11-26 20:42:03', '2020-11-26 20:42:03'),
(27, 23, 1, 'Effectué par la banque', 123, '2020-12-09 04:38:13', '2020-12-09 04:38:13'),
(28, 23, 1, 'Effectué par la banque', 111, '2020-12-09 04:45:37', '2020-12-09 04:45:37');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `language_id`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'types_transaction', 'deposit', 'Dépôt', NULL, NULL),
(2, 2, 'types_transaction', 'deposit', 'Deposit', NULL, NULL),
(3, 3, 'types_transaction', 'deposit', 'Depositar', NULL, NULL),
(4, 1, 'types_transaction', 'check_deposit', 'Dépôt par chèque', NULL, '2020-10-17 22:29:07'),
(5, 2, 'types_transaction', 'check_deposit', 'Check deposit', NULL, NULL),
(6, 3, 'types_transaction', 'check_deposit', 'Cheque deposito', NULL, NULL),
(7, 1, 'types_transaction', 'withdrawal', 'Retrait', NULL, NULL),
(8, 2, 'types_transaction', 'withdrawal', 'Withdrawal', NULL, NULL),
(9, 3, 'types_transaction', 'withdrawal', 'Retirada', NULL, NULL),
(10, 1, 'types_compte', 'check', 'Chèque', NULL, NULL),
(11, 2, 'types_compte', 'check', 'Check', NULL, NULL),
(12, 3, 'types_compte', 'check', 'Cheque', NULL, NULL),
(13, 1, 'types_compte', 'saving', 'Épargne', NULL, NULL),
(14, 2, 'types_compte', 'saving', 'Saving', NULL, NULL),
(15, 3, 'types_compte', 'saving', 'Ahorros', NULL, NULL),
(16, 1, 'types_compte', 'tfsa', 'CELI', NULL, NULL),
(17, 2, 'types_compte', 'tfsa', 'TFSA', NULL, NULL),
(18, 3, 'types_compte', 'tfsa', 'Ahorros Libre de Impuestos', NULL, NULL),
(19, 1, 'types_compte', 'rrsp', 'RÉER', NULL, NULL),
(20, 2, 'types_compte', 'rrsp', 'RRSP', NULL, NULL),
(21, 3, 'types_compte', 'rrsp', 'Ahorros para la jubilación', NULL, NULL),
(22, 1, 'types_role', 'cashier', 'Caissier', NULL, NULL),
(23, 2, 'types_role', 'cashier', 'Cashier', NULL, NULL),
(24, 3, 'types_role', 'cashier', 'Cajero', NULL, NULL),
(25, 1, 'types_role', 'customer', 'Client', NULL, NULL),
(26, 2, 'types_role', 'customer', 'Customer', NULL, NULL),
(27, 3, 'types_role', 'customer', 'Cliente', NULL, NULL),
(28, 1, 'types_role', 'admin', 'Admin', NULL, NULL),
(29, 2, 'types_role', 'admin', 'Admin', NULL, NULL),
(30, 3, 'types_role', 'admin', 'Administración', NULL, NULL),
(31, 1, 'email', 'confirm', 'Confirmer', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(32, 1, 'email', 'email_already_confirmed', 'Courriel déjà confirmé!', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(33, 1, 'email', 'email_confirmed', 'Le courriel à bien été confirmé !', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(34, 1, 'email', 'invalid_token', 'Jeton invalide', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(35, 1, 'email', 'msg_confirm', 'Voilà, vous avez créé votre compte utilisateur.\n     Vous devez maintenant confirmer votre courriel en cliquant sur le bouton ci-dessous', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(36, 1, 'email', 'sincerly', 'Cordialement', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(37, 1, 'auth', 'failed', 'Ces informations d\'identification ne correspondent pas.', '2020-10-17 21:50:28', '2020-10-17 21:50:28'),
(38, 1, 'auth', 'throttle', 'Trop de tentatives de connexion. Veuillez réessayer dans  :seconds seconds.', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(39, 1, 'passwords', 'password', 'Les mots de passe doivent comporter au moins six caractères et correspondre à la confirmation.', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(40, 1, 'passwords', 'reset', 'Votre mot de passe a été réinitialisé!', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(41, 1, 'passwords', 'sent', 'Nous avons envoyé votre lien de réinitialisation de mot de passe par courriel!', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(42, 1, 'passwords', 'token', 'Ce jeton de réinitialisation de mot de passe n\'est pas valide.', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(43, 1, 'passwords', 'user', 'Nous ne pouvons pas trouver un utilisateur avec cette adresse courriel.', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(44, 1, 'app', 'about', 'À propos', '2020-10-17 21:50:29', '2020-10-19 05:17:42'),
(45, 1, 'app', 'account_name', 'Nom du compte', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(46, 1, 'app', 'account_transfer', 'Virement entre comptes', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(47, 1, 'app', 'accounts_list', 'Liste de vos comptes', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(48, 1, 'app', 'amount', 'Montant', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(49, 1, 'app', 'app_name', 'Banque', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(50, 1, 'app', 'back', 'Retour', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(51, 1, 'app', 'bad_id', 'L\'identifiant passé en paramètre n\'est associé à aucun enregistrement dans la base de données', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(52, 1, 'app', 'card_no', 'Numéro de carte', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(53, 1, 'app', 'check', 'Chèque', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(54, 1, 'app', 'check_deposit', 'Dépot par chèque', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(55, 1, 'app', 'choose_file', 'Choisir un fichier', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(56, 1, 'app', 'create_new_account', 'Créer un nouveau compte', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(57, 1, 'app', 'delete_success', 'La suppression a bien été effectuée', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(58, 1, 'app', 'destination_account', 'Compte de destination', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(59, 1, 'app', 'edit', 'Modifier', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(60, 1, 'app', 'edit_user', 'Modifier l\'utilisateur', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(61, 1, 'app', 'email', 'Courriel', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(62, 1, 'app', 'email_confirmation', 'Confirmation du courriel', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(63, 1, 'app', 'erase', 'Effacer', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(64, 1, 'app', 'home', 'Accueil', '2020-10-17 21:50:29', '2020-10-17 21:50:29'),
(65, 1, 'app', 'home_welcome_message', 'Voici ce que nous avons réservé pour vous aujourd\'hui...', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(66, 1, 'app', 'leave_empty', 'Laisser vide pour conserver', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(67, 1, 'app', 'login', 'Connexion', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(68, 1, 'app', 'logout', 'Se déconnecter', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(69, 1, 'app', 'logout_message', 'Vous avez été déconnecté !', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(70, 1, 'app', 'modify_account', 'Modifier le compte', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(71, 1, 'app', 'modify_transactions', 'Modifier la transaction', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(72, 1, 'app', 'name', 'Nom', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(73, 1, 'app', 'new_account', 'Nouveau compte', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(74, 1, 'app', 'new_operation', 'Nouvelle opération', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(75, 1, 'app', 'nextLanguage', 'English', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(76, 1, 'app', 'no_account', 'Vous n\'avez aucun compte...', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(77, 1, 'app', 'no_account_destination', 'Vous n\'avez aucun compte disponible pour le virement', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(78, 1, 'app', 'no_transaction', 'Il n\'y a pas de transaction', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(79, 1, 'app', 'not_logged', 'Non connecté', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(80, 1, 'app', 'operation_type', 'Type d\'opération', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(81, 1, 'app', 'overview_accounts', 'Aperçu de vos comptes', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(82, 1, 'app', 'password', 'Mot de passe', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(83, 1, 'app', 'role', 'Rôle', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(84, 1, 'app', 'roles', '', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(85, 1, 'app', 'signin', 'Inscription', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(86, 1, 'app', 'submit', 'Envoyer', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(87, 1, 'app', 'transactions', 'Transactions', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(88, 1, 'app', 'type', 'Type', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(89, 1, 'app', 'unauthorized', 'Non permis', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(90, 1, 'app', 'update', 'Mettre à jour', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(91, 1, 'app', 'updated', 'Mise à jour effectuée', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(92, 1, 'app', 'upload', 'Téléverser', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(93, 1, 'app', 'users', 'Utilisateurs', '2020-10-17 21:50:30', '2020-10-17 21:50:30'),
(94, 1, 'app', 'users_list', 'Liste des utilisateurs', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(95, 1, 'app', 'welcome', 'Bienvenue', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(96, 1, 'app', 'your_accounts', 'Vos comptes', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(97, 1, 'validation', 'accepted', 'Le champ :attribute doit être accepté.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(98, 1, 'validation', 'active_url', 'Le champ :attribute n\'est pas une URL valide.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(99, 1, 'validation', 'after', 'Le champ :attribute doit être une date postérieure au :date.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(100, 1, 'validation', 'after_or_equal', 'Le champ :attribute doit être une date postérieure ou égale au :date.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(101, 1, 'validation', 'alpha', 'Le champ :attribute doit contenir uniquement des lettres.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(102, 1, 'validation', 'alpha_dash', 'Le champ :attribute doit contenir uniquement des lettres, des chiffres et des tirets.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(103, 1, 'validation', 'alpha_num', 'Le champ :attribute doit contenir uniquement des chiffres et des lettres.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(104, 1, 'validation', 'array', 'Le champ :attribute doit être un tableau.', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(105, 1, 'validation', 'attributes.address', 'adresse', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(106, 1, 'validation', 'attributes.age', 'âge', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(107, 1, 'validation', 'attributes.available', 'disponible', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(108, 1, 'validation', 'attributes.city', 'ville', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(109, 1, 'validation', 'attributes.content', 'contenu', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(110, 1, 'validation', 'attributes.country', 'pays', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(111, 1, 'validation', 'attributes.courriel', '', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(112, 1, 'validation', 'attributes.date', 'date', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(113, 1, 'validation', 'attributes.day', 'jour', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(114, 1, 'validation', 'attributes.description', 'description', '2020-10-17 21:50:31', '2020-10-17 21:50:31'),
(115, 1, 'validation', 'attributes.email', 'adresse email', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(116, 1, 'validation', 'attributes.excerpt', 'extrait', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(117, 1, 'validation', 'attributes.first_name', 'prénom', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(118, 1, 'validation', 'attributes.gender', 'genre', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(119, 1, 'validation', 'attributes.hour', 'heure', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(120, 1, 'validation', 'attributes.last_name', 'nom', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(121, 1, 'validation', 'attributes.minute', 'minute', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(122, 1, 'validation', 'attributes.mobile', 'portable', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(123, 1, 'validation', 'attributes.montant', '', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(124, 1, 'validation', 'attributes.month', 'mois', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(125, 1, 'validation', 'attributes.mot_de_passe', '', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(126, 1, 'validation', 'attributes.name', 'nom', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(127, 1, 'validation', 'attributes.no_carte', '', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(128, 1, 'validation', 'attributes.nom', '', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(129, 1, 'validation', 'attributes.password', 'mot de passe', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(130, 1, 'validation', 'attributes.password_confirmation', 'confirmation du mot de passe', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(131, 1, 'validation', 'attributes.phone', 'téléphone', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(132, 1, 'validation', 'attributes.second', 'seconde', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(133, 1, 'validation', 'attributes.sex', 'sexe', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(134, 1, 'validation', 'attributes.size', 'taille', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(135, 1, 'validation', 'attributes.time', 'heure', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(136, 1, 'validation', 'attributes.title', 'titre', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(137, 1, 'validation', 'attributes.username', 'nom d\'utilisateur', '2020-10-17 21:50:32', '2020-10-17 21:50:32'),
(138, 1, 'validation', 'attributes.year', 'année', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(139, 1, 'validation', 'before', 'Le champ :attribute doit être une date antérieure au :date.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(140, 1, 'validation', 'before_or_equal', 'Le champ :attribute doit être une date antérieure ou égale au :date.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(141, 1, 'validation', 'between.array', 'Le tableau :attribute doit contenir entre :min et :max éléments.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(142, 1, 'validation', 'between.file', 'La taille du fichier de :attribute doit être comprise entre :min et :max kilo-octets.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(143, 1, 'validation', 'between.numeric', 'La valeur de :attribute doit être comprise entre :min et :max.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(144, 1, 'validation', 'between.string', 'Le texte :attribute doit contenir entre :min et :max caractères.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(145, 1, 'validation', 'boolean', 'Le champ :attribute doit être vrai ou faux.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(146, 1, 'validation', 'confirmed', 'Le champ de confirmation :attribute ne correspond pas.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(147, 1, 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(148, 1, 'validation', 'date', 'Le champ :attribute n\'est pas une date valide.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(149, 1, 'validation', 'date_equals', 'Le champ :attribute doit être une date égale à :date.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(150, 1, 'validation', 'date_format', 'Le champ :attribute ne correspond pas au format :format.', '2020-10-17 21:50:33', '2020-10-17 21:50:33'),
(151, 1, 'validation', 'different', 'Les champs :attribute et :other doivent être différents.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(152, 1, 'validation', 'digits', 'Le champ :attribute doit contenir :digits chiffres.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(153, 1, 'validation', 'digits_between', 'Le champ :attribute doit contenir entre :min et :max chiffres.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(154, 1, 'validation', 'dimensions', 'La taille de l\'image :attribute n\'est pas conforme.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(155, 1, 'validation', 'distinct', 'Le champ :attribute a une valeur en double.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(156, 1, 'validation', 'email', 'Le champ :attribute doit être une adresse email valide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(157, 1, 'validation', 'ends_with', 'Le champ :attribute doit se terminer par une des valeurs suivantes : :values', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(158, 1, 'validation', 'exists', 'Le champ :attribute sélectionné est invalide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(159, 1, 'validation', 'file', 'Le champ :attribute doit être un fichier.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(160, 1, 'validation', 'filled', 'Le champ :attribute doit avoir une valeur.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(161, 1, 'validation', 'gt.array', 'Le tableau :attribute doit contenir plus de :value éléments.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(162, 1, 'validation', 'gt.file', 'La taille du fichier de :attribute doit être supérieure à :value kilo-octets.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(163, 1, 'validation', 'gt.numeric', 'La valeur de :attribute doit être supérieure à :value.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(164, 1, 'validation', 'gt.string', 'Le texte :attribute doit contenir plus de :value caractères.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(165, 1, 'validation', 'gte.array', 'Le tableau :attribute doit contenir au moins :value éléments.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(166, 1, 'validation', 'gte.file', 'La taille du fichier de :attribute doit être supérieure ou égale à :value kilo-octets.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(167, 1, 'validation', 'gte.numeric', 'La valeur de :attribute doit être supérieure ou égale à :value.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(168, 1, 'validation', 'gte.string', 'Le texte :attribute doit contenir au moins :value caractères.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(169, 1, 'validation', 'image', 'Le champ :attribute doit être une image.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(170, 1, 'validation', 'in', 'Le champ :attribute est invalide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(171, 1, 'validation', 'in_array', 'Le champ :attribute n\'existe pas dans :other.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(172, 1, 'validation', 'integer', 'Le champ :attribute doit être un entier.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(173, 1, 'validation', 'ip', 'Le champ :attribute doit être une adresse IP valide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(174, 1, 'validation', 'ipv4', 'Le champ :attribute doit être une adresse IPv4 valide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(175, 1, 'validation', 'ipv6', 'Le champ :attribute doit être une adresse IPv6 valide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(176, 1, 'validation', 'json', 'Le champ :attribute doit être un document JSON valide.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(177, 1, 'validation', 'lt.array', 'Le tableau :attribute doit contenir moins de :value éléments.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(178, 1, 'validation', 'lt.file', 'La taille du fichier de :attribute doit être inférieure à :value kilo-octets.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(179, 1, 'validation', 'lt.numeric', 'La valeur de :attribute doit être inférieure à :value.', '2020-10-17 21:50:34', '2020-10-17 21:50:34'),
(180, 1, 'validation', 'lt.string', 'Le texte :attribute doit contenir moins de :value caractères.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(181, 1, 'validation', 'lte.array', 'Le tableau :attribute doit contenir au plus :value éléments.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(182, 1, 'validation', 'lte.file', 'La taille du fichier de :attribute doit être inférieure ou égale à :value kilo-octets.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(183, 1, 'validation', 'lte.numeric', 'La valeur de :attribute doit être inférieure ou égale à :value.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(184, 1, 'validation', 'lte.string', 'Le texte :attribute doit contenir au plus :value caractères.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(185, 1, 'validation', 'max.array', 'Le tableau :attribute ne peut contenir plus de :max éléments.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(186, 1, 'validation', 'max.file', 'La taille du fichier de :attribute ne peut pas dépasser :max kilo-octets.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(187, 1, 'validation', 'max.numeric', 'La valeur de :attribute ne peut être supérieure à :max.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(188, 1, 'validation', 'max.string', 'Le texte de :attribute ne peut contenir plus de :max caractères.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(189, 1, 'validation', 'mimes', 'Le champ :attribute doit être un fichier de type : :values.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(190, 1, 'validation', 'mimetypes', 'Le champ :attribute doit être un fichier de type : :values.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(191, 1, 'validation', 'min.array', 'Le tableau :attribute doit contenir au moins :min éléments.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(192, 1, 'validation', 'min.file', 'La taille du fichier de :attribute doit être supérieure à :min kilo-octets.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(193, 1, 'validation', 'min.numeric', 'La valeur de :attribute doit être supérieure ou égale à :min.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(194, 1, 'validation', 'min.string', 'Le texte :attribute doit contenir au moins :min caractères.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(195, 1, 'validation', 'not_in', 'Le champ :attribute sélectionné n\'est pas valide.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(196, 1, 'validation', 'not_regex', 'Le format du champ :attribute n\'est pas valide.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(197, 1, 'validation', 'numeric', 'Le champ :attribute doit contenir un nombre.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(198, 1, 'validation', 'password', 'Le mot de passe est incorrect', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(199, 1, 'validation', 'present', 'Le champ :attribute doit être présent.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(200, 1, 'validation', 'regex', 'Le format du champ :attribute est invalide.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(201, 1, 'validation', 'required', 'Le champ :attribute est obligatoire.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(202, 1, 'validation', 'required_if', 'Le champ :attribute est obligatoire quand la valeur de :other est :value.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(203, 1, 'validation', 'required_unless', 'Le champ :attribute est obligatoire sauf si :other est :values.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(204, 1, 'validation', 'required_with', 'Le champ :attribute est obligatoire quand :values est présent.', '2020-10-17 21:50:35', '2020-10-17 21:50:35'),
(205, 1, 'validation', 'required_with_all', 'Le champ :attribute est obligatoire quand :values sont présents.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(206, 1, 'validation', 'required_without', 'Le champ :attribute est obligatoire quand :values n\'est pas présent.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(207, 1, 'validation', 'required_without_all', 'Le champ :attribute est requis quand aucun de :values n\'est présent.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(208, 1, 'validation', 'same', 'Les champs :attribute et :other doivent être identiques.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(209, 1, 'validation', 'size.array', 'Le tableau :attribute doit contenir :size éléments.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(210, 1, 'validation', 'size.file', 'La taille du fichier de :attribute doit être de :size kilo-octets.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(211, 1, 'validation', 'size.numeric', 'La valeur de :attribute doit être :size.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(212, 1, 'validation', 'size.string', 'Le texte de :attribute doit contenir :size caractères.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(213, 1, 'validation', 'starts_with', 'Le champ :attribute doit commencer avec une des valeurs suivantes : :values', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(214, 1, 'validation', 'string', 'Le champ :attribute doit être une chaîne de caractères.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(215, 1, 'validation', 'timezone', 'Le champ :attribute doit être un fuseau horaire valide.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(216, 1, 'validation', 'unique', 'La valeur du champ :attribute est déjà utilisée.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(217, 1, 'validation', 'uploaded', 'Le fichier du champ :attribute n\'a pu être téléversé.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(218, 1, 'validation', 'url', 'Le format de l\'URL de :attribute n\'est pas valide.', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(219, 1, 'validation', 'uuid', 'Le champ :attribute doit être un UUID valide', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(220, 1, 'pagination', 'next', 'Suivant &raquo;', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(221, 1, 'pagination', 'previous', '&laquo; Précédent', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(222, 1, 'translation::translation', 'add', '+ Ajouter', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(223, 1, 'translation::translation', 'add_language', 'Ajouter une nouvelle langue', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(224, 1, 'translation::translation', 'add_translation', 'Ajouter une traduction', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(225, 1, 'translation::translation', 'advanced_options', 'Afficher les options avancées', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(226, 1, 'translation::translation', 'file', 'Fichier', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(227, 1, 'translation::translation', 'group', 'Groupe', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(228, 1, 'translation::translation', 'group_label', 'Groupe (Optionnel)', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(229, 1, 'translation::translation', 'group_placeholder', 'Ex: validation', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(230, 1, 'translation::translation', 'group_single', 'Groupe / Unique', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(231, 1, 'translation::translation', 'invalid_driver', 'Driver invalide', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(232, 1, 'translation::translation', 'invalid_language', 'Langue invalide', '2020-10-17 21:50:36', '2020-10-17 21:50:36'),
(233, 1, 'translation::translation', 'key', 'Clé', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(234, 1, 'translation::translation', 'key_label', 'Clé', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(235, 1, 'translation::translation', 'key_placeholder', 'Par exemple : invalid_key', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(236, 1, 'translation::translation', 'keys_synced', 'Clés manquantes synchronisées avec succès 🎊', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(237, 1, 'translation::translation', 'language', 'Langue', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(238, 1, 'translation::translation', 'language_added', 'Nouvelle langue ajoutée avec succés 🙌', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(239, 1, 'translation::translation', 'language_exists', 'Le :attribute existe déjà.', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(240, 1, 'translation::translation', 'language_key_added', 'Nouvelle clé dans la langue ajoutée avec succès 👏', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(241, 1, 'translation::translation', 'language_name', 'Nom', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(242, 1, 'translation::translation', 'languages', 'Langues', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(243, 1, 'translation::translation', 'locale', 'Locale', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(244, 1, 'translation::translation', 'namespace', 'Namespace', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(245, 1, 'translation::translation', 'namespace_label', 'Namespace (Optionnel)', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(246, 1, 'translation::translation', 'namespace_placeholder', 'Par exemple : my_package', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(247, 1, 'translation::translation', 'no_missing_keys', 'Il ne manque aucune clé de traduction dans l\'application 🎉', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(248, 1, 'translation::translation', 'prompt_file', 'Dans quel fichier sera t\'elle stockée ?', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(249, 1, 'translation::translation', 'prompt_from_driver', 'De quel driver voudriez-vous prendre les traductions ?', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(250, 1, 'translation::translation', 'prompt_key', 'Quelle est la clé de cette traduction ?', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(251, 1, 'translation::translation', 'prompt_language', 'Entrez le code langue que vous aimeriez ajouter (Ex: fr)', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(252, 1, 'translation::translation', 'prompt_language_for_key', 'Entrez la langue pour la clé (Ex: fr)', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(253, 1, 'translation::translation', 'prompt_language_if_any', 'Quelle langue ? (Laissez vide pour tous)', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(254, 1, 'translation::translation', 'prompt_to_driver', 'À quel driver désirez-vous ajouter les traductions ?', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(255, 1, 'translation::translation', 'prompt_type', 'Est-ce une clé Json ou Array ?', '2020-10-17 21:50:37', '2020-10-17 21:50:37'),
(256, 1, 'translation::translation', 'prompt_value', 'Quelle est la valeur de la traduction', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(257, 1, 'translation::translation', 'save', 'Sauvegarder', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(258, 1, 'translation::translation', 'search', 'Rechercher toutes les traductions', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(259, 1, 'translation::translation', 'single', 'Unique', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(260, 1, 'translation::translation', 'synced', 'Les traductions sont synchronisées 😎', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(261, 1, 'translation::translation', 'syncing', 'Synchronisation des traductions ⏳', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(262, 1, 'translation::translation', 'translation_added', 'Nouvelle traduction ajoutée avec succès 🙌', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(263, 1, 'translation::translation', 'translations', 'Traduction', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(264, 1, 'translation::translation', 'type', 'Type', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(265, 1, 'translation::translation', 'type_error', 'Le type de traduction doit être en json ou en array', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(266, 1, 'translation::translation', 'uh_oh', 'Quelque chose ne fonctionne pas', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(267, 1, 'translation::translation', 'value', 'Valeur', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(268, 1, 'translation::translation', 'value_label', 'Valeur', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(269, 1, 'translation::translation', 'value_placeholder', 'Par exemple : Les clés doivent être une seule chaîne', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(270, 1, 'translation::errors', 'key_exists', 'La clé de traduction { :key } existe déjà', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(271, 1, 'translation::errors', 'language_exists', 'La langue { :language } existe déjà', '2020-10-17 21:50:38', '2020-10-17 21:50:38'),
(272, 2, 'email', 'confirm', 'Confirm', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(273, 2, 'email', 'email_already_confirmed', 'Email already confirmed!', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(274, 2, 'email', 'email_confirmed', 'The email has been confirmed!', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(275, 2, 'email', 'invalid_token', 'Invalid token', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(276, 2, 'email', 'msg_confirm', 'Voila, you have created your user account. \n    You must now confirm your email by clicking on the button below.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(277, 2, 'email', 'sincerly', 'Sincerly', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(278, 2, 'auth', 'failed', 'These credentials do not match our records.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(279, 2, 'auth', 'throttle', 'Too many attempts. Retry in :seconds seconds.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(280, 2, 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(281, 2, 'passwords', 'reset', 'Your password has been reset!', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(282, 2, 'passwords', 'sent', 'We have e-mailed your password reset link!', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(283, 2, 'passwords', 'token', 'This password reset token is invalid.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(284, 2, 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(285, 2, 'app', 'about', 'About', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(286, 2, 'app', 'account_name', 'Account name', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(287, 2, 'app', 'account_transfer', 'Transfer between accounts', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(288, 2, 'app', 'accounts_list', 'List of your accounts', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(289, 2, 'app', 'amount', 'Amount', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(290, 2, 'app', 'app_name', 'Bank', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(291, 2, 'app', 'back', 'Back', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(292, 2, 'app', 'bad_id', 'The identifier passed as a parameter is not associated with any record in the database', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(293, 2, 'app', 'card_no', 'Card number', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(294, 2, 'app', 'check', 'Check', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(295, 2, 'app', 'check_deposit', 'Deposit by check', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(296, 2, 'app', 'choose_file', 'Choose a file', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(297, 2, 'app', 'create_new_account', 'Create new account', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(298, 2, 'app', 'delete_success', 'The deletion was successful', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(299, 2, 'app', 'destination_account', 'Destination account', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(300, 2, 'app', 'edit', 'Edit', '2020-10-17 21:50:43', '2020-10-17 21:50:43'),
(301, 2, 'app', 'edit_user', 'Edit user', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(302, 2, 'app', 'email', 'Email', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(303, 2, 'app', 'email_confirmation', 'Email confirmation', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(304, 2, 'app', 'erase', 'Erase', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(305, 2, 'app', 'home', 'Home', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(306, 2, 'app', 'home_welcome_message', 'Here\'s what we have for you today ...', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(307, 2, 'app', 'leave_empty', 'Leave blank to keep the password', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(308, 2, 'app', 'login', 'Log in', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(309, 2, 'app', 'logout', 'Logout', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(310, 2, 'app', 'logout_message', 'You\'ve been disconnected !', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(311, 2, 'app', 'modify_account', 'Modify account', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(312, 2, 'app', 'modify_transactions', 'Transaction modification', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(313, 2, 'app', 'name', 'Name', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(314, 2, 'app', 'new_account', 'New account', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(315, 2, 'app', 'new_operation', 'New operation', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(316, 2, 'app', 'nextLanguage', 'Español', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(317, 2, 'app', 'no_account', 'You have no account...', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(318, 2, 'app', 'no_account_destination', 'You have no account available for the transfer', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(319, 2, 'app', 'no_transaction', 'There is no transaction', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(320, 2, 'app', 'not_logged', 'Not logged', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(321, 2, 'app', 'operation_type', 'Operation type', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(322, 2, 'app', 'overview_accounts', 'Overview of your accounts', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(323, 2, 'app', 'password', 'Password', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(324, 2, 'app', 'role', 'Role', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(325, 2, 'app', 'roles', 'Roles', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(326, 2, 'app', 'signin', 'Sign in', '2020-10-17 21:50:44', '2020-10-17 21:50:44'),
(327, 2, 'app', 'submit', 'Submit', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(328, 2, 'app', 'transactions', 'Transactions', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(329, 2, 'app', 'type', 'Type', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(330, 2, 'app', 'unauthorized', 'Unauthorized', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(331, 2, 'app', 'update', 'Update', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(332, 2, 'app', 'updated', 'Updated', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(333, 2, 'app', 'upload', 'Upload', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(334, 2, 'app', 'users', 'Users', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(335, 2, 'app', 'users_list', 'Users list', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(336, 2, 'app', 'welcome', 'Welcome', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(337, 2, 'app', 'your_accounts', 'Your accounts', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(338, 2, 'validation', 'accepted', 'The :attribute must be accepted.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(339, 2, 'validation', 'active_url', 'The :attribute is not a valid URL.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(340, 2, 'validation', 'after', 'The :attribute must be a date after :date.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(341, 2, 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(342, 2, 'validation', 'alpha', 'The :attribute may only contain letters.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(343, 2, 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(344, 2, 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(345, 2, 'validation', 'array', 'The :attribute must be an array.', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(346, 2, 'validation', 'attributes.address', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(347, 2, 'validation', 'attributes.age', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(348, 2, 'validation', 'attributes.available', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(349, 2, 'validation', 'attributes.city', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(350, 2, 'validation', 'attributes.content', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(351, 2, 'validation', 'attributes.country', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(352, 2, 'validation', 'attributes.courriel', 'email', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(353, 2, 'validation', 'attributes.date', '', '2020-10-17 21:50:45', '2020-10-17 21:50:45'),
(354, 2, 'validation', 'attributes.day', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(355, 2, 'validation', 'attributes.description', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(356, 2, 'validation', 'attributes.email', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(357, 2, 'validation', 'attributes.excerpt', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(358, 2, 'validation', 'attributes.first_name', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(359, 2, 'validation', 'attributes.gender', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(360, 2, 'validation', 'attributes.hour', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(361, 2, 'validation', 'attributes.last_name', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(362, 2, 'validation', 'attributes.minute', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(363, 2, 'validation', 'attributes.mobile', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(364, 2, 'validation', 'attributes.montant', 'amount', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(365, 2, 'validation', 'attributes.month', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(366, 2, 'validation', 'attributes.mot_de_passe', 'password', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(367, 2, 'validation', 'attributes.name', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(368, 2, 'validation', 'attributes.no_carte', 'card number', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(369, 2, 'validation', 'attributes.nom', 'name', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(370, 2, 'validation', 'attributes.password', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(371, 2, 'validation', 'attributes.password_confirmation', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(372, 2, 'validation', 'attributes.phone', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(373, 2, 'validation', 'attributes.second', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(374, 2, 'validation', 'attributes.sex', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(375, 2, 'validation', 'attributes.size', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(376, 2, 'validation', 'attributes.time', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(377, 2, 'validation', 'attributes.title', '', '2020-10-17 21:50:46', '2020-10-17 21:50:46'),
(378, 2, 'validation', 'attributes.username', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(379, 2, 'validation', 'attributes.year', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(380, 2, 'validation', 'before', 'The :attribute must be a date before :date.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(381, 2, 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(382, 2, 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(383, 2, 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(384, 2, 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(385, 2, 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(386, 2, 'validation', 'boolean', 'The :attribute field must be true or false.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(387, 2, 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(388, 2, 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(389, 2, 'validation', 'date', 'The :attribute is not a valid date.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(390, 2, 'validation', 'date_equals', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(391, 2, 'validation', 'date_format', 'The :attribute does not match the format :format.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(392, 2, 'validation', 'different', 'The :attribute and :other must be different.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(393, 2, 'validation', 'digits', 'The :attribute must be :digits digits.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(394, 2, 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(395, 2, 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(396, 2, 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(397, 2, 'validation', 'email', 'The :attribute must be a valid email address.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(398, 2, 'validation', 'ends_with', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(399, 2, 'validation', 'exists', 'The selected :attribute is invalid.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(400, 2, 'validation', 'file', 'The :attribute must be a file.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(401, 2, 'validation', 'filled', 'The :attribute field must have a value.', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(402, 2, 'validation', 'gt.array', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(403, 2, 'validation', 'gt.file', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(404, 2, 'validation', 'gt.numeric', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(405, 2, 'validation', 'gt.string', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(406, 2, 'validation', 'gte.array', '', '2020-10-17 21:50:47', '2020-10-17 21:50:47'),
(407, 2, 'validation', 'gte.file', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(408, 2, 'validation', 'gte.numeric', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(409, 2, 'validation', 'gte.string', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(410, 2, 'validation', 'image', 'The :attribute must be an image.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(411, 2, 'validation', 'in', 'The selected :attribute is invalid.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(412, 2, 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(413, 2, 'validation', 'integer', 'The :attribute must be an integer.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(414, 2, 'validation', 'ip', 'The :attribute must be a valid IP address.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(415, 2, 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(416, 2, 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(417, 2, 'validation', 'json', 'The :attribute must be a valid JSON string.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(418, 2, 'validation', 'lt.array', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(419, 2, 'validation', 'lt.file', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(420, 2, 'validation', 'lt.numeric', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(421, 2, 'validation', 'lt.string', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(422, 2, 'validation', 'lte.array', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(423, 2, 'validation', 'lte.file', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(424, 2, 'validation', 'lte.numeric', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(425, 2, 'validation', 'lte.string', '', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(426, 2, 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(427, 2, 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(428, 2, 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(429, 2, 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2020-10-17 21:50:48', '2020-10-17 21:50:48'),
(430, 2, 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(431, 2, 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(432, 2, 'validation', 'min.array', 'The :attribute must have at least :min items.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(433, 2, 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(434, 2, 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(435, 2, 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(436, 2, 'validation', 'not_in', 'The selected :attribute is invalid.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(437, 2, 'validation', 'not_regex', '', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(438, 2, 'validation', 'numeric', 'The :attribute must be a number.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(439, 2, 'validation', 'password', '', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(440, 2, 'validation', 'present', 'The :attribute field must be present.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(441, 2, 'validation', 'regex', 'The :attribute format is invalid.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(442, 2, 'validation', 'required', 'The :attribute field is required.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(443, 2, 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(444, 2, 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(445, 2, 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(446, 2, 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(447, 2, 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2020-10-17 21:50:49', '2020-10-17 21:50:49');
INSERT INTO `translations` (`id`, `language_id`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(448, 2, 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(449, 2, 'validation', 'same', 'The :attribute and :other must match.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(450, 2, 'validation', 'size.array', 'The :attribute must contain :size items.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(451, 2, 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(452, 2, 'validation', 'size.numeric', 'The :attribute must be :size.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(453, 2, 'validation', 'size.string', 'The :attribute must be :size characters.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(454, 2, 'validation', 'starts_with', '', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(455, 2, 'validation', 'string', 'The :attribute must be a string.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(456, 2, 'validation', 'timezone', 'The :attribute must be a valid zone.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(457, 2, 'validation', 'unique', 'The :attribute has already been taken.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(458, 2, 'validation', 'uploaded', 'The :attribute failed to upload.', '2020-10-17 21:50:49', '2020-10-17 21:50:49'),
(459, 2, 'validation', 'url', 'The :attribute format is invalid.', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(460, 2, 'validation', 'uuid', '', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(461, 2, 'pagination', 'next', 'Next &raquo;', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(462, 2, 'pagination', 'previous', '&laquo; Previous', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(463, 2, 'translation::translation', 'languages', 'Languages', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(464, 2, 'translation::translation', 'language', 'Language', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(465, 2, 'translation::translation', 'type', 'Type', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(466, 2, 'translation::translation', 'file', 'File', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(467, 2, 'translation::translation', 'key', 'Key', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(468, 2, 'translation::translation', 'prompt_language', 'Enter the language code you would like to add (e.g. en)', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(469, 2, 'translation::translation', 'language_added', 'New language added successfully 🙌', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(470, 2, 'translation::translation', 'prompt_language_for_key', 'Enter the language for the key (e.g. en)', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(471, 2, 'translation::translation', 'prompt_type', 'Is this a json or array key?', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(472, 2, 'translation::translation', 'prompt_file', 'Which file will this be stored in?', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(473, 2, 'translation::translation', 'prompt_key', 'What is the key for this translation?', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(474, 2, 'translation::translation', 'prompt_value', 'What is the value for this translation', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(475, 2, 'translation::translation', 'type_error', 'Translation type must be json or array', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(476, 2, 'translation::translation', 'language_key_added', 'New language key added successfully 👏', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(477, 2, 'translation::translation', 'no_missing_keys', 'There are no missing translation keys in the app 🎉', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(478, 2, 'translation::translation', 'keys_synced', 'Missing keys synchronised successfully 🎊', '2020-10-17 21:50:50', '2020-10-17 21:50:50'),
(479, 2, 'translation::translation', 'search', 'Search all translations', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(480, 2, 'translation::translation', 'translations', 'Translation', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(481, 2, 'translation::translation', 'language_name', 'Name', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(482, 2, 'translation::translation', 'locale', 'Locale', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(483, 2, 'translation::translation', 'add', '+ Add', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(484, 2, 'translation::translation', 'add_language', 'Add a new language', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(485, 2, 'translation::translation', 'save', 'Save', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(486, 2, 'translation::translation', 'language_exists', 'The :attribute already exists.', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(487, 2, 'translation::translation', 'uh_oh', 'Something\'s not quite right', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(488, 2, 'translation::translation', 'group_single', 'Group / Single', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(489, 2, 'translation::translation', 'group', 'Group', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(490, 2, 'translation::translation', 'single', 'Single', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(491, 2, 'translation::translation', 'value', 'Value', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(492, 2, 'translation::translation', 'namespace', 'Namespace', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(493, 2, 'translation::translation', 'prompt_from_driver', 'Which driver would you like to take translations from?', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(494, 2, 'translation::translation', 'prompt_to_driver', 'Which driver would you like to add the translations to?', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(495, 2, 'translation::translation', 'prompt_language_if_any', 'Which language? (leave blank for all)', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(496, 2, 'translation::translation', 'syncing', 'Syncing translations ⏳', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(497, 2, 'translation::translation', 'synced', 'Translations have been synced 😎', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(498, 2, 'translation::translation', 'invalid_driver', 'Invalid driver', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(499, 2, 'translation::translation', 'invalid_language', 'Invalid language', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(500, 2, 'translation::translation', 'add_translation', 'Add a translation', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(501, 2, 'translation::translation', 'translation_added', 'New translation added successfull 🙌', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(502, 2, 'translation::translation', 'namespace_label', 'Namespace (Optional)', '2020-10-17 21:50:51', '2020-10-17 21:50:51'),
(503, 2, 'translation::translation', 'group_label', 'Group (Optional)', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(504, 2, 'translation::translation', 'key_label', 'Key', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(505, 2, 'translation::translation', 'value_label', 'Value', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(506, 2, 'translation::translation', 'namespace_placeholder', 'e.g. my_package', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(507, 2, 'translation::translation', 'group_placeholder', 'e.g. validation', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(508, 2, 'translation::translation', 'key_placeholder', 'e.g. invalid_key', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(509, 2, 'translation::translation', 'value_placeholder', 'e.g. Keys must be a single string', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(510, 2, 'translation::translation', 'advanced_options', 'Toggle advanced options', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(511, 2, 'translation::errors', 'language_exists', 'The language { :language } already exists', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(512, 2, 'translation::errors', 'key_exists', 'The translation key { :key } already exists', '2020-10-17 21:50:52', '2020-10-17 21:50:52'),
(513, 3, 'email', 'confirm', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(514, 3, 'email', 'email_already_confirmed', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(515, 3, 'email', 'email_confirmed', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(516, 3, 'email', 'invalid_token', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(517, 3, 'email', 'msg_confirm', 'Aquí ha creado su cuenta de usuario. Ahora debe confirmar su correo electrónico haciendo clic en el botón de abajo', '2020-10-17 21:51:10', '2020-10-17 22:35:07'),
(518, 3, 'email', 'sincerly', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(519, 3, 'auth', 'failed', 'Estas credenciales no coinciden con nuestros registros.', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(520, 3, 'auth', 'throttle', 'Demasiados intentos de acceso. Por favor intente nuevamente en :seconds segundos.', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(521, 3, 'passwords', 'password', '', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(522, 3, 'passwords', 'reset', '¡Tu contraseña ha sido restablecida!', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(523, 3, 'passwords', 'sent', '¡Te hemos enviado por correo el enlace para restablecer tu contraseña!', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(524, 3, 'passwords', 'token', 'El token de recuperación de contraseña es inválido.', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(525, 3, 'passwords', 'user', 'No podemos encontrar ningún usuario con ese correo electrónico.', '2020-10-17 21:51:10', '2020-10-17 22:39:58'),
(526, 3, 'app', 'about', 'A proposito', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(527, 3, 'app', 'account_name', 'Nombre de la cuenta', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(528, 3, 'app', 'account_transfer', 'Transferencia entre cuentas', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(529, 3, 'app', 'accounts_list', 'Lista de sus cuentas', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(530, 3, 'app', 'amount', 'Cantidad', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(531, 3, 'app', 'app_name', 'Banco', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(532, 3, 'app', 'back', 'Regreso', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(533, 3, 'app', 'bad_id', 'El identificador pasado como parámetro no está asociado con ningún registro en la base de datos', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(534, 3, 'app', 'card_no', 'Numero de tarjeta', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(535, 3, 'app', 'check', 'Comprobar', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(536, 3, 'app', 'check_deposit', 'Depósito con cheque', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(537, 3, 'app', 'choose_file', 'Elige un archivo', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(538, 3, 'app', 'create_new_account', 'Crea una cuenta nueva', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(539, 3, 'app', 'delete_success', 'La eliminación fue exitosa', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(540, 3, 'app', 'destination_account', 'Cuenta de Destino', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(541, 3, 'app', 'edit', 'Editar', '2020-10-17 21:51:10', '2020-10-17 21:51:10'),
(542, 3, 'app', 'edit_user', 'Editar usuario', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(543, 3, 'app', 'email', 'Correo Electrónico', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(544, 3, 'app', 'email_confirmation', 'Confirmación de correo electrónico', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(545, 3, 'app', 'erase', 'Borrar', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(546, 3, 'app', 'home', 'Bienvenida', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(547, 3, 'app', 'home_welcome_message', 'Esto es lo que tenemos reservado para usted hoy ...', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(548, 3, 'app', 'leave_empty', 'Dejar en blanco para mantener', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(549, 3, 'app', 'login', 'Acceder', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(550, 3, 'app', 'logout', 'Desconectarse', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(551, 3, 'app', 'logout_message', 'Has sido desconectado !', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(552, 3, 'app', 'modify_account', 'Editar cuenta', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(553, 3, 'app', 'modify_transactions', 'Modificar la transacción', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(554, 3, 'app', 'name', 'Apellido', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(555, 3, 'app', 'new_account', 'Nueva cuenta', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(556, 3, 'app', 'new_operation', 'Nueva operacion', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(557, 3, 'app', 'nextLanguage', 'Français', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(558, 3, 'app', 'no_account', 'No tienes cuenta ...', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(559, 3, 'app', 'no_account_destination', 'No tienes una cuenta disponible para la transferencia', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(560, 3, 'app', 'no_transaction', 'No hay transacción', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(561, 3, 'app', 'not_logged', 'No conectado', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(562, 3, 'app', 'operation_type', 'Tipo de operación', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(563, 3, 'app', 'overview_accounts', 'Resumen de sus cuentas', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(564, 3, 'app', 'password', 'Contraseña', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(565, 3, 'app', 'role', 'Papel', '2020-10-17 21:51:11', '2020-10-17 23:04:27'),
(566, 3, 'app', 'roles', '', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(567, 3, 'app', 'signin', 'Registro', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(568, 3, 'app', 'submit', 'Enviar a', '2020-10-17 21:51:11', '2020-10-17 22:45:35'),
(569, 3, 'app', 'transactions', 'Transacciones', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(570, 3, 'app', 'type', 'Tipo', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(571, 3, 'app', 'unauthorized', 'No permitido', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(572, 3, 'app', 'update', 'Poner al día', '2020-10-17 21:51:11', '2020-10-17 21:51:11'),
(573, 3, 'app', 'updated', 'Actualización completada', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(574, 3, 'app', 'upload', 'Subir', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(575, 3, 'app', 'users', 'Usuarios', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(576, 3, 'app', 'users_list', 'Lista de usuarios', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(577, 3, 'app', 'welcome', 'Bienvenida', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(578, 3, 'app', 'your_accounts', 'Tus cuentas', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(579, 3, 'validation', 'accepted', ':attribute debe ser aceptado.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(580, 3, 'validation', 'active_url', ':attribute no es una URL válida.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(581, 3, 'validation', 'after', ':attribute debe ser una fecha posterior a :date.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(582, 3, 'validation', 'after_or_equal', ':attribute debe ser una fecha posterior o igual a :date.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(583, 3, 'validation', 'alpha', ':attribute sólo debe contener letras.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(584, 3, 'validation', 'alpha_dash', ':attribute sólo debe contener letras, números, guiones y guiones bajos.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(585, 3, 'validation', 'alpha_num', ':attribute sólo debe contener letras y números.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(586, 3, 'validation', 'array', ':attribute debe ser un conjunto.', '2020-10-17 21:51:12', '2020-10-17 22:40:02'),
(587, 3, 'validation', 'attributes.address', 'dirección', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(588, 3, 'validation', 'attributes.age', 'edad', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(589, 3, 'validation', 'attributes.available', '', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(590, 3, 'validation', 'attributes.city', 'ciudad', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(591, 3, 'validation', 'attributes.content', 'contenido', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(592, 3, 'validation', 'attributes.country', 'país', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(593, 3, 'validation', 'attributes.courriel', '', '2020-10-17 21:51:12', '2020-10-17 21:51:12'),
(594, 3, 'validation', 'attributes.date', 'fecha', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(595, 3, 'validation', 'attributes.day', 'día', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(596, 3, 'validation', 'attributes.description', 'descripción', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(597, 3, 'validation', 'attributes.email', 'correo electrónico', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(598, 3, 'validation', 'attributes.excerpt', 'extracto', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(599, 3, 'validation', 'attributes.first_name', 'nombre', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(600, 3, 'validation', 'attributes.gender', 'género', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(601, 3, 'validation', 'attributes.hour', 'hora', '2020-10-17 21:51:12', '2020-10-17 22:40:07'),
(602, 3, 'validation', 'attributes.last_name', 'apellido', '2020-10-17 21:51:13', '2020-10-17 22:40:07'),
(603, 3, 'validation', 'attributes.minute', 'minuto', '2020-10-17 21:51:13', '2020-10-17 22:40:07'),
(604, 3, 'validation', 'attributes.mobile', 'móvil', '2020-10-17 21:51:13', '2020-10-17 22:40:07'),
(605, 3, 'validation', 'attributes.montant', '', '2020-10-17 21:51:13', '2020-10-17 21:51:13'),
(606, 3, 'validation', 'attributes.month', 'mes', '2020-10-17 21:51:13', '2020-10-17 22:40:07'),
(607, 3, 'validation', 'attributes.mot_de_passe', '', '2020-10-17 21:51:13', '2020-10-17 21:51:13'),
(608, 3, 'validation', 'attributes.name', 'nombre', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(609, 3, 'validation', 'attributes.no_carte', '', '2020-10-17 21:51:13', '2020-10-17 21:51:13'),
(610, 3, 'validation', 'attributes.nom', '', '2020-10-17 21:51:13', '2020-10-17 21:51:13'),
(611, 3, 'validation', 'attributes.password', 'contraseña', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(612, 3, 'validation', 'attributes.password_confirmation', 'confirmación de la contraseña', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(613, 3, 'validation', 'attributes.phone', 'teléfono', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(614, 3, 'validation', 'attributes.second', 'segundo', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(615, 3, 'validation', 'attributes.sex', 'sexo', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(616, 3, 'validation', 'attributes.size', '', '2020-10-17 21:51:13', '2020-10-17 21:51:13'),
(617, 3, 'validation', 'attributes.time', 'hora', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(618, 3, 'validation', 'attributes.title', 'título', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(619, 3, 'validation', 'attributes.username', 'usuario', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(620, 3, 'validation', 'attributes.year', 'año', '2020-10-17 21:51:13', '2020-10-17 22:40:08'),
(621, 3, 'validation', 'before', ':attribute debe ser una fecha anterior a :date.', '2020-10-17 21:51:13', '2020-10-17 22:40:02'),
(622, 3, 'validation', 'before_or_equal', ':attribute debe ser una fecha anterior o igual a :date.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(623, 3, 'validation', 'between.array', ':attribute tiene que tener entre :min - :max elementos.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(624, 3, 'validation', 'between.file', ':attribute debe pesar entre :min - :max kilobytes.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(625, 3, 'validation', 'between.numeric', ':attribute tiene que estar entre :min - :max.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(626, 3, 'validation', 'between.string', ':attribute tiene que tener entre :min - :max caracteres.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(627, 3, 'validation', 'boolean', 'El campo :attribute debe tener un valor verdadero o falso.', '2020-10-17 21:51:13', '2020-10-17 22:40:03'),
(628, 3, 'validation', 'confirmed', 'La confirmación de :attribute no coincide.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(629, 3, 'validation', 'custom.attribute-name.rule-name', '', '2020-10-17 21:51:14', '2020-10-17 21:51:14'),
(630, 3, 'validation', 'date', ':attribute no es una fecha válida.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(631, 3, 'validation', 'date_equals', ':attribute debe ser una fecha igual a :date.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(632, 3, 'validation', 'date_format', ':attribute no corresponde al formato :format.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(633, 3, 'validation', 'different', ':attribute y :other deben ser diferentes.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(634, 3, 'validation', 'digits', ':attribute debe tener :digits dígitos.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(635, 3, 'validation', 'digits_between', ':attribute debe tener entre :min y :max dígitos.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(636, 3, 'validation', 'dimensions', 'Las dimensiones de la imagen :attribute no son válidas.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(637, 3, 'validation', 'distinct', 'El campo :attribute contiene un valor duplicado.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(638, 3, 'validation', 'email', ':attribute no es un correo válido.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(639, 3, 'validation', 'ends_with', 'El campo :attribute debe finalizar con uno de los siguientes valores: :values', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(640, 3, 'validation', 'exists', ':attribute es inválido.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(641, 3, 'validation', 'file', 'El campo :attribute debe ser un archivo.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(642, 3, 'validation', 'filled', 'El campo :attribute es obligatorio.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(643, 3, 'validation', 'gt.array', 'El campo :attribute debe tener más de :value elementos.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(644, 3, 'validation', 'gt.file', 'El campo :attribute debe tener más de :value kilobytes.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(645, 3, 'validation', 'gt.numeric', 'El campo :attribute debe ser mayor que :value.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(646, 3, 'validation', 'gt.string', 'El campo :attribute debe tener más de :value caracteres.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(647, 3, 'validation', 'gte.array', 'El campo :attribute debe tener como mínimo :value elementos.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(648, 3, 'validation', 'gte.file', 'El campo :attribute debe tener como mínimo :value kilobytes.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(649, 3, 'validation', 'gte.numeric', 'El campo :attribute debe ser como mínimo :value.', '2020-10-17 21:51:14', '2020-10-17 22:40:03'),
(650, 3, 'validation', 'gte.string', 'El campo :attribute debe tener como mínimo :value caracteres.', '2020-10-17 21:51:15', '2020-10-17 22:40:03'),
(651, 3, 'validation', 'image', ':attribute debe ser una imagen.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(652, 3, 'validation', 'in', ':attribute es inválido.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(653, 3, 'validation', 'in_array', 'El campo :attribute no existe en :other.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(654, 3, 'validation', 'integer', ':attribute debe ser un número entero.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(655, 3, 'validation', 'ip', ':attribute debe ser una dirección IP válida.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(656, 3, 'validation', 'ipv4', ':attribute debe ser una dirección IPv4 válida.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(657, 3, 'validation', 'ipv6', ':attribute debe ser una dirección IPv6 válida.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(658, 3, 'validation', 'json', 'El campo :attribute debe ser una cadena JSON válida.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(659, 3, 'validation', 'lt.array', 'El campo :attribute debe tener menos de :value elementos.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(660, 3, 'validation', 'lt.file', 'El campo :attribute debe tener menos de :value kilobytes.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(661, 3, 'validation', 'lt.numeric', 'El campo :attribute debe ser menor que :value.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(662, 3, 'validation', 'lt.string', 'El campo :attribute debe tener menos de :value caracteres.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(663, 3, 'validation', 'lte.array', 'El campo :attribute debe tener como máximo :value elementos.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(664, 3, 'validation', 'lte.file', 'El campo :attribute debe tener como máximo :value kilobytes.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(665, 3, 'validation', 'lte.numeric', 'El campo :attribute debe ser como máximo :value.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(666, 3, 'validation', 'lte.string', 'El campo :attribute debe tener como máximo :value caracteres.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(667, 3, 'validation', 'max.array', ':attribute no debe tener más de :max elementos.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(668, 3, 'validation', 'max.file', ':attribute no debe ser mayor que :max kilobytes.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(669, 3, 'validation', 'max.numeric', ':attribute no debe ser mayor que :max.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(670, 3, 'validation', 'max.string', ':attribute no debe ser mayor que :max caracteres.', '2020-10-17 21:51:15', '2020-10-17 22:40:04'),
(671, 3, 'validation', 'mimes', ':attribute debe ser un archivo con formato: :values.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(672, 3, 'validation', 'mimetypes', ':attribute debe ser un archivo con formato: :values.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(673, 3, 'validation', 'min.array', ':attribute debe tener al menos :min elementos.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(674, 3, 'validation', 'min.file', 'El tamaño de :attribute debe ser de al menos :min kilobytes.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(675, 3, 'validation', 'min.numeric', 'El tamaño de :attribute debe ser de al menos :min.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(676, 3, 'validation', 'min.string', ':attribute debe contener al menos :min caracteres.', '2020-10-17 21:51:15', '2020-10-17 22:40:05'),
(677, 3, 'validation', 'not_in', ':attribute es inválido.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(678, 3, 'validation', 'not_regex', 'El formato del campo :attribute no es válido.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(679, 3, 'validation', 'numeric', ':attribute debe ser numérico.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(680, 3, 'validation', 'password', 'La contraseña es incorrecta.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(681, 3, 'validation', 'present', 'El campo :attribute debe estar presente.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(682, 3, 'validation', 'regex', 'El formato de :attribute es inválido.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(683, 3, 'validation', 'required', 'El campo :attribute es obligatorio.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(684, 3, 'validation', 'required_if', 'El campo :attribute es obligatorio cuando :other es :value.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(685, 3, 'validation', 'required_unless', 'El campo :attribute es obligatorio a menos que :other esté en :values.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(686, 3, 'validation', 'required_with', 'El campo :attribute es obligatorio cuando :values está presente.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(687, 3, 'validation', 'required_with_all', 'El campo :attribute es obligatorio cuando :values están presentes.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(688, 3, 'validation', 'required_without', 'El campo :attribute es obligatorio cuando :values no está presente.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(689, 3, 'validation', 'required_without_all', 'El campo :attribute es obligatorio cuando ninguno de :values está presente.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(690, 3, 'validation', 'same', ':attribute y :other deben coincidir.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(691, 3, 'validation', 'size.array', ':attribute debe contener :size elementos.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(692, 3, 'validation', 'size.file', 'El tamaño de :attribute debe ser :size kilobytes.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(693, 3, 'validation', 'size.numeric', 'El tamaño de :attribute debe ser :size.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(694, 3, 'validation', 'size.string', ':attribute debe contener :size caracteres.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(695, 3, 'validation', 'starts_with', 'El campo :attribute debe comenzar con uno de los siguientes valores: :values', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(696, 3, 'validation', 'string', 'El campo :attribute debe ser una cadena de caracteres.', '2020-10-17 21:51:16', '2020-10-17 22:40:06'),
(697, 3, 'validation', 'timezone', 'El :attribute debe ser una zona válida.', '2020-10-17 21:51:16', '2020-10-17 22:40:07'),
(698, 3, 'validation', 'unique', 'El campo :attribute ya ha sido registrado.', '2020-10-17 21:51:16', '2020-10-17 22:40:07'),
(699, 3, 'validation', 'uploaded', 'Subir :attribute ha fallado.', '2020-10-17 21:51:17', '2020-10-17 22:40:07'),
(700, 3, 'validation', 'url', 'El formato :attribute es inválido.', '2020-10-17 21:51:17', '2020-10-17 22:40:07'),
(701, 3, 'validation', 'uuid', 'El campo :attribute debe ser un UUID válido.', '2020-10-17 21:51:17', '2020-10-17 22:40:07'),
(702, 3, 'pagination', 'next', 'Siguiente &raquo;', '2020-10-17 21:51:17', '2020-10-17 22:40:08'),
(703, 3, 'pagination', 'previous', '&laquo; Anterior', '2020-10-17 21:51:17', '2020-10-17 22:40:08'),
(704, 1, 'email', 'confirm_needed', 'Vous devez confirmer votre courriel', '2020-10-17 22:02:02', '2020-10-17 22:02:02'),
(705, 2, 'email', 'confirm_needed', 'You need to confirm your email', '2020-10-17 22:03:58', '2020-10-17 22:03:58'),
(706, 3, 'email', 'confirm_needed', 'Debes confirmar tu correo electrónico', '2020-10-17 22:08:09', '2020-10-17 22:34:11'),
(707, 3, 'passwords', 'throttled', 'Por favor espera antes de intentar de nuevo.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(708, 3, 'validation-inline', 'accepted', 'Este campo debe ser aceptado.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(709, 3, 'validation-inline', 'active_url', 'Esta no es una URL válida.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(710, 3, 'validation-inline', 'after', 'Debe ser una fecha después de :date.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(711, 3, 'validation-inline', 'after_or_equal', 'Debe ser una fecha después o igual a :date.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(712, 3, 'validation-inline', 'alpha', 'Este campo solo puede contener letras.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(713, 3, 'validation-inline', 'alpha_dash', 'Este campo solo puede contener letras, números, guiones y guiones bajos.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(714, 3, 'validation-inline', 'alpha_num', 'Este campo solo puede contener letras y números.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(715, 3, 'validation-inline', 'array', 'Este campo debe ser un array (colección).', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(716, 3, 'validation-inline', 'before', 'Debe ser una fecha antes de :date.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(717, 3, 'validation-inline', 'before_or_equal', 'Debe ser una fecha anterior o igual a :date.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(718, 3, 'validation-inline', 'between.numeric', 'Este valor debe ser entre :min y :max.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(719, 3, 'validation-inline', 'between.file', 'Este archivo debe ser entre :min y :max kilobytes.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(720, 3, 'validation-inline', 'between.string', 'El texto debe ser entre :min y :max caracteres.', '2020-10-17 22:39:58', '2020-10-17 22:39:58'),
(721, 3, 'validation-inline', 'between.array', 'El contenido debe tener entre :min y :max elementos.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(722, 3, 'validation-inline', 'boolean', 'El campo debe ser verdadero o falso.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(723, 3, 'validation-inline', 'confirmed', 'La confirmación no coincide.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(724, 3, 'validation-inline', 'date', 'Esta no es una fecha válida.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(725, 3, 'validation-inline', 'date_equals', 'El campo debe ser una fecha igual a :date.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(726, 3, 'validation-inline', 'date_format', 'El campo no corresponde al formato :format.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(727, 3, 'validation-inline', 'different', 'Este valor deben ser diferente de :other.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(728, 3, 'validation-inline', 'digits', 'Debe tener :digits dígitos.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(729, 3, 'validation-inline', 'digits_between', 'Debe tener entre :min y :max dígitos.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(730, 3, 'validation-inline', 'dimensions', 'Las dimensiones de esta imagen son inválidas.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(731, 3, 'validation-inline', 'distinct', 'El campo tiene un valor duplicado.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(732, 3, 'validation-inline', 'email', 'No es un correo válido.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(733, 3, 'validation-inline', 'ends_with', 'Debe finalizar con uno de los siguientes valores: :values.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(734, 3, 'validation-inline', 'exists', 'El valor seleccionado es inválido.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(735, 3, 'validation-inline', 'file', 'El campo debe ser un archivo.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(736, 3, 'validation-inline', 'filled', 'Este campo debe tener un valor.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(737, 3, 'validation-inline', 'gt.numeric', 'El valor del campo debe ser mayor que :value.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(738, 3, 'validation-inline', 'gt.file', 'El archivo debe ser mayor que :value kilobytes.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(739, 3, 'validation-inline', 'gt.string', 'El texto debe ser mayor de :value caracteres.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(740, 3, 'validation-inline', 'gt.array', 'El contenido debe tener mas de :value elementos.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(741, 3, 'validation-inline', 'gte.numeric', 'El valor debe ser mayor o igual que :value.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(742, 3, 'validation-inline', 'gte.file', 'El tamaño del archivo debe ser mayor o igual que :value kilobytes.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(743, 3, 'validation-inline', 'gte.string', 'El texto debe ser mayor o igual de :value caracteres.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(744, 3, 'validation-inline', 'gte.array', 'El contenido debe tener :value elementos o más.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(745, 3, 'validation-inline', 'image', 'Esta debe ser una imagen.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(746, 3, 'validation-inline', 'in', 'El valor seleccionado es inválido.', '2020-10-17 22:39:59', '2020-10-17 22:39:59'),
(747, 3, 'validation-inline', 'in_array', 'Este valor no existe en :other.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(748, 3, 'validation-inline', 'integer', 'Esto debe ser un entero.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(749, 3, 'validation-inline', 'ip', 'Debe ser una dirección IP válida.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(750, 3, 'validation-inline', 'ipv4', 'Debe ser una dirección IPv4 válida.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(751, 3, 'validation-inline', 'ipv6', 'Debe ser una dirección IPv6 válida.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(752, 3, 'validation-inline', 'json', 'Debe ser un texto válido en JSON.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(753, 3, 'validation-inline', 'lt.numeric', 'El valor debe ser menor que :value.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(754, 3, 'validation-inline', 'lt.file', 'El tamaño del archivo debe ser menor a :value kilobytes.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(755, 3, 'validation-inline', 'lt.string', 'El texto debe ser menor de :value caracteres.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(756, 3, 'validation-inline', 'lt.array', 'El contenido debe tener menor de :value elementos.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(757, 3, 'validation-inline', 'lte.numeric', 'El valor debe ser menor o igual que :value.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(758, 3, 'validation-inline', 'lte.file', 'El tamaño del archivo debe ser menor o igual que :value kilobytes.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(759, 3, 'validation-inline', 'lte.string', 'El texto debe ser menor o igual de :value caracteres.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(760, 3, 'validation-inline', 'lte.array', 'El contenido no debe tener más de :value elementos.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(761, 3, 'validation-inline', 'max.numeric', 'El valor no debe ser mayor de :max.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(762, 3, 'validation-inline', 'max.file', 'El tamaño del archivo no debe ser mayor a :max kilobytes.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(763, 3, 'validation-inline', 'max.string', 'El texto no debe ser mayor a :max caracteres.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(764, 3, 'validation-inline', 'max.array', 'El contenido no debe tener más de :max elementos.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(765, 3, 'validation-inline', 'mimes', 'Debe ser un archivo de tipo: :values.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(766, 3, 'validation-inline', 'mimetypes', 'Debe ser un archivo de tipo: :values.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(767, 3, 'validation-inline', 'min.numeric', 'El valor debe ser al menos de :min.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(768, 3, 'validation-inline', 'min.file', 'El tamaño del archivo debe ser al menos de :min kilobytes.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(769, 3, 'validation-inline', 'min.string', 'El texto debe ser al menos de :min caracteres.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(770, 3, 'validation-inline', 'min.array', 'El contenido debe tener al menos :min elementos.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(771, 3, 'validation-inline', 'multiple_of', 'Este valor debe ser múltiplo de :value', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(772, 3, 'validation-inline', 'not_in', 'El valor seleccionado es inválido.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(773, 3, 'validation-inline', 'not_regex', 'Este formato es inválido.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(774, 3, 'validation-inline', 'numeric', 'Debe ser un número.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(775, 3, 'validation-inline', 'password', 'La contraseña es incorrecta.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(776, 3, 'validation-inline', 'present', 'Este campo debe estar presente.', '2020-10-17 22:40:00', '2020-10-17 22:40:00'),
(777, 3, 'validation-inline', 'regex', 'Este formato es inválido.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(778, 3, 'validation-inline', 'required', 'Este campo es requerido.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(779, 3, 'validation-inline', 'required_if', 'Este campo es requerido cuando :other es :value.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(780, 3, 'validation-inline', 'required_unless', 'Este campo es requerido a menos que :other esté en :values.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(781, 3, 'validation-inline', 'required_with', 'Este campo es requerido cuando :values está presente.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(782, 3, 'validation-inline', 'required_with_all', 'Este campo es requerido cuando :values están presentes.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(783, 3, 'validation-inline', 'required_without', 'Este campo es requerido cuando :values no está presente.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(784, 3, 'validation-inline', 'required_without_all', 'Este campo es requerido cuando ninguno de :values están presentes.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(785, 3, 'validation-inline', 'same', 'El valor de este campo debe ser igual a :other.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(786, 3, 'validation-inline', 'size.numeric', 'El valor debe ser :size.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(787, 3, 'validation-inline', 'size.file', 'El tamaño del archivo debe ser de :size kilobytes.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(788, 3, 'validation-inline', 'size.string', 'El texto debe ser de :size caracteres.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(789, 3, 'validation-inline', 'size.array', 'El contenido debe tener :size elementos.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(790, 3, 'validation-inline', 'starts_with', 'Debe comenzar con alguno de los siguientes valores: :values.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(791, 3, 'validation-inline', 'string', 'Debe ser un texto.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(792, 3, 'validation-inline', 'timezone', 'Debe ser de una zona horaria válida.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(793, 3, 'validation-inline', 'unique', 'Este campo ya ha sido tomado.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(794, 3, 'validation-inline', 'uploaded', 'Falló al subir.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(795, 3, 'validation-inline', 'url', 'Este formato es inválido.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(796, 3, 'validation-inline', 'uuid', 'Debe ser un UUID válido.', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(797, 3, 'validation-inline', 'custom.attribute-name.rule-name', 'custom-message', '2020-10-17 22:40:01', '2020-10-17 22:40:01'),
(798, 3, 'validation', 'multiple_of', 'El campo :attribute debe ser múltiplo de :value', '2020-10-17 22:40:05', '2020-10-17 22:40:05'),
(799, 3, 'validation', 'custom.password.min', 'La :attribute debe contener más de :min caracteres', '2020-10-17 22:40:07', '2020-10-17 22:40:07'),
(800, 3, 'validation', 'custom.email.unique', 'El :attribute ya ha sido registrado.', '2020-10-17 22:40:07', '2020-10-17 22:40:07'),
(801, 3, 'validation', 'attributes.body', 'contenido', '2020-10-17 22:40:07', '2020-10-17 22:40:07'),
(802, 3, 'validation', 'attributes.message', 'mensaje', '2020-10-17 22:40:07', '2020-10-17 22:40:07'),
(803, 3, 'validation', 'attributes.price', 'precio', '2020-10-17 22:40:08', '2020-10-17 22:40:08'),
(804, 3, 'validation', 'attributes.subject', 'asunto', '2020-10-17 22:40:08', '2020-10-17 22:40:08'),
(805, 3, 'validation', 'attributes.terms', 'términos', '2020-10-17 22:40:08', '2020-10-17 22:40:08'),
(806, 1, 'single', 'types_role.\'.Auth::user()->getFirstRole()->type) . \" : \". Auth::user()->nom}} <svg class=\"svg-icon \" style=\"width: 1.5em; fill: cornflowerblue; margin-top: -4px\" viewBox=\"0 0 20 20\">\r\n                    <path d=\"M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,\r\n                    9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934 M7.402,12.627H4.257c-0.247,0-0.449,\r\n                    0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,\r\n                    7.402,12.627 M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,\r\n                    0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339 M18.631,4.543v10.78c0,\r\n                    0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,\r\n                    0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543 M17.732,4.993H2.46v9.882h15.272V4.993z\r\n                    M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,\r\n                    0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,\r\n                    1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,\r\n                    8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,\r\n                    7.515,11.542,8.137 M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644\r\n                    ,2.246H15.435z\"></path></svg>\r\n                @else\r\n                    Non connecté\r\n                @endif\r\n            </a>\r\n            <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenuButton\">\r\n                <a class=\"dropdown-item\" href=\"{{route(\'changer_langue', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(807, 1, 'single', 'types_compte.\'.$compte->type_compte->type)}}</div>\n\n                            <div class=\"float-right\">@money($compte->getMontant()) $</div>\n\n                        </div>\n\n\n                    @empty\n                                <span style=\"font-size: smaller; color:gray\"> @lang(\'app.no_account', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(808, 1, 'single', 'types_role.\'.$role->type)}}</label>\r\n                </div>\r\n                @endforeach\r\n                @if($utilisateur->nom === Auth::user()->nom) <br>\r\n            <span class=\"mt-0 text-danger\" style=\"font-size: 13px\">\r\n                * Si vous modifier votre rôle, vous ne pourrez plus le modifier par la suite.\r\n            </span><br>@endif\r\n        @endcan\r\n\r\n        <br>\r\n        <button type=\"submit\" class=\"btn btn-primary\">@lang(\'app.update', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(809, 1, 'single', 'types_role.\' . $roles->type)}}\r\n                    @if(!$loop->last)\r\n                        ,\r\n                    @endif\r\n                @endforeach\r\n            </td>\r\n            @can(\'modifier-utilisateurs', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(810, 1, 'single', 'types_compte.\'.$typeCompte->type)}}</label>\r\n                </div>\r\n        @endforeach\r\n        <div class=\"form-group\">\r\n            <label for=\"nomCompte\">@lang(\'app.account_name', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(811, 1, 'app', '\'.\'updated', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(812, 2, 'single', 'types_role.\'.Auth::user()->getFirstRole()->type) . \" : \". Auth::user()->nom}} <svg class=\"svg-icon \" style=\"width: 1.5em; fill: cornflowerblue; margin-top: -4px\" viewBox=\"0 0 20 20\">\r\n                    <path d=\"M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,\r\n                    9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934 M7.402,12.627H4.257c-0.247,0-0.449,\r\n                    0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,\r\n                    7.402,12.627 M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,\r\n                    0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339 M18.631,4.543v10.78c0,\r\n                    0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,\r\n                    0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543 M17.732,4.993H2.46v9.882h15.272V4.993z\r\n                    M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,\r\n                    0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,\r\n                    1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,\r\n                    8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,\r\n                    7.515,11.542,8.137 M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644\r\n                    ,2.246H15.435z\"></path></svg>\r\n                @else\r\n                    Non connecté\r\n                @endif\r\n            </a>\r\n            <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenuButton\">\r\n                <a class=\"dropdown-item\" href=\"{{route(\'changer_langue', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(813, 2, 'single', 'types_compte.\'.$compte->type_compte->type)}}</div>\n\n                            <div class=\"float-right\">@money($compte->getMontant()) $</div>\n\n                        </div>\n\n\n                    @empty\n                                <span style=\"font-size: smaller; color:gray\"> @lang(\'app.no_account', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(814, 2, 'single', 'types_role.\'.$role->type)}}</label>\r\n                </div>\r\n                @endforeach\r\n                @if($utilisateur->nom === Auth::user()->nom) <br>\r\n            <span class=\"mt-0 text-danger\" style=\"font-size: 13px\">\r\n                * Si vous modifier votre rôle, vous ne pourrez plus le modifier par la suite.\r\n            </span><br>@endif\r\n        @endcan\r\n\r\n        <br>\r\n        <button type=\"submit\" class=\"btn btn-primary\">@lang(\'app.update', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27');
INSERT INTO `translations` (`id`, `language_id`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(815, 2, 'single', 'types_role.\' . $roles->type)}}\r\n                    @if(!$loop->last)\r\n                        ,\r\n                    @endif\r\n                @endforeach\r\n            </td>\r\n            @can(\'modifier-utilisateurs', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(816, 2, 'single', 'types_compte.\'.$typeCompte->type)}}</label>\r\n                </div>\r\n        @endforeach\r\n        <div class=\"form-group\">\r\n            <label for=\"nomCompte\">@lang(\'app.account_name', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(817, 2, 'app', '\'.\'updated', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(818, 3, 'single', 'types_role.\'.Auth::user()->getFirstRole()->type) . \" : \". Auth::user()->nom}} <svg class=\"svg-icon \" style=\"width: 1.5em; fill: cornflowerblue; margin-top: -4px\" viewBox=\"0 0 20 20\">\r\n                    <path d=\"M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,\r\n                    9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934 M7.402,12.627H4.257c-0.247,0-0.449,\r\n                    0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,\r\n                    7.402,12.627 M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,\r\n                    0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339 M18.631,4.543v10.78c0,\r\n                    0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,\r\n                    0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543 M17.732,4.993H2.46v9.882h15.272V4.993z\r\n                    M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,\r\n                    0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,\r\n                    1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,\r\n                    8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,\r\n                    7.515,11.542,8.137 M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644\r\n                    ,2.246H15.435z\"></path></svg>\r\n                @else\r\n                    Non connecté\r\n                @endif\r\n            </a>\r\n            <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenuButton\">\r\n                <a class=\"dropdown-item\" href=\"{{route(\'changer_langue', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(819, 3, 'single', 'types_compte.\'.$compte->type_compte->type)}}</div>\n\n                            <div class=\"float-right\">@money($compte->getMontant()) $</div>\n\n                        </div>\n\n\n                    @empty\n                                <span style=\"font-size: smaller; color:gray\"> @lang(\'app.no_account', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(820, 3, 'single', 'types_role.\'.$role->type)}}</label>\r\n                </div>\r\n                @endforeach\r\n                @if($utilisateur->nom === Auth::user()->nom) <br>\r\n            <span class=\"mt-0 text-danger\" style=\"font-size: 13px\">\r\n                * Si vous modifier votre rôle, vous ne pourrez plus le modifier par la suite.\r\n            </span><br>@endif\r\n        @endcan\r\n\r\n        <br>\r\n        <button type=\"submit\" class=\"btn btn-primary\">@lang(\'app.update', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(821, 3, 'single', 'types_role.\' . $roles->type)}}\r\n                    @if(!$loop->last)\r\n                        ,\r\n                    @endif\r\n                @endforeach\r\n            </td>\r\n            @can(\'modifier-utilisateurs', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(822, 3, 'single', 'types_compte.\'.$typeCompte->type)}}</label>\r\n                </div>\r\n        @endforeach\r\n        <div class=\"form-group\">\r\n            <label for=\"nomCompte\">@lang(\'app.account_name', '', '2020-10-17 22:47:27', '2020-10-17 22:47:27'),
(823, 3, 'app', '\'.\'updated', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(824, 3, 'translation::translation', 'languages', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(825, 3, 'translation::translation', 'add', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(826, 3, 'translation::translation', 'language_name', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(827, 3, 'translation::translation', 'locale', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(828, 3, 'translation::translation', 'translations', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(829, 3, 'translation::translation', 'group_single', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(830, 3, 'translation::translation', 'key', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(831, 3, 'translation::translation', 'add_translation', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(832, 3, 'translation::translation', 'group_label', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(833, 3, 'translation::translation', 'group_placeholder', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(834, 3, 'translation::translation', 'key_label', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(835, 3, 'translation::translation', 'key_placeholder', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(836, 3, 'translation::translation', 'value_label', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(837, 3, 'translation::translation', 'value_placeholder', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(838, 3, 'translation::translation', 'advanced_options', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(839, 3, 'translation::translation', 'namespace_label', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(840, 3, 'translation::translation', 'namespace_placeholder', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(841, 3, 'translation::translation', 'save', 'Salvar', '2020-10-17 22:47:28', '2020-10-17 22:59:08'),
(842, 3, 'translation::translation', 'add_language', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(843, 3, 'translation::translation', 'search', '', '2020-10-17 22:47:28', '2020-10-17 22:47:28'),
(844, 1, 'app', 'user', 'Utilisateur', '2020-10-18 03:40:32', '2020-10-18 03:40:32'),
(845, 2, 'app', 'user', 'User', '2020-10-18 03:41:09', '2020-10-18 03:41:09'),
(846, 3, 'app', 'user', 'Usuario', '2020-10-18 03:41:33', '2020-10-18 03:41:33'),
(847, 1, 'app', 'update_check_picture', 'Ajouter une photo du chèque pour écraser l\'ancienne', '2020-10-18 03:45:01', '2020-10-18 03:45:01'),
(848, 2, 'app', 'update_check_picture', 'Add a photo of the check to overwrite the old one', '2020-10-18 03:46:14', '2020-10-18 03:46:14'),
(849, 3, 'app', 'update_check_picture', 'Agregue una foto del cheque para sobrescribir el anterior', '2020-10-18 03:46:42', '2020-10-18 03:46:42'),
(850, 1, 'app', 'delete_account', 'Supprimer le compte', '2020-10-19 18:46:42', '2020-10-19 18:46:42'),
(851, 2, 'app', 'delete_account', 'Delete the account', '2020-10-19 18:47:01', '2020-10-19 18:47:01'),
(852, 3, 'app', 'delete_account', 'Borrar cuenta', '2020-10-19 18:47:30', '2020-10-19 18:47:30'),
(853, 3, 'app', 'accounts', 'Cuentas', '2020-10-19 19:22:07', '2020-10-19 19:22:07'),
(854, 1, 'app', 'accounts', 'Comptes', '2020-10-19 19:23:32', '2020-10-19 19:23:32'),
(855, 2, 'app', 'accounts', 'Accounts', '2020-10-19 19:23:46', '2020-10-19 19:23:46'),
(856, 3, 'app', 'user_no_account', 'El usuario no tiene cuentas', '2020-10-19 19:51:00', '2020-10-19 19:53:07'),
(857, 1, 'app', 'user_no_account', 'L\'utilisateur n\'a pas de compte', '2020-10-19 19:51:27', '2020-10-19 19:51:27'),
(858, 2, 'app', 'user_no_account', 'The user doesn\'t have any account', '2020-10-19 19:52:32', '2020-10-19 19:52:32');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_carte` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mot_de_passe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courriel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirme` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `no_carte`, `nom`, `mot_de_passe`, `courriel`, `confirme`, `confirmation_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, '7489182951579117', 'test', '$2y$10$VZJ5dHbZN78DTedANdW6A./Sadi1D53imGUsJaKnY6mn42p7tR1KW', 'test@test.test', 1, '$2y$10$9NRmKOU7Ex6RpI.tAdOVWuNM6vCKmBonrK9Vf40da4R1uvK1NnJmO', NULL, '2020-10-28 02:53:35', '2020-12-23 21:08:57'),
(6, '7489296569421392', 'apilon', '$2y$10$hmOv6G03juDNtyNhlsxG9.H7Ibv3tKHWowcJONy2mhrmbyvj/YH1G', 'apilon@cmontmorency.qc.ca', 1, '$2y$10$xK1AH.YoKcFDM5M6PsPXne4Chc43Vb0WjXRrlbsb18nzZDcjTd4Yu', NULL, '2020-11-14 20:55:35', '2020-11-14 20:56:05');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comptes_utilisateur_id_foreign` (`utilisateur_id`),
  ADD KEY `comptes_type_compte_id_foreign` (`type_compte_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD KEY `images_transaction_id_foreign` (`transaction_id`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `ref_roles_utilisateur`
--
ALTER TABLE `ref_roles_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ref_types_compte`
--
ALTER TABLE `ref_types_compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ref_types_transaction`
--
ALTER TABLE `ref_types_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles_assignations`
--
ALTER TABLE `roles_assignations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_fk` (`utilisateur_id`),
  ADD KEY `role_fk` (`ref_role_utilisateur_id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_compte_id_foreign` (`compte_id`),
  ADD KEY `transactions_type_transaction_id_foreign` (`type_transaction_id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateurs_no_carte_unique` (`no_carte`),
  ADD UNIQUE KEY `utilisateurs_courriel_unique` (`courriel`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comptes`
--
ALTER TABLE `comptes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `ref_roles_utilisateur`
--
ALTER TABLE `ref_roles_utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ref_types_compte`
--
ALTER TABLE `ref_types_compte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ref_types_transaction`
--
ALTER TABLE `ref_types_transaction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `roles_assignations`
--
ALTER TABLE `roles_assignations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=859;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comptes`
--
ALTER TABLE `comptes`
  ADD CONSTRAINT `comptes_type_compte_id_foreign` FOREIGN KEY (`type_compte_id`) REFERENCES `ref_types_compte` (`id`),
  ADD CONSTRAINT `comptes_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `roles_assignations`
--
ALTER TABLE `roles_assignations`
  ADD CONSTRAINT `role_fk` FOREIGN KEY (`ref_role_utilisateur_id`) REFERENCES `ref_roles_utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_fk` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_compte_id_foreign` FOREIGN KEY (`compte_id`) REFERENCES `comptes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_type_transaction_id_foreign` FOREIGN KEY (`type_transaction_id`) REFERENCES `ref_types_transaction` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
