-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 29 2024 г., 17:14
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wsr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `driver`
--

CREATE TABLE `driver` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT 'avatar.png',
  `vehicle_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `driver`
--

INSERT INTO `driver` (`id`, `name`, `birth_date`, `email`, `phone`, `avatar`, `vehicle_id`) VALUES
(1, 'Иванов И.И.', '2014-05-15', 'ivanov@mail.ru', '9175465465', 'avatar.png', 1);


-- --------------------------------------------------------

--
-- Структура таблицы `line`
--

CREATE TABLE `line` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `start_time_operation` time NOT NULL,
  `end_time_operation` time NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `map` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `line`
--

INSERT INTO `line` (`id`, `code`, `start_time_operation`, `end_time_operation`, `type`, `map`) VALUES
(1, 'Линия №47', '03:00:00', '03:00:00', 'Ночные автобусы', 'map.png');

-- --------------------------------------------------------

--
-- Структура таблицы `station`
--

CREATE TABLE `station` (
  `id` int NOT NULL,
  `name` varchar(80) NOT NULL,
  `position_station` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `line_id` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `station`
--

INSERT INTO `station` (`id`, `name`, `position_station`, `line_id`) VALUES
(1, 'Деревня универсиады', '3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` char(2) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `birth_date`, `email`, `login`, `password`) VALUES
(1, 'Иванов И.И.', 'М', '1984-05-01', 'ivanov@mail.ru', 'admin', 'kazan');

-- --------------------------------------------------------

--
-- Структура таблицы `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `capacity` int NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `line_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `vehicle`
--

INSERT INTO `vehicle` (`id`, `name`, `capacity`, `type`, `line_id`) VALUES
(1, 'Форд спринтер', 17, 'Автобусы', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Индексы таблицы `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `line_id` (`line_id`),
  ADD KEY `line_id_2` (`line_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `line_id` (`line_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `line`
--
ALTER TABLE `line`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `station`
--
ALTER TABLE `station`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
