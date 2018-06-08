-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 08 2018 г., 16:00
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
-- База данных: `is`
--

-- --------------------------------------------------------

--
-- Структура таблицы `check_moders`
--

CREATE TABLE `check_moders` (
  `id_moder` int(4) NOT NULL,
  `random_moder` int(6) NOT NULL,
  `hash_moder` varchar(100) NOT NULL,
  `last_moder` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `check_moders`
--

INSERT INTO `check_moders` (`id_moder`, `random_moder`, `hash_moder`, `last_moder`) VALUES
(1, 766555, 'c257e51f2d9b050263c6556770e52161', '2018-06-08 13:08:46'),
(2, 56789, 'dfg', '2018-06-08 13:50:42');

-- --------------------------------------------------------

--
-- Структура таблицы `check_user`
--

CREATE TABLE `check_user` (
  `id_user` int(4) NOT NULL,
  `hash_user` varchar(100) NOT NULL,
  `random_user` int(6) NOT NULL,
  `last_user` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `check_user`
--

INSERT INTO `check_user` (`id_user`, `hash_user`, `random_user`, `last_user`) VALUES
(1, 'acd11cb59c206f94a165ccce3b09a55e', 416789, '2018-06-05 13:00:15'),
(2, 'цу', 241, '2018-06-08 13:51:41');

-- --------------------------------------------------------

--
-- Структура таблицы `commands`
--

CREATE TABLE `commands` (
  `id_com` int(4) NOT NULL,
  `name_com` varchar(50) NOT NULL,
  `cap_com` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `commands`
--

INSERT INTO `commands` (`id_com`, `name_com`, `cap_com`) VALUES
(1, 'Котик кусает ссаную тряпку', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `commands_stations`
--

CREATE TABLE `commands_stations` (
  `id_stat_com` int(4) NOT NULL,
  `id_com_stat` int(4) NOT NULL,
  `time_sec` int(2) NOT NULL,
  `id_shtraf` int(4) NOT NULL,
  `status_zagadka` int(1) NOT NULL,
  `id_kur_stat` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `commands_stations`
--

INSERT INTO `commands_stations` (`id_stat_com`, `id_com_stat`, `time_sec`, `id_shtraf`, `status_zagadka`, `id_kur_stat`) VALUES
(1, 1, 79, 2, 1, 1),
(2, 1, 235, 3, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `moders`
--

CREATE TABLE `moders` (
  `id_mod` int(4) NOT NULL,
  `vk_id_mod` varchar(100) NOT NULL,
  `station_mod` int(4) NOT NULL,
  `name_mod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `moders`
--

INSERT INTO `moders` (`id_mod`, `vk_id_mod`, `station_mod`, `name_mod`) VALUES
(1, 'id137952993', 100, 'Черномырдин Владимир'),
(2, 'id363791102', 2, 'Глебас');

-- --------------------------------------------------------

--
-- Структура таблицы `players`
--

CREATE TABLE `players` (
  `id_pl` int(4) NOT NULL,
  `vk_id_pl` varchar(100) NOT NULL,
  `com_pl` int(4) DEFAULT NULL,
  `name_pl` varchar(30) NOT NULL,
  `status_user` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `players`
--

INSERT INTO `players` (`id_pl`, `vk_id_pl`, `com_pl`, `name_pl`, `status_user`) VALUES
(1, 'id137952993', 1, 'Черномырдин Владимир', 0),
(2, 'id363791102', 1, 'Глебас', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shtraf`
--

CREATE TABLE `shtraf` (
  `id_sht` int(4) NOT NULL,
  `shtraf` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shtraf`
--

INSERT INTO `shtraf` (`id_sht`, `shtraf`) VALUES
(1, 0),
(2, 5),
(3, 10),
(4, 15),
(5, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `stations`
--

CREATE TABLE `stations` (
  `id_station` int(4) NOT NULL,
  `name_station` varchar(30) NOT NULL,
  `id_zag_st` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stations`
--

INSERT INTO `stations` (`id_station`, `name_station`, `id_zag_st`) VALUES
(1, 'Залупоньки', 1),
(2, 'Подзалупоньки', 2),
(100, 'МОЙКА 64', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `table_raz`
--

CREATE TABLE `table_raz` (
  `team_id` varchar(7) NOT NULL,
  `COL 2` varchar(2) DEFAULT NULL,
  `COL 3` varchar(2) DEFAULT NULL,
  `COL 4` varchar(2) DEFAULT NULL,
  `COL 5` varchar(2) DEFAULT NULL,
  `COL 6` varchar(2) DEFAULT NULL,
  `COL 7` varchar(2) DEFAULT NULL,
  `COL 8` varchar(2) DEFAULT NULL,
  `COL 9` varchar(2) DEFAULT NULL,
  `COL 10` varchar(2) DEFAULT NULL,
  `COL 11` varchar(3) DEFAULT NULL,
  `COL12` int(2) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `table_raz`
--

INSERT INTO `table_raz` (`team_id`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL12`) VALUES
('1', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 100),
('10', '5', '2', '4', '1', '3', '10', '7', '9', '6', '8', 100),
('11', '1', '4', '2', '5', '3', '6', '9', '7', '10', '8', 100),
('12', '2', '5', '3', '1', '4', '7', '10', '8', '6', '9', 100),
('13', '3', '1', '4', '2', '5', '8', '6', '9', '7', '10', 100),
('14', '4', '2', '5', '3', '1', '9', '7', '10', '8', '6', 100),
('15', '5', '3', '1', '4', '2', '10', '8', '6', '9', '7', 100),
('16', '1', '5', '4', '3', '2', '6', '10', '9', '8', '7', 100),
('17', '2', '1', '5', '4', '3', '7', '6', '10', '9', '8', 100),
('18', '3', '2', '1', '5', '4', '8', '7', '6', '10', '9', 100),
('19', '4', '3', '2', '1', '5', '9', '8', '7', '6', '10', 100),
('2', '2', '3', '4', '5', '1', '7', '8', '9', '10', '6', 100),
('20', '5', '4', '3', '2', '1', '10', '9', '8', '7', '6', 100),
('21', '1', '3', '2', '4', '5', '6', '8', '7', '9', '10', 100),
('22', '3', '2', '4', '1', '5', '8', '7', '9', '6', '10', 100),
('23', '2', '1', '3', '5', '4', '7', '6', '8', '10', '9', 100),
('24', '4', '5', '1', '2', '3', '9', '10', '6', '7', '8', 100),
('25', '5', '4', '2', '3', '1', '10', '9', '7', '8', '6', 100),
('26', '1', '2', '4', '5', '3', '6', '7', '9', '10', '8', 100),
('27', '2', '3', '5', '1', '4', '7', '8', '10', '6', '9', 100),
('28', '3', '1', '5', '4', '2', '8', '6', '10', '9', '7', 100),
('29', '6', '7', '8', '9', '10', '1', '2', '3', '4', '5', 100),
('3', '3', '4', '5', '1', '2', '8', '9', '10', '6', '7', 100),
('30', '7', '8', '9', '10', '6', '2', '3', '4', '5', '1', 100),
('31', '8', '9', '10', '6', '7', '3', '4', '5', '1', '2', 100),
('32', '9', '10', '6', '7', '8', '4', '5', '1', '2', '3', 100),
('33', '10', '6', '7', '8', '9', '5', '1', '2', '3', '4', 100),
('34', '6', '8', '10', '7', '9', '1', '3', '5', '2', '4', 100),
('35', '7', '9', '6', '8', '10', '2', '4', '1', '3', '5', 100),
('36', '8', '10', '7', '9', '6', '3', '5', '2', '4', '1', 100),
('37', '9', '6', '8', '10', '7', '4', '1', '3', '5', '2', 100),
('38', '10', '7', '9', '6', '8', '5', '2', '4', '1', '3', 100),
('39', '6', '9', '7', '10', '8', '1', '4', '2', '5', '3', 100),
('4', '4', '5', '1', '2', '3', '9', '10', '6', '7', '8', 100),
('40', '7', '10', '8', '6', '9', '2', '5', '3', '1', '4', 100),
('41', '8', '6', '9', '7', '10', '3', '1', '4', '2', '5', 100),
('42', '9', '7', '10', '8', '6', '4', '2', '5', '3', '1', 100),
('43', '10', '8', '6', '9', '7', '5', '3', '1', '4', '2', 100),
('44', '6', '10', '9', '8', '7', '1', '5', '4', '3', '2', 100),
('45', '7', '6', '10', '9', '8', '2', '1', '5', '4', '3', 100),
('46', '8', '7', '6', '10', '9', '3', '2', '1', '5', '4', 100),
('47', '9', '8', '7', '6', '10', '4', '3', '2', '1', '5', 100),
('48', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1', 100),
('49', '6', '8', '7', '9', '10', '1', '3', '2', '4', '5', 100),
('5', '5', '1', '2', '3', '4', '10', '6', '7', '8', '9', 100),
('50', '8', '7', '9', '6', '10', '3', '2', '4', '1', '5', 100),
('51', '7', '6', '8', '10', '9', '2', '1', '3', '5', '4', 100),
('52', '9', '10', '6', '7', '8', '4', '5', '1', '2', '3', 100),
('53', '10', '9', '7', '8', '6', '5', '4', '2', '3', '1', 100),
('54', '6', '7', '9', '10', '8', '1', '2', '4', '5', '3', 100),
('55', '7', '8', '10', '6', '9', '2', '3', '5', '1', '4', 100),
('56', '8', '6', '10', '9', '7', '3', '1', '5', '4', '2', 100),
('6', '1', '3', '5', '2', '4', '6', '8', '10', '7', '9', 100),
('7', '2', '4', '1', '3', '5', '7', '9', '6', '8', '10', 100),
('8', '3', '5', '2', '4', '1', '8', '10', '7', '9', '6', 100),
('9', '4', '1', '3', '5', '2', '9', '6', '8', '10', '7', 100),
('team_id', 's1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `timer_station`
--

CREATE TABLE `timer_station` (
  `id_timer` int(4) NOT NULL,
  `id_st_timer` int(4) NOT NULL,
  `id_moder_timer` int(4) NOT NULL,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `timer_station`
--

INSERT INTO `timer_station` (`id_timer`, `id_st_timer`, `id_moder_timer`, `end`, `start`) VALUES
(12, 1, 1, '2018-06-05 10:53:49', '2018-06-05 10:53:42');

-- --------------------------------------------------------

--
-- Структура таблицы `zagadki`
--

CREATE TABLE `zagadki` (
  `id_zag` int(4) NOT NULL,
  `text_zag` varchar(300) NOT NULL,
  `img_zag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zagadki`
--

INSERT INTO `zagadki` (`id_zag`, `text_zag`, `img_zag`) VALUES
(1, 'Пойди туда не знаю куда!(1 загадка)', 'https://i.ytimg.com/vi/E44d0DBqBYU/maxresdefault.jpg'),
(2, 'Принеси то, не знаю чо! (2 загадка)', 'http://rech-deti.ru/upload/iblock/31f/31fef6252c4fc4b537c7fa8f40a410a7.jpg'),
(100, 'Пиздуй на мойку, уёба!', 'https://cs6.pikabu.ru/images/previews_comm/2015-06_3/1434282359182534072.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `check_moders`
--
ALTER TABLE `check_moders`
  ADD PRIMARY KEY (`id_moder`);

--
-- Индексы таблицы `check_user`
--
ALTER TABLE `check_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id_com`),
  ADD KEY `cap_com` (`cap_com`);

--
-- Индексы таблицы `commands_stations`
--
ALTER TABLE `commands_stations`
  ADD PRIMARY KEY (`id_stat_com`,`id_com_stat`),
  ADD KEY `id_shtraf` (`id_shtraf`),
  ADD KEY `id_com_stat` (`id_com_stat`),
  ADD KEY `id_kur_stat` (`id_kur_stat`);

--
-- Индексы таблицы `moders`
--
ALTER TABLE `moders`
  ADD PRIMARY KEY (`id_mod`),
  ADD KEY `station_mod` (`station_mod`);

--
-- Индексы таблицы `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id_pl`),
  ADD KEY `com_pl` (`com_pl`);

--
-- Индексы таблицы `shtraf`
--
ALTER TABLE `shtraf`
  ADD PRIMARY KEY (`id_sht`);

--
-- Индексы таблицы `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id_station`),
  ADD KEY `id_zag_st` (`id_zag_st`);

--
-- Индексы таблицы `table_raz`
--
ALTER TABLE `table_raz`
  ADD PRIMARY KEY (`team_id`);

--
-- Индексы таблицы `timer_station`
--
ALTER TABLE `timer_station`
  ADD PRIMARY KEY (`id_timer`),
  ADD KEY `id_moder_timer` (`id_moder_timer`),
  ADD KEY `id_st_timer` (`id_st_timer`);

--
-- Индексы таблицы `zagadki`
--
ALTER TABLE `zagadki`
  ADD PRIMARY KEY (`id_zag`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `check_moders`
--
ALTER TABLE `check_moders`
  MODIFY `id_moder` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `check_user`
--
ALTER TABLE `check_user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `commands`
--
ALTER TABLE `commands`
  MODIFY `id_com` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `moders`
--
ALTER TABLE `moders`
  MODIFY `id_mod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `players`
--
ALTER TABLE `players`
  MODIFY `id_pl` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `shtraf`
--
ALTER TABLE `shtraf`
  MODIFY `id_sht` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `stations`
--
ALTER TABLE `stations`
  MODIFY `id_station` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `timer_station`
--
ALTER TABLE `timer_station`
  MODIFY `id_timer` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `zagadki`
--
ALTER TABLE `zagadki`
  MODIFY `id_zag` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `check_moders`
--
ALTER TABLE `check_moders`
  ADD CONSTRAINT `check_moders_ibfk_1` FOREIGN KEY (`id_moder`) REFERENCES `moders` (`id_mod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `check_user`
--
ALTER TABLE `check_user`
  ADD CONSTRAINT `check_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `players` (`id_pl`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `commands_ibfk_1` FOREIGN KEY (`cap_com`) REFERENCES `check_user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `commands_stations`
--
ALTER TABLE `commands_stations`
  ADD CONSTRAINT `commands_stations_ibfk_1` FOREIGN KEY (`id_shtraf`) REFERENCES `shtraf` (`id_sht`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commands_stations_ibfk_2` FOREIGN KEY (`id_com_stat`) REFERENCES `commands` (`id_com`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commands_stations_ibfk_3` FOREIGN KEY (`id_stat_com`) REFERENCES `stations` (`id_station`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commands_stations_ibfk_4` FOREIGN KEY (`id_kur_stat`) REFERENCES `check_moders` (`id_moder`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `moders`
--
ALTER TABLE `moders`
  ADD CONSTRAINT `moders_ibfk_1` FOREIGN KEY (`station_mod`) REFERENCES `stations` (`id_station`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`com_pl`) REFERENCES `commands` (`id_com`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `stations`
--
ALTER TABLE `stations`
  ADD CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`id_zag_st`) REFERENCES `zagadki` (`id_zag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `timer_station`
--
ALTER TABLE `timer_station`
  ADD CONSTRAINT `timer_station_ibfk_1` FOREIGN KEY (`id_moder_timer`) REFERENCES `moders` (`id_mod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timer_station_ibfk_2` FOREIGN KEY (`id_st_timer`) REFERENCES `stations` (`id_station`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
