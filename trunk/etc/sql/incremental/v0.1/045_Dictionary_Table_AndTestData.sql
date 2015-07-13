﻿SET NAMES utf8;

CREATE TABLE `dictionary` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `word` VARCHAR(255) NOT NULL COMMENT 'слово',
  `translate` VARCHAR(255) NULL COMMENT 'от какого слова произошло, например \"лат. bronchitis, от бронх + -itis — воспаление\"',
  `explanation` TEXT NULL COMMENT 'значение слова',
PRIMARY KEY (`id`));

INSERT INTO `dictionary` (`word`, `explanation`) VALUES ('Аутизм', 'расстройство, возникающее вследствие нарушения развития головного мозга и характеризующееся выраженным и всесторонним дефицитом социального взаимодействия и общения, а также ограниченными интересами и повторяющимися действиями. ');
INSERT INTO `dictionary` (`word`, `explanation`) VALUES ('Аутоиммунный тиреоидит', 'хроническое воспалительное заболевание щитовидной железы аутоиммунного генеза. Патогенетические механизмы аутоиммунного тиреоидита до конца не выяснены. Причина болезни — частичный генетический дефект иммунной системы, в результате в клетках эндокринных желез происходят специфические морфологические изменения различной степени выраженности (от лимфоплазмоцитарной инфильтрации до фиброзного замещения ткани щитовидной железы)');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Блефарит', 'лат. blepharitis от др.-греч. βλέφαρον — «веко»', 'большая группа разнообразных заболеваний глаз, сопровождающихся хроническим воспалением краев век и трудно поддающихся лечению.');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Болезнь Альцгеймера', 'также сенильная деменция альцгеймеровского типа', 'наиболее распространённая форма деменции, нейродегенеративное заболевание, впервые описанное в 1906 году немецким психиатром Алоисом Альцгеймером. Как правило, она обнаруживается у людей старше 65 лет, но существует и ранняя болезнь Альцгеймера — редкая форма заболевания. Общемировая заболеваемость на 2006 год оценивалась в 26,6 млн человек, а к 2050 году число больных может вырасти вчетверо.');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Бронхит', 'лат. bronchitis, от бронх + -itis — воспаление', 'заболевание дыхательной системы, при котором в воспалительный процесс вовлекаются бронхи. Входит в десятку самых распространенных причин обращения за медицинской помощью. В большинстве случаев острого бронхита его причиной является инфекция, например вирусная или бактериальная, и требуется лечение противовирусными препаратами или антибиотиками. Хронический бронхит может развиваться как осложнение острого, или в результате длительного действия неинфекционных раздражающих факторов, таких как пыль.');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Диарея', 'от др.-греч. διάρροια, народное название — Поно́с', 'патологическое состояние, при котором у больного наблюдается учащённая дефекация, при этом стул становится водянистым. В странах третьего мира диарея является частой причиной младенческой смертности: В 2009 году более 1,5 млн детей (возраста до 5 лет) в год умирают в результате данного патологического состояния.');
INSERT INTO `dictionary` (`word`, `explanation`) VALUES ('Дистония', 'синдром, при котором происходит постоянное либо спазматическое сокращение мышц, затрагивающее как мышцу-агонист, так и антагонистичную ей мышцу. Спазмы мышц часто непредсказуемы, они изменяют нормальное положение тела, могут носить хронический характер и вызывать значительное неудобство, боль и потерю трудоспособности');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Экзема', 'греч. ékzema — высыпание на коже, от ekzéo — вскипаю', 'острое или хроническое незаразное воспалительное заболевание кожи, имеющее нервно-аллергическую природу, характеризующееся разнообразной сыпью, чувством жжения, зудом и склонностью к рецидивам. Возникновению Э. способствуют разнообразные внешние (механические, химические, термические и др.) и внутренние (заболевания печени, почек, желудочно-кишечного тракта, эндокринной, нервной систем и др.) факторы.');
INSERT INTO `dictionary` (`word`, `translate`, `explanation`) VALUES ('Язва', 'лат. ulcus, -eris, n.', 'глубокий воспалённый дефект эпителия кожи или слизистой оболочки и (в отличие от эрозии) базальной мембраны, как правило, возникающий вследствие инфекции, механического, химического или лучевого повреждения, а также в результате нарушения кровоснабжения и/или иннервации. Для язвы, в отличие от раны характерна потеря ткани («минус-ткань»). Язва заживает с образованием рубца.');
