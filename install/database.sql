-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 10:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- โครงสร้างตาราง `{prefix}_01work`
--

CREATE TABLE `{prefix}_01work` (
  `id` int(2) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `{prefix}_01work`
--

INSERT INTO `{prefix}_01work` (`id`, `title`, `description`, `fname`) VALUES
(1, 'การเขียนเว็บไซต์', 'ให้นักเรียนนักศึกษาดูจากตัวอย่างที่อาจารย์สอนให้เป็นแบบอย่างในการทำงานต่อไป', 'อ.คำภี');

--
-- โครงสร้างตาราง `{prefix}_member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `{prefix}_member` (
  `id_m` int(2) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อ',
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุล',
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมล',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์โทร',
  `address` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ที่อยู่',
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสผ่าน',
  `typeid` int(3) NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`id_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางสมาชิก';

--
-- โครงสร้างตาราง `{prefix}_type`
--
CREATE TABLE `{prefix}_type` (
  `typeid` int(3) NOT NULL COMMENT 'รหัสประเภท' AUTO_INCREMENT PRIMARY KEY,
  `typename` varchar(20) NOT NULL COMMENT 'ประเภทสินค้า'
) COMMENT='ตารางประเภท' COLLATE 'utf8_unicode_ci';

--
-- โครงสร้างตาราง `{prefix}_product`
--

DROP TABLE IF EXISTS `{prefix}_product`;
CREATE TABLE `product` (
  `proid` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า',
  `proname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `detail` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'รายละเอียด',
  `price` float NOT NULL COMMENT 'ราคา',
  `bal` int(10) NOT NULL COMMENT 'จํานวนคงเหลือ',
  `typeid` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`proid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางสินค้า';

--
-- โครงสร้างตาราง `{prefix}_basket`
--

CREATE TABLE `{prefix}_basket` (
  `orderid` int(10) NOT NULL COMMENT 'เลขที่สั่งซื้อ' AUTO_INCREMENT PRIMARY KEY,
  `basdate` date NOT NULL COMMENT 'วันที่',
  `id_m` int(2) NOT NULL COMMENT 'ผู้สั่ง',
  `proid` int(5) NOT NULL COMMENT 'รหัสสินค้า',
  `amount` int(10) NOT NULL COMMENT 'จํานวน',
  `status` varchar(1) NOT NULL COMMENT 'สถานะการสั่ง'
) COMMENT='ตารางตะกร้า' COLLATE 'utf8_unicode_ci';


--
-- โครงสร้างตาราง `{prefix}_payment`
--

CREATE TABLE `{prefix}_payment` (
  `payid` int(10) NOT NULL COMMENT 'ลําดับ' AUTO_INCREMENT PRIMARY KEY,
  `paydate` date NOT NULL COMMENT 'วันที่',
  `paytime` time NOT NULL COMMENT 'เวลา',
  `channel` varchar(100) NOT NULL COMMENT 'ช่องทางการชําระ',
  `total` float NOT NULL COMMENT 'ยอดชําระ',
  `id_m` int(2) NOT NULL COMMENT 'ผู้ชำระ'
) COMMENT='ตารางการชำระเงิน' COLLATE 'utf8_unicode_ci';

--
-- โครงสร้างตาราง `{prefix}_question`
--

CREATE TABLE `{prefix}_question` (
  `qid` int(10) NOT NULL COMMENT 'ลําดับคําถาม' AUTO_INCREMENT PRIMARY KEY,
  `qdate` date NOT NULL COMMENT 'วันที่',
  `q` varchar(200) NOT NULL COMMENT 'คําถาม',
  `id_m` int(2) NOT NULL COMMENT 'ผู้ถาม'
) COMMENT='ตารางคำถาม' COLLATE 'utf8_unicode_ci';

--
-- โครงสร้างตาราง `{prefix}_answer`
--

CREATE TABLE `{prefix}_answer` (
  `aid` int(10) NOT NULL COMMENT 'ลําดับความคิด' AUTO_INCREMENT PRIMARY KEY,
  `adate` date NOT NULL COMMENT 'วันที่',
  `a` varchar(200) NOT NULL COMMENT 'ความคิดเห็น',
  `id_m` int(2) NOT NULL COMMENT 'ผู้ตอบ',
  `qid` int(10) NOT NULL COMMENT 'ลําดับคําถาม'
) COMMENT='ตารางคำตอบ' COLLATE 'utf8_unicode_ci';