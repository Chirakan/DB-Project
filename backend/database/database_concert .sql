drop table if exists `payments`;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_id` (`payment_id`)
);

drop table if exists `halls`;
CREATE TABLE `halls` (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`hall_id`),
  UNIQUE KEY `hall_name_UNIQUE` (`hall_name`),
  UNIQUE KEY `hall_id_UNIQUE` (`hall_id`)
);

drop table if exists `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthday` date NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `postcode` varchar(5) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

drop table if exists `concerts`;
CREATE TABLE `concerts` (
  `concert_id` int NOT NULL AUTO_INCREMENT,
  `concert_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hall_id` int NOT NULL,
  `max_ticket` int DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`concert_id`),
  UNIQUE KEY `concert_id_UNIQUE` (`concert_id`),
  UNIQUE KEY `concert_name_UNIQUE` (`concert_name`),
  KEY `concert_hall_hall_id` (`hall_id`),
  CONSTRAINT `concert_hall_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`)
);

drop table if exists `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `delivery_email` varchar(255) NOT NULL,
  `total_price` int NOT NULL,
  `payment_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_user_id` (`user_id`),
  KEY `order_banking_payment_id_idx` (`payment_id`),
  CONSTRAINT `order_banking_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  CONSTRAINT `order_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

drop table if exists `ticket_zones`;
CREATE TABLE `ticket_zones` (
  `ticket_zone_id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `price` int NOT NULL,
  `start_date` datetime NOT NULL,
  `zone` varchar(255) NOT NULL,
  `concert_id` int NOT NULL,
  PRIMARY KEY (`ticket_zone_id`),
  UNIQUE KEY `ticket_zone_id_UNIQUE` (`ticket_zone_id`),
  KEY `ticket_zone_concert_concert_id_idx` (`concert_id`),
  CONSTRAINT `ticket_zone_concert_concert_id` FOREIGN KEY (`concert_id`) REFERENCES `concerts` (`concert_id`)
);

drop table if exists `tickets`;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `concert_id` int NOT NULL,
  `ticket_zone_id` int NOT NULL,
  `seat` varchar(255) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_id_UNIQUE` (`ticket_id`),
  KEY `ticket_concert_concert_id_idx` (`concert_id`),
  KEY `ticket_ticket_zone_ticket_zone_id_idx` (`ticket_zone_id`),
  CONSTRAINT `ticket_concert_concert_id` FOREIGN KEY (`concert_id`) REFERENCES `concerts` (`concert_id`),
  CONSTRAINT `ticket_ticket_zone_ticket_zone_id` FOREIGN KEY (`ticket_zone_id`) REFERENCES `ticket_zones` (`ticket_zone_id`)
);

drop table if exists `order_tickets`;
CREATE TABLE `order_tickets` (
  `order_ticket_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  PRIMARY KEY (`order_ticket_id`),
  UNIQUE KEY `order_ticket_id_UNIQUE` (`order_ticket_id`),
  KEY `order_ticket_order_order_id_idx` (`order_id`),
  KEY `order_ticket_ticket_ticket_id_idx` (`ticket_id`),
  CONSTRAINT `order_ticket_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_ticket_ticket_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
);

insert into users
values(null, 'Chalitawang' ,  'ชลิตา', 'หนันวงค์ ', 'หญิง', '2002-09-20', '0958786609', 'Chalita2002@gmail.com', 'attn8965', 'ลีลา  ถ.นิมิตใหม่ เขตมีนบุรี กรุงเทพ','10510'),
(null,'NekoRabu03', 'กชกร', 'นิลกำแหง', 'ชาย', '2003-03-03', '0992547812', 'NekoRabu03@gmail.com', 'GHv2546', 'คาซาลีน่า2 ถ.นิมิตใหม่ เขตคลองสามวา  กรุงเทพ','10510'),
(null,'Sinnerdarker', 'นิ่มนาล', 'พลโยธา', 'หญิง', '2002-01-21', '0861124567', 'Boom2545@gmail.com', 'darkness4561', '103 ถ.พหลโยธิน เขตลำลูกา ปทุมธานี','12130'),
(null,'ryoshi', 'ปุณณภา', 'เขมรัฐวงศ์', 'ไม่ระบุ', '2001-05-18', '0812547892', 'Bamryoshi@gmail.com', 'mama54612', '123 ถ.วิภาวดี-รังสิต เขตจตุจักร กรุงเทพ','10900'),
(null,'Tamaw102', 'ชนาพร', 'ไตรโชค', 'ไม่ระบุ', '2003-06-21', '0951479525', 'Isekaiusagi102@gmail.com', 'kratai3000', '299 ถ.บางกรวย-ไทรน้อย เขตบางบัวทอง นนทบุรี','11110'),
(null,'Diaochan', 'ศศิกานต์', 'หลงกระจ่าง', 'หญิง', '1995-08-23', '0826515521', 'koibito128@gmail.com', 'lubuloveme', '253 ถ.แจ้งวัฒนะ เขตหลักสี่ กรุงเทพ','10210'),
(null,'Jett', 'จิรการ', 'ใจศิริ', 'ชาย', '1998-06-10', '0902551133', 'Jettkorea@gmail.com', 'jettreviveme', '2046 ถ.บรรทัดทอง เขตปทุมวัน กรุงเทพ','10330'),
(null,'Raze867', 'ณฐยศ', 'อรุณสุริยศักดิ์', 'ชาย', '2002-12-30', '0915552059', 'RazeNa02@gmail.com', 'bombbuddy', 'คาซาลีน่า1 ถ.นิมิตใหม่ เขตคลองสามวา  กรุงเทพ','10510'),
(null,'JayJay', 'ศุภณัฐ', 'แก้วกุลศรี', 'ชาย', '2002-12-30', '0806965551', 'JainmesJay@gmail.com', 'Jainmes12345', '2055 ถ.บรรทัดทอง เขตปทุมวัน กรุงเทพ','10330'),
(null,'Keqing2005', 'นภิศา', 'พัศระ', 'หญิง', '1995-11-08', '0951592315', 'Ganyu999@gmail.com', 'Liyuemorax', 'ลัดดารมย์บางนา ซ.โรงเรียนราชวินิตบางแก้ว เขตบางพลี สมุทรปราการ','10140'),

(null,'Anantaya', 'อนันตญา', 'ชามทอง', 'หญิง', '1995-11-08', '0957425544', 'Eyeanataya224@gmail.com', 'datelinecomming', 'เคซีการ์เด้นโฮม ถ.นิมิตใหม่ เขตคลองสามวา กรุงเทพ ','10510'),
(null,'manee' , 'มาริษา', 'ผ่องแก้ว',  'หญิง' , '2002-12-22' , '0819006531', 'mane95@gmail.com', 'manee12345' , '296/1 หมู่ 7 ถนนสุขุมวิท ตำบลบางปูใหม่ อำเภอเมืองสมุทรปราการ สมุทรปราการ','10280'),
(null,'areya54' , 'อารีญา' ,'สายทอง' , 'หญิง'  ,'1999-12-22' , '0984576520', 'areya_saitong@gmail.com' ,'areyasaitong54', 'หมู่ที่ ๒ ตำบลดีหลวง อำเภอสทิงพระ สงขลา','90190'),
(null, 'kob89' , 'กานต์รวี', 'ศรีธาตุ',  'ชาย' , '2003-02-14' ,'0618957618', 'kob89_mainum@gmail.com', 'kobobob990',  '99/9 หมู่1 ตำบลบางเมืองใหม่ อำเภอเมืองสมุทรปราการ สมุทรปราการ' , '10270' ),
(null, 'sayun955' , 'สาญัณ', 'ไผ่ทอง' , 'ชาย' , '2002-08-30' , '0849756123' ,'sayun955@gmail.com', 'sayunsanya57' ,'333 หมู่ 1 ตำบลท่าสุด อำเภอเมือง เชียงราย', '57100'),
(null,'parinya99' , 'ปริณชา', 'แซตั้ง' , 'หญิง', '1996-04-14'  ,  '0987654723' ,'parincha_mayor@gmail.com', 'parinya9968' , '9/1 หมู่ 5 ถนนพหลโยธิน ตำบลคลองหนึ่ง อำเภอคลองหลวง ปทุมธานี' ,'12120'),
(null,'mayyyyyy89' , 'เมรัณญา' ,'อำนาจทองแก้ว' , 'หญิง' , '2003-12-25' , '0689434982' ,'maysincha1@gmail.com' ,'mayyyyyy99' , 'เลขที่ 199 หมู่ที่ 5 ตำบลวิชิต อำเภอเมืองภูเก็ต ภูเก็ต' ,'83000'),
(null,'warunya18' , 'วรัณยา', 'คาบแก้ว' , 'หญิง' , '2003-07-29' , '0846732290', 'warunya_limnum2@gmail.com' ,'warunya1827' , '24  ถ.ห้วยยอด ตำบลทับเที่ยง อำเภอเมือง ตรัง', '92000'),
(null,'wegoxi91' , 'ภารัณ', 'พิสมัย' , 'ชาย' , '2000-04-10'  ,'0637958100' ,'wegoxi9162@gmail.com', 'wegoxi9199'  ,'239 ถนนห้วยแก้ว ตำบลสุเทพ อำเภอเมือง เชียงใหม่' ,'50200' ),
(null,'rayasatu' , 'ราญา' ,'สาธุประดิษฐ์',  'หญิง'  ,'2003-09-22'  ,'0875533456' ,'raya_satu@gmail.com' ,'rayasatuja48' ,'110 ถนนอินทวโรรส ตำบลศรีภูมิ อำเภอเมืองเชียงใหม่ เชียงใหม่' ,'50200'),

(null,'poipo99' , 'โปษัณ','วิเศษ' , 'ชาย', '2001-02-27' , '0697544421','poipo26@gmail.com',  'poipopo9926', '169 ถนนลงหาดบางแสน ตำบลแสนสุข อำเภอเมือง ชลบุรี',  '20131'  )
;

alter table halls auto_increment = 1;
insert into halls
values(null,'ธันเดอร์โดม เมืองทองธานี','15000'),
(null,'แลก BKK','150'),
(null,'สนามราชมังคลากีฬาสถาน','51552'),
(null,'SEARCH STUDIO รามคำแหง 81','200'),
(null,'รอยัล พารากอน ฮอลล์ 1','2000'),
(null,'รอยัล พารากอน ฮอลล์ 2','5200'),
(null,'อิมแพ็ค อารีน่า','12000'),
(null,'DE MOON BANGKOK รัชดา ซ.4','500'),
(null,'CENTRAL WORLD SQUARE',null),
(null,'สามย่าน มิตรทาวน์ ฮอลล์ ','3000'),

(null,'เอ็มซีซีฮอลล์','5000'),
(null,'TRUE ICON HALL, 7th FLOOR, ICONSIAM','3000'),
(null,'True Digital Park Grand Hall','500'),
(null,'อิมแพ็ค เอ็กซิบิชั่น ฮอลล์ 5, เมืองทองธานี','1100'),
(null,'ไบเทค บางนา ฮอลล์ 102 - 104','11000'),
(null,'หอประชุมใหญ่ มหาวิทยาลัยธรรมศาสตร์ ท่าพระจันทร์','2500');

alter table concerts auto_increment = 1;
insert into concerts
values(null,'BOWKYLION LANTA CONCERT','2023-06-18', 1, 5000,'on sale'),
(null,'YourMOOD x MIRRR x แลก BKK Concert','2022-04-27', 2, 150,'sold out'),
(null,'BLACKPINK BORN PINK World tour Bangkok','2023-05-27', 3, 20000,'on sale'),
(null,'In the Studio with 2 Days Ago Kids','2023-04-01', 4, 200,'sold out'),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK','2023-06-08', 5, 1800,'on sale'),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK','2023-04-08', 1, 12000,'sold out'),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร','2023-06-30', 7, 8000,'on sale'),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK','2023-04-14', 7, 10000,'sold out'),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์','2023-04-29', 7, 5000,'sold out'),
(null,'DE MOON BANGKOK WATER FESTIVAL','2023-04-12', 8, 500,'on sale'),

(null,'SUPERFLUID FEST 2023','2023-04-14', 9, null,'on sale'),
(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK','2023-06-04', 14, 1000,'coming soon'),
(null,'BABYMETAL WORLD TOUR 2023 IN BANGKOK','2023-05-28', 12, 5000,'coming soon'),
(null,'BELUCA FOURTIVERSE CONCERT','2023-05-20', 5, 1200,'on sale'),
(null,'ART ROAD SHOWCASE','2023-04-22', 12, null,'on sale'),
(null,'“Heavenly Moment” Kim Mingue Fanmeet in Bangkok','2023-04-22', 8, 250,'on sale'),
(null,'KODALINE LIVE IN BANGKOK','2023-09-16', 14, 1000,'coming soon'),
(null,'Mr.BIG Farewell World Tour','2023-08-07', 11, 2300,'coming soon'),
(null,'THE STAR 2022 SUMMER ZEED PARTY FANCON','2023-04-23', 13, 200,'sold out'),
(null,'YERIN BAEK ASIA-PACIFIC TOUR','2023-06-17', 6, 2500,'on sale')
;





alter table ticket_zones auto_increment = 1;
insert into ticket_zones
values(null,'BOWKYLION LANTA CONCERT',9800, '2023-06-02 10:00:00', 'A', 1),
(null,'BOWKYLION LANTA CONCERT',7800, '2023-06-02 10:00:00', 'B', 1),
(null,'BOWKYLION LANTA CONCERT',6800, '2023-06-02 10:00:00', 'C', 1),
(null,'BOWKYLION LANTA CONCERT',1800, '2023-06-02 10:00:00', 'D', 1),

(null,'YourMOOD x MIRRR x แลก BKK Concert',990,'2023-03-01 10:00:00', 'A', 2),

(null,'BLACKPINK BORN PINK World tour Bangkok',14800,'2023-03-05 10:00:00', 'A', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',9800,'2023-03-05 10:00:00', 'B', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',7800,'2023-03-05 10:00:00', 'C', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',6800,'2023-03-05 10:00:00', 'D', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',5800,'2023-03-05 10:00:00', 'E', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',4800,'2023-03-05 10:00:00', 'F', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',3800,'2023-03-05 10:00:00', 'G', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',2800,'2023-03-05 10:00:00', 'H', 3),


(null,'In the Studio with 2 Days Ago Kids',2400,'2023-03-10 10:00:00', 'A', 4),
(null,'In the Studio with 2 Days Ago Kids',1900,'2023-03-10 10:00:00', 'B', 4),

(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',6500,'2023-04-04 10:00:00', 'A', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',5500,'2023-04-04 10:00:00', 'B', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',4500,'2023-04-04 10:00:00', 'C', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',3000,'2023-04-04 10:00:00', 'D', 5),


(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',5800,'2022-11-13 10:00:00', 'A', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',4800,'2022-11-13 10:00:00', 'B', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',3800,'2022-11-13 10:00:00', 'C', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',2800,'2022-11-13 10:00:00', 'D', 6),


(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',4500,'2023-03-22 10:00:00', 'A', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',4000,'2023-03-22 10:00:00', 'B', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',3500,'2023-03-22 10:00:00', 'C', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',3000,'2023-03-22 10:00:00', 'D', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',2500,'2023-03-22 10:00:00', 'E', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',2000,'2023-03-22 10:00:00', 'F', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',1500,'2023-03-22 10:00:00', 'G', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',1200,'2023-03-22 10:00:00', 'H', 7),


(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',6000,'2023-04-05 10:00:00', 'A', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',5800,'2023-04-05 10:00:00', 'B', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',5500,'2023-04-05 10:00:00', 'C', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',4500,'2023-04-05 10:00:00', 'D', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',3500,'2023-04-05 10:00:00', 'E', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',2500,'2023-04-05 10:00:00', 'F', 8),


(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',6000,'2023-03-08 10:00:00', 'A', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',4500,'2023-03-08 10:00:00', 'B', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',3500,'2023-03-08 10:00:00', 'C', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',3000,'2023-03-08 10:00:00', 'D', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',2500,'2023-03-08 10:00:00', 'E', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',2000,'2023-03-08 10:00:00', 'F', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',1200,'2023-03-08 10:00:00', 'G', 9),

(null,'DE MOON BANGKOK WATER FESTIVAL',500,'2023-03-15 18:00:00', 'A', 10),

(null,'SUPERFLUID FEST 2023',600,'2023-04-05 10:00:00', 'A', 11),

(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK',4800,'2023-04-23 10:00:00', 'A', 12),
(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK',4300,'2023-04-23 10:00:00', 'B', 12),
(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK',3800,'2023-04-23 10:00:00', 'C', 12),
(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK',3300,'2023-04-23 10:00:00', 'D', 12),
(null,'NMIXX SHOWCASE TOUR <NICE TO MIXX YOU> BANGKOK',2300,'2023-04-23 10:00:00', 'E', 12),

(null,'BABYMETAL WORLD TOUR 2023 IN BANGKOK',5500,'2023-04-22 10:00:00', 'A', 13),
(null,'BABYMETAL WORLD TOUR 2023 IN BANGKOK',3500,'2023-04-22 10:00:00', 'B', 13),
(null,'BABYMETAL WORLD TOUR 2023 IN BANGKOK',2500,'2023-04-22 10:00:00', 'C', 13),

(null,'BELUCA FOURTIVERSE CONCERT',9500,'2023-03-25 10:00:00', 'A', 14),
(null,'BELUCA FOURTIVERSE CONCERT',7500,'2023-03-25 10:00:00', 'B', 14),
(null,'BELUCA FOURTIVERSE CONCERT',6500,'2023-03-25 10:00:00', 'C', 14),
(null,'BELUCA FOURTIVERSE CONCERT',6000,'2023-03-25 10:00:00', 'D', 14),
(null,'BELUCA FOURTIVERSE CONCERT',5500,'2023-03-25 10:00:00', 'E', 14),
(null,'BELUCA FOURTIVERSE CONCERT',5000,'2023-03-25 10:00:00', 'F', 14),
(null,'BELUCA FOURTIVERSE CONCERT',4500,'2023-03-25 10:00:00', 'G', 14),
(null,'BELUCA FOURTIVERSE CONCERT',3500,'2023-03-25 10:00:00', 'H', 14),
(null,'BELUCA FOURTIVERSE CONCERT',3000,'2023-03-25 10:00:00', 'I', 14),
(null,'BELUCA FOURTIVERSE CONCERT',2000,'2023-03-25 10:00:00', 'J', 14),
(null,'BELUCA FOURTIVERSE CONCERT',1500,'2023-03-25 10:00:00', 'K', 14),

(null,'ART ROAD SHOWCASE',5800,'2023-04-16 10:00:00', 'A', 15),
(null,'ART ROAD SHOWCASE',4800,'2023-04-16 10:00:00', 'B', 15),
(null,'ART ROAD SHOWCASE',3800,'2023-04-16 10:00:00', 'C', 15),
(null,'ART ROAD SHOWCASE',2800,'2023-04-16 10:00:00', 'D', 15),

(null,'“Heavenly Moment” Kim Mingue Fanmeet in Bangkok',5600,'2023-04-02 10:00:00', 'A', 16),
(null,'“Heavenly Moment” Kim Mingue Fanmeet in Bangkok',4600,'2023-04-02 10:00:00', 'B', 16),
(null,'“Heavenly Moment” Kim Mingue Fanmeet in Bangkok',3600,'2023-04-02 10:00:00', 'C', 16),
(null,'“Heavenly Moment” Kim Mingue Fanmeet in Bangkok',2600,'2023-04-02 10:00:00', 'D', 16),

(null,'“KODALINE LIVE IN BANGKOK',3500,'2023-04-30 14:00:00', 'A', 17),
(null,'“KODALINE LIVE IN BANGKOK',2700,'2023-04-30 14:00:00', 'B', 17),
(null,'“KODALINE LIVE IN BANGKOK',1800,'2023-04-30 14:00:00', 'C', 17),

(null,'Mr.BIG Farewell World Tour',2500,'2023-04-25 10:00:00', 'A', 18),

(null,'THE STAR 2022 SUMMER ZEED PARTY FANCON',1200,'2023-04-05 10:00:00', 'A', 19),
(null,'THE STAR 2022 SUMMER ZEED PARTY FANCON',800,'2023-04-05 10:00:00', 'B', 19),

(null,'YERIN BAEK ASIA-PACIFIC TOUR',3800,'2023-04-05 10:00:00', 'A', 18),
(null,'YERIN BAEK ASIA-PACIFIC TOUR',3200,'2023-04-05 10:00:00', 'B', 18),
(null,'YERIN BAEK ASIA-PACIFIC TOUR',3000,'2023-04-05 10:00:00', 'C', 18),
(null,'YERIN BAEK ASIA-PACIFIC TOUR',2600,'2023-04-05 10:00:00', 'D', 18),
(null,'YERIN BAEK ASIA-PACIFIC TOUR',1800,'2023-04-05 10:00:00', 'E', 18)

;


alter table payments auto_increment = 1;
insert into payments
values(null,'credit/debit card'),
(null,'money'),
(null,'truemoney wallet'),
(null,'direct debit');



alter table orders auto_increment = 1;
insert into orders
values(null,6,'2023-04-05 11:02:22', 'koibito128@gmail.com',6000, 4, 1),
(null,9,'2023-03-05 10:32:22', 'JainmesJay@gmail.com',4800, 4, 1),
(null,2,'2022-11-13 11:35:52', 'NekoRabu03@gmail.com',4800, 2, 1),
(null,6,'2023-03-05 11:35:52', 'koibito128@gmail.com',4800, 4, 1),
(null,7,'2023-03-08 10:00:00' , 'Jettkorea@gmail.com',3000, 4, 1),
(null,9,'2023-03-08 10:00:00' , 'JainmesJay@gmail.com',3000, 4, 1),
(null,5,'2023-03-08 10:00:00', 'Isekaiusagi102@gmail.com',500, 3, 1),
(null,11,'2023-03-08 10:00:00', 'Eyeanataya224@gmail.com',1800, 4, 1),
(null,1,'2023-03-08 10:00:00', 'Chalita2002@gmail.com',990, 1, 1),
(null,4,'2023-03-08 10:00:00', 'Bamryoshi@gmail.com',3500, 4, 1),

(null,2,'2023-03-08 10:00:00', 'NekoRabu03@gmail.com',500, 2, 1),
(null,8, '2023-03-08 10:00:00', 'RazeNa02@gmail.com',500, 4, 0),
(null,1, '2023-03-08 10:00:00', 'Chalita2002@gmail.com',5800, 2, 1),
(null,2, '2023-03-08 10:00:00', 'NekoRabu03@gmail.com',2800, 2, 1),
(null,3, '2023-03-08 10:00:00', 'Boom2545@gmail.com',2800, 4, 0),
(null,4, '2023-03-08 10:00:00', 'Bamryoshi@gmail.com',2800, 2, 1),
(null,5, '2023-03-08 10:00:00' , 'Isekaiusagi102@gmail.com',2800, 2, 1),
(null,6, '2023-03-08 10:00:00', 'koibito128@gmail.com',4800, 2, 1),
(null,7, '2023-03-08 10:00:00', 'Jettkorea@gmail.com',2800, 4, 1),
(null,8, '2023-03-08 10:00:00', 'RazeNa02@gmail.com',3800, 2, 0),

(null,7, '2023-03-08 10:00:00', 'Jettkorea@gmail.com',5000, 4, 0),
(null,9, '2023-03-08 10:00:00', 'JainmesJay@gmail.com',5000, 4, 1),
(null,1, '2023-03-08 10:00:00', 'Chalita2002@gmail.com',1200, 1, 1),
(null,1, '2023-03-08 10:00:00', 'Chalita2002@gmail.com',7800, 1, 1),
(null,5, '2023-03-08 10:00:00', 'Isekaiusagi102@gmail.com',1200, 3, 1),
(null,11, '2023-03-08 10:00:00', 'Eyeanataya224@gmail.com',1800, 4, 1),
(null,9, '2023-03-08 10:00:00', 'JainmesJay@gmail.com',5800, 4, 1),
(null,10, '2023-03-08 10:00:00', 'Ganyu999@gmail.com',7800, 4, 1),
(null,13, '2023-03-08 10:00:00', 'areya_saitong@gmail.com',14800, 2, 1),
(null,18, '2023-03-08 10:00:00', 'warunya_limnum2@gmail.com',7800, 4, 1)

;

alter table tickets auto_increment = 1;
insert into tickets
values(null,8,32, 'A10','2023-04-05 11:02:22'),
(null,3,11, 'F5','2023-04-05 11:02:22'),
(null,6,21, 'B30','2023-04-05 11:02:22'),
(null,3,11, 'F20','2023-04-05 11:02:22'),
(null,9,27, 'D10','2023-04-05 11:02:22'),
(null,9,27, 'D5','2023-04-05 11:02:22'),
(null,10,45, 'A1','2023-04-05 11:02:22'),
(null,1,4, 'D50','2023-04-05 11:02:22'),
(null,2,5, 'A1','2023-04-05 11:02:22'),
(null,7,26, 'C57','2023-04-05 11:02:22'),


(null,10,45, 'A2','2023-04-05 11:02:22'),
(null,10,45, 'A3','2023-04-05 11:02:22'),
(null,15,52, 'A1','2023-04-05 11:02:22'),
(null,15,68, 'D1','2023-04-05 11:02:22'),
(null,15,68, 'D2','2023-04-05 11:02:22'),
(null,15,68, 'D3','2023-04-05 11:02:22'),
(null,15,68, 'D4','2023-04-05 11:02:22'),
(null,15,53, 'B1','2023-04-05 11:02:22'),
(null,15,68, 'D5','2023-04-05 11:02:22'),
(null,15,45, 'C1','2023-04-05 11:02:22'),

(null,14,45, 'F1','2023-04-05 11:02:22'),
(null,14,45, 'F2','2023-04-05 11:02:22'),
(null,19,45, 'A1','2023-04-05 11:02:22'),
(null,3,8, 'C1','2023-04-05 11:02:22'),
(null,19,45, 'A2','2023-04-05 11:02:22'),
(null,1,45, 'D1','2023-04-05 11:02:22'),
(null,15,45, 'A2','2023-04-05 11:02:22'),
(null,3,8, 'C5','2023-04-05 11:02:22'),
(null,3,6, 'A30','2023-04-05 11:02:22'),
(null,3,8, 'C1','2023-04-05 11:02:22')
;

alter table order_tickets auto_increment = 1;
insert into order_tickets
values(null,1,1),
(null,2,2),
(null,3,3),
(null,4,4),
(null,5,5),
(null,6,6),
(null,7,7),
(null,8,8),
(null,9,9),
(null,10,10),

(null,11,11),
(null,12,12),
(null,13,13),
(null,14,14),
(null,15,15),
(null,16,16),
(null,17,17),
(null,18,18),
(null,19,19),
(null,20,20),

(null,21,21),
(null,22,22),
(null,23,23),
(null,24,24),
(null,25,25),
(null,26,26),
(null,27,27),
(null,28,28),
(null,29,29),
(null,30,30)
;