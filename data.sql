INSERT INTO Base(Name,Location) VALUES
('Дельта','Северная часть'),
('Альфа','Южная часть'),
('Браво','Южная часть');

INSERT INTO Energon(Capacity,Type,Kkal,EnoughDays) VALUES
(3005,'Usual',3296,2),
(7800,'Usual',4096,5),
(2000,'Dark',8096,1);

INSERT INTO Transport(Name,Status,Location) VALUES
('Хаммер','Активна','На базе'),
('ХаммерX2','В ромнте','На базе'),
('ХаммерX3','Активна','Неизвестно');

INSERT INTO Operation(Name,start_time,end_time,Enemie,Location) VALUES
('Мир','2000-02-15 10:00:00','2000-03-15 10:00:00','Десептиконы','Кибертрон'),
('Земля','2001-04-19 13:00:00','2003-01-17 15:00:00','Десептиконы','Кибертрон'),
('Тайфун','2003-08-27 21:00:00','2003-08-29 21:00:00','Люди','Земля');

INSERT INTO Equipment(SpecialArmor,Communication,Midecal,Energon_ID) VALUES
('Ligth','Рация',2,3),
('Medium','Нету',1,2),
('Heavy','Станция',3,1);
INSERT INTO EquipmentType(Equipment_ID,EquipmentType) VALUES
(2,1),
(1,2),
(3,3);

INSERT INTO Weapon(Name,Type,Calliber,Rate_of_fire,FiringRange) VALUES
('AWP','Снайперсская винтовка',10.2,5,4000),
('GLOCK-18','Пистолет',5.12,25,100),
('M4A1-S','Винтовка',7.59,50,1000);

INSERT INTO Position(Name,Rank,EquipmentType_ID,Squad) VALUES
('Рядовой','Младший',1,'GF'),
('Сержант','Старший',2,'GF'),
('Командир','Главный',3,'GF');

INSERT INTO Transformer(Name,Date_of_build,Position_ID,Base_ID,Status) VALUES
('Оптимус Прайм','1995-04-13 17:30:45',3,1,'Жив'),
('Джаз','1998-08-20 11:35:10',1,2,'Жив'),
('Айрохайд','1990-11-17 13:15:18',2,3,'Жив');

INSERT INTO Modification(Name,Date_of_modification ,ModificationPart,IsChecked) VALUES
('Оптика','1994-11-17 18:49:18','Head',TRUE),
('Лазер','1999-08-20 16:20:15','Hand',TRUE),
('Меч','1997-04-13 22:15:46','Hand',TRUE);

INSERT INTO SigmaCard(Transformer_ID,Height_m,Weight_t,Modification_ID) VALUES
(1,10,25,3),
(2,4,10,1),
(3,8,18,2);

INSERT INTO Operation_Transformer(Transformer_ID,Operation_ID) VALUES
(1,3),
(2,2),
(3,1);

INSERT INTO Operation_Transport(Transport_ID ,Operation_ID) VALUES
(1,3),
(2,2),
(3,1);

INSERT INTO Equipment_Weapon(Equipment_ID,Weapon_ID) VALUES
(1,3),
(2,2),
(3,1);

INSERT INTO Inspection(Transport_ID,Transformer_ID,ServiceDate,Discription) VALUES
(1,3,'2000-03-15 10:00:00','В порядке'),
(2,2,'2003-01-17 15:00:00','Все в норме'),
(3,1,'2003-08-29 21:00:00','На слом');

