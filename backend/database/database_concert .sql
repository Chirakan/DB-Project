drop table if exists `banking`;
CREATE TABLE `banking` (
  `banking_id` int NOT NULL AUTO_INCREMENT,
  `payment` varchar(20) NOT NULL,
  PRIMARY KEY (`banking_id`),
  UNIQUE KEY `banking_id` (`banking_id`)
);

drop table if exists `hall`;
CREATE TABLE `hall` (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`hall_id`),
  UNIQUE KEY `hall_name_UNIQUE` (`hall_name`),
  UNIQUE KEY `hall_id_UNIQUE` (`hall_id`)
);

drop table if exists `user`;
CREATE TABLE `user` (
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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

drop table if exists `concert`;
CREATE TABLE `concert` (
  `concert_id` int NOT NULL AUTO_INCREMENT,
  `concert_name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `hall_id` int NOT NULL,
  `max_ticket` int DEFAULT NULL,
  `remain_ticket` int DEFAULT NULL,
  PRIMARY KEY (`concert_id`),
  UNIQUE KEY `concert_id_UNIQUE` (`concert_id`),
  UNIQUE KEY `concert_name_UNIQUE` (`concert_name`),
  KEY `concert_hall_hall_id` (`hall_id`),
  CONSTRAINT `concert_hall_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`)
);

drop table if exists `order`;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_email` varchar(255) NOT NULL,
  `total_price` int NOT NULL,
  `banking_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_user_id` (`user_id`),
  KEY `order_banking_banking_id_idx` (`banking_id`),
  CONSTRAINT `order_banking_banking_id` FOREIGN KEY (`banking_id`) REFERENCES `banking` (`banking_id`),
  CONSTRAINT `order_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

drop table if exists `ticket_zone`;
CREATE TABLE `ticket_zone` (
  `ticket_zone_id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `price` int NOT NULL,
  `start_date` datetime NOT NULL,
  `zone` varchar(255) NOT NULL,
  `concert_id` int NOT NULL,
  PRIMARY KEY (`ticket_zone_id`),
  UNIQUE KEY `ticket_zone_id_UNIQUE` (`ticket_zone_id`),
  KEY `ticket_zone_concert_concert_id_idx` (`concert_id`),
  CONSTRAINT `ticket_zone_concert_concert_id` FOREIGN KEY (`concert_id`) REFERENCES `concert` (`concert_id`)
);

drop table if exists `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `concert_id` int NOT NULL,
  `ticket_zone_id` int NOT NULL,
  `seat` varchar(255) NOT NULL,
  `purchase_date` datetime,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_id_UNIQUE` (`ticket_id`),
  KEY `ticket_concert_concert_id_idx` (`concert_id`),
  KEY `ticket_ticket_zone_ticket_zone_id_idx` (`ticket_zone_id`),
  CONSTRAINT `ticket_concert_concert_id` FOREIGN KEY (`concert_id`) REFERENCES `concert` (`concert_id`),
  CONSTRAINT `ticket_ticket_zone_ticket_zone_id` FOREIGN KEY (`ticket_zone_id`) REFERENCES `ticket_zone` (`ticket_zone_id`)
);

drop table if exists `order_ticket`;
CREATE TABLE `order_ticket` (
  `order_ticket_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  PRIMARY KEY (`order_ticket_id`),
  UNIQUE KEY `order_ticket_id_UNIQUE` (`order_ticket_id`),
  KEY `order_ticket_order_order_id_idx` (`order_id`),
  KEY `order_ticket_ticket_ticket_id_idx` (`ticket_id`),
  CONSTRAINT `order_ticket_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_ticket_ticket_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
);

insert into user
values(null, 'Chalitawang' ,  'ชลิตา', 'หนันวงค์ ', 'หญิง', '2002-09-20', '0958786609', 'Chalita2002@gmail.com', 'attn8965', 'ลีลา  ถ.นิมิตใหม่ เขตมีนบุรี กรุงเทพ 10510'),
(null,'NekoRabu03', 'กชกร', 'นิลกำแหง', 'ชาย', '2003-03-03', '0992547812', 'NekoRabu03@gmail.com', 'GHv2546', 'คาซาลีน่า2 ถ.นิมิตใหม่ เขตคลองสามวา  กรุงเทพ 10510'),
(null,'Sinnerdarker', 'นิ่มนาล', 'พลโยธา', 'หญิง', '2002-01-21', '0861124567', 'Boom2545@gmail.com', 'darkness4561', '103 ถ.พหลโยธิน เขตลำลูกา ปทุมธานี 12130'),
(null,'ryoshi', 'ปุณณภา', 'เขมรัฐวงศ์', 'ไม่ระบุ', '2001-05-18', '0812547892', 'Bamryoshi@gmail.com', 'mama54612', '123 ถ.วิภาวดี-รังสิต เขตจตุจักร กรุงเทพ 10900'),
(null,'Tamaw102', 'ชนาพร', 'ไตรโชค', 'ไม่ระบุ', '2003-06-21', '0951479525', 'Isekaiusagi102@gmail.com', 'kratai3000', '299 ถ.บางกรวย-ไทรน้อย เขตบางบัวทอง นนทบุรี 11110'),
(null,'Diaochan', 'ศศิกานต์', 'หลงกระจ่าง', 'หญิง', '1995-08-23', '0826515521', 'koibito128@gmail.com', 'lubuloveme', '253 ถ.แจ้งวัฒนะ เขตหลักสี่ กรุงเทพ 10210'),
(null,'Jett', 'จิรการ', 'ใจศิริ', 'ชาย', '1998-06-10', '0902551133', 'Jettkorea@gmail.com', 'jettreviveme', '2046 ถ.บรรทัดทอง เขตปทุมวัน กรุงเทพ 10330'),
(null,'Raze867', 'ณฐยศ', 'อรุณสุริยศักดิ์', 'ชาย', '2002-12-30', '0915552059', 'RazeNa02@gmail.com', 'bombbuddy', 'คาซาลีน่า1 ถ.นิมิตใหม่ เขตคลองสามวา  กรุงเทพ 10510'),
(null,'JayJay', 'ศุภณัฐ', 'แก้วกุลศรี', 'ชาย', '2002-12-30', '0806965551', 'JainmesJay@gmail.com', 'Jainmes12345', '2055 ถ.บรรทัดทอง เขตปทุมวัน กรุงเทพ 10330'),
(null,'Keqing2005', 'นภิศา', 'พัศระ', 'หญิง', '1995-11-08', '0951592315', 'Ganyu999@gmail.com', 'Liyuemorax', 'ลัดดารมย์บางนา ซ.โรงเรียนราชวินิตบางแก้ว เขตบางพลี สมุทรปราการ 10140'),
(null,'Anantaya', 'อนันตญา', 'ชามทอง', 'หญิง', '1995-11-08', '0957425544', 'Eyeanataya224@gmail.com', 'datelinecomming', 'เคซีการ์เด้นโฮม ถ.นิมิตใหม่ เขตคลองสามวา กรุงเทพ  10510');

alter table hall auto_increment = 1;
insert into hall
values(null,'ธันเดอร์โดม เมืองทองธานี','15000'),
(null,'แลก BKK','150'),
(null,'สนามราชมังคลากีฬาสถาน','51552'),
(null,'SEARCH STUDIO รามคำแหง 81','200'),
(null,'รอยัล พารากอน ฮอลล์ 1','2000'),
(null,'รอยัล พารากอน ฮอลล์ 2','5200'),
(null,'อิมแพ็ค อารีน่า','12000'),
(null,'DE MOON BANGKOK รัชดา ซ.4','500'),
(null,'CENTRAL WORLD SQUARE','0'),
(null,'สามย่าน มิตรทาวน์ ฮอลล์ ','3000'),
(null,'เอ็มซีซีฮอลล์','5000');

alter table concert auto_increment = 1;
insert into concert
values(null,'BOWKYLION LANTA CONCERT','2023-06-18', 1, null, null),
(null,'YourMOOD x MIRRR x แลก BKK Concert','2022-04-27', 2, null, null),
(null,'BLACKPINK BORN PINK World tour Bangkok','2023-05-27', 3, null, null),
(null,'In the Studio with 2 Days Ago Kids','2023-04-01', 4, null, null),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK','2023-06-08', 5, null, null),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK','2023-04-08', 1, null, null),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร','2023-06-30', 7, null, null),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK','2023-04-14', 7, null, null),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์','2023-04-29', 7, null, null),
(null,'DE MOON BANGKOK WATER FESTIVAL','2023-04-12', 8, null, null),
(null,'SUPERFLUID FEST 2023','2023-04-14', 9, null, null);

alter table ticket_zone auto_increment = 1;
insert into ticket_zone
values(null,'BOWKYLION LANTA CONCERT',9800, '2023-06-02', 'A', 1),
(null,'BOWKYLION LANTA CONCERT',7800, '2023-06-02', 'B', 1),
(null,'BOWKYLION LANTA CONCERT',6800, '2023-06-02', 'C', 1),
(null,'BOWKYLION LANTA CONCERT',1800, '2023-06-02', 'D', 1),

(null,'YourMOOD x MIRRR x แลก BKK Concert',990,'2023-03-01', 'A', 2),

(null,'BLACKPINK BORN PINK World tour Bangkok',14800,'2023-03-05', 'A', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',9800,'2023-03-05', 'B', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',7800,'2023-03-05', 'C', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',6800,'2023-03-05', 'D', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',5800,'2023-03-05', 'E', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',4800,'2023-03-05', 'F', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',3800,'2023-03-05', 'G', 3),
(null,'BLACKPINK BORN PINK World tour Bangkok',2800,'2023-03-05', 'H', 3),


(null,'In the Studio with 2 Days Ago Kids',2400,'2023-03-10', 'A', 4),
(null,'In the Studio with 2 Days Ago Kids',1900,'2023-03-10', 'B', 4),

(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',6500,'2023-04-04', 'A', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',5500,'2023-04-04', 'B', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',4500,'2023-04-04', 'C', 5),
(null,'2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK',3000,'2023-04-04', 'D', 5),


(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',5800,'2022-11-13', 'A', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',4800,'2022-11-13', 'B', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',3800,'2022-11-13', 'C', 6),
(null,'ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK',2800,'2022-11-13', 'D', 6),


(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',4500,'2023-03-22', 'A', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',4000,'2023-03-22', 'B', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',3500,'2023-03-22', 'C', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',3000,'2023-03-22', 'D', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',2500,'2023-03-22', 'E', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',2000,'2023-03-22', 'F', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',1500,'2023-03-22', 'G', 7),
(null,'INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร',1200,'2023-03-22', 'H', 7),


(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',6000,'2023-04-05', 'A', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',5800,'2023-04-05', 'B', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',5500,'2023-04-05', 'C', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',4500,'2023-04-05', 'D', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',3500,'2023-04-05', 'E', 8),
(null,'SUGA | Agust D TOUR \'D-DAY\' IN BANGKOK',2500,'2023-04-05', 'F', 8),


(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',6000,'2023-03-08', 'A', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',4500,'2023-03-08', 'B', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',3500,'2023-03-08', 'C', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',3000,'2023-03-08', 'D', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',2500,'2023-03-08', 'E', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',2000,'2023-03-08', 'F', 9),
(null,'คอนเสิร์ต 37 ปี อัสนีและวสันต์',1200,'2023-03-08', 'G', 9),

(null,'DE MOON BANGKOK WATER FESTIVAL',500,'2023-03-15', 'A', 10),

(null,'SUPERFLUID FEST 2023',600,'2023-04-05', 'A', 11);


alter table banking auto_increment = 1;
insert into banking
values(null,'credit/debit card'),
(null,'money'),
(null,'truemoney wallet'),
(null,'direct debit');


alter table `order` auto_increment = 1;
insert into `order`
values(null,6,null, 'koibito128@gmail.com',6000, 4, 1),
(null,9,null, 'JainmesJay@gmail.com',4800, 4, 1),
(null,2,null, 'NekoRabu03@gmail.com',4800, 2, 1),
(null,6,null, 'koibito128@gmail.com',4800, 4, 1),
(null,7,null, 'Jettkorea@gmail.com',3000, 4, 1),
(null,9,null, 'JainmesJay@gmail.com',3000, 4, 1),
(null,5,null, 'Isekaiusagi102@gmail.com',500, 3, 1),
(null,11,null, 'Eyeanataya224@gmail.com',1800, 4, 1),
(null,1,null, 'Chalita2002@gmail.com',990, 1, 1),
(null,4,null, 'Bamryoshi@gmail.com',3500, 4, 1),
(null,2,null, 'NekoRabu03@gmail.com',500, 2, 1),
(null,8,null, 'RazeNa02@gmail.com',500, 4, 1)
;


alter table ticket auto_increment = 1;
insert into ticket
values(null,8,32, 'A10',null),
(null,3,11, 'F5',null),
(null,6,21, 'B30',null),
(null,3,11, 'F20',null),
(null,7,27, 'D10',null),
(null,7,27, 'D5',null),
(null,10,45, 'A1',null),
(null,1,4, 'D50',null),
(null,7,26, 'C57',null),
(null,10,45, 'A2',null),
(null,10,45, 'A3',null)
;

alter table order_ticket auto_increment = 1;
insert into order_ticket
values(null,1,1),
(null,2,2),
(null,3,3),
(null,4,4),
(null,5,5),
(null,6,6),
(null,7,7),
(null,8,8),
(null,9,9),
(null,10,10)
;