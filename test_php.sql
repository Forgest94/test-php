-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 20 2020 г., 21:04
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_php`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2020_12_20_102042_create_prizes_users', 1),
(13, '2020_12_20_102700_create_prizes_table', 1),
(14, '2020_12_20_102738_create_type_prizes_table', 1),
(15, '2020_12_20_103019_create_products_table', 1),
(16, '2020_12_20_103908_create_status_prizes_users_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `prizes`
--

CREATE TABLE `prizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interval_from` int(11) DEFAULT NULL,
  `interval_to` int(11) DEFAULT NULL,
  `type_prizes_id` int(11) NOT NULL,
  `max_sum` int(11) DEFAULT NULL,
  `fact_sum` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `prizes`
--

INSERT INTO `prizes` (`id`, `interval_from`, `interval_to`, `type_prizes_id`, `max_sum`, `fact_sum`, `created_at`, `updated_at`) VALUES
(4, 100, 10000, 1, 100000, 22524, NULL, '2020-12-20 10:27:40'),
(5, 100, 30000, 2, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `prizes_users`
--

CREATE TABLE `prizes_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `sum` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `prizes_users`
--

INSERT INTO `prizes_users` (`id`, `user_id`, `prize_id`, `sum`, `product_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, 3, 2, '2020-12-20 09:56:21', '2020-12-20 10:00:49'),
(2, 1, 5, 8773, 0, 1, '2020-12-20 10:00:58', '2020-12-20 10:00:58'),
(3, 1, 6, 1, 2, 1, '2020-12-20 10:03:06', '2020-12-20 10:03:06'),
(4, 1, 5, 2644, 0, 1, '2020-12-20 10:03:21', '2020-12-20 10:23:59'),
(5, 1, 4, 8447, 0, 1, '2020-12-20 10:26:52', '2020-12-20 10:26:52'),
(6, 1, 4, 6912, 0, 1, '2020-12-20 10:27:00', '2020-12-20 10:27:00'),
(7, 1, 4, 6563, 0, 1, '2020-12-20 10:27:38', '2020-12-20 10:27:38'),
(8, 1, 4, 602, 0, 1, '2020-12-20 10:27:40', '2020-12-20 10:27:40');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `count`, `created_at`, `updated_at`) VALUES
(1, 'Наушники', 10, NULL, NULL),
(2, 'Ноутбук', 1, NULL, NULL),
(3, 'Телефон', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `status_prizes_users`
--

CREATE TABLE `status_prizes_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `status_prizes_users`
--

INSERT INTO `status_prizes_users` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Не отправлен', NULL, NULL),
(2, 'Отправлен', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `type_prizes`
--

CREATE TABLE `type_prizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `type_prizes`
--

INSERT INTO `type_prizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'денежный', NULL, NULL),
(2, 'бонусные баллы', NULL, NULL),
(3, 'физический предмет', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `score`, `points`, `created_at`, `updated_at`) VALUES
(1, 'Forgest', 'test@test.ru', NULL, '$2y$10$X7SgEdO5PcKDeRJ1vbzg8OPJUnb6S8pM3CAzaEoBFwcBckwR6REGC', NULL, 0, 0, '2020-12-20 09:52:45', '2020-12-20 09:52:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `prizes`
--
ALTER TABLE `prizes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prizes_users`
--
ALTER TABLE `prizes_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status_prizes_users`
--
ALTER TABLE `status_prizes_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type_prizes`
--
ALTER TABLE `type_prizes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `prizes`
--
ALTER TABLE `prizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `prizes_users`
--
ALTER TABLE `prizes_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `status_prizes_users`
--
ALTER TABLE `status_prizes_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_prizes`
--
ALTER TABLE `type_prizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
