-- Vào http://localhost/phpmyadmin, chọn mục SQL, dán từ dòng 3 -> 110 rồi bấm Go, sau đó mở web làm theo dòng 112

CREATE DATABASE `db`;
USE `db`;

CREATE TABLE `roles` (
	`roleid` INT UNIQUE NOT NULL,
	`name` VARCHAR(40),
	PRIMARY KEY(roleid)
);

CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(40),
   `pass` VARCHAR(40),
   `email` VARCHAR(40),
   `role` INT NOT NULL,
   `fullname` VARCHAR(40),
   `DOB` DATE,
   `sex` VARCHAR(5),
   PRIMARY KEY(id),
   FOREIGN KEY (role) REFERENCES roles(roleid)
);

CREATE TABLE `posts`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `userid` INT NOT NULL,
    `content` VARCHAR(1000),
    `postID` INT,
    `order` INT,
    PRIMARY KEY(id),
    FOREIGN KEY(userid) REFERENCES users(id)
);

CREATE TABLE `item` (
  `name` varchar(255) NOT NULL,
  `monthlyPrice` int(10) UNSIGNED DEFAULT NULL,
  `onlineStore` varchar(5) DEFAULT NULL,
  `UnlimitedProducts` varchar(5) DEFAULT NULL,
  `StaffAccounts` int(10) UNSIGNED DEFAULT NULL,
  `Support` varchar(5) DEFAULT NULL,
  `SalesChannels` varchar(5) DEFAULT NULL,
  `Locations` int(10) UNSIGNED DEFAULT NULL,
  `ManualOrderCreation` varchar(5) DEFAULT NULL,
  `DiscountCodes` varchar(5) DEFAULT NULL,
  `FreeSSL` varchar(5) DEFAULT NULL,
  `AbandonedCartRecovery` varchar(5) DEFAULT NULL,
  `GiftCards` varchar(5) DEFAULT NULL,
  `ProfessionalReports` varchar(5) DEFAULT NULL,
  `AdvancedReportBuilder` varchar(5) DEFAULT NULL,
  `ShippingRates` varchar(5) DEFAULT NULL,
  `ShippingDiscount` decimal(3,0) DEFAULT NULL,
  `PrintShipping` varchar(5) DEFAULT NULL,
  `USPS` varchar(5) DEFAULT NULL,
  `FraudAnalysis` varchar(5) DEFAULT NULL,
  `OnlineCreditCard` decimal(4,1) DEFAULT NULL,
  `InpersonCreditCard` decimal(4,1) DEFAULT NULL,
  `Additional` decimal(3,0) DEFAULT NULL,
  `POSLite` varchar(5) DEFAULT NULL,
  `POSPro` varchar(5) DEFAULT NULL,
  `SellCurrencies` varchar(5) DEFAULT NULL,
  `Exchange` varchar(5) DEFAULT NULL,
  `SellLanguage` decimal(3,0) DEFAULT NULL,
  `Domains` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `contact`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fieldname` VARCHAR(100),
    `content` VARCHAR(1000),
    PRIMARY KEY(id)
);


CREATE TABLE `examples`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `img_name` VARCHAR(1000),
    `img` longblob,
    `href` VARCHAR(1000),
    `title` VARCHAR(1000),
    PRIMARY KEY(id)
);

INSERT INTO roles VALUES(1,'Khach');
INSERT INTO roles VALUES(2,'ThanhVien');
INSERT INTO roles VALUES(3,'QuanTriVien');
INSERT INTO users (name,pass,email,role) VALUES ('member','1234', 'member@gmail.com', 2);
INSERT INTO users (name,pass,email,role) VALUES ('admin','1234', 'admin1@gmail.com', 3);

insert into item values ('Basic Shopify',29,true,true,2,true,true,4,true,true,true,true,true,false,false,false,
                             64,true,false,
                             true,2.9,2.7,2.0,
                             true,89,
                             true,false,false,false);
insert into item values ('Advanced Shopify',299,true,true,15,true,true,8,true,true,true,true,true,true,true,true, 74,true,true, true,2.4,2.4,0.5, true,89, true,true,true,true);
insert into item values ('Shopify',79,true,true,5,true,true,5,true,true,true,true,true,true,false,false, 72,true,true,true,2.6,2.5,1.0, true,89, true,true,true,true);


INSERT INTO posts (userid,content,postid,`order`) VALUES ('1','Trang web cua toi co duoc ho tro vinh vien khong?', -1,1609151819);
INSERT INTO posts (userid,content,postid,`order`) VALUES ('1','Toi khong dang nhap vao trang web cua minh duoc?', -1,1609151819);
INSERT INTO posts (userid,content,postid,`order`) VALUES ('2','Rat tiec nhung chung toi chi ho tro trong vong 2 nam',1,1609151819);

INSERT INTO contact(fieldname, content) VALUES ('article','Gap van de thac mac voi Shopify ?');
INSERT INTO contact(fieldname, content) VALUES ('content','Cau tra loi cho van de cua ban co the duoc tim thay trong cong dong Shopify hoac nhan duoc tu doi ngu ho tro');
INSERT INTO contact(fieldname, content) VALUES ('companyname','Cong ty TNHH thuong mai SHOPIFY');
INSERT INTO contact(fieldname, content) VALUES ('taxnumber','10801010014');
INSERT INTO contact(fieldname, content) VALUES ('companyaddr','Ly Thuong kiet Quan 10, Thanh Pho Ho Chi Minh.');
INSERT INTO contact(fieldname, content) VALUES ('phone','190091989');
INSERT INTO contact(fieldname, content) VALUES ('mail','info@shopify.com.vn');
INSERT INTO contact(fieldname, content) VALUES ('web','www.shopify.com.vn');

-- Vào example_admin.php (Quản lý sản phẩm) bằng admin mk 123, thêm các tư liệu sản phẩm:
-- Hình trong Theme/img
-- STT; Hình ; Tên ; Link ; Chủ đề
-- 1; example_pic2.webp ; Mollyjogger ; https://www.mollyjogger.com ; Nhà cửa và nội thất 
-- 2; example_pic3.webp ; DENY Designs ; https://www.denydesigns.com ; Nhà cửa và nội thất 
-- 3; example_pic4.webp ; Dowse Design ; https://dowsedesign.co.uk ; Nhà cửa và nội thất 
-- 4; example_pic10.webp ; Lindsay Lettersn ; https://lindsayletters.com ; Sách
-- 5; example_pic11.webp ; A Book Apart ; https://abookapart.com ; Sách
-- 6; example_pic12.webp ; GREERChicago ; https://greerchicago.com ; Sách
-- 7; example_pic19.webp ; Negative Underwear ; https://negativeunderwear.com ; Quần áo và thời trang
-- 8; example_pic20.jpg ; 3sixteen ; https://www.3sixteen.com ; Quần áo và thời trang
-- 9; example_pic21.jpg ; Roden Gray ; https://rodengray.com ; Quần áo và thời trang
-- 10; example_pic24.jpg ; LEIF ; https://www.leifshop.com ; Trang sức và phụ kiện
-- 11; example_pic25.jpg ; Moorea Seal ; https://www.mooreaseal.com ; Trang sức và phụ kiện
-- 12; example_pic26.jpg ; Grovermade ; https://grovemade.com ; Trang sức và phụ kiện