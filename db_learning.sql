-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 09:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `id_biodata` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là đang trong rõ hàng, 1 là đã trong lịch sử giao dịch',
  `code` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `sale` int(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `status`, `code`, `sale`, `created`) VALUES
(89, 55, 49, 2, 'e9f58be5-6', 0, '2022-05-20 12:33:35'),
(90, 55, 19, 2, '16038350-1', 0, '2022-05-22 19:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `rootId` int(10) NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL COMMENT 'Thứ tự xắp sếp',
  `create` varchar(100) COLLATE utf8_unicode_ci DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `rootId`, `icon`, `status`, `name`, `description`, `sort_order`, `create`) VALUES
(63, 1, '[jwI]-language.png', 1, 'Ngoại ngữ', 'Nơi đăng tải các khóa học giảng dạy ngoại ngữ', 1, '2021-05-01 07:04:51'),
(64, 1, '[EGi]-line-chart.png', 1, 'Marketing', '', 1, '2021-05-01 07:07:03'),
(65, 1, '[yfo]-desktop-monitor.png', 1, 'Tin học văn phòng', '', 1, '2021-05-01 07:07:31'),
(66, 1, '[rGF]-paintbrush.png', 1, 'Thiết kế', '', 1, '2021-05-01 07:07:49'),
(67, 1, '[8XV]-rocket.svg', 1, 'Kinh doanh', '', 1, '2021-05-01 07:10:17'),
(68, 1, '[WTN]-big-light.png', 1, 'Phát triển cá nhân', '', 1, '2021-05-01 07:11:10'),
(69, 1, '[aUc]-shopping-cart.png', 1, 'Sales, bán hàng', '', 1, '2021-05-01 07:11:36'),
(70, 1, '[nlT]-coding.png', 1, 'Công nghệ thông tin', '', 1, '2021-05-01 07:12:01'),
(71, 1, '[F7g]-heartbeat.png', 1, 'Sức khỏe - giới tính', '', 1, '2021-05-01 07:12:30'),
(72, 1, '[Nk5]-restaurant.png', 1, 'Phong cách sống', '', 1, '2021-05-01 07:12:53'),
(73, 1, '[Jz8]-baby-boy.png', 1, 'Nuôi dạy con', '', 1, '2021-05-01 07:13:16'),
(74, 1, '[CRY]-group.png', 1, 'Hôn nhân & Gia đình', '', 1, '2021-05-01 07:13:50'),
(75, 1, '[XLJ]-camera.png', 1, 'Nhiếp ảnh, làm phim', '', 1, '2021-05-01 07:14:10'),
(76, 63, '', 1, 'Tiếng Anh', '', 1, '2021-05-01 07:22:10'),
(77, 63, '', 1, 'Tiếng Hàn', '', 1, '2021-05-01 07:22:26'),
(78, 63, '', 1, 'Tiếng Trung', '', 1, '2021-05-01 12:38:43'),
(79, 63, '', 1, 'Tiếng Nhật', '', 1, '2021-05-01 12:38:57'),
(96, 64, '', 1, 'Facebook Marketing', '', 1, '2021-07-14 21:19:52'),
(97, 64, '', 1, 'Zalo marketing', '', 1, '2021-07-14 21:20:01'),
(98, 64, '', 1, 'Email Marketing', '', 1, '2021-07-14 21:20:15'),
(99, 64, '', 1, 'Marketing Online', '', 1, '2021-07-14 21:20:27'),
(100, 64, '', 1, 'Google Ads', '', 1, '2021-07-14 21:20:36'),
(101, 64, '', 1, 'Seo', '', 1, '2021-07-14 21:20:44'),
(102, 64, '', 1, 'Branding', '', 1, '2021-07-14 21:20:55'),
(103, 65, '', 1, 'Excel', '', 1, '2021-07-14 21:21:20'),
(104, 65, '', 1, 'Word', 'sss', 1, '2021-07-14 21:21:31'),
(106, 65, '', 1, 'PowerPoint', '', 1, '2021-07-14 21:22:08'),
(107, 66, '', 1, 'Thiết kế quảng cáo', '', 1, '2021-07-14 21:22:32'),
(108, 66, '', 1, 'Phần mềm thiết kế', '', 1, '2021-07-14 21:22:40'),
(109, 66, '', 1, 'Thiết kế Web', '', 1, '2021-07-14 21:22:48'),
(110, 66, '', 1, 'Illustrator', '', 1, '2021-07-14 21:22:58'),
(111, 66, '', 1, 'Photoshop', '', 1, '2021-07-14 21:23:07'),
(112, 67, '', 1, 'Chiến lược kinh doanh', '', 1, '2021-07-14 21:23:52'),
(113, 67, '', 1, 'Bất động sản', '', 1, '2021-07-14 21:24:00'),
(114, 67, '', 1, 'Crypto', '', 1, '2021-07-14 21:24:10'),
(115, 67, '', 1, 'Kinh doanh Online', '', 1, '2021-07-14 21:24:18'),
(116, 67, '', 1, 'Startup', '', 1, '2021-07-14 21:24:29'),
(117, 67, '', 1, 'Kinh doanh Cafe', '', 1, '2021-07-14 21:24:38'),
(118, 67, '', 1, 'Kiếm tiền Online', '', 1, '2021-07-14 21:24:47'),
(119, 67, '', 1, 'Quản trị doanh nghiệp', '', 1, '2021-07-14 21:24:55'),
(120, 67, '', 1, 'Chứng khoán', '', 1, '2021-07-14 21:25:05'),
(121, 67, '', 1, 'Dropshipping', '', 1, '2021-07-14 21:25:16'),
(122, 68, '', 1, 'Thương hiệu cá nhân', '', 1, '2021-07-14 21:25:35'),
(123, 68, '', 1, 'Tài chính cá nhân', '', 1, '2021-07-14 21:25:54'),
(124, 68, '', 1, 'Đàm phán', '', 1, '2021-07-14 21:27:17'),
(125, 68, '', 1, 'Kỹ năng lãnh đạo', '', 1, '2021-07-14 21:27:29'),
(126, 68, '', 1, 'Nhân sự', '', 1, '2021-07-14 21:27:37'),
(127, 68, '', 1, 'Quản trị nhân sự', '', 1, '2021-07-14 21:27:45'),
(128, 68, '', 1, 'MC', '', 1, '2021-07-14 21:27:56'),
(129, 68, '', 1, 'Rèn luyện trí nhớ', '', 1, '2021-07-14 21:28:04'),
(130, 68, '', 1, 'Kỹ năng mềm', '', 1, '2021-07-14 21:28:15'),
(131, 68, '', 1, 'Giao tiếp', '', 1, '2021-07-14 21:28:24'),
(132, 68, '', 1, 'Kỹ năng quản lý', '', 1, '2021-07-14 21:28:31'),
(133, 68, '', 1, 'Tuyển dụng', '', 1, '2021-07-14 21:28:40'),
(134, 68, '', 1, 'Thuyết trình', '', 1, '2021-07-14 21:28:47'),
(135, 69, '', 1, 'Bán hàng Online', '', 1, '2021-07-14 21:29:15'),
(136, 69, '', 1, 'Telesales', '', 1, '2021-07-14 21:29:26'),
(137, 69, '', 1, 'Bán hàng livestream', '', 1, '2021-07-14 21:29:33'),
(138, 69, '', 1, 'Nghệ thuật bán hàng', '', 1, '2021-07-14 21:29:40'),
(139, 69, '', 1, 'Chăm sóc khách hàng', '', 1, '2021-07-14 21:29:49'),
(140, 69, '', 1, 'Chiến lược bán hàng', '', 1, '2021-07-14 21:29:56'),
(141, 69, '', 1, 'Kỹ năng bán hàng', '', 1, '2021-07-14 21:30:04'),
(142, 70, '', 1, 'Lập trình', '', 1, '2021-07-14 21:30:23'),
(143, 70, '', 1, 'Ngôn ngữ lập trình', '', 1, '2021-07-14 21:30:31'),
(144, 70, '', 1, 'Lập Trình Web', '', 1, '2021-07-14 21:30:38'),
(145, 70, '', 1, 'Lập trình Android', '', 1, '2021-07-14 21:30:46'),
(146, 71, '', 1, 'Giảm cân', '', 1, '2021-07-14 21:31:28'),
(147, 71, '', 1, 'Thiền', '', 1, '2021-07-14 21:31:34'),
(148, 71, '', 1, 'Phòng the', '', 1, '2021-07-14 21:31:43'),
(149, 71, '', 1, 'Giảm stress', '', 1, '2021-07-14 21:31:52'),
(150, 71, '', 1, 'Fitness - Gym', '', 1, '2021-07-14 21:31:59'),
(151, 71, '', 1, 'Tình yêu', '', 1, '2021-07-14 21:32:06'),
(152, 71, '', 1, 'Yoga', '', 1, '2021-07-14 21:32:14'),
(153, 71, '', 1, 'Massage', '', 1, '2021-07-14 21:32:22'),
(158, 73, '', 1, 'Phương pháp dạy con', '', 1, '2021-07-14 21:33:31'),
(159, 72, '', 1, 'Pha chế', '', 1, '2021-07-14 21:34:38'),
(160, 72, '', 1, 'Làm bánh', '', 1, '2021-07-14 21:38:54'),
(161, 72, '', 1, 'Làm đẹp', '', 1, '2021-07-14 21:39:01'),
(162, 72, '', 1, 'Tử vi', '', 1, '2021-07-14 21:39:14'),
(163, 72, '', 1, 'Ảo thuật', '', 1, '2021-07-14 21:39:24'),
(164, 73, '', 1, 'Dạy con thông minh', '', 1, '2021-07-14 21:39:35'),
(165, 73, '', 1, 'Mang Thai', '', 1, '2021-07-14 21:39:40'),
(166, 73, '', 1, 'Dinh dưỡng cho con', '', 1, '2021-07-14 21:40:02'),
(167, 74, '', 1, 'Hạnh phúc gia đình', '', 1, '2021-07-14 21:40:21'),
(168, 74, '', 1, 'Đời sống vợ chồng', '', 1, '2021-07-14 21:40:30'),
(169, 75, '', 1, 'Biên tập video', '', 1, '2021-07-14 21:40:48'),
(170, 75, '', 1, 'Dựng phim', '', 1, '2021-07-14 21:41:10'),
(171, 75, '', 1, 'Chụp ảnh', '', 1, '2021-07-14 21:41:28'),
(172, 75, '', 1, 'Kỹ xảo', '', 1, '2021-07-14 21:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vote` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_id` int(11) NOT NULL,
  `status_feedback` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `status_order` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `catalog_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trailer_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(10) NOT NULL,
  `sale` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `number_user` int(100) DEFAULT 0,
  `list_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`list_number`)),
  `content_full` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `image_link`, `trailer_link`, `author_id`, `sale`, `status`, `number_user`, `list_number`, `content_full`) VALUES
(55, 70, 'Quy trình dựng phim HD trên Adobe Premiere CC', 'Khóa học thiết kế dành riêng cho khách hàng Studio. Với phương pháp hướng dẫn ” Cầm Tay Chỉ Việc ” kết hợp với thu lại Video bài giảng sẽ giúp cho học viên nhanh chóng tiếp cận phần mềm mà không lo bị hổng kiến thức dù là nhỏ nhất .', 20.00, '[p1F]-Quy-trình-dựng-phim-HD-trên-Adobe-Premiere-CC_m_1597897525.jpg', '[zYZ]-Islands---2119.mp4', 19, 0, 1, 2, '[49,19]', '<div class=\"u-learn-what\">\n<h3>Bạn sẽ học được g&igrave;</h3>\n<div class=\"content\">\n<div class=\"row\">\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">\n<p>Với 71 Video hướng dẫn sẽ gi&uacute;p học vi&ecirc;n hiểu hết tất cả c&aacute;c c&ocirc;ng cụ cũng&nbsp;&nbsp;t&iacute;nh năng tr&ecirc;n Adobe Premiere CC</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n<p>&nbsp;</p>\n<div id=\"u-des-course\" class=\"u-des-course\">\n<h2>Giới thiệu kh&oacute;a học</h2>\n<p>Kh&oacute;a học dựng phim online thiết kế d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng Studio. Với phương ph&aacute;p hướng dẫn &rdquo; Cầm Tay Chỉ Việc &rdquo; kết hợp với thu lại Video b&agrave;i giảng sẽ gi&uacute;p cho học vi&ecirc;n nhanh ch&oacute;ng tiếp cận phần mềm m&agrave; kh&ocirc;ng lo bị hổng kiến thức d&ugrave; l&agrave; nhỏ nhất .</p>\n</div>'),
(56, 70, 'Adobe Premiere cơ bản - Dựng phim cho doanh nghiệp', 'Khóa Học Premiere giúp bạn trở thành chuyên gia dựng phim chuyên nghiệp - Tạo dựng cho bạn được một nền tảng vững chắc để có thể tiến xa hơn trong lĩnh vực dựng phim với phần mềm Pr', 10.00, '[GWD]-1.jpg', '[1VC]-Islands---2119.mp4', 19, 0, 1, 0, '[]', '<div class=\"u-learn-what\">\n<h3>Bạn sẽ học được g&igrave;</h3>\n<div class=\"content\">\n<div class=\"row\">\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Nhanh ch&oacute;ng l&agrave;m quen v&agrave; sử dụng th&agrave;nh thạo phần mềm Adobe Premiere - phần mềm dựng phim chuy&ecirc;n nghiệp</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Theo kịp xu hướng của thời đại về dựng phim</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Th&agrave;nh thạo dựng được một TVC, s&acirc;n khấu ca nhạc, album cưới, kỉ yếu, giới thiệu sản phẩm cho doanh nghiệp...</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Tự tin v&agrave; dễ d&agrave;ng xin việc trong lĩnh vực phim ảnh.</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Tự tin mở c&aacute;c dịch vụ l&agrave;m phim chuy&ecirc;n nghiệp tại nh&agrave; để tăng th&ecirc;m thu nhập hiện tại</div>\n</div>\n</div>\n</div>\n</div>\n<p>&nbsp;</p>\n<div id=\"u-des-course\" class=\"u-des-course\">\n<h2>Giới thiệu kh&oacute;a học</h2>\n<h3><strong>Dựng phim - lĩnh vực hot kiếm bội tiền cho doanh nghiệp</strong></h3>\n<p>&nbsp; Hiện nay, đi&ecirc;̣n ảnh l&agrave; m&ocirc;̣t ng&agrave;nh c&ocirc;ng nghi&ecirc;̣p kh&ocirc;ng th&ecirc;̉ thi&ecirc;́u trong qu&aacute; tr&igrave;nh ph&aacute;t tri&ecirc;̉n văn h&oacute;a x&atilde; hội bởi những gi&aacute; trị của n&oacute;. Với n&ocirc;̣i dung, kịch bản v&ocirc; c&ugrave;ng đặc sắc, những b&ocirc;̣ phim d&ecirc;̃ d&agrave;ng truyền tải th&ocirc;ng điệp nh&acirc;n văn, mang những gi&aacute; trị tinh thần tới người xem.. Ngo&agrave;i ra, sức h&uacute;t của c&aacute;c bộ phim c&ograve;n phụ thuộc v&agrave;o tay ngh&ecirc;̀ của người c&acirc;̀m m&aacute;y v&agrave; đặc bi&ecirc;̣t l&agrave; th&ocirc;ng qua những bước chỉnh sửa xử l&yacute; cắt gh&eacute;p v&ocirc; c&ugrave;ng tỉ mỉ &nbsp;- ho&agrave;n hảo bởi những nh&agrave; dựng phim chuy&ecirc;n nghi&ecirc;̣p.&nbsp;</p>\n<p>&nbsp; Dựng phim l&agrave; một trong những ng&agrave;nh HOT nhất. &nbsp;Nếu bạn th&ocirc;ng thạo về dựng phim, chắc chắn bạn sẽ kh&ocirc;ng bao giờ lo thất nghiệp v&agrave; thậm ch&iacute; c&oacute; thể l&agrave;m việc tại c&aacute;c c&ocirc;ng ty quốc tế lớn với mức lương l&ecirc;n đến h&agrave;ng trăm triệu/th&aacute;ng.</p>\n<p>&nbsp; &nbsp;Để trở th&agrave;nh được một nh&agrave; dựng phim chuy&ecirc;n nghiệp th&igrave; kh&ocirc;ng thể thiếu vắng được c&aacute;c c&ocirc;ng cụ dựng phim, trong số c&aacute;c c&ocirc;ng cụ - phần mềm được biết đến v&agrave; sử dụng rộng r&atilde;i hiện nay. C&oacute; một phần mềm đang thu h&uacute;t sự ch&uacute; &yacute; của thế giới v&agrave; đang được tin d&ugrave;ng tại c&aacute;c c&ocirc;ng ty lớn của đ&oacute; ch&iacute;nh l&agrave; Adobe Premiere. L&agrave; một phần mềm dựng phim mạnh mẽ, trực quan v&agrave; dễ sử dụng nhất hiện nay, Premiere hiện đ&atilde; v&agrave; đang g&oacute;p mặt trong rất nhiều dự &aacute;n phim v&agrave; hậu k&igrave; nổi tiếng thế giới.</p>\n<h3>H&atilde;y đến với&nbsp;kh&oacute;a học Adobe Premiere&nbsp;l&agrave;m phim \"<strong>Adobe Premiere cơ bản - Dựng phim cho doanh nghiệp\"</strong>&nbsp;tại Unica</h3>\n<p>&nbsp; Với&nbsp;<strong>kh&oacute;a học Adobe Premiere</strong>&nbsp;cơ bản n&agrave;y, bạn sẽ l&agrave;m quen được giao diện, c&aacute;ch thức sử dụng c&aacute;c c&ocirc;ng cụ trong Premiere. V&agrave; sau kh&oacute;a học n&agrave;y, bạn sẽ c&oacute; c&oacute; hội kiếm cho m&igrave;nh một c&ocirc;ng việc với c&aacute;c ứng dụng như dựng TVC, Trailer phim, Event, album cưới, kỉ yếu bạn b&egrave;, hội họp, clip giới thiệu sản phẩm, c&ocirc;ng ty.... v&agrave; c&ograve;n hơn thế nữa, đồng thời tạo dựng cho bạn được một nền tảng vững chắc để c&oacute; thể tiến xa hơn trong lĩnh vực dựng phim.</p>\n<p>&nbsp; &nbsp;Tham gia kh&oacute;a học dựng phim l&agrave;m phim đỉnh cao \"<strong>Adobe Premiere cơ bản - Dựng phim cho doanh nghiệp\"&nbsp;</strong>ngay h&ocirc;m&nbsp;nay th&ocirc;i n&agrave;o!</p>\n</div>'),
(57, 70, 'Dựng video đỉnh cao trên Adobe Premiere', 'Khóa học cung cấp các kiến thức từ cơ bản đến chuyên sâu về phần mềm Adobe Premiere và tất cả các công cụ trên phần mềm, giúp người học có thể dựng hoàn thiện một video với đầy đủ các hiệu ứng hấp dẫn.', 5.00, '[SjZ]-2.jpg', '[DIl]-Islands---2119.mp4', 19, 0, 1, 0, '[]', '<h2>Giới thiệu kh&oacute;a học</h2>\n<p>Kh&oacute;a học&nbsp;<strong>Dựng video đỉnh cao&nbsp;tr&ecirc;n Adobe Premiere&nbsp;c</strong>ung cấp c&aacute;c kiến thức từ cơ bản đến chuy&ecirc;n s&acirc;u về phần mềm Adobe Premiere v&agrave; tất cả c&aacute;c c&ocirc;ng cụ&nbsp;tr&ecirc;n phần mềm, gi&uacute;p người học c&oacute; thể dựng ho&agrave;n thiện một video với đầy đủ c&aacute;c hiệu ứng hấp dẫn.</p>\n<p>Nội dung kho&aacute; học được bi&ecirc;n soạn&nbsp;bởi giảng vi&ecirc;n c&oacute; hơn 10 năm kinh nghiệm&nbsp;thực tế trong lĩnh vực quay phim, dựng phim, l&agrave;m đồ hoạ cho c&aacute;c video quảng c&aacute;o, gi&uacute;p người học dễ hiểu, dễ thực h&agrave;nh.</p>\n<p>Đăng k&yacute; kh&oacute;a học ngay để nhận được qu&agrave;&nbsp;tặng cực gi&aacute; trị:</p>\n<ul>\n<li>Tặng +5 intro Logo cơ bản tr&ecirc;n Adobe Premiere</li>\n<li>Tặng +1000 Text Animation tr&ecirc;n Adobe Premiere</li>\n<li>Tặng +500 LUT m&agrave;u được ph&acirc;n chia từng thư mục</li>\n<li>Tặng +300 Transitions hay d&ugrave;ng cho phim quảng c&aacute;o</li>\n<li>Tặng +300 Sound Effect hay d&ugrave;ng cho phim quảng c&aacute;o</li>\n<li>Tặng +300 Neon T&iacute;ch Hợp tr&ecirc;n Adobe Premiere</li>\n<li>Tặng +300 VFX Youtube tr&ecirc;n Adobe Premiere</li>\n<li>Tặng bộ chỉnh m&agrave;u da tr&ecirc;n Adobe Premiere</li>\n<li>Tặng +5 Effect Arrow Maker d&ugrave;ng cho Adobe Premiere</li>\n<li>Tặng +50 Call outs Graphic Motion d&ugrave;ng cho Adobe Premiere</li>\n<li>Tặng +2000 b&agrave;i nhạc nền (background music)</li>\n</ul>'),
(58, 70, 'Dựng phim nâng cao ca nhạc & hiệu ứng kỹ xảo với Adobe Premiere CC', 'Giúp bạn sở hữu kỹ năng nâng cao với những hiệu ứng kỹ xảo tuyệt vời trong Adobe Premiere CC.', 5.00, '[W3l]-Quy-trình-dựng-phim-HD-trên-Adobe-Premiere-CC_m_1597897525.jpg', '[qxM]-Islands---2119.mp4', 19, 1, 1, 0, '[]', '<div class=\"u-learn-what\">\n<h3>Bạn sẽ học được g&igrave;</h3>\n<div class=\"content\">\n<div class=\"row\">\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Học vi&ecirc;n nắm được nhiều kỹ năng từ cơ bản đến n&acirc;ng cao trong&nbsp;Adobe Premiere CC</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Nắm được hương ph&aacute;p dựng Multicam hỗ trợ trong việc dựng phim ca nhạc nhanh ch&oacute;ng v&agrave; chuy&ecirc;n nghiệp.</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Th&agrave;nh thạo xử l&yacute; audio v&agrave; video</div>\n</div>\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">Tạo n&ecirc;n những hiệu ứng kỹ xảo đẹp mắt v&agrave; ấn tượng</div>\n</div>\n</div>\n</div>\n</div>\n<p>&nbsp;</p>\n<div id=\"u-des-course\" class=\"u-des-course\">\n<h2>Giới thiệu kh&oacute;a học</h2>\n<p>Kh&oacute;a học dựng phim online thiết kế d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng Studio. Với phương ph&aacute;p hướng dẫn &rdquo; Cầm Tay Chỉ Việc &rdquo; kết hợp với thu lại Video b&agrave;i giảng sẽ gi&uacute;p cho học vi&ecirc;n nhanh ch&oacute;ng tiếp cận phần mềm m&agrave; kh&ocirc;ng lo bị hổng kiến thức d&ugrave; l&agrave; nhỏ nhất.</p>\n</div>');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `right_answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'câu trả lời đúng',
  `study_program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `inedex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_answers`
--

CREATE TABLE `student_answers` (
  `id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `test_examcises_id` int(11) NOT NULL,
  `selection` text COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_program`
--

CREATE TABLE `study_program` (
  `id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'trang thái',
  `random_question` tinyint(1) NOT NULL,
  `is_time_question` tinyint(1) NOT NULL,
  `number_minute_check` int(11) NOT NULL,
  `pass_poin` int(11) NOT NULL COMMENT 'điểm qua bài kiểm tra',
  `product_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `study_program`
--

INSERT INTO `study_program` (`id`, `content`, `status`, `random_question`, `is_time_question`, `number_minute_check`, `pass_poin`, `product_id`, `name`) VALUES
(53, '<div class=\"article__sapo cms-desc\">(PLO)-&nbsp; Gi&aacute;m đốc CDC&nbsp;Đồng Th&aacute;p Trần Văn Hai&nbsp;bị khởi tố, bắt tạm giam v&igrave; li&ecirc;n quan đến&nbsp;đấu thầu mua sắm sinh phẩm, thiết bị y tế của C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;.</div>\n<div class=\"article__body\">\n<div class=\"cms-body \">\n<p>Ng&agrave;y 20-5, Cơ quan CSĐT C&ocirc;ng an tỉnh Đồng Th&aacute;p đ&atilde; tống đạt quyết định khởi tố bị can v&agrave; bắt tạm giam Trần Văn Hai, Gi&aacute;m đốc Trung t&acirc;m kiểm so&aacute;t bệnh tật Đồng Th&aacute;p (CDC Đồng Th&aacute;p) v&agrave; Nguyễn Thị Lệ Ngọc, Ph&oacute; trưởng khoa x&eacute;t nghiệm &ndash; Chẩn đo&aacute;n h&igrave;nh ảnh - Thăm d&ograve; chức năng về tội vi phạm quy định về đấu thầu g&acirc;y hậu quả nghi&ecirc;m trọng.</p>\n<table class=\"video\">\n<tbody>\n<tr>\n<td>\n<div id=\"player-wrapper-4\">\n<div class=\"--z--player\" tabindex=\"1\" data-player=\"\">\n<div class=\"AdsPluginNonLinear\">&nbsp;</div>\n<div class=\"--z--player-poster\">\n<div class=\"--z--poster-controls --z--play-wrapper --z--active\">&nbsp;</div>\n</div>\n<button class=\"--z--big-play-button\" title=\"Ph&aacute;t\" type=\"button\"></button></div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n<p>Cả bị hai bị bắt do sai phạm li&ecirc;n quan trong mua sắm sinh phẩm, thiết bị y tế của C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;.</p>\n<table class=\"picture\" align=\"center\">\n<tbody>\n<tr>\n<td class=\"pic\"><a class=\"photo\" href=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" data-desc=\"Gi&aacute;m đốc CDC Đồng Th&aacute;p Trần Văn Hai.\" data-index=\"0\"><img class=\"cms-photo lazyloaded\" src=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" alt=\"Bắt gi&aacute;m đốc CDC tỉnh Đồng Th&aacute;p ảnh 1\" data-image-id=\"1615608\" data-width=\"700\" data-height=\"513\" data-photo-original-src=\"\" data-src=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" /></a></td>\n</tr>\n<tr>\n<td class=\"caption\">\n<p>Gi&aacute;m đốc CDC Đồng Th&aacute;p Trần Văn Hai.</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>Trước đ&oacute; Cơ quan CSĐT C&ocirc;ng an tỉnh Đồng Th&aacute;p đ&atilde; khởi tố vụ &aacute;n h&igrave;nh sự vi phạm quy định về đấu thầu g&acirc;y hậu quả nghi&ecirc;m trọng xảy ra tại CDC Đồng Th&aacute;p v&agrave; c&aacute;c đơn vị, cơ sở y tế kh&aacute;c tr&ecirc;n địa b&agrave;n.</p>\n<p>Theo th&ocirc;ng b&aacute;o kết luận thanh tra tỉnh Đồng Th&aacute;p về việc mua sắm trang thiết bị, vật tư y tế, sinh phẩm, kit x&eacute;t nghiệm, vaccine, thuốc ph&ograve;ng chống COVID-19 cho thấy c&oacute; 30 g&oacute;i thầu về hồ sơ, tr&igrave;nh tự, thủ tục cơ bản c&aacute;c chủ đầu tư tu&acirc;n thủ quy định về mua sắm.</p>\n<p>Tuy nhi&ecirc;n, vẫn c&ograve;n một số hạn chế được ghi nhận l&agrave; một v&agrave;i Chủ đầu tư ứng h&agrave;ng trước khi k&yacute; hợp đồng; việc theo d&otilde;i nhập, xuất kho chưa hợp l&yacute;.</p>\n<p>Một số hồ sơ dự thầu, tr&uacute;ng thầu thiếu Tờ khai hải quan, chứng nhận xuất xứ (CO), chứng nhận chất lượng (CQ) đối với c&aacute;c h&agrave;ng h&oacute;a nhập khẩu. Bi&ecirc;n bản b&agrave;n giao v&agrave; nghiệm thu h&agrave;ng h&oacute;a chưa c&oacute; chữ k&yacute; của c&aacute;n bộ kỹ thuật. Thiếu hồ sơ chứng minh xuất xứ, m&atilde; k&yacute; hiệu, nh&atilde;n m&aacute;c, t&iacute;nh hợp lệ của sản phẩm, h&agrave;ng h&oacute;a.</p>\n<p>Trong c&aacute;c g&oacute;i thầu n&oacute;i tr&ecirc;n, c&aacute;c đơn vị tr&ecirc;n địa b&agrave;n tỉnh đ&atilde; mua sắm 10 g&oacute;i thầu với gi&aacute; trị hợp đồng l&agrave; hơn 233 tỉ đồng với C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;. Gi&aacute; trị thực tế mua sắm l&agrave; hơn 197 tỉ đồng, đ&atilde; thanh to&aacute;n hơn 156 tỉ đồng.</p>\n</div>\n</div>', 0, 0, 0, 0, 0, 55, ' GIỚI THIỆU TỔNG QUAN ADOBE PREMIERE'),
(54, '<h2 id=\"Gioi-thieu-ve-Adobe-Premiere\"><strong>Giới thiệu về Adobe Premiere</strong></h2>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/1-gioi-thieu-adobe-premiere.jpg?v=1608047141048\" width=\"868\" height=\"488\" data-thumb=\"original\" /></p>\n<p>Adobe Premiere (hay c&ograve;n gọi l&agrave; Pr) l&agrave; phần mềm được h&atilde;ng Adobe Systems ra mắt v&agrave;o năm 1985 với nhiệm vụ hỗ trợ người d&ugrave;ng trong c&ocirc;ng việc chỉnh sửa đồ họa vector. V&agrave;o năm 2018, Tạp ch&iacute; PC Magazine đ&aacute;nh gi&aacute; Adobe Illustrator l&agrave; chương tr&igrave;nh chỉnh sửa đồ họa vector tốt nhất.</p>\n<p>Đối với những người theo học hoặc l&agrave;m trong lĩnh vực thiết kế đồ họa, dựng video th&igrave; th&ocirc;ng thạo Pr được coi như b&agrave;i học vỡ l&ograve;ng m&agrave; tất cả mọi người phải nắm r&otilde;. Thậm ch&iacute;, việc sử dụng Pr c&ograve;n được đưa v&agrave;o gi&aacute;o tr&igrave;nh giảng dạy ở một số trường đại học, cao đẳng.&nbsp;</p>\n<p>Adobe Premiere l&agrave; phần mềm dựng phim sở hữu rất nhiều t&iacute;nh năng vượt trội v&agrave; v&ocirc; c&ugrave;ng chuy&ecirc;n nghiệp. Ứng dụng c&oacute; thể hỗ trợ người d&ugrave;ng sản xuất video với độ ph&acirc;n giải cao l&ecirc;n đến 10.240 &times; 8.192, l&ecirc;n đến 32-bits cho mỗi điểm m&agrave;u sắc, trong cả hai bảng m&atilde; RGB v&agrave; YUV. N&oacute; c&ograve;n c&oacute; khả năng chỉnh sửa &acirc;m thanh, hỗ trợ VST audio v&agrave; &acirc;m thanh 5.1 trộn sẵn.</p>\n<p>Sản phẩm tương th&iacute;ch với nhiều hệ điều h&agrave;nh kh&aacute;c nhau từ Mac OS của Apple cho đến hệ điều h&agrave;nh quốc d&acirc;n Windows. Nhờ vậy m&agrave; nhiều định dạng video v&agrave; tập tin &acirc;m thanh tr&ecirc;n cả hai hệ điều h&agrave;nh n&agrave;y đều được hỗ trợ.</p>\n<p>Chưa hết, Premiere c&ograve;n c&oacute; khả năng t&iacute;ch hợp với nhiều phần mềm kh&aacute;c nhau như After Effects, Photoshop, tạo thuận lợi cho người d&ugrave;ng trong qu&aacute; tr&igrave;nh sản xuất video, phim.</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/2-gioi-thieu-adobe-premiere-jpeg.jpg?v=1608047151027\" width=\"679\" height=\"378\" data-thumb=\"original\" /></p>\n<p>Bởi những đặc điểm ưu việt tr&ecirc;n m&agrave; phần mềm Adobe Premiere được người s&aacute;ng tạo nội dung video tin d&ugrave;ng. Với phần mềm n&agrave;y bạn c&oacute; thể:</p>\n<ul>\n<li>Xử l&yacute;, chỉnh sửa c&aacute;c file dạng video, h&igrave;nh ảnh, typographic.</li>\n<li>Sắp xếp, cắt dựng nhiều video gốc th&agrave;nh một video ho&agrave;n chỉnh.</li>\n<li>Tạo c&aacute;c hiệu ứng, bộ lọc, kỹ xảo trong video</li>\n<li>L&agrave;m Subtitle (phụ đề) &ndash; Phần mở đầu/ kết th&uacute;c phim &ndash; Ch&egrave;n logo v&agrave; h&igrave;nh ảnh.</li>\n<li>Xử l&yacute; &acirc;m thanh trong video</li>\n<li>Xuất video bằng nhiều định dạng kh&aacute;c nhau, bao gồm c&aacute;c bản ghi &acirc;m băng video, DVD, v&agrave; c&aacute;c định dạng video phổ biến Internet.</li>\n</ul>\n<p>Nh&igrave;n chung, việc dựng một bộ phim ngắn, bản tin, hoặc bất kỳ loại video n&agrave;o kh&aacute;c sẽ đơn giản hơn nhiều với Adobe Premiere.</p>\n<h2 id=\"Yeu-cau-cau-hinh\"><strong>Y&ecirc;u cầu cấu h&igrave;nh</strong></h2>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/3-gioi-thieu-adobe-premiere.jpg?v=1608047173269\" data-thumb=\"original\" /></p>\n<p>Adobe Premiere l&agrave; một ứng dụng tương đối &ldquo;nặng đ&ocirc;&rdquo;, v&igrave; vậy, n&oacute; đ&ograve;i hỏi một v&agrave;i th&ocirc;ng số kỹ thuật tương đối cao, cụ thể l&agrave;:</p>\n<ul>\n<li>Hệ điều h&agrave;nh: Windows 10 64-bit (Đối với hệ điều h&agrave;nh Windows) hoặc macOS 10.12 trở l&ecirc;n (Đối với hệ điều h&agrave;nh MacOS)</li>\n<li>CPU: Intel thế hệ thứ 6 hoặc chip AMD tương đương trở l&ecirc;n</li>\n<li>RAM: 8GB. Ưu ti&ecirc;n sử dụng RAM 16GB cho video HD v&agrave; 32GB cho video 4K</li>\n<li>Card đồ họa rời: 2GB VRAM trở l&ecirc;n. Tối ưu nhất khi d&ugrave;ng card đồ họa rời 4GB VRAM</li>\n<li>Dung lượng trống: 8GB trở l&ecirc;n. Tối ưu nhất khi d&ugrave;ng SSD 12GB</li>\n<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh: 1280 x 800 trở l&ecirc;n</li>\n</ul>\n<h2 id=\"Cach-cai-dat\"><strong>C&aacute;ch c&agrave;i đặt</strong></h2>\n<p>Hiện nay, nh&agrave; ph&aacute;t h&agrave;nh Adobe đ&atilde; cho ra mắt phi&ecirc;n bản mới nhất l&agrave; Adobe Premiere CC 2020. Bạn c&oacute; thể tham khảo tải ứng dụng Adobe Premiere CC 2020 v&agrave; mua bản quyền&nbsp;<a href=\"https://creativecloud.adobe.com/apps/download/premiere?promoid=KSPCX\">tại đ&acirc;y</a></p>\n<p>Sau khi đ&atilde; tải về m&aacute;y, bạn cần ngắt kết nối Internet v&agrave; phần mềm diệt Virus v&agrave; tiến h&agrave;nh giải n&eacute;n File vừa tải về.</p>\n<p>Sau khi giải n&eacute;n xong, chạy file &rdquo; Adobe.Premiere.Pro.2020.v14.0.exe &rdquo;. L&uacute;c n&agrave;y m&aacute;y t&iacute;nh sẽ xuất hiện th&ocirc;ng b&aacute;o như h&igrave;nh dưới. Bạn bấm OK</p>\n<p><img src=\"https://bizweb.dktcdn.net/100/330/208/files/4-gioi-thieu-adobe-premiere-a0b87338-4d18-4141-8107-675a029bd286.png?v=1608047613221\" data-thumb=\"original\" /></p>\n<p>Sau đ&oacute;, t&iacute;ch &ocirc; t&ugrave;y chọn như h&igrave;nh dưới v&agrave; bấm INSTALL</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/5-gioi-thieu-adobe-premiere.jpg?v=1608047244839\" width=\"704\" height=\"455\" data-thumb=\"original\" /></p>\n<p>Đợi phần mềm c&agrave;i đặt, khi hiện ra th&ocirc;ng b&aacute;o như h&igrave;nh dưới th&igrave; Bấm Continue</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/6-gioi-thieu-adobe-premiere-cb26baeb-2f69-4bb7-8a6a-eab6ab1e171c.jpg?v=1608047300082\" width=\"701\" height=\"767\" data-thumb=\"original\" /></p>\n<p>B&acirc;y giờ, bạn h&atilde;y đợi phần mềm c&agrave;i đặt tr&ecirc;n m&aacute;y</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/7-gioi-thieu-adobe-premiere-de0a4af4-451f-496f-8e9d-733b89e7de70.jpg?v=1608047282308\" width=\"705\" height=\"771\" data-thumb=\"original\" /></p>\n<p>Nếu c&agrave;i đặt th&agrave;nh c&ocirc;ng, ứng dụng sẽ xuất hiện th&ocirc;ng b&aacute;o như h&igrave;nh b&ecirc;n dưới. Chọn OK.</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/8-gioi-thieu-adobe-premiere.jpg?v=1608047321513\" width=\"640\" height=\"406\" data-thumb=\"original\" /></p>\n<p>Như vậy, bạn đ&atilde; c&agrave;i đặt th&agrave;nh c&ocirc;ng phần mềm Adobe Photoshop CC 2020. Giờ bạn c&oacute; thể sử dụng phần mềm n&agrave;y để chỉnh sửa, dựng video được rồi!</p>\n<h2 id=\"Huong-dan-su-dung-Adobe-Premiere\"><strong>Hướng dẫn sử dụng Adobe Premiere&nbsp;</strong></h2>\n<p>Để sử dụng th&agrave;nh thạo Pr, bạn cần c&oacute; thời gian để luyện tập. Đầu ti&ecirc;n, bạn cần hiểu r&otilde; c&aacute;ch bố tr&iacute; giao diện của phần mềm n&agrave;y.</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/9-gioi-thieu-adobe-premiere.jpg?v=1608047351473\" width=\"1049\" height=\"423\" data-thumb=\"original\" /></p>\n<p>Giao diện bao gồm 6 phần ch&iacute;nh:</p>\n<ul>\n<li>Menu bar</li>\n<li>Program bar: Đ&acirc;y l&agrave; kh&ocirc;ng gian hiển thị sản phẩm sau qu&aacute; tr&igrave;nh dựng, n&oacute; cho ph&eacute;p người d&ugrave;ng xem lại video sau khi đ&atilde; thao t&aacute;c trong qu&aacute; tr&igrave;nh dựng.</li>\n<li>Source pan: C&oacute; chức năng cho người d&ugrave;ng xem lại c&aacute;c file nguồn.</li>\n<li>Project and media: Đ&acirc;y l&agrave; nơi chứa tất cả c&aacute;c file nguồn đ&atilde; import, c&aacute;c đoạn text, c&aacute;c hiệu ứng, kỹ xảo được tạo trong khi dựng.</li>\n<li>Timeline: Đ&acirc;y l&agrave; cửa sổ xuất hiện tiến độ l&agrave;m việc của sequence, bao gồm c&aacute;c đường h&igrave;nh (Video tracks) v&agrave; c&aacute;c đường tiếng (Audio tracks).</li>\n<li>Toolbar: Bao gồm c&aacute;c c&ocirc;ng cụ hỗ trợ như cắt gh&eacute;p video gốc, di chuyển c&aacute;c video, ch&egrave;n chữ v&agrave;o khung h&igrave;nh,...</li>\n</ul>\n<p>Để c&oacute; thể chỉnh sửa hoặc bi&ecirc;n tập một video. Bạn phải tạo được một Project để quản l&yacute; c&aacute;c file v&agrave; chỉnh sửa ch&uacute;ng.&nbsp;</p>\n<p>Đầu ti&ecirc;n, bạn khởi động phần mềm, chọn new project, sau đ&oacute; cửa sổ như ph&iacute;a dưới sẽ xuất hiện.&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://bizweb.dktcdn.net/100/330/208/files/10-gioi-thieu-adobe-premiere.jpg?v=1608047372742\" width=\"815\" height=\"930\" data-thumb=\"original\" /></p>\n<p>Bạn h&atilde;y điền c&aacute;c yếu tố cần thiết trong bảng:&nbsp;</p>\n<ul>\n<li>Name: T&ecirc;n cho project</li>\n<li>Location: Thư mục m&agrave; bạn muốn chứa project</li>\n</ul>\n<p>Sau khi đ&atilde; ho&agrave;n th&agrave;nh xong hai bước tr&ecirc;n, nhấn Ok hoặc Enter l&agrave; một Project mới đ&atilde; sẵn s&agrave;ng.&nbsp;</p>\n<p>Tr&ecirc;n đ&acirc;y l&agrave; phần giới thiệu v&agrave; c&aacute;ch c&agrave;i đặt Adobe Premiere d&agrave;nh cho bạn.</p>\n<p>Để c&oacute; thể sử dụng phần mềm n&agrave;y một c&aacute;ch mượt m&agrave;, bạn n&ecirc;n trang bị cho bản th&acirc;n một chiếc laptop ph&ugrave; hợp. H&atilde;y đến ngay laptop Tường Ch&iacute; L&acirc;m 153 L&ecirc; Thanh Nghị để sở hữu một chiếc laptop ưng &yacute; với nhiều phần qu&agrave; hấp dẫn!</p>', 1, 0, 0, 0, 0, 55, 'GIỚI THIỆU TỔNG QUAN ADOBE PREMIERE'),
(55, 'null', 1, 0, 0, 0, 0, 55, 'Phần 2: CÁC CÔNG CỤ & TÍNH NĂNG TRÊN ADOBE PREMIERE'),
(56, 'null', 1, 0, 0, 0, 0, 55, 'Phần 3: PLUGIN CHỈNH MÀU CAO CẤP TRÊN ADOBE PREMIERE'),
(57, 'null', 1, 0, 0, 0, 0, 55, ' Phần 4: XUẤT PHIM TRÊN ADOBE PREMIERE'),
(58, '', 0, 0, 0, 0, 0, 55, ' Bài 1: Giới Thiệu Tổng Quan Phần Mềm Adobe Premiere CC');

-- --------------------------------------------------------

--
-- Table structure for table `test_exercises`
--

CREATE TABLE `test_exercises` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `study_program_id` int(11) NOT NULL,
  `point` int(11) NOT NULL COMMENT 'Điểm bài kiểm tra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `status_transaction` tinyint(1) NOT NULL,
  `list_cart` longtext COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL COMMENT 'tổng số tiền cần thanh toán',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa điểm thanh toán',
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `phone`, `status_transaction`, `list_cart`, `message`, `amount`, `address`, `created`) VALUES
(72, 49, '0904195755', 3, '[89]', '1234', 20.00, '1234', '2022-05-20 12:33:25'),
(73, 19, '0374668113', 3, '[90]', 'Giao giờ hành chính ', 20.00, 'Hà Nội', '2022-05-22 19:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`info`)),
  `list_product_open` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]' CHECK (json_valid(`list_product_open`)),
  `rank` int(10) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `coin` int(10) NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_user` tinyint(1) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT 0 COMMENT '0:là chưa chọn,\r\n1: là nam,\r\n2: là nữ\r\n3: giới tính khác',
  `create` varchar(100) COLLATE utf8_unicode_ci DEFAULT current_timestamp(),
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `address`, `info`, `list_product_open`, `rank`, `role`, `coin`, `password`, `status_user`, `avatar`, `gender`, `create`, `position`) VALUES
(19, 'Quản trị viên', '0374668113', 'admin@edu.com', 'Thanh Hóa ', '{\"introduce\":\"<p>L&agrave; một trong giảng vi&ecirc;n ưu t&uacute;&nbsp;&nbsp;</p>\"}', '[55]', 0, 'admin', 0, '123456789', 1, '[zu8]-1ae8eba774712b4350f5f61beb3a4119.jpg', 1, '2021-04-22 19:50:32', ''),
(48, 'Người dùng mới', '904195711', 'aadmin@x.com', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2022-05-20 19:11:57', ''),
(49, 'Người dùng mới', '0904195755', 'test@edu.com', '', '{}', '[55]', 0, 'user', 0, '123456', 1, '', 0, '2022-05-20 19:32:13', 'Người dùng');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Video chưc được đặt tên',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `study_program_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `isPreview` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `name`, `img`, `link_video`, `file_document`, `study_program_id`, `product_id`, `isPreview`) VALUES
(61, ' Bài 1: Giới Thiệu Tổng Quan Phần Mềm Adobe Premiere CC', '[BtW]-Quy-trình-dựng-phim-HD-trên-Adobe-Premiere-CC_m_1597897525.jpg', '[wtA]-Islands---2119.mp4', '', 53, 55, 1),
(63, ' Bài 1: Giới Thiệu Tổng Quan Phần Mềm Adobe Premiere CC', '[rjr]-3.jpg', '[5pY]-Islands---2119.mp4', '', 54, 55, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id_biodata`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_video_id_foreign` (`video_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_video_id_foreign` (`video_id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transaction_id_foreign` (`transaction_id`),
  ADD KEY `order_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_catalog_id_foreign` (`catalog_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_study_program_id_foreign` (`study_program_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_answers_user_id_foreign` (`user_id`),
  ADD KEY `student_answers_test_examcises_id_foreign` (`test_examcises_id`),
  ADD KEY `student_answers_id_question_foreign` (`id_question`);

--
-- Indexes for table `study_program`
--
ALTER TABLE `study_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_program_product_id_foreign` (`product_id`);

--
-- Indexes for table `test_exercises`
--
ALTER TABLE `test_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_exercises_user_id_foreign` (`user_id`),
  ADD KEY `test_exercises_study_program_id_foreign` (`study_program_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_user_id_foreign` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_program`
--
ALTER TABLE `study_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `test_exercises`
--
ALTER TABLE `test_exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
