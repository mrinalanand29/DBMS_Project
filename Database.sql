DROP DATABASE PROJECT2;
CREATE DATABASE PROJECT2;
use PROJECT2;

CREATE TABLE `CUSTOMER` (
  `Customer_ID` Integer NOT NULL auto_increment,
  `Name` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(500) NOT NULL UNIQUE,
  `Contact_No` VARCHAR(15) NOT NULL,
  `Reg_Date` Date not null check(Reg_Date>20220101),
  `Address` VARCHAR(500) NOT NULL,
  `Points` Integer DEFAULT 0 check(Points>=0),
  PRIMARY KEY (`Customer_ID`)
);

CREATE TABLE `CATEGORIES` (
  `Category_ID` Integer NOT NULL auto_increment,
  `Category_Name` VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (`Category_ID`)
);

CREATE TABLE `SELLER` (
  `Seller_ID` Integer NOT NULL auto_increment,
  `Name` VARCHAR(50) NOT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `Contact_No` VARCHAR(15) NOT NULL,
  `Email_Id` VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (`Seller_ID`)
);

CREATE TABLE `PRODUCTS` (
  `Product_ID` Integer auto_increment,
  `Category_ID` Integer NOT NULL,
  `Name` VARCHAR (50) not null,
  `Price` Float NOT NULL check(Price>0),
  `Quantity_Available` Integer DEFAULT 0,
  `Seller_ID` Integer NOT NULL,
  `Days_to_Arrive` Integer NOT NULL check(Days_to_Arrive>=0),
  `Description` VARCHAR(500) NOT NULL,
  `ImageSource` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  FOREIGN KEY(Category_ID) REFERENCES CATEGORIES(Category_ID), 
FOREIGN KEY(Seller_ID) REFERENCES SELLER(Seller_ID)
);

CREATE TABLE `Reviews` (
    `Review_ID` INTEGER NOT NULL auto_increment,
    `Text` VARCHAR(500),
    `Stars` INTEGER NOT NULL check(Stars>0 and Stars<=5),
    `RCustomerID` INTEGER NOT NULL,
    `Product_ID` INTEGER NOT NULL,
    `TimeStamp` TIMESTAMP NOT NULL,
    PRIMARY KEY (`Review_ID`),
    FOREIGN KEY (RCustomerID)
        REFERENCES CUSTOMER (Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES PRODUCTS (Product_ID)
);

CREATE TABLE `Cart` (
  `Cart_ID` INTEGER NOT NULL auto_increment,
  `CCustomerID` Integer NOT NULL,
  `Order_Placed` VARCHAR(20),
  PRIMARY KEY (`Cart_ID`),
FOREIGN KEY(CCustomerID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE `Cart_Items` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cart_id` INT,
  `product_id` INT,
  `quantity` INT,
  
	FOREIGN KEY (cart_id) REFERENCES Cart(Cart_ID),
  FOREIGN KEY (product_id) REFERENCES Products(Product_ID)
  );

CREATE TABLE `Orders` (
   `Order_ID` Integer check(Order_ID>0),
  `OCustomerID` Integer NOT NULL,
  `Date_Of_Delivery` Date NOT NULL check(Date_Of_Delivery>20220101),
  `Cart_ID` Integer NOT NULL,
  PRIMARY KEY (`Order_ID`), 
FOREIGN KEY(OCustomerID) REFERENCES Customer(Customer_ID), 
FOREIGN KEY(Cart_ID) REFERENCES Cart(Cart_ID)
);

CREATE TABLE `Payment` (
   `Payment_ID` Integer NOT NULL auto_increment,
  `OrderID` Integer NOT NULL,
  `Type` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(15) NOT NULL check(Status='FAILED' or Status='PROCESSING' or Status='SUCCESSFUL'),
  `DatePayment` Date NOT NULL check(DatePayment>20220101),
  `Amount` Float NOT NULL,
  PRIMARY KEY (`Payment_ID`), 
FOREIGN KEY(OrderID) REFERENCES Orders(Order_ID) 

);

CREATE TABLE `Delivery_Person` (
  `DP_ID` Integer auto_increment,
  `Name` VARCHAR(100) NOT NULL,
  `DOJ` Date NOT NULL check(DOJ>20210101),
  `Contact` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`DP_ID`)
);

CREATE TABLE `Deliveries` (
  `Delivery_ID` Integer NOT NULL AUTO_INCREMENT,
  `Order_ID` Integer NOT NULL,
  `DP_ID` Integer NOT NULL,
  `Delivery_Status` VARCHAR(50) NOT NULL,
  `DateofDelivery` date not null check(DateofDelivery>20210101),
FOREIGN KEY(Order_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY(DP_ID) REFERENCES Delivery_Person(DP_ID),
PRIMARY KEY(`Delivery_ID`)
);

CREATE TABLE `LoginDetails` (
	`Username` VARCHAR(50) NOT NULL UNIQUE,
    `Password` VARCHAR(20) NOT NULL,
    `Type` VARCHAR(10) not null,
    `Id` int not null,
    primary key(`Type`, ID)
);

insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (1, 'Sheelah Charnley', 'scharnley0@deliciousdays.com', '636-259-9337', '2023-11-29 03:26:12', '18th Floor', 52);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (2, 'Dorthy Schollick', 'dschollick1@vinaora.com', '178-624-4735', '2023-06-20 14:40:36', 'Suite 83', 31);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (3, 'Ansley Poutress', 'apoutress2@microsoft.com', '587-877-1452', '2023-08-12 17:19:58', 'Apt 987', 44);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (4, 'Barbi Stock', 'bstock3@free.fr', '877-936-7461', '2023-08-22 08:18:11', '8th Floor', 11);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (5, 'Trevor Kener', 'tkener4@boston.com', '893-302-8882', '2023-03-26 15:17:38', 'Suite 35', 51);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (6, 'Talbert Mereweather', 'tmereweather5@smugmug.com', '974-701-5943', '2023-02-26 07:07:23', 'Apt 1074', 63);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (7, 'Horton Rubinowitsch', 'hrubinowitsch6@printfriendly.com', '208-625-3094', '2023-09-05 17:28:21', 'Apt 1328', 11);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (8, 'Carlina Cordel', 'ccordel7@epa.gov', '953-746-4574', '2023-09-18 11:52:21', '9th Floor', 54);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (9, 'Florida Pachmann', 'fpachmann8@prweb.com', '656-455-6843', '2023-06-16 11:33:53', 'Room 1512', 88);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (10, 'Beniamino Jezzard', 'bjezzard9@kickstarter.com', '735-710-2572', '2023-02-20 08:46:55', 'Suite 63', 88);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (11, 'Aloisia Sherington', 'asheringtona@uiuc.edu', '880-291-5205', '2023-04-14 16:55:13', '11th Floor', 8);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (12, 'Loutitia Pratten', 'lprattenb@china.com.cn', '325-221-8718', '2023-10-21 08:09:25', 'Room 275', 8);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (13, 'Donetta Heinert', 'dheinertc@ocn.ne.jp', '549-710-8612', '2023-09-07 17:52:20', 'Room 1096', 43);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (14, 'Cord Dwane', 'cdwaned@zimbio.com', '795-475-1496', '2023-03-07 12:12:33', '18th Floor', 69);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (15, 'Den Sergant', 'dsergante@t-online.de', '198-685-2994', '2023-08-14 23:12:01', '9th Floor', 60);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (16, 'Husein Diano', 'hdianof@bandcamp.com', '669-600-7291', '2024-02-01 03:34:37', '11th Floor', 50);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (17, 'Wilfred Couling', 'wcoulingg@cbsnews.com', '825-327-8376', '2023-08-22 01:09:13', '12th Floor', 57);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (18, 'Susan Simm', 'ssimmh@blogger.com', '585-378-6358', '2023-05-13 04:53:01', 'Suite 81', 88);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (19, 'Garrett Aiken', 'gaikeni@princeton.edu', '143-131-8276', '2023-08-27 22:25:08', 'Apt 1619', 5);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (20, 'Veda Walkley', 'vwalkleyj@java.com', '444-960-8666', '2023-06-16 18:22:40', 'Apt 1785', 28);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (21, 'Knox Cescon', 'kcesconk@webeden.co.uk', '769-228-9879', '2023-12-24 03:25:32', 'PO Box 1785', 10);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (22, 'Rourke Linklater', 'rlinklaterl@bravesites.com', '671-334-5205', '2023-10-22 09:02:01', 'Room 1581', 4);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (23, 'Hasheem De Freyne', 'hdem@merriam-webster.com', '791-826-6542', '2023-10-31 16:13:03', 'PO Box 69609', 4);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (24, 'Caria Dunstone', 'cdunstonen@purevolume.com', '929-832-6502', '2023-11-02 12:06:15', '19th Floor', 24);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (25, 'Karia Baptie', 'kbaptieo@yolasite.com', '553-390-6112', '2023-09-26 17:08:30', 'PO Box 57113', 76);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (26, 'Hinze Clurow', 'hclurowp@studiopress.com', '667-925-1291', '2024-02-04 17:55:54', 'Room 1427', 15);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (27, 'Allyce Gorvette', 'agorvetteq@icio.us', '296-500-1201', '2023-03-31 02:08:19', '20th Floor', 54);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (28, 'Ailyn Huncoot', 'ahuncootr@jigsy.com', '396-652-3706', '2023-08-06 06:29:35', 'Apt 579', 77);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (29, 'Fields Klaus', 'fklauss@arizona.edu', '201-970-6609', '2023-12-14 23:45:12', 'Suite 71', 97);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (30, 'Nicky Asee', 'naseet@usgs.gov', '102-740-1355', '2023-02-10 22:51:37', 'Suite 100', 72);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (31, 'Myron Priden', 'mpridenu@senate.gov', '178-676-6614', '2023-08-21 14:14:00', 'Room 198', 53);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (32, 'Herta Adamovitch', 'hadamovitchv@yandex.ru', '285-770-2858', '2023-12-25 12:46:09', 'Apt 1874', 34);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (33, 'Gerry Berkelay', 'gberkelayw@soundcloud.com', '764-494-9759', '2023-09-02 08:33:31', 'Room 1504', 57);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (34, 'Graham Vial', 'gvialx@bloomberg.com', '227-622-1512', '2023-03-18 16:43:30', 'Suite 41', 34);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (35, 'Jefferson Mellody', 'jmellodyy@typepad.com', '764-848-7592', '2024-01-08 15:05:17', 'Room 1795', 42);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (36, 'Davidson Jauncey', 'djaunceyz@soup.io', '456-182-4988', '2023-09-13 18:49:47', 'PO Box 68632', 27);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (37, 'Deeann Caulder', 'dcaulder10@ftc.gov', '135-572-0560', '2023-03-22 22:19:24', '4th Floor', 70);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (38, 'Dido Dumbleton', 'ddumbleton11@redcross.org', '196-836-2917', '2023-07-06 10:17:49', 'Room 1240', 43);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (39, 'Birgitta Gotcliffe', 'bgotcliffe12@state.tx.us', '966-948-7370', '2023-06-15 21:49:48', '18th Floor', 38);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (40, 'Homerus Cleminson', 'hcleminson13@va.gov', '714-287-0763', '2023-03-11 15:43:51', 'Apt 199', 64);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (41, 'Flem Pail', 'fpail14@uiuc.edu', '138-715-1202', '2023-11-20 12:55:12', '6th Floor', 38);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (42, 'Lynett Matuszkiewicz', 'lmatuszkiewicz15@nature.com', '938-876-3202', '2023-03-27 01:32:27', '3rd Floor', 29);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (43, 'Gisella Jorden', 'gjorden16@amazon.com', '806-401-3906', '2023-07-14 21:39:47', 'Suite 38', 74);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (44, 'Judd Lightbowne', 'jlightbowne17@360.cn', '997-964-4104', '2023-04-29 03:40:54', 'PO Box 98941', 98);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (45, 'Anett Calbaithe', 'acalbaithe18@behance.net', '680-533-1685', '2023-11-17 08:28:22', 'PO Box 70118', 80);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (46, 'Codee Savin', 'csavin19@fc2.com', '666-862-7857', '2023-07-10 02:15:28', 'PO Box 63051', 40);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (47, 'Giraldo Ensley', 'gensley1a@wufoo.com', '587-810-8512', '2024-01-30 19:27:25', '3rd Floor', 30);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (48, 'Dulce Mushrow', 'dmushrow1b@unblog.fr', '412-881-9052', '2024-02-06 18:26:06', 'Room 1333', 84);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (49, 'Janela Reiners', 'jreiners1c@wufoo.com', '149-264-9028', '2023-11-03 04:16:12', 'Apt 982', 97);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (50, 'Steffane Espinas', 'sespinas1d@over-blog.com', '993-153-7417', '2023-09-26 02:04:03', '11th Floor', 71);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (51, 'Morgan Arnison', 'marnison1e@theglobeandmail.com', '777-683-8349', '2023-09-07 17:02:37', '6th Floor', 96);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (52, 'Dave Oland', 'doland1f@creativecommons.org', '792-104-6571', '2023-10-05 09:16:30', '12th Floor', 44);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (53, 'Dall Woodberry', 'dwoodberry1g@sciencedaily.com', '514-592-7302', '2023-08-28 18:37:35', 'PO Box 50357', 42);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (54, 'Bone Ferrillio', 'bferrillio1h@1688.com', '801-209-5726', '2023-05-16 05:34:09', 'Apt 1050', 9);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (55, 'Danya Sutterby', 'dsutterby1i@google.com.br', '280-564-9709', '2024-01-19 00:22:45', 'Suite 98', 54);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (56, 'Stephanus Bruckmann', 'sbruckmann1j@princeton.edu', '389-393-2415', '2023-05-11 20:59:46', 'Suite 20', 73);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (57, 'Jewell Garretson', 'jgarretson1k@jugem.jp', '130-452-7438', '2023-12-11 07:38:09', 'Apt 9', 65);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (58, 'Latrena Angerstein', 'langerstein1l@google.it', '750-470-5303', '2024-02-01 22:31:21', 'Suite 91', 36);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (59, 'Carie Bradbrook', 'cbradbrook1m@house.gov', '658-107-9339', '2023-09-15 07:56:12', 'Apt 1468', 32);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (60, 'Guthrie Arends', 'garends1n@indiegogo.com', '987-780-0539', '2023-05-02 20:35:43', 'Room 882', 93);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (61, 'Hilliary Pettingall', 'hpettingall1o@symantec.com', '730-680-2869', '2023-09-11 02:15:06', 'Room 1036', 97);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (62, 'Bev Marnes', 'bmarnes1p@weibo.com', '979-838-7047', '2023-05-10 19:51:50', 'Room 561', 20);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (63, 'Regen Yakobovicz', 'ryakobovicz1q@drupal.org', '920-914-3869', '2023-06-01 14:42:30', 'Suite 38', 99);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (64, 'Rachael Ruffles', 'rruffles1r@miitbeian.gov.cn', '754-840-9175', '2023-08-15 08:33:52', 'Room 1379', 47);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (65, 'Carmina MacTimpany', 'cmactimpany1s@paginegialle.it', '250-502-6633', '2023-08-09 13:27:08', 'Apt 1209', 3);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (66, 'Vallie Baglow', 'vbaglow1t@sohu.com', '191-783-5321', '2023-03-04 01:13:56', 'PO Box 65414', 80);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (67, 'Marietta Fawks', 'mfawks1u@discuz.net', '216-769-3698', '2023-05-21 03:32:35', 'PO Box 18172', 25);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (68, 'Wallas Reynard', 'wreynard1v@smugmug.com', '421-505-1252', '2023-05-21 08:03:11', '10th Floor', 49);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (69, 'Marvin Kimbrey', 'mkimbrey1w@wp.com', '864-299-9963', '2023-03-13 10:03:56', '20th Floor', 66);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (70, 'Eada Bris', 'ebris1x@cbslocal.com', '322-937-5905', '2023-08-07 02:17:00', 'Suite 86', 18);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (71, 'Mariejeanne Rops', 'mrops1y@twitpic.com', '263-746-7549', '2023-11-30 18:43:22', 'Suite 58', 4);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (72, 'Roz Geraudy', 'rgeraudy1z@tuttocitta.it', '380-302-6001', '2023-10-25 20:37:07', 'Apt 815', 38);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (73, 'Bobbette Kornilov', 'bkornilov20@ifeng.com', '270-209-1164', '2023-02-26 15:10:46', 'Suite 56', 61);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (74, 'Bond Lankham', 'blankham21@accuweather.com', '142-197-6077', '2024-02-08 05:24:15', 'Suite 3', 47);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (75, 'Aristotle Rodinger', 'arodinger22@google.com', '851-710-6648', '2023-02-21 08:37:51', 'PO Box 32807', 42);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (76, 'Hally Sinton', 'hsinton23@about.me', '599-791-9532', '2023-09-01 17:14:31', 'Apt 1691', 21);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (77, 'Leroi Parramore', 'lparramore24@myspace.com', '980-946-8389', '2023-09-26 13:32:04', 'PO Box 75059', 19);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (78, 'Jae Errey', 'jerrey25@businesswire.com', '962-271-2059', '2023-06-01 16:48:56', 'Apt 1617', 38);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (79, 'Guthrie Cathel', 'gcathel26@ow.ly', '988-726-6843', '2023-07-10 10:44:47', 'Room 292', 53);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (80, 'Alford Uttermare', 'auttermare27@privacy.gov.au', '713-287-7249', '2023-10-26 18:21:51', 'Room 941', 26);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (81, 'Jackie Franchi', 'jfranchi28@kickstarter.com', '282-401-9182', '2023-08-20 07:24:33', 'Room 375', 89);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (82, 'Morganica Dedam', 'mdedam29@techcrunch.com', '320-179-6141', '2023-05-31 03:21:35', 'Suite 77', 4);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (83, 'Amble Lapre', 'alapre2a@elpais.com', '340-745-0440', '2023-08-12 07:18:22', '19th Floor', 43);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (84, 'Rosaline Drable', 'rdrable2b@oakley.com', '622-566-3229', '2023-02-16 01:35:07', 'PO Box 13322', 32);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (85, 'Ozzy Walkington', 'owalkington2c@opensource.org', '485-220-6955', '2023-11-22 02:24:38', '12th Floor', 1);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (86, 'Eleonore Barchrameev', 'ebarchrameev2d@miibeian.gov.cn', '804-492-7866', '2023-11-16 13:32:07', 'Room 1585', 68);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (87, 'Tracee Viel', 'tviel2e@guardian.co.uk', '424-525-1429', '2023-08-24 18:23:08', '11th Floor', 2);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (88, 'Noami Bricknall', 'nbricknall2f@phoca.cz', '540-791-3629', '2023-05-09 00:39:28', 'PO Box 94612', 91);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (89, 'Valeda Whetland', 'vwhetland2g@loc.gov', '130-922-0229', '2023-12-04 01:16:48', '14th Floor', 66);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (90, 'Tybalt Dalyell', 'tdalyell2h@51.la', '557-778-3410', '2023-10-30 09:03:22', 'Apt 1471', 1);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (91, 'Edsel Gemlbett', 'egemlbett2i@twitter.com', '878-558-6597', '2024-02-07 03:43:10', 'Room 387', 72);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (92, 'Arte Cicero', 'acicero2j@about.com', '194-967-9290', '2023-10-05 01:15:45', 'PO Box 36394', 66);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (93, 'Drud Burner', 'dburner2k@usatoday.com', '212-214-3767', '2023-10-16 07:21:47', 'PO Box 61048', 97);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (94, 'Linus Tunny', 'ltunny2l@istockphoto.com', '670-729-2934', '2023-10-29 13:07:49', 'Room 1204', 18);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (95, 'Bertram Dorcey', 'bdorcey2m@oracle.com', '356-920-8006', '2023-04-30 06:26:33', 'Apt 407', 89);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (96, 'Rich Marquis', 'rmarquis2n@cargocollective.com', '908-249-1857', '2023-10-05 20:38:13', '4th Floor', 12);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (97, 'Brent Leuty', 'bleuty2o@arstechnica.com', '962-302-8112', '2023-04-18 02:32:52', 'Apt 1685', 24);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (98, 'Boycey Belf', 'bbelf2p@pcworld.com', '219-513-4263', '2023-11-01 14:49:52', 'PO Box 47309', 58);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (99, 'Boyce Roselli', 'broselli2q@google.de', '871-861-2277', '2023-12-27 14:18:40', 'Suite 79', 4);
insert into CUSTOMER (Customer_ID, Name, Email, Contact_No, Reg_Date, Address, Points) values (100, 'Fitz Duckers', 'fduckers2r@census.gov', '734-210-4441', '2023-10-21 11:14:56', 'Apt 633', 15);


insert into CATEGORIES (Category_ID, Category_Name) values (1, 'Electronics');
insert into CATEGORIES (Category_ID, Category_Name) values (2, 'Footwear');
insert into CATEGORIES (Category_ID, Category_Name) values (3, 'Accessories');
insert into CATEGORIES (Category_ID, Category_Name) values (4, 'Clothes');
insert into CATEGORIES (Category_ID, Category_Name) values (5, 'Appliances');
insert into CATEGORIES (Category_ID, Category_Name) values (6, 'Furniture');
insert into CATEGORIES (Category_ID, Category_Name) values (7, 'Home Decor');
insert into CATEGORIES (Category_ID, Category_Name) values (8, 'Groceries');
insert into CATEGORIES (Category_ID, Category_Name) values (9, 'Bath and Bodyworks');
insert into CATEGORIES (Category_ID, Category_Name) values (10, 'Fitness');

insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (1, 'Wells Panswick', '563 Fulton Plaza', 'wpanswick0@cbslocal.com', '993-163-8143');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (2, 'Niall Rupel', '90 Charing Cross Court', 'nrupel1@vk.com', '708-678-1450');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (3, 'Hillier Ghidoli', '77831 Sherman Avenue', 'hghidoli2@google.co.jp', '819-570-4262');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (4, 'Livvie Stucksbury', '8006 5th Hill', 'lstucksbury3@webs.com', '569-609-9785');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (5, 'Steven Monier', '68 Green Avenue', 'smonier4@ycombinator.com', '269-818-8783');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (6, 'Rusty Thursfield', '0 Buell Park', 'rthursfield5@umich.edu', '794-617-0686');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (7, 'Shina Clunan', '3523 Crowley Street', 'sclunan6@reference.com', '841-559-2580');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (8, 'Payton Sellar', '01 Manitowish Trail', 'psellar7@thetimes.co.uk', '903-471-3763');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (9, 'Lisle Tottie', '08609 Kropf Way', 'ltottie8@fc2.com', '193-881-2060');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (10, 'Gae Lock', '91510 Melrose Crossing', 'glock9@friendfeed.com', '632-560-1866');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (11, 'Lauri Hagland', '403 Service Court', 'lhaglanda@adobe.com', '780-103-7989');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (12, 'Andre Aulsford', '54254 Old Shore Plaza', 'aaulsfordb@tiny.cc', '507-567-7664');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (13, 'Jakie Clute', '898 Sunnyside Trail', 'jclutec@google.pl', '263-455-7392');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (14, 'Syman Ranken', '7 Shelley Pass', 'srankend@networksolutions.com', '442-149-9334');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (15, 'Cyrus Speake', '89 Mcguire Alley', 'cspeakee@sun.com', '700-838-3251');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (16, 'Mabel Gildersleeve', '7677 Evergreen Hill', 'mgildersleevef@columbia.edu', '688-592-9188');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (17, 'Brandy Elijah', '767 Shoshone Trail', 'belijahg@oaic.gov.au', '370-746-1923');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (18, 'Pru O''Fogerty', '126 Judy Point', 'pofogertyh@cnet.com', '917-834-5585');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (19, 'Oona Blaske', '86725 Vahlen Street', 'oblaskei@so-net.ne.jp', '143-179-5076');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (20, 'Shirline Caltera', '9194 Center Drive', 'scalteraj@drupal.org', '899-981-6834');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (21, 'Abagail A''Barrow', '3597 Reindahl Alley', 'aabarrowk@dell.com', '526-108-2006');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (22, 'Burty Van der Beek', '28631 Little Fleur Point', 'bvanl@patch.com', '317-561-5800');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (23, 'Georgine Jemmison', '9203 Spaight Pass', 'gjemmisonm@dropbox.com', '176-178-2274');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (24, 'Carling Hammerstone', '42 Prentice Point', 'chammerstonen@buzzfeed.com', '468-123-8440');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (25, 'Kenna Tomsa', '587 Lunder Terrace', 'ktomsao@nifty.com', '773-322-6283');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (26, 'Guthrey Guyet', '8932 Talmadge Hill', 'gguyetp@biblegateway.com', '790-466-1651');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (27, 'Shel Paradise', '45777 Sunfield Plaza', 'sparadiseq@usnews.com', '561-466-6960');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (28, 'Caitrin Lakenden', '80 Messerschmidt Trail', 'clakendenr@buzzfeed.com', '858-311-3686');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (29, 'Osborn Partridge', '65 Farragut Junction', 'opartridges@issuu.com', '349-542-6268');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (30, 'Lorena Verbruggen', '178 Kingsford Point', 'lverbruggent@wufoo.com', '874-981-4180');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (31, 'Nevsa Gartrell', '595 Katie Pass', 'ngartrellu@wiley.com', '644-557-3449');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (32, 'Cleve Welds', '0 Mallory Point', 'cweldsv@google.fr', '894-507-3655');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (33, 'Walden Starkie', '855 Browning Crossing', 'wstarkiew@soup.io', '255-687-6029');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (34, 'Valle Sallan', '0965 Rutledge Way', 'vsallanx@nytimes.com', '991-519-4972');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (35, 'Gideon Candelin', '9 Caliangt Plaza', 'gcandeliny@hostgator.com', '419-662-2058');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (36, 'Brendin Bilney', '2087 Dexter Pass', 'bbilneyz@arizona.edu', '142-572-0755');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (37, 'Way Browning', '40563 Holmberg Junction', 'wbrowning10@shutterfly.com', '569-191-8361');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (38, 'Engelbert Vickery', '7 Fremont Way', 'evickery11@wired.com', '268-400-4674');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (39, 'Brnaba Poff', '386 Maple Wood Avenue', 'bpoff12@kickstarter.com', '188-269-6998');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (40, 'Daisie Chomicki', '815 Clarendon Circle', 'dchomicki13@hhs.gov', '911-616-3074');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (41, 'Arturo Hawney', '93897 Troy Pass', 'ahawney14@topsy.com', '271-216-5055');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (42, 'Keely Broek', '901 Atwood Park', 'kbroek15@opera.com', '655-506-6005');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (43, 'Bebe Toxell', '50692 Larry Way', 'btoxell16@miibeian.gov.cn', '857-215-6728');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (44, 'Karel Leeds', '51122 Algoma Alley', 'kleeds17@paypal.com', '480-614-0211');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (45, 'Cami Nerger', '66865 Bluejay Park', 'cnerger18@cnbc.com', '202-405-8879');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (46, 'Patrice Cargon', '27 Thackeray Plaza', 'pcargon19@epa.gov', '263-409-6081');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (47, 'Anne-corinne Paunsford', '30 Portage Circle', 'apaunsford1a@rediff.com', '262-934-5042');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (48, 'Mischa Tremoulet', '044 Toban Place', 'mtremoulet1b@yale.edu', '682-816-9600');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (49, 'Sunshine Jakubski', '977 Glendale Alley', 'sjakubski1c@webnode.com', '332-664-5699');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (50, 'Suzann Duggary', '18593 Johnson Drive', 'sduggary1d@cnn.com', '976-486-4465');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (51, 'Jocelyn Gulliman', '0660 Mayfield Alley', 'jgulliman1e@rakuten.co.jp', '651-667-7503');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (52, 'Marinna Breach', '079 Dorton Circle', 'mbreach1f@arstechnica.com', '912-526-9299');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (53, 'Kristien Claybourne', '30896 Orin Road', 'kclaybourne1g@usa.gov', '797-123-2383');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (54, 'Mala Johnston', '04 Monterey Crossing', 'mjohnston1h@foxnews.com', '445-824-6142');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (55, 'Simon Cowan', '569 Sugar Trail', 'scowan1i@rakuten.co.jp', '925-434-2309');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (56, 'Byrann Acland', '52776 Anzinger Trail', 'bacland1j@jimdo.com', '427-811-1652');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (57, 'Ricard Kennan', '96496 Shelley Terrace', 'rkennan1k@smugmug.com', '673-696-7911');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (58, 'Juliane Trevaskiss', '4689 Lighthouse Bay Alley', 'jtrevaskiss1l@reuters.com', '595-172-2519');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (59, 'Quintana Tyre', '4204 Ruskin Court', 'qtyre1m@msu.edu', '911-141-1541');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (60, 'Daryle Galiford', '819 Blackbird Road', 'dgaliford1n@chicagotribune.com', '514-735-1202');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (61, 'Farah Strotton', '27 Comanche Place', 'fstrotton1o@naver.com', '953-956-4097');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (62, 'Marita Twigge', '6686 New Castle Road', 'mtwigge1p@1und1.de', '671-285-3964');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (63, 'Diena Durant', '56 Village Hill', 'ddurant1q@census.gov', '235-546-8215');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (64, 'Evey MacGuffog', '80121 Petterle Point', 'emacguffog1r@economist.com', '885-741-8802');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (65, 'Gaven Filippozzi', '94 Namekagon Junction', 'gfilippozzi1s@indiatimes.com', '119-179-4291');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (66, 'Dorian Verdy', '06305 Marcy Pass', 'dverdy1t@edublogs.org', '633-436-7383');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (67, 'Fifine Snipe', '9744 Oak Center', 'fsnipe1u@cpanel.net', '508-294-8070');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (68, 'Tomasina Warke', '87 Rusk Terrace', 'twarke1v@example.com', '962-549-7695');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (69, 'Veriee Kensington', '46 Mayfield Junction', 'vkensington1w@behance.net', '406-868-4508');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (70, 'Leah Gealle', '25 Ruskin Street', 'lgealle1x@friendfeed.com', '214-416-3697');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (71, 'Rosene Kynett', '6411 Atwood Way', 'rkynett1y@admin.ch', '588-223-6336');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (72, 'Mario Rosson', '095 Shopko Lane', 'mrosson1z@cornell.edu', '593-254-1089');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (73, 'Lorne Storre', '4592 Dunning Crossing', 'lstorre20@unesco.org', '984-305-7456');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (74, 'Gratiana Bussetti', '2 Sugar Park', 'gbussetti21@slashdot.org', '858-150-3488');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (75, 'Kalindi Gerrietz', '25309 Eagle Crest Road', 'kgerrietz22@berkeley.edu', '768-827-8813');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (76, 'Peg Crookall', '0773 Di Loreto Alley', 'pcrookall23@so-net.ne.jp', '505-896-7436');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (77, 'Riordan Yokel', '63774 Schmedeman Pass', 'ryokel24@exblog.jp', '524-325-5778');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (78, 'Carly Reese', '87 Shasta Terrace', 'creese25@lulu.com', '944-642-0006');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (79, 'Lorant Halloway', '2 Bluestem Crossing', 'lhalloway26@angelfire.com', '626-729-4691');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (80, 'Wenona Hamal', '9 Bultman Trail', 'whamal27@icio.us', '594-477-5525');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (81, 'Carmine Heiner', '146 Oneill Terrace', 'cheiner28@theglobeandmail.com', '943-165-5849');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (82, 'Ilse Kamenar', '5 8th Alley', 'ikamenar29@reference.com', '382-578-1576');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (83, 'Sully Costar', '90160 Vera Road', 'scostar2a@360.cn', '777-225-2460');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (84, 'Bruis Kilius', '16 Sunfield Terrace', 'bkilius2b@reverbnation.com', '613-214-6411');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (85, 'Ingar Smead', '2 Texas Terrace', 'ismead2c@icio.us', '667-659-4686');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (86, 'Ambur Gerok', '81 Corry Parkway', 'agerok2d@miitbeian.gov.cn', '555-298-1379');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (87, 'Jacques De Andreis', '83 Magdeline Hill', 'jde2e@ovh.net', '425-676-2720');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (88, 'Minna Sutherden', '09980 School Plaza', 'msutherden2f@go.com', '113-604-4701');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (89, 'Valentine Fancett', '8 Cambridge Court', 'vfancett2g@sun.com', '613-521-3930');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (90, 'Gaylord Sebring', '98652 Steensland Pass', 'gsebring2h@prweb.com', '344-518-8476');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (91, 'Guntar Tern', '17 Green Ridge Trail', 'gtern2i@parallels.com', '591-987-7453');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (92, 'Iseabal Mathan', '52 Anthes Drive', 'imathan2j@google.com', '744-613-5037');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (93, 'Harman Sawdon', '34802 David Court', 'hsawdon2k@macromedia.com', '757-940-6510');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (94, 'Filmore Fawthrop', '0 Summit Hill', 'ffawthrop2l@abc.net.au', '802-153-6265');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (95, 'Eldon Southcombe', '3 West Trail', 'esouthcombe2m@webs.com', '111-558-8452');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (96, 'Helsa Kembley', '108 Emmet Road', 'hkembley2n@ihg.com', '470-848-6580');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (97, 'Olimpia Force', '71 Almo Park', 'oforce2o@sciencedaily.com', '611-259-1566');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (98, 'Agnes Mynard', '18 Kim Court', 'amynard2p@skype.com', '330-680-9618');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (99, 'Isebal Mathan', '55 Anthes Drive', 'imathDFGj@google.com', '744-613-5033');
insert into SELLER (Seller_ID, Name, location, Email_Id, Contact_No) values (100, 'Is Math', '52 Anth Drive', 'ima@google.com', '742-613-5037');

insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (1, 8, 'Red Quebracho', 30213.75, 271, 51, 4, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 'http://dummyimage.com/202x120.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (2, 1, 'Scrub Gilia', 9003.45, 605, 60, 1, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', 'http://dummyimage.com/173x157.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (3, 1, 'Clustered Goldenweed', 71125.0, 439, 64, 8, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/160x127.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (4, 8, 'Whiteflower Beach Morning-glory', 25502.19, 721, 72, 3, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'http://dummyimage.com/214x138.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (5, 6, 'Trumpets', 41688.83, 544, 92, 3, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 'http://dummyimage.com/189x248.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (6, 9, 'Largebract Ticktrefoil', 39352.59, 643, 92, 1, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'http://dummyimage.com/215x246.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (7, 1, 'Lesley''s Rimmed Lichen', 12613.48, 558, 19, 6, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/100x165.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (8, 8, 'Nevada Cryptantha', 22136.14, 637, 15, 8, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/130x149.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (9, 10, 'Dwarf Mountain Lupine', 66322.59, 45, 20, 2, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 'http://dummyimage.com/162x206.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (10, 6, 'Fringed Nutrush', 31707.81, 450, 99, 9, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/115x227.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (11, 9, 'Dotted Bristle Fern', 3420.68, 556, 50, 4, 'Proin eu mi. Nulla ac enim.', 'http://dummyimage.com/182x101.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (12, 9, 'South American Skullcap', 45474.8, 804, 36, 2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/117x178.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (13, 5, 'Sprucemont Flax', 63441.0, 218, 26, 10, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'http://dummyimage.com/165x107.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (14, 4, 'Hairyflower Bellflower', 6897.23, 383, 93, 2, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'http://dummyimage.com/208x129.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (15, 6, 'Pineland Pinweed', 12319.78, 614, 48, 10, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/191x197.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (16, 3, 'Snow Mountain Buckwheat', 30515.5, 980, 31, 9, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/149x183.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (17, 2, 'Indian Sandbur', 2749.13, 621, 16, 4, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'http://dummyimage.com/217x181.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (18, 2, 'Mt. Shasta Arnica', 34944.35, 99, 2, 3, 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/109x176.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (19, 9, 'Prairie Hawthorn', 41061.9, 207, 44, 7, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/130x238.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (20, 4, 'Low Bulrush', 5210.62, 562, 92, 3, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/160x110.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (21, 10, 'Yellow Fringeless Orchid', 38468.22, 450, 27, 1, 'Etiam pretium iaculis justo.', 'http://dummyimage.com/191x106.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (22, 1, 'Baldwin Lake Linanthus', 10043.41, 59, 40, 7, 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/157x172.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (23, 2, 'Hairy-tuft Four O''clock', 392.95, 806, 28, 6, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 'http://dummyimage.com/139x192.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (24, 4, 'Desertbells', 14734.19, 423, 88, 5, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 'http://dummyimage.com/153x159.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (25, 7, 'Lakecress', 93613.04, 412, 33, 8, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'http://dummyimage.com/236x124.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (26, 1, 'Colton''s Milkvetch', 63357.57, 817, 97, 6, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/155x217.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (27, 7, 'Dwarf False Pennyroyal', 64695.75, 391, 40, 1, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/138x201.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (28, 1, 'Neolaugeria', 56055.1, 922, 91, 7, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/120x239.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (29, 5, 'Dakota Sarcogyne Lichen', 69678.41, 235, 94, 3, 'Proin eu mi. Nulla ac enim.', 'http://dummyimage.com/167x136.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (30, 3, 'Myrionora', 49461.74, 133, 35, 3, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 'http://dummyimage.com/176x121.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (31, 6, 'Dactylospora Lichen', 9255.78, 331, 65, 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/168x168.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (32, 9, 'Scarlet Larkspur', 64959.69, 533, 82, 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'http://dummyimage.com/135x205.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (33, 6, 'Fourleaf Manyseed', 92797.29, 579, 67, 2, 'In congue.', 'http://dummyimage.com/250x103.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (34, 6, 'Dwarf Oak', 81907.92, 200, 82, 2, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/195x247.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (35, 1, 'Tinantia', 72398.65, 438, 77, 4, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/203x121.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (36, 1, 'Wand Goldenrod', 57980.91, 879, 28, 10, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'http://dummyimage.com/231x215.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (37, 3, 'White Spanishbroom', 24309.5, 318, 98, 10, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/197x156.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (38, 8, 'Alpine Bedstraw', 15834.18, 102, 68, 2, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 'http://dummyimage.com/169x229.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (39, 1, 'Broom Brome', 57602.52, 717, 91, 3, 'Phasellus id sapien in sapien iaculis congue.', 'http://dummyimage.com/181x169.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (40, 6, 'Whipple Cholla', 41389.33, 167, 57, 9, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'http://dummyimage.com/142x202.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (41, 3, 'Cylinder Jointtail Grass', 47142.05, 504, 90, 10, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/138x239.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (42, 1, 'Porpidia Lichen', 81371.64, 982, 61, 5, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'http://dummyimage.com/216x220.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (43, 7, 'Lady''s Tresses', 35346.73, 559, 61, 1, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 'http://dummyimage.com/201x241.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (44, 5, 'Menzies'' Pepperweed', 62798.17, 40, 18, 7, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/118x239.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (45, 7, 'Alabama Croton', 95282.69, 511, 54, 8, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/242x233.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (46, 7, 'Hawthorn', 15782.98, 741, 40, 1, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 'http://dummyimage.com/111x103.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (47, 5, 'Hygroamblystegium Moss', 67424.1, 521, 22, 10, 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'http://dummyimage.com/217x214.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (48, 1, 'Common Bamboo', 48743.82, 531, 62, 10, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', 'http://dummyimage.com/195x136.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (49, 3, 'Yellow Marsh Saxifrage', 46025.2, 614, 59, 5, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'http://dummyimage.com/159x124.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (50, 9, 'Smooth White Aster', 64677.16, 701, 46, 1, 'Nulla nisl.', 'http://dummyimage.com/116x205.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (51, 8, 'Grassland Tarweed', 99732.02, 678, 62, 8, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/224x206.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (52, 8, 'Dwarfdandelion', 36037.02, 264, 18, 2, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/162x178.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (53, 2, 'Haleakala Sandalwood', 77626.5, 712, 81, 1, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 'http://dummyimage.com/237x178.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (54, 1, 'Apache Plume', 74776.95, 673, 63, 4, 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'http://dummyimage.com/130x230.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (55, 8, 'Bay County Indian Plantain', 61418.67, 20, 58, 3, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'http://dummyimage.com/141x119.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (56, 9, 'Spreading Moonpod', 72522.84, 209, 26, 5, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/145x144.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (57, 6, 'Eucalyptus', 34219.76, 641, 38, 1, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 'http://dummyimage.com/132x188.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (58, 4, 'Craters Of The Moon Cushion Buckwheat', 86772.46, 21, 44, 9, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 'http://dummyimage.com/229x243.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (59, 10, 'Little Bluestem', 34175.88, 80, 85, 2, 'Phasellus in felis.', 'http://dummyimage.com/175x175.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (60, 9, 'Chaparral Asphead', 67535.62, 741, 49, 6, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/195x201.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (61, 2, 'Silver Vine', 23311.82, 44, 59, 2, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/224x223.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (62, 3, 'Open Lupine', 74374.45, 355, 67, 2, 'In hac habitasse platea dictumst.', 'http://dummyimage.com/157x198.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (63, 2, 'Tall Oatgrass', 12460.93, 213, 69, 6, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 'http://dummyimage.com/209x228.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (64, 3, 'Dot Lichen', 5146.75, 337, 85, 7, 'Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/168x103.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (65, 7, 'Bicknell''s Milkvetch', 23844.55, 528, 70, 10, 'In hac habitasse platea dictumst.', 'http://dummyimage.com/172x175.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (66, 3, 'Blackroot Sedge', 3353.08, 61, 67, 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/213x173.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (67, 4, 'Alkali Sandmat', 62347.54, 351, 4, 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 'http://dummyimage.com/168x193.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (68, 4, 'Rillita Pellitory', 81506.59, 976, 50, 7, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/177x107.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (69, 8, 'Thurber''s Fescue', 71793.83, 687, 23, 6, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 'http://dummyimage.com/146x147.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (70, 10, 'Field Eryngo', 59531.42, 256, 33, 1, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/135x166.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (71, 5, 'Cowhage Cherry', 191.01, 814, 11, 3, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/178x103.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (72, 10, 'Wisconsin Blackberry', 29685.61, 3, 12, 9, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 'http://dummyimage.com/240x146.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (73, 3, 'Mojave Cryptantha', 34585.23, 772, 3, 3, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'http://dummyimage.com/248x138.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (74, 10, 'Lemmon''s Cinquefoil', 74924.65, 214, 20, 4, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 'http://dummyimage.com/217x109.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (75, 10, 'Wingleaf Soapberry', 97242.8, 239, 37, 3, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/248x116.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (76, 9, 'Miniature Lupine', 65000.01, 306, 49, 2, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'http://dummyimage.com/154x145.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (77, 6, 'Red Passionflower', 78806.95, 551, 15, 2, 'Suspendisse accumsan tortor quis turpis. Sed ante.', 'http://dummyimage.com/162x138.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (78, 9, 'Fogfruit', 43116.79, 771, 40, 1, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'http://dummyimage.com/189x200.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (79, 5, 'Climbing False Buckwheat', 98111.89, 241, 13, 6, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'http://dummyimage.com/162x177.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (80, 4, 'Mexican Skullcap', 12248.4, 897, 71, 3, 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/208x189.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (81, 5, 'Owlfruit Sedge', 87715.77, 457, 2, 9, 'Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/173x238.png/ff4444/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (82, 9, 'Erect Milkpea', 85856.87, 360, 1, 6, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'http://dummyimage.com/227x211.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (83, 2, 'Lecidea Lichen', 95447.22, 68, 78, 4, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://dummyimage.com/153x152.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (84, 6, 'Bird-of-paradise', 82430.41, 793, 100, 3, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'http://dummyimage.com/116x119.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (85, 10, 'Brothera Moss', 71861.27, 312, 78, 8, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/162x140.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (86, 2, 'Entireleaf Indian Paintbrush', 59164.63, 871, 38, 8, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'http://dummyimage.com/234x121.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (87, 8, 'Dwarf Mountain Lupine', 64895.16, 830, 18, 1, 'Sed ante.', 'http://dummyimage.com/232x182.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (88, 2, 'Rose Thistle', 38231.68, 268, 18, 1, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 'http://dummyimage.com/172x110.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (89, 8, 'White Prairie Clover', 36352.06, 468, 58, 8, 'Duis aliquam convallis nunc.', 'http://dummyimage.com/174x173.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (90, 6, 'Dopatrium', 39052.1, 196, 43, 8, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/203x156.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (91, 2, 'Fogg''s Goosefoot', 60067.28, 153, 59, 3, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/158x238.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (92, 8, 'Brook Saxifrage', 7082.16, 284, 40, 8, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'http://dummyimage.com/174x118.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (93, 9, 'Low Spearwort', 92206.96, 660, 51, 5, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 'http://dummyimage.com/126x135.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (94, 6, 'Cheerful Sunflower', 6036.28, 697, 22, 2, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/181x215.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (95, 8, 'Small Beggarticks', 28421.0, 412, 82, 6, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/213x155.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (96, 9, 'Lowbush Blueberry', 12120.65, 150, 61, 10, 'Proin risus.', 'http://dummyimage.com/236x233.png/dddddd/000000');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (97, 4, 'Dooryard Dock', 35974.15, 753, 55, 10, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'http://dummyimage.com/129x195.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (98, 3, 'Rio Grande Palafox', 19281.87, 8, 48, 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 'http://dummyimage.com/131x159.png/5fa2dd/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (99, 5, 'Narrow-petal Rein Orchid', 26700.33, 359, 15, 1, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/188x245.png/cc0000/ffffff');
insert into PRODUCTS (Product_ID, Category_ID, Name, Price, Quantity_Available, Seller_ID, Days_to_Arrive, Description, ImageSource) values (100, 2, 'Tropical Desert-thorn', 88046.6, 247, 24, 5, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/158x106.png/5fa2dd/ffffff');


insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (1, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 3, 81, 100, '2023-05-15 01:03:04');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (2, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5, 62, 98, '2023-02-28 02:13:11');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (3, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1, 45, 44, '2023-06-06 10:04:01');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (4, 'In eleifend quam a odio.', 3, 53, 51, '2023-05-22 07:03:09');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (5, 'Suspendisse potenti.', 1, 54, 83, '2023-04-23 12:53:01');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (6, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 3, 96, 10, '2023-03-13 04:14:33');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (7, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1, 62, 87, '2023-06-09 04:44:50');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (8, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 2, 95, 99, '2023-11-30 11:57:44');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (9, 'Proin risus.', 5, 37, 53, '2023-03-21 17:49:10');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (10, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 4, 33, 71, '2023-12-16 03:07:46');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (11, 'Sed ante.', 5, 9, 82, '2023-12-09 16:23:22');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (12, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 2, 100, 36, '2023-12-07 11:23:46');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (13, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 4, 6, 50, '2023-09-23 08:06:28');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (14, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 4, 68, 30, '2023-07-26 07:55:12');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (15, 'Suspendisse potenti.', 3, 61, 34, '2023-11-02 00:42:42');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (16, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 3, 89, 59, '2023-02-27 03:21:43');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (17, 'Donec vitae nisi.', 2, 58, 22, '2023-09-28 21:25:54');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (18, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 5, 29, 12, '2023-08-05 05:01:04');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (19, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 4, 97, 17, '2023-12-23 22:26:53');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (20, 'Integer ac leo. Pellentesque ultrices mattis odio.', 4, 35, 18, '2023-10-23 21:23:02');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (21, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 5, 86, 47, '2023-11-13 03:58:58');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (22, 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 2, 16, 7, '2023-05-06 02:01:19');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (23, 'In eleifend quam a odio. In hac habitasse platea dictumst.', 2, 36, 56, '2023-09-29 21:21:05');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (24, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1, 82, 18, '2023-01-19 02:37:41');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (25, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 4, 13, 57, '2023-07-28 23:12:48');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (26, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 4, 49, 44, '2023-11-24 20:58:00');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (27, 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 3, 29, 31, '2023-02-09 07:08:05');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (28, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 3, 20, 71, '2023-06-18 21:57:14');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (29, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 3, 99, 55, '2023-11-08 22:36:21');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (30, 'Integer a nibh. In quis justo.', 4, 60, 94, '2023-08-22 16:34:17');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (31, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 5, 81, 13, '2023-11-04 15:10:35');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (32, 'Pellentesque viverra pede ac diam.', 2, 61, 41, '2023-06-10 14:26:22');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (33, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 4, 57, 19, '2023-12-09 20:13:04');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (34, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 69, 35, '2023-06-30 01:46:18');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (35, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 3, 86, 76, '2023-01-17 21:30:52');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (36, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1, 97, 19, '2023-02-14 17:40:59');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (37, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 3, 81, 46, '2023-12-09 04:18:40');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (38, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4, 29, 91, '2023-04-07 04:34:48');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (39, 'Nulla justo.', 1, 48, 11, '2023-08-15 21:52:43');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (40, 'Etiam justo. Etiam pretium iaculis justo.', 3, 45, 98, '2023-03-03 22:38:40');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (41, 'Fusce consequat. Nulla nisl.', 4, 8, 87, '2023-10-30 07:09:49');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (42, 'Sed accumsan felis. Ut at dolor quis odio consequat varius.', 2, 41, 55, '2023-04-16 22:49:33');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (43, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 3, 64, 41, '2023-01-25 23:02:50');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (44, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 1, 47, 19, '2023-03-15 18:25:55');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (45, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 3, 13, 91, '2023-06-23 03:29:30');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (46, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, 91, 46, '2023-07-28 15:40:35');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (47, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 5, 9, 75, '2023-09-01 04:48:56');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (48, 'Duis bibendum.', 3, 3, 56, '2023-05-22 19:18:32');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (49, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', 4, 8, 59, '2023-10-31 09:22:17');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (50, 'Quisque id justo sit amet sapien dignissim vestibulum.', 3, 81, 78, '2023-08-06 09:38:57');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (51, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1, 93, 52, '2023-05-16 16:02:30');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (52, 'Duis at velit eu est congue elementum.', 2, 71, 4, '2023-09-17 13:35:05');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (53, 'Sed accumsan felis. Ut at dolor quis odio consequat varius.', 2, 2, 88, '2023-11-07 05:14:30');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (54, 'Nulla ut erat id mauris vulputate elementum.', 3, 97, 32, '2023-12-21 03:18:15');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (55, 'Ut at dolor quis odio consequat varius. Integer ac leo.', 3, 18, 27, '2023-04-10 21:54:19');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (56, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 3, 60, 76, '2023-12-07 18:50:58');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (57, 'Nulla justo.', 3, 20, 98, '2023-05-04 09:29:51');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (58, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 3, 93, 77, '2023-09-30 10:31:29');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (59, 'Nullam porttitor lacus at turpis.', 4, 65, 29, '2023-12-16 06:56:48');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (60, 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 3, 11, 3, '2023-11-19 18:40:33');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (61, 'Morbi non quam nec dui luctus rutrum.', 3, 30, 84, '2023-05-12 22:04:47');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (62, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 2, 28, 54, '2023-07-20 21:47:54');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (63, 'Nulla tellus.', 3, 87, 60, '2023-01-23 03:52:35');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (64, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 2, 87, 78, '2023-10-17 03:40:14');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (65, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 3, 34, 92, '2023-02-28 08:45:56');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (66, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 2, 10, 71, '2023-01-02 17:05:24');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (67, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 5, 65, 42, '2023-06-17 07:33:35');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (68, 'Etiam faucibus cursus urna. Ut tellus.', 5, 81, 51, '2023-10-25 16:15:08');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (69, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 2, 47, 24, '2023-07-16 00:27:19');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (70, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 4, 80, 11, '2023-10-16 13:52:40');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (71, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1, 91, 81, '2023-06-12 03:24:15');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (72, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 5, 37, 77, '2023-11-08 20:16:34');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (73, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 2, 79, 32, '2023-11-12 23:04:30');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (74, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 3, 74, 84, '2023-05-30 06:49:34');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (75, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2, 19, 78, '2023-12-25 09:24:19');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (76, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 4, 74, 69, '2023-09-26 18:02:31');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (77, 'Vivamus vel nulla eget eros elementum pellentesque.', 3, 79, 50, '2023-12-12 10:38:14');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (78, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 3, 74, 62, '2023-02-22 20:46:17');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (79, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 4, 43, 11, '2023-07-22 00:02:43');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (80, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1, 80, 35, '2023-04-22 03:41:35');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (81, 'Ut at dolor quis odio consequat varius.', 5, 71, 40, '2023-05-19 03:21:01');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (82, 'Vestibulum rutrum rutrum neque.', 5, 12, 51, '2023-07-01 14:50:30');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (83, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 2, 3, 54, '2023-08-26 02:01:08');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (84, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 5, 39, 14, '2023-12-23 12:55:55');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (85, 'Nullam varius. Nulla facilisi.', 1, 93, 65, '2023-10-12 08:11:04');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (86, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 5, 90, 64, '2023-03-08 18:28:19');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (87, 'Pellentesque ultrices mattis odio.', 1, 83, 51, '2023-10-30 09:45:59');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (88, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 4, 47, 76, '2023-04-19 01:27:52');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (89, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 3, 71, 69, '2023-04-07 21:27:46');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (90, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 1, 90, 71, '2023-10-13 01:19:16');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (91, 'Vestibulum ac est lacinia nisi venenatis tristique.', 1, 78, 34, '2023-10-28 09:03:24');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (92, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 5, 37, 75, '2023-01-06 22:55:39');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (93, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 3, 67, 6, '2023-03-03 07:48:11');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (94, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 2, 62, 7, '2023-11-15 13:42:00');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (95, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 1, 28, 7, '2023-08-13 18:09:54');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (96, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', 4, 95, 71, '2023-10-08 02:31:51');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (97, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 5, 4, 63, '2023-07-23 06:56:58');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (98, 'Etiam faucibus cursus urna.', 3, 5, 69, '2023-10-25 18:00:55');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (99, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 4, 26, 48, '2023-07-28 14:15:46');
insert into REVIEWS (Review_ID, Text, Stars, RCustomerId, Product_ID, TimeStamp) values (100, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 5, 6, 100, '2023-03-18 02:01:31');


insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (1, 1, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (2, 2, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (3, 3, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (4, 4, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (5, 5, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (6, 6, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (7, 7, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (8, 8, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (9, 9, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (10, 10, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (11, 11, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (12, 12, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (13, 13, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (14, 14, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (15, 15, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (16, 16, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (17, 17, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (18, 18, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (19, 19, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (20, 20, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (21, 21, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (22, 22, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (23, 23, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (24, 24, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (25, 25, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (26, 26, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (27, 27, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (28, 28, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (29, 29, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (30, 30, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (31, 31, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (32, 32, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (33, 33, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (34, 34, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (35, 35, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (36, 36, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (37, 37, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (38, 38, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (39, 39, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (40, 40, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (41, 41, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (42, 42, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (43, 43, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (44, 44, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (45, 45, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (46, 46, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (47, 47, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (48, 48, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (49, 49, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (50, 50, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (51, 51, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (52, 52, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (53, 53, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (54, 54, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (55, 55, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (56, 56, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (57, 57, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (58, 58, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (59, 59, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (60, 60, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (61, 61, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (62, 62, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (63, 63, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (64, 64, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (65, 65, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (66, 66, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (67, 67, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (68, 68, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (69, 69, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (70, 70, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (71, 71, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (72, 72, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (73, 73, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (74, 74, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (75, 75, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (76, 76, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (77, 77, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (78, 78, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (79, 79, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (80, 80, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (81, 81, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (82, 82, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (83, 83, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (84, 84, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (85, 85, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (86, 86, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (87, 87, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (88, 88, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (89, 89, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (90, 90, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (91, 91, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (92, 92, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (93, 93, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (94, 94, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (95, 95, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (96, 96, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (97, 97, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (98, 98, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (99, 99, 'yes');
insert into Cart (Cart_ID, CCustomerID, Order_Placed) values (100, 100, 'yes');

insert into Cart_Items (id, cart_id, product_id, quantity) values (1, 1, 1, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (2, 2, 2, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (3, 3, 3, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (4, 4, 4, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (5, 5, 5, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (6, 6, 6, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (7, 7, 7, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (8, 8, 8, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (9, 9, 9, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (10, 10, 10, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (11, 11, 11, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (12, 12, 12, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (13, 13, 13, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (14, 14, 14, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (15, 15, 15, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (16, 16, 16, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (17, 17, 17, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (18, 18, 18, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (19, 19, 19, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (20, 20, 20, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (21, 21, 21, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (22, 22, 22, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (23, 23, 23, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (24, 24, 24, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (25, 25, 25, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (26, 26, 26, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (27, 27, 27, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (28, 28, 28, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (29, 29, 29, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (30, 30, 30, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (31, 31, 31, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (32, 32, 32, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (33, 33, 33, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (34, 34, 34, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (35, 35, 35, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (36, 36, 36, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (37, 37, 37, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (38, 38, 38, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (39, 39, 39, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (40, 40, 40, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (41, 41, 41, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (42, 42, 42, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (43, 43, 43, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (44, 44, 44, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (45, 45, 45, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (46, 46, 46, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (47, 47, 47, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (48, 48, 48, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (49, 49, 49, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (50, 50, 50, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (51, 51, 51, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (52, 52, 52, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (53, 53, 53, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (54, 54, 54, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (55, 55, 55, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (56, 56, 56, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (57, 57, 57, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (58, 58, 58, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (59, 59, 59, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (60, 60, 60, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (61, 61, 61, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (62, 62, 62, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (63, 63, 63, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (64, 64, 64, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (65, 65, 65, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (66, 66, 66, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (67, 67, 67, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (68, 68, 68, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (69, 69, 69, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (70, 70, 70, 4);
insert into Cart_Items (id, cart_id, product_id, quantity) values (71, 71, 71, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (72, 72, 72, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (73, 73, 73, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (74, 74, 74, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (75, 75, 75, 1);
insert into Cart_Items (id, cart_id, product_id, quantity) values (76, 76, 76, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (77, 77, 77, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (78, 78, 78, 8);
insert into Cart_Items (id, cart_id, product_id, quantity) values (79, 79, 79, 6);
insert into Cart_Items (id, cart_id, product_id, quantity) values (80, 80, 80, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (81, 81, 81, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (82, 82, 82, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (83, 83, 83, 4);
insert into Cart_Items (id, cart_id, product_id, quantity) values (84, 84, 84, 2);
insert into Cart_Items (id, cart_id, product_id, quantity) values (85, 85, 85, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (86, 86, 86, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (87, 87, 87, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (88, 88, 88, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (89, 89, 89, 5);
insert into Cart_Items (id, cart_id, product_id, quantity) values (90, 90, 90, 4);
insert into Cart_Items (id, cart_id, product_id, quantity) values (91, 91, 91, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (92, 92, 92, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (93, 93, 93, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (94, 94, 94, 9);
insert into Cart_Items (id, cart_id, product_id, quantity) values (95, 95, 95, 4);
insert into Cart_Items (id, cart_id, product_id, quantity) values (96, 96, 96, 3);
insert into Cart_Items (id, cart_id, product_id, quantity) values (97, 97, 97, 10);
insert into Cart_Items (id, cart_id, product_id, quantity) values (98, 98, 98, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (99, 99, 99, 7);
insert into Cart_Items (id, cart_id, product_id, quantity) values (100, 100, 100, 10);

insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (1, 80, '2023-11-14 20:46:40', 20);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (2, 59, '2023-04-29 00:09:45', 70);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (3, 21, '2023-05-07 00:52:50', 92);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (4, 44, '2023-08-13 02:30:42', 13);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (5, 26, '2023-05-13 20:26:48', 46);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (6, 63, '2023-09-08 00:15:11', 23);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (7, 69, '2023-04-01 02:09:54', 97);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (8, 39, '2024-02-03 03:13:15', 23);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (9, 29, '2023-04-29 18:22:36', 71);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (10, 25, '2023-05-08 15:34:03', 49);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (11, 62, '2023-03-28 00:07:09', 66);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (12, 55, '2023-02-18 05:31:54', 55);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (13, 58, '2023-10-05 10:07:08', 18);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (14, 32, '2023-06-23 04:14:31', 65);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (15, 7, '2023-12-04 18:38:24', 91);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (16, 4, '2023-03-09 15:46:37', 49);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (17, 8, '2023-06-07 15:07:17', 88);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (18, 87, '2023-09-15 13:38:11', 37);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (19, 55, '2023-05-01 20:24:46', 74);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (20, 77, '2023-02-12 11:22:15', 85);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (21, 66, '2024-01-29 03:14:53', 94);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (22, 18, '2023-09-20 14:09:14', 50);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (23, 52, '2024-01-05 07:55:33', 29);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (24, 59, '2023-09-28 18:43:47', 89);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (25, 73, '2023-12-09 19:22:52', 30);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (26, 61, '2024-01-21 11:39:39', 4);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (27, 14, '2023-10-12 16:57:10', 55);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (28, 78, '2024-01-03 12:39:38', 98);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (29, 64, '2023-04-24 23:35:25', 22);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (30, 79, '2023-12-22 16:17:41', 82);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (31, 53, '2023-05-09 11:19:47', 70);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (32, 30, '2024-01-17 09:52:45', 62);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (33, 43, '2023-11-22 22:29:16', 11);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (34, 18, '2023-11-13 18:32:19', 97);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (35, 36, '2023-03-16 15:59:18', 96);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (36, 14, '2023-03-07 16:13:01', 79);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (37, 71, '2023-12-26 04:22:56', 87);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (38, 98, '2023-10-21 23:54:37', 84);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (39, 52, '2023-04-25 20:09:29', 54);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (40, 45, '2024-02-02 11:02:32', 87);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (41, 24, '2023-04-21 10:05:46', 96);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (42, 19, '2023-07-22 05:43:12', 60);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (43, 69, '2023-06-04 20:57:44', 83);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (44, 59, '2023-06-27 11:43:42', 73);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (45, 81, '2023-06-10 08:37:37', 48);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (46, 82, '2023-05-19 08:16:56', 86);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (47, 87, '2024-01-29 19:59:43', 59);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (48, 79, '2023-03-30 23:11:09', 25);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (49, 27, '2024-02-02 16:46:07', 61);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (50, 84, '2023-11-25 07:40:23', 56);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (51, 12, '2023-03-15 15:00:22', 73);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (52, 52, '2023-04-30 19:38:44', 10);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (53, 8, '2023-06-03 20:42:56', 14);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (54, 24, '2023-03-04 17:03:41', 43);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (55, 96, '2023-02-20 19:37:22', 57);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (56, 45, '2023-12-22 08:18:41', 84);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (57, 24, '2023-04-18 05:56:25', 94);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (58, 3, '2023-12-28 05:18:48', 40);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (59, 29, '2023-11-09 11:55:54', 74);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (60, 93, '2023-12-23 02:22:46', 80);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (61, 95, '2023-08-02 09:00:52', 34);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (62, 50, '2023-02-18 09:56:59', 29);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (63, 26, '2023-09-20 20:26:45', 99);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (64, 25, '2023-10-07 15:10:42', 55);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (65, 3, '2023-12-24 09:41:57', 62);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (66, 35, '2024-01-09 16:12:43', 73);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (67, 30, '2023-11-29 20:29:27', 47);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (68, 9, '2023-08-28 14:35:55', 53);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (69, 49, '2023-09-04 13:58:14', 7);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (70, 28, '2023-04-06 23:27:54', 6);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (71, 50, '2023-10-29 13:23:53', 63);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (72, 79, '2023-12-30 03:09:54', 42);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (73, 19, '2023-09-27 13:35:19', 13);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (74, 62, '2023-12-22 18:22:35', 45);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (75, 96, '2023-10-18 03:56:17', 63);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (76, 41, '2023-11-06 20:51:56', 29);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (77, 83, '2023-03-30 12:36:18', 89);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (78, 24, '2023-11-13 03:15:31', 25);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (79, 11, '2023-03-13 15:27:03', 51);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (80, 95, '2023-10-08 00:26:50', 75);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (81, 62, '2023-02-21 15:29:04', 78);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (82, 3, '2023-03-30 12:05:43', 35);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (83, 8, '2023-05-15 10:41:57', 35);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (84, 6, '2023-12-01 11:15:15', 13);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (85, 47, '2023-11-08 10:26:40', 24);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (86, 52, '2023-11-24 14:39:51', 32);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (87, 61, '2023-09-12 19:38:14', 5);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (88, 67, '2023-04-26 22:29:18', 87);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (89, 51, '2024-01-29 11:28:45', 20);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (90, 83, '2023-11-03 15:20:36', 25);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (91, 31, '2023-02-21 14:06:58', 52);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (92, 85, '2023-04-06 06:18:56', 33);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (93, 52, '2023-04-28 05:48:45', 7);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (94, 53, '2024-01-25 00:57:31', 41);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (95, 30, '2023-07-16 05:16:01', 34);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (96, 46, '2023-12-11 22:38:11', 45);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (97, 99, '2023-09-28 15:17:19', 76);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (98, 21, '2023-05-03 10:10:43', 63);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (99, 70, '2023-05-26 15:56:24', 19);
insert into Orders (Order_ID, OCustomerID, Date_Of_Delivery, Cart_ID) values (100, 77, '2023-04-10 23:21:42', 92);



insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (1, 94, 'mastercard', 'SUCCESSFUL', '2023-03-04 03:44:24', 468.92);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (2, 22, 'jcb', 'PROCESSING', '2023-02-14 19:54:30', 842.21);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (3, 79, 'bankcard', 'SUCCESSFUL', '2023-08-21 23:14:10', 273.61);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (4, 52, 'instapayment', 'SUCCESSFUL', '2023-07-20 23:12:41', 44.89);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (5, 58, 'jcb', 'PROCESSING', '2024-01-06 13:40:34', 779.37);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (6, 69, 'bankcard', 'SUCCESSFUL', '2024-01-31 23:55:44', 954.67);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (7, 66, 'jcb', 'PROCESSING', '2023-10-19 09:26:47', 219.43);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (8, 49, 'diners-club-carte-blanche', 'PROCESSING', '2023-04-21 21:13:42', 732.99);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (9, 80, 'jcb', 'SUCCESSFUL', '2023-08-05 02:16:53', 949.04);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (10, 57, 'jcb', 'FAILED', '2023-05-08 04:47:02', 278.73);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (11, 61, 'jcb', 'FAILED', '2023-04-06 18:06:12', 238.18);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (12, 35, 'jcb', 'PROCESSING', '2023-09-21 21:55:04', 794.77);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (13, 78, 'americanexpress', 'SUCCESSFUL', '2023-06-29 14:34:22', 287.97);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (14, 40, 'jcb', 'FAILED', '2024-01-11 05:01:25', 266.14);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (15, 10, 'china-unionpay', 'PROCESSING', '2024-01-12 19:52:12', 378.78);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (16, 49, 'jcb', 'SUCCESSFUL', '2023-05-22 22:54:38', 758.59);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (17, 1, 'jcb', 'FAILED', '2023-12-19 09:57:59', 377.0);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (18, 35, 'jcb', 'SUCCESSFUL', '2023-09-25 06:00:07', 368.25);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (19, 74, 'jcb', 'SUCCESSFUL', '2023-07-27 22:17:30', 119.62);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (20, 4, 'jcb', 'PROCESSING', '2023-05-11 05:08:32', 363.14);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (21, 24, 'diners-club-carte-blanche', 'SUCCESSFUL', '2023-07-10 07:36:05', 754.78);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (22, 54, 'jcb', 'SUCCESSFUL', '2023-03-05 13:35:36', 473.73);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (23, 41, 'visa', 'FAILED', '2024-01-17 21:23:42', 61.76);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (24, 33, 'visa', 'FAILED', '2023-03-31 23:18:54', 327.1);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (25, 85, 'diners-club-carte-blanche', 'SUCCESSFUL', '2023-06-16 10:11:38', 470.4);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (26, 45, 'china-unionpay', 'FAILED', '2023-12-12 09:12:53', 550.83);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (27, 98, 'jcb', 'FAILED', '2024-01-23 05:28:35', 960.34);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (28, 12, 'bankcard', 'PROCESSING', '2023-02-24 02:24:19', 546.53);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (29, 34, 'jcb', 'PROCESSING', '2023-11-23 20:03:56', 339.32);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (30, 86, 'jcb', 'SUCCESSFUL', '2023-05-04 11:51:35', 337.28);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (31, 5, 'mastercard', 'SUCCESSFUL', '2023-06-16 04:35:03', 761.07);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (32, 61, 'americanexpress', 'SUCCESSFUL', '2023-03-09 03:45:28', 265.66);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (33, 55, 'diners-club-enroute', 'PROCESSING', '2023-10-25 11:59:07', 127.21);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (34, 16, 'maestro', 'PROCESSING', '2023-04-25 23:57:20', 882.8);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (35, 53, 'jcb', 'PROCESSING', '2023-09-07 23:49:27', 639.52);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (36, 26, 'jcb', 'PROCESSING', '2023-11-10 11:50:30', 227.04);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (37, 47, 'visa-electron', 'FAILED', '2023-07-11 04:16:36', 340.47);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (38, 72, 'switch', 'SUCCESSFUL', '2023-04-19 22:36:53', 161.14);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (39, 6, 'mastercard', 'SUCCESSFUL', '2024-01-18 08:50:23', 278.14);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (40, 78, 'jcb', 'PROCESSING', '2023-06-27 22:57:51', 791.54);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (41, 96, 'jcb', 'SUCCESSFUL', '2023-11-11 03:40:00', 595.14);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (42, 27, 'laser', 'FAILED', '2023-09-05 00:58:47', 936.64);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (43, 9, 'jcb', 'FAILED', '2023-12-31 00:10:18', 224.84);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (44, 63, 'jcb', 'PROCESSING', '2023-12-14 11:44:07', 60.26);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (45, 9, 'visa-electron', 'PROCESSING', '2024-02-09 08:16:30', 427.45);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (46, 57, 'jcb', 'SUCCESSFUL', '2023-11-12 10:10:48', 822.85);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (47, 15, 'instapayment', 'SUCCESSFUL', '2023-10-30 08:26:24', 588.82);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (48, 5, 'jcb', 'PROCESSING', '2023-07-06 21:39:40', 753.13);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (49, 9, 'diners-club-enroute', 'FAILED', '2023-05-14 06:54:04', 286.84);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (50, 68, 'diners-club-enroute', 'SUCCESSFUL', '2023-09-11 08:16:38', 770.17);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (51, 55, 'diners-club-carte-blanche', 'SUCCESSFUL', '2023-11-19 01:08:20', 896.13);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (52, 64, 'jcb', 'PROCESSING', '2023-11-10 15:05:25', 449.73);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (53, 50, 'jcb', 'FAILED', '2023-11-14 03:57:37', 127.69);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (54, 68, 'visa-electron', 'FAILED', '2023-07-18 18:33:40', 443.51);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (55, 55, 'diners-club-carte-blanche', 'PROCESSING', '2023-09-07 18:14:39', 547.76);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (56, 48, 'maestro', 'SUCCESSFUL', '2023-02-12 22:43:57', 41.39);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (57, 4, 'switch', 'SUCCESSFUL', '2023-09-18 10:20:16', 438.18);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (58, 90, 'solo', 'FAILED', '2023-04-16 15:03:37', 182.11);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (59, 25, 'jcb', 'PROCESSING', '2023-12-11 15:43:51', 778.01);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (60, 75, 'bankcard', 'FAILED', '2023-08-21 06:30:58', 772.54);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (61, 82, 'americanexpress', 'FAILED', '2023-03-01 07:26:42', 537.27);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (62, 84, 'switch', 'SUCCESSFUL', '2024-01-01 21:17:29', 287.01);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (63, 81, 'mastercard', 'SUCCESSFUL', '2023-04-17 15:25:51', 345.02);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (64, 85, 'jcb', 'PROCESSING', '2023-05-26 07:35:00', 859.8);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (65, 73, 'americanexpress', 'FAILED', '2023-08-28 12:16:17', 851.74);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (66, 6, 'diners-club-carte-blanche', 'PROCESSING', '2023-04-06 22:47:44', 680.3);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (67, 96, 'jcb', 'FAILED', '2023-02-16 10:16:51', 48.55);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (68, 81, 'visa-electron', 'FAILED', '2023-05-16 09:43:21', 700.54);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (69, 16, 'bankcard', 'FAILED', '2023-12-24 22:35:50', 936.66);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (70, 20, 'jcb', 'SUCCESSFUL', '2024-01-28 06:22:13', 405.08);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (71, 37, 'jcb', 'SUCCESSFUL', '2023-08-24 20:08:36', 275.89);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (72, 36, 'switch', 'SUCCESSFUL', '2023-08-27 03:24:01', 335.39);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (73, 89, 'laser', 'FAILED', '2023-12-02 12:48:50', 382.87);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (74, 20, 'jcb', 'PROCESSING', '2023-08-14 15:08:33', 674.77);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (75, 8, 'visa-electron', 'FAILED', '2024-01-01 11:11:15', 441.89);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (76, 13, 'diners-club-us-ca', 'PROCESSING', '2023-08-25 16:13:01', 634.51);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (77, 30, 'jcb', 'SUCCESSFUL', '2023-06-17 23:05:00', 235.79);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (78, 37, 'switch', 'PROCESSING', '2023-09-15 07:55:33', 929.68);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (79, 54, 'jcb', 'FAILED', '2023-12-06 03:27:17', 820.81);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (80, 28, 'jcb', 'SUCCESSFUL', '2023-09-19 05:53:15', 872.64);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (81, 86, 'jcb', 'SUCCESSFUL', '2023-09-20 06:35:30', 310.71);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (82, 64, 'jcb', 'PROCESSING', '2023-10-16 12:47:37', 546.78);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (83, 96, 'jcb', 'PROCESSING', '2023-03-08 00:11:04', 102.18);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (84, 3, 'jcb', 'PROCESSING', '2023-05-25 07:27:27', 940.8);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (85, 19, 'visa-electron', 'FAILED', '2023-08-09 13:48:53', 346.04);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (86, 17, 'china-unionpay', 'SUCCESSFUL', '2023-05-05 05:22:27', 445.08);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (87, 89, 'mastercard', 'PROCESSING', '2023-12-05 01:50:25', 107.36);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (88, 85, 'visa', 'FAILED', '2023-08-27 09:12:09', 410.55);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (89, 8, 'jcb', 'SUCCESSFUL', '2023-02-14 12:29:06', 523.63);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (90, 62, 'switch', 'SUCCESSFUL', '2023-03-06 15:18:53', 517.6);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (91, 47, 'diners-club-us-ca', 'FAILED', '2023-12-01 00:38:30', 839.02);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (92, 98, 'visa', 'SUCCESSFUL', '2023-07-25 13:50:28', 649.95);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (93, 64, 'jcb', 'SUCCESSFUL', '2023-12-15 15:23:27', 635.6);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (94, 82, 'maestro', 'PROCESSING', '2023-05-11 18:06:40', 759.37);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (95, 39, 'diners-club-us-ca', 'SUCCESSFUL', '2023-10-23 07:21:02', 886.78);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (96, 27, 'china-unionpay', 'SUCCESSFUL', '2023-08-10 03:49:57', 118.33);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (97, 84, 'instapayment', 'PROCESSING', '2023-06-08 13:43:01', 715.77);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (98, 12, 'maestro', 'FAILED', '2023-06-12 09:00:45', 409.65);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (99, 8, 'jcb', 'PROCESSING', '2023-05-11 04:35:43', 405.96);
insert into Payment (Payment_ID, OrderID, Type, Status, DatePayment, Amount) values (100, 22, 'jcb', 'PROCESSING', '2023-06-03 11:42:15', 570.9);



insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (1, 'Garwin Aleksashin', '2023-01-30', '707-518-2986');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (2, 'Atlanta MacDunleavy', '2023-07-20', '971-946-9656');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (3, 'Packston Tamsett', '2023-03-16', '793-961-9350');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (4, 'Lyle Klemke', '2023-02-15', '374-276-1575');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (5, 'Olga Minton', '2023-09-13', '811-951-8922');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (6, 'Odessa Morfield', '2023-08-21', '265-907-0360');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (7, 'Cal Kopacek', '2023-01-13', '584-640-6950');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (8, 'Murray Agate', '2023-10-11', '688-183-2152');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (9, 'Far Sodor', '2023-08-02', '995-293-0947');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (10, 'Doralynn Audley', '2023-07-29', '116-687-3374');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (11, 'Jonie Sieur', '2023-08-19', '708-973-0419');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (12, 'Steffie Fellows', '2023-06-29', '775-938-2701');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (13, 'Janean Szymonowicz', '2023-12-03', '768-765-8423');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (14, 'Regina Ziems', '2023-06-21', '374-144-3658');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (15, 'Ellwood Leyrroyd', '2023-03-26', '752-978-5637');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (16, 'Bunny Dmtrovic', '2023-11-25', '382-227-6216');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (17, 'Ruthanne Rodway', '2023-10-09', '304-767-2227');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (18, 'Julius Burrett', '2023-06-26', '904-498-6431');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (19, 'Nathaniel Fielder', '2023-11-03', '756-689-2405');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (20, 'Sax Surtees', '2023-10-28', '320-756-5391');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (21, 'Leoline Cowburn', '2023-10-14', '114-749-7848');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (22, 'Vassily Airdrie', '2023-08-02', '483-429-9201');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (23, 'Judd Martinek', '2023-11-22', '346-431-7416');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (24, 'Siward Pargeter', '2023-05-16', '325-692-4632');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (25, 'Windham Timmens', '2023-10-31', '125-673-1155');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (26, 'Jethro Mussolini', '2023-07-03', '891-981-9219');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (27, 'Giovanna Sandever', '2023-08-24', '226-470-5478');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (28, 'Stephen Bruckenthal', '2023-05-16', '278-198-0568');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (29, 'Hogan Fife', '2023-03-15', '252-595-0862');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (30, 'Gilda Coverdill', '2023-11-28', '101-203-1500');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (31, 'Dru Brandreth', '2023-03-01', '333-459-8621');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (32, 'Wallis Drayn', '2023-02-01', '269-357-5987');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (33, 'Carter Lukesch', '2023-06-30', '657-618-0492');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (34, 'Dianne Hellicar', '2023-02-22', '966-326-3642');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (35, 'Merrili Stollwerk', '2023-11-03', '577-679-0486');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (36, 'Hasheem MacGauhy', '2023-05-07', '387-265-4916');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (37, 'Rodolphe Verling', '2023-02-05', '261-204-3016');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (38, 'Chrissie Laxton', '2023-02-28', '199-705-9862');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (39, 'Bobbye Brettoner', '2023-03-18', '800-572-8430');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (40, 'Luce Arney', '2023-04-27', '400-467-7555');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (41, 'Lyndsay Blunsum', '2023-11-04', '253-970-9221');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (42, 'Carma Garraway', '2023-06-20', '184-681-8522');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (43, 'Maurizia Bucke', '2023-03-09', '145-516-5170');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (44, 'Gay Arnson', '2023-10-05', '702-672-9788');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (45, 'Randene Fowle', '2023-05-03', '281-469-5868');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (46, 'Jesus Duval', '2023-10-04', '520-687-1244');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (47, 'Valma Worboy', '2023-02-16', '760-755-0992');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (48, 'Riccardo Bleddon', '2023-07-10', '307-146-3727');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (49, 'Torrance Sissland', '2023-06-26', '115-904-0191');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (50, 'Ruttger Janouch', '2023-11-06', '197-709-2701');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (51, 'Obediah Wakes', '2023-06-01', '845-464-0849');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (52, 'Selia Morritt', '2023-06-13', '595-875-2179');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (53, 'Merissa Arstingall', '2023-08-22', '207-632-2880');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (54, 'Leonhard Winfrey', '2023-04-02', '938-246-8093');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (55, 'Johannes Cakebread', '2023-06-13', '751-491-0683');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (56, 'Carlie Daveridge', '2023-06-16', '922-665-2875');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (57, 'Lizbeth Orleton', '2023-05-31', '618-144-6014');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (58, 'Harlene Mearns', '2023-12-17', '722-839-3048');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (59, 'Tucker Ranscomb', '2023-07-24', '948-398-4334');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (60, 'Gilberta Hymer', '2023-10-21', '768-823-4211');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (61, 'Stephen Coade', '2023-06-01', '871-733-6133');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (62, 'Sebastian Corkell', '2023-04-26', '904-268-5704');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (63, 'Averil Debell', '2023-09-09', '203-661-3393');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (64, 'Philippine Flewin', '2023-02-28', '363-257-8444');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (65, 'Merissa Rintoul', '2023-07-18', '353-617-2461');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (66, 'Madalena Pitkeathly', '2023-07-26', '746-130-0197');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (67, 'Wash Champe', '2023-01-11', '276-585-3823');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (68, 'Nikos Coombes', '2023-08-14', '846-465-4748');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (69, 'Corrie Josefowicz', '2023-10-16', '131-551-4966');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (70, 'Beulah Pesterfield', '2023-12-23', '683-716-9447');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (71, 'Patsy Kedwell', '2023-03-08', '105-893-2463');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (72, 'Chrysa Slogrove', '2023-03-04', '351-298-0858');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (73, 'Lucas Heintsch', '2023-02-17', '346-470-8466');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (74, 'Gunter Winney', '2023-03-31', '802-314-5955');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (75, 'Ruthie Domegan', '2023-03-20', '195-107-7134');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (76, 'Keelia Shallcrass', '2023-01-11', '279-405-0722');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (77, 'Tonnie Mattin', '2023-09-21', '909-938-0472');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (78, 'Garner Woodstock', '2023-03-28', '419-281-7917');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (79, 'Kimbell Grigoire', '2023-03-12', '640-281-4655');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (80, 'Deeanne Tuxill', '2023-02-24', '415-916-3404');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (81, 'Abbot Trustrie', '2023-11-27', '964-559-3263');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (82, 'Kendre Coleby', '2023-02-04', '467-768-7794');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (83, 'Merry Frayn', '2023-03-19', '535-433-8492');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (84, 'Gunar Barefoot', '2023-05-15', '686-507-3604');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (85, 'Hedi Cakebread', '2023-02-28', '377-335-0338');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (86, 'Scottie Sexti', '2023-06-29', '778-382-0995');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (87, 'Blondelle Duke', '2023-08-19', '310-545-4712');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (88, 'Dalli Girardi', '2023-02-21', '890-824-7004');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (89, 'Dierdre Epsly', '2023-01-04', '269-350-5663');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (90, 'Stanwood Faragan', '2023-01-11', '229-839-9601');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (91, 'Kalil Gauche', '2023-11-24', '986-412-2483');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (92, 'Hedda Crosoer', '2023-01-01', '189-228-0554');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (93, 'Gwyneth Mickan', '2023-08-18', '282-599-6259');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (94, 'Linell Claworth', '2023-07-26', '177-536-7916');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (95, 'Gusta Rennocks', '2023-05-06', '304-623-7881');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (96, 'Amos Petracco', '2023-05-18', '916-475-5882');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (97, 'Denis Wibrow', '2023-05-22', '712-234-3225');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (98, 'Bayard Dashkov', '2023-08-23', '805-582-0876');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (99, 'Hillyer Lamberto', '2023-10-21', '520-754-0245');
insert into Delivery_Person (DP_ID, Name, DOJ, Contact) values (100, 'Edith Risely', '2023-08-30', '201-824-8019');

insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (1, 1, 'in Waiting', 2, '2023-04-07');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (2, 2, 'in Waiting', 5, '2023-03-11');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (3, 3, 'Dispatched', 3, '2023-01-28');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (4, 4, 'Delivered', 2, '2023-08-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (5, 5, 'Dispatched', 5, '2023-12-24');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (6, 6, 'Dispatched', 1, '2023-11-15');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (7, 7, 'Dispatched', 3, '2023-11-10');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (8, 8, 'in Waiting', 3, '2023-02-05');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (9, 9, 'Dispatched', 5, '2023-06-23');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (10, 10, 'in Waiting', 5, '2023-03-06');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (11, 11, 'Delivered', 4, '2023-11-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (12, 12, 'Delivered', 1, '2023-05-04');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (13, 13, 'Delivered', 5, '2023-02-23');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (14, 14, 'Delivered', 2, '2023-01-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (15, 15, 'Delivered', 3, '2023-04-16');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (16, 16, 'Delivered', 3, '2023-09-28');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (17, 17, 'Dispatched', 5, '2023-11-16');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (18, 18, 'Dispatched', 3, '2023-11-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (19, 19, 'Delivered', 4, '2023-02-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (20, 20, 'Dispatched', 1, '2023-03-24');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (21, 21, 'Delivered', 4, '2023-08-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (22, 22, 'Dispatched', 3, '2023-07-11');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (23, 23, 'in Waiting', 1, '2023-08-07');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (24, 24, 'Delivered', 2, '2023-03-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (25, 25, 'in Waiting', 2, '2023-12-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (26, 26, 'Delivered', 5, '2023-10-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (27, 27, 'Dispatched', 3, '2023-12-18');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (28, 28, 'Delivered', 2, '2023-10-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (29, 29, 'in Waiting', 1, '2023-08-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (30, 30, 'Delivered', 4, '2023-09-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (31, 31, 'in Waiting', 5, '2023-07-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (32, 32, 'Delivered', 2, '2023-03-11');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (33, 33, 'in Waiting', 4, '2023-12-16');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (34, 34, 'in Waiting', 2, '2023-09-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (35, 35, 'Delivered', 3, '2023-05-04');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (36, 36, 'Delivered', 1, '2023-01-06');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (37, 37, 'Dispatched', 1, '2023-02-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (38, 38, 'Delivered', 1, '2023-01-08');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (39, 39, 'Dispatched', 4, '2023-08-21');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (40, 40, 'in Waiting', 2, '2023-04-18');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (41, 41, 'Dispatched', 2, '2023-11-21');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (42, 42, 'Delivered', 1, '2023-02-06');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (43, 43, 'Dispatched', 2, '2023-04-14');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (44, 44, 'Dispatched', 4, '2023-10-21');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (45, 45, 'Delivered', 3, '2023-07-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (46, 46, 'Delivered', 1, '2023-02-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (47, 47, 'Delivered', 5, '2023-01-05');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (48, 48, 'Delivered', 5, '2023-09-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (49, 49, 'Dispatched', 4, '2023-05-05');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (50, 50, 'Dispatched', 1, '2023-05-26');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (51, 51, 'Delivered', 2, '2023-04-08');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (52, 52, 'Delivered', 5, '2023-07-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (53, 53, 'in Waiting', 3, '2023-11-15');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (54, 54, 'Dispatched', 4, '2023-10-14');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (55, 55, 'in Waiting', 1, '2023-02-05');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (56, 56, 'Dispatched', 2, '2023-10-12');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (57, 57, 'Delivered', 5, '2023-01-21');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (58, 58, 'Dispatched', 5, '2023-05-28');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (59, 59, 'Delivered', 1, '2023-02-04');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (60, 60, 'in Waiting', 5, '2023-05-06');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (61, 61, 'Dispatched', 4, '2023-12-07');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (62, 62, 'Dispatched', 3, '2023-03-27');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (63, 63, 'in Waiting', 5, '2023-02-01');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (64, 64, 'Dispatched', 1, '2023-07-15');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (65, 65, 'Delivered', 4, '2023-04-06');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (66, 66, 'Dispatched', 2, '2023-02-08');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (67, 67, 'in Waiting', 4, '2023-09-11');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (68, 68, 'Dispatched', 4, '2023-02-03');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (69, 69, 'in Waiting', 3, '2023-09-13');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (70, 70, 'Delivered', 5, '2023-02-07');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (71, 71, 'in Waiting', 2, '2023-05-11');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (72, 72, 'in Waiting', 4, '2023-03-27');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (73, 73, 'in Waiting', 2, '2023-01-25');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (74, 74, 'Delivered', 4, '2023-11-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (75, 75, 'Delivered', 3, '2023-07-29');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (76, 76, 'in Waiting', 4, '2023-03-19');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (77, 77, 'Delivered', 3, '2023-09-15');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (78, 78, 'Dispatched', 4, '2023-03-28');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (79, 79, 'Dispatched', 1, '2023-02-22');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (80, 80, 'Delivered', 1, '2023-07-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (81, 81, 'in Waiting', 2, '2023-11-23');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (82, 82, 'Delivered', 2, '2023-03-24');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (83, 83, 'Delivered', 4, '2023-05-18');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (84, 84, 'Delivered', 2, '2023-03-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (85, 85, 'Dispatched', 5, '2023-07-07');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (86, 86, 'Dispatched', 2, '2023-01-13');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (87, 87, 'Dispatched', 3, '2023-12-30');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (88, 88, 'Delivered', 3, '2023-12-14');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (89, 89, 'Dispatched', 4, '2023-02-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (90, 90, 'Delivered', 3, '2023-02-13');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (91, 91, 'in Waiting', 3, '2023-11-02');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (92, 92, 'in Waiting', 5, '2023-06-13');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (93, 93, 'in Waiting', 3, '2023-06-22');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (94, 94, 'Delivered', 1, '2023-04-27');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (95, 95, 'Dispatched', 4, '2023-04-08');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (96, 96, 'Dispatched', 1, '2023-05-17');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (97, 97, 'Dispatched', 4, '2023-04-20');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (98, 98, 'Dispatched', 3, '2023-03-16');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (99, 99, 'Delivered', 1, '2023-06-18');
insert into deliveries (Delivery_ID, Order_ID, Delivery_Status, DP_ID, DateofDelivery) values (100, 100, 'Dispatched', 2, '2023-08-28');


insert into logindetails (Username, Password, Type, ID) values ('c1', '123', 'customer', 1);
insert into logindetails (Username, Password, Type, ID) values ('hbonifant1', 'PKgVthWhcK8V', 'customer', 2);
insert into logindetails (Username, Password, Type, ID) values ('s1', '123', 'seller', 3);
insert into logindetails (Username, Password, Type, ID) values ('kfarrah3', 'w1tHOt', 'customer', 4);
insert into logindetails (Username, Password, Type, ID) values ('abrakespear4', '0qhq2M', 'customer', 5);
insert into logindetails (Username, Password, Type, ID) values ('mjeacock5', 'uwtW0sW0Iz6', 'seller', 6);
insert into logindetails (Username, Password, Type, ID) values ('lsamuel6', 'UJ5Dge', 'seller', 7);
insert into logindetails (Username, Password, Type, ID) values ('alittlefield7', 'EkTrn3gcdw6', 'customer', 8);
insert into logindetails (Username, Password, Type, ID) values ('rkemish8', 'vBXpgp', 'seller', 9);
insert into logindetails (Username, Password, Type, ID) values ('d1', '123', 'dp', 10);
insert into logindetails (Username, Password, Type, ID) values ('mpapachristophoroua', 'N2ZrXaoovBrS', 'seller', 11);
insert into logindetails (Username, Password, Type, ID) values ('rfearb', 'lciJE1jn', 'seller', 12);
insert into logindetails (Username, Password, Type, ID) values ('gmcneighc', 'zrJqU2x3lA9', 'customer', 13);
insert into logindetails (Username, Password, Type, ID) values ('dwingeatd', 'VWIL1baC3', 'customer', 14);
insert into logindetails (Username, Password, Type, ID) values ('aagasse', '3RWX8SHzn', 'customer', 15);
insert into logindetails (Username, Password, Type, ID) values ('ytwinef', 'QcHm16', 'customer', 16);
insert into logindetails (Username, Password, Type, ID) values ('dsomersettg', 'paKB1YGW00QK', 'dp', 17);
insert into logindetails (Username, Password, Type, ID) values ('santushevh', 'gbvMmU9RoS', 'dp', 18);
insert into logindetails (Username, Password, Type, ID) values ('ltomaskovi', '7EkmOB7', 'dp', 19);
insert into logindetails (Username, Password, Type, ID) values ('odelwaterj', 'CGsiKKrgXOS', 'seller', 20);
insert into logindetails (Username, Password, Type, ID) values ('rsirmonk', 'HkMYhx', 'dp', 21);
insert into logindetails (Username, Password, Type, ID) values ('gbarnwilll', 'DQzBpBs', 'customer', 22);
insert into logindetails (Username, Password, Type, ID) values ('ecullenm', '37K5prOCt', 'customer', 23);
insert into logindetails (Username, Password, Type, ID) values ('abausmannn', 'RBYQqY5Lk2V', 'seller', 24);
insert into logindetails (Username, Password, Type, ID) values ('kpidgleyo', 'xd4bHmjMq', 'dp', 25);
insert into logindetails (Username, Password, Type, ID) values ('amichaelp', '29CedkKEsOH1', 'dp', 26);
insert into logindetails (Username, Password, Type, ID) values ('wjoburnq', 'jEQgdP68FFL', 'seller', 27);
insert into logindetails (Username, Password, Type, ID) values ('spaladinir', 'K2u1H0WlG', 'customer', 28);
insert into logindetails (Username, Password, Type, ID) values ('jbarnsdales', 'R33qvN', 'customer', 29);
insert into logindetails (Username, Password, Type, ID) values ('mhubbersteyt', 'TaDSSN7na', 'dp', 30);
insert into logindetails (Username, Password, Type, ID) values ('dgareisru', 'B6YTqWrcOb', 'dp', 31);
insert into logindetails (Username, Password, Type, ID) values ('gkiftv', 'lxNpT0msFS', 'customer', 32);
insert into logindetails (Username, Password, Type, ID) values ('cwillanw', 'qXGs8wdvnCG', 'dp', 33);
insert into logindetails (Username, Password, Type, ID) values ('vtidboldx', 'pOJt7Z', 'dp', 34);
insert into logindetails (Username, Password, Type, ID) values ('cwildbloody', 'xBGqprHIxT', 'seller', 35);
insert into logindetails (Username, Password, Type, ID) values ('smeasorz', 'G1x2R4Tm', 'seller', 36);
insert into logindetails (Username, Password, Type, ID) values ('kforeman10', '5ASZSEi1VSI', 'seller', 37);
insert into logindetails (Username, Password, Type, ID) values ('jhiddsley11', 'TBWTP2vT', 'seller', 38);
insert into logindetails (Username, Password, Type, ID) values ('rlomasna12', 'ytO1wJuAa', 'dp', 39);
insert into logindetails (Username, Password, Type, ID) values ('dprew13', 'cFICBv', 'seller', 40);
insert into logindetails (Username, Password, Type, ID) values ('arathbone14', 'aSWKK2T', 'seller', 41);
insert into logindetails (Username, Password, Type, ID) values ('bsimcock15', '8f44ka', 'customer', 42);
insert into logindetails (Username, Password, Type, ID) values ('mcurl16', 'Vo9rk3dh', 'customer', 43);
insert into logindetails (Username, Password, Type, ID) values ('pjays17', 'wS5ynbo', 'seller', 44);
insert into logindetails (Username, Password, Type, ID) values ('ananetti18', 'XNfSWn7iyXj', 'seller', 45);
insert into logindetails (Username, Password, Type, ID) values ('wsmitheram19', 'hn5LDGgM', 'dp', 46);
insert into logindetails (Username, Password, Type, ID) values ('adouble1a', 'BpafD45VWo4F', 'customer', 47);
insert into logindetails (Username, Password, Type, ID) values ('alamminam1b', 'vzK3jvDmD1U', 'customer', 48);
insert into logindetails (Username, Password, Type, ID) values ('pmccoughan1c', 'FI0xiTiFPZIx', 'customer', 49);
insert into logindetails (Username, Password, Type, ID) values ('tpersey1d', 'qw0OEj09', 'dp', 50);
insert into logindetails (Username, Password, Type, ID) values ('imcowis1e', '1jQofI0EQE', 'seller', 51);
insert into logindetails (Username, Password, Type, ID) values ('mbever1f', 'qOnLmPcCvrdw', 'manager', 52);
insert into logindetails (Username, Password, Type, ID) values ('wthackham1g', '1GrupE', 'dp', 53);
insert into logindetails (Username, Password, Type, ID) values ('hgibbs1h', 'xMYfdd', 'customer', 54);
insert into logindetails (Username, Password, Type, ID) values ('eforsaith1i', 'iIWBZno1P', 'dp', 55);
insert into logindetails (Username, Password, Type, ID) values ('mpetrishchev1j', '9X0LXWG', 'dp', 56);
insert into logindetails (Username, Password, Type, ID) values ('veble1k', 'KL40TBHuZh', 'dp', 57);
insert into logindetails (Username, Password, Type, ID) values ('mhounsome1l', 'vYnen74RqA', 'customer', 58);
insert into logindetails (Username, Password, Type, ID) values ('edolton1m', 'qxqoFhQyTUGN', 'dp', 59);
insert into logindetails (Username, Password, Type, ID) values ('wblaszczyk1n', 'VuVyCQGO', 'manager', 60);
insert into logindetails (Username, Password, Type, ID) values ('khurlestone1o', 'aO7OP0V', 'seller', 61);
insert into logindetails (Username, Password, Type, ID) values ('ebradforth1p', 'R6rWPnkJcg5', 'dp', 62);
insert into logindetails (Username, Password, Type, ID) values ('burien1q', 'PRJ4CtRl', 'dp', 63);
insert into logindetails (Username, Password, Type, ID) values ('ldobrovolski1r', 'QG8saJ', 'seller', 64);
insert into logindetails (Username, Password, Type, ID) values ('saxston1s', 'Y9wM37Xki', 'manager', 65);
insert into logindetails (Username, Password, Type, ID) values ('cburnet1t', 'p82b7zEJoP', 'customer', 66);
insert into logindetails (Username, Password, Type, ID) values ('mharberer1u', 'TYWx3151Q6', 'seller', 67);
insert into logindetails (Username, Password, Type, ID) values ('mkilmurray1v', 'V2nArsGRh', 'dp', 68);
insert into logindetails (Username, Password, Type, ID) values ('sbarca1w', 'BDcfExf', 'customer', 69);
insert into logindetails (Username, Password, Type, ID) values ('kdow1x', 'ERvuxZU1', 'dp', 70);
insert into logindetails (Username, Password, Type, ID) values ('tcrichmere1y', 'FyKaJY', 'customer', 71);
insert into logindetails (Username, Password, Type, ID) values ('bgwin1z', 'sURBM8vt2', 'seller', 72);
insert into logindetails (Username, Password, Type, ID) values ('dpickton20', 'SPwu5t', 'seller', 73);
insert into logindetails (Username, Password, Type, ID) values ('nbuske21', 'hiMx9vGOJ', 'dp', 74);
insert into logindetails (Username, Password, Type, ID) values ('nshoosmith22', 'VtKj8Dv', 'dp', 75);
insert into logindetails (Username, Password, Type, ID) values ('mscoggins23', 'WOhcwgAu', 'dp', 76);
insert into logindetails (Username, Password, Type, ID) values ('smogra24', 'dAqlQ3Z1mwF', 'seller', 77);
insert into logindetails (Username, Password, Type, ID) values ('lbesnard25', 'k2zK7a7zvO', 'dp', 78);
insert into logindetails (Username, Password, Type, ID) values ('bdummigan26', 'tdrin0Rl', 'seller', 79);
insert into logindetails (Username, Password, Type, ID) values ('draggles27', '9HuIQnjXy6', 'manager', 80);
insert into logindetails (Username, Password, Type, ID) values ('jfilyashin28', 'yi2TPk7siy', 'customer', 81);
insert into logindetails (Username, Password, Type, ID) values ('headon29', 'go5fqs', 'dp', 82);
insert into logindetails (Username, Password, Type, ID) values ('jsuter2a', 'M1RPMiD', 'dp', 83);
insert into logindetails (Username, Password, Type, ID) values ('eelliot2b', 'HgRr0g3iui', 'customer', 84);
insert into logindetails (Username, Password, Type, ID) values ('cding2c', 'MWhtdvjnMZ', 'customer', 85);
insert into logindetails (Username, Password, Type, ID) values ('bcoite2d', 'FPAJOjzCaw', 'seller', 86);
insert into logindetails (Username, Password, Type, ID) values ('bmatelaitis2e', 'ovZ6a8oP', 'customer', 87);
insert into logindetails (Username, Password, Type, ID) values ('gmurty2f', 'phjoNGDNJG', 'customer', 88);
insert into logindetails (Username, Password, Type, ID) values ('kmelbert2g', 'qfQm1GvIHz', 'customer', 89);
insert into logindetails (Username, Password, Type, ID) values ('vhegel2h', 'Nu31s2P36tok', 'dp', 90);
insert into logindetails (Username, Password, Type, ID) values ('cvye2i', 'QIgsQ9QK', 'dp', 91);
insert into logindetails (Username, Password, Type, ID) values ('lkhoter2j', 'bO5tdE5ETppj', 'dp', 92);
insert into logindetails (Username, Password, Type, ID) values ('ahagard2k', 'A7QRaIG', 'dp', 93);
insert into logindetails (Username, Password, Type, ID) values ('fvlasin2l', 'r62ThUK', 'customer', 94);
insert into logindetails (Username, Password, Type, ID) values ('hgillio2m', 'UI1bEenWg', 'dp', 95);
insert into logindetails (Username, Password, Type, ID) values ('qgresty2n', 'Gis4kRBpb', 'customer', 96);
insert into logindetails (Username, Password, Type, ID) values ('bpauleau2o', '5MGjl663eA5', 'seller', 97);
insert into logindetails (Username, Password, Type, ID) values ('rgherardi2p', 'zdUWBsC', 'dp', 98);
insert into logindetails (Username, Password, Type, ID) values ('achaston2q', 'k5VqDX', 'dp', 99);
insert into logindetails (Username, Password, Type, ID) values ('tatmore2r', 'b1xwnXUUpuZ', 'customer', 100);


show tables;
