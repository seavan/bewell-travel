SET NAMES utf8;

UPDATE `cure_profiles` SET `title`='Болезни сердечно-сосудистой системы' WHERE `id`='1';
UPDATE `cure_profiles` SET `title`='Болезни опорно-двигательного аппарата, болезни костно-мышечной системы' WHERE `id`='4';
UPDATE `cure_profiles` SET `title`='Болезни мочеполовой системы, андрологические заболевания' WHERE `id`='8';
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('11', 'Болезни кожи ', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('12', 'Заболевания крови, кроветворных органов и хронические интоксикации', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('13', 'Реабилитация онкологических больных', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('14', 'Аллергические болезни', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('15', 'Оздоровление пожилых людей', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('16', 'Оздоровление беременных женщин', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('17', 'Оздоровление детей', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('18', 'Общеоздоровительные, wellness программы', '1');
INSERT INTO `cure_profiles` (`id`, `title`, `gender_id`) VALUES ('19', 'Программы красоты: косметология и коррекция фигуры', '1');

