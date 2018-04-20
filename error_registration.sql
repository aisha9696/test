-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 20 2018 г., 03:21
-- Версия сервера: 10.1.30-MariaDB
-- Версия PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `error_registration`
--

-- --------------------------------------------------------

--
-- Структура таблицы `error`
--

CREATE TABLE `error` (
  `id` int(11) NOT NULL,
  `short_descr` text COLLATE utf8_unicode_ci NOT NULL,
  `full_descr` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `urgency` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `criticality` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `error`
--

INSERT INTO `error` (`id`, `short_descr`, `full_descr`, `urgency`, `criticality`) VALUES
(1, 'fg', 'dfg', '????? ??????', '?????????'),
(2, 'hhkh', 'kjhkh', '??????', '?????????'),
(3, 'zzxc', 'zxc', '????? ??????', '?????????'),
(5, 'CVsdfsd', '46546', 'Choose...', '??????'),
(12, 'ads', 'asd', '????? ??????', '?????????');

--
-- Триггеры `error`
--
DELIMITER $$
CREATE TRIGGER `new_history` AFTER UPDATE ON `error` FOR EACH ROW BEGIN
                 INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
                 VALUES ('2018-04-20 03:04:24','????????','asd','3',NEW.id);
                END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `errorhistory`
--

CREATE TABLE `errorhistory` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `error_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `errorhistory`
--

INSERT INTO `errorhistory` (`id`, `data`, `status`, `comment`, `user_id`, `error_id`) VALUES
(22, '2018-04-20', '?????', 'asd', 3, 12),
(23, '2018-04-20', '?????', 'asd', 3, 12),
(24, '2018-04-20', '????????', 'asd', 3, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `systemuser`
--

CREATE TABLE `systemuser` (
  `id` int(11) NOT NULL,
  `login` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `systemuser`
--

INSERT INTO `systemuser` (`id`, `login`, `firstname`, `lastname`, `password`) VALUES
(1, '123', '????????', '????', '789'),
(2, '456', '????? ', '??????????', '456'),
(3, '151', 'Aisha', 'Abylgazy', '7877'),
(4, '151Ai', 'Kate', 'Simpsom', '456456'),
(5, '789', 'Adema', 'Tursunkozha', '456789'),
(6, 'Gul1234', 'Gulshat', 'Zhylkibaeva', '123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `error`
--
ALTER TABLE `error`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `errorhistory`
--
ALTER TABLE `errorhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `error_id` (`error_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `systemuser`
--
ALTER TABLE `systemuser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `error`
--
ALTER TABLE `error`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `errorhistory`
--
ALTER TABLE `errorhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `systemuser`
--
ALTER TABLE `systemuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `errorhistory`
--
ALTER TABLE `errorhistory`
  ADD CONSTRAINT `errorhistory_ibfk_1` FOREIGN KEY (`error_id`) REFERENCES `error` (`id`),
  ADD CONSTRAINT `errorhistory_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `systemuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
