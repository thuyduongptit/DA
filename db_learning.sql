-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2022 at 02:46 PM
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
(89, 55, 49, 2, 'e9f58be5-6', 0, '2022-05-20 12:33:35');

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
(55, 70, 'Quy trình dựng phim HD trên Adobe Premiere CC', 'Khóa học thiết kế dành riêng cho khách hàng Studio. Với phương pháp hướng dẫn ” Cầm Tay Chỉ Việc ” kết hợp với thu lại Video bài giảng sẽ giúp cho học viên nhanh chóng tiếp cận phần mềm mà không lo bị hổng kiến thức dù là nhỏ nhất .', 20.00, '[p1F]-Quy-trình-dựng-phim-HD-trên-Adobe-Premiere-CC_m_1597897525.jpg', '[zYZ]-Islands---2119.mp4', 19, 0, 1, 1, '[49]', '<div class=\"u-learn-what\">\n<h3>Bạn sẽ học được g&igrave;</h3>\n<div class=\"content\">\n<div class=\"row\">\n<div class=\"col-sm-6 form-group\">\n<div class=\"title\">\n<p>Với 71 Video hướng dẫn sẽ gi&uacute;p học vi&ecirc;n hiểu hết tất cả c&aacute;c c&ocirc;ng cụ cũng&nbsp;&nbsp;t&iacute;nh năng tr&ecirc;n Adobe Premiere CC</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n<p>&nbsp;</p>\n<div id=\"u-des-course\" class=\"u-des-course\">\n<h2>Giới thiệu kh&oacute;a học</h2>\n<p>Kh&oacute;a học dựng phim online thiết kế d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng Studio. Với phương ph&aacute;p hướng dẫn &rdquo; Cầm Tay Chỉ Việc &rdquo; kết hợp với thu lại Video b&agrave;i giảng sẽ gi&uacute;p cho học vi&ecirc;n nhanh ch&oacute;ng tiếp cận phần mềm m&agrave; kh&ocirc;ng lo bị hổng kiến thức d&ugrave; l&agrave; nhỏ nhất .</p>\n</div>');

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
(53, '<div class=\"article__sapo cms-desc\">(PLO)-&nbsp; Gi&aacute;m đốc CDC&nbsp;Đồng Th&aacute;p Trần Văn Hai&nbsp;bị khởi tố, bắt tạm giam v&igrave; li&ecirc;n quan đến&nbsp;đấu thầu mua sắm sinh phẩm, thiết bị y tế của C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;.</div>\n<div class=\"article__body\">\n<div class=\"cms-body \">\n<p>Ng&agrave;y 20-5, Cơ quan CSĐT C&ocirc;ng an tỉnh Đồng Th&aacute;p đ&atilde; tống đạt quyết định khởi tố bị can v&agrave; bắt tạm giam Trần Văn Hai, Gi&aacute;m đốc Trung t&acirc;m kiểm so&aacute;t bệnh tật Đồng Th&aacute;p (CDC Đồng Th&aacute;p) v&agrave; Nguyễn Thị Lệ Ngọc, Ph&oacute; trưởng khoa x&eacute;t nghiệm &ndash; Chẩn đo&aacute;n h&igrave;nh ảnh - Thăm d&ograve; chức năng về tội vi phạm quy định về đấu thầu g&acirc;y hậu quả nghi&ecirc;m trọng.</p>\n<table class=\"video\">\n<tbody>\n<tr>\n<td>\n<div id=\"player-wrapper-4\">\n<div class=\"--z--player\" tabindex=\"1\" data-player=\"\">\n<div class=\"AdsPluginNonLinear\">&nbsp;</div>\n<div class=\"--z--player-poster\">\n<div class=\"--z--poster-controls --z--play-wrapper --z--active\">&nbsp;</div>\n</div>\n<button class=\"--z--big-play-button\" title=\"Ph&aacute;t\" type=\"button\"></button></div>\n</div>\n</td>\n</tr>\n</tbody>\n</table>\n<p>Cả bị hai bị bắt do sai phạm li&ecirc;n quan trong mua sắm sinh phẩm, thiết bị y tế của C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;.</p>\n<table class=\"picture\" align=\"center\">\n<tbody>\n<tr>\n<td class=\"pic\"><a class=\"photo\" href=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" data-desc=\"Gi&aacute;m đốc CDC Đồng Th&aacute;p Trần Văn Hai.\" data-index=\"0\"><img class=\"cms-photo lazyloaded\" src=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" alt=\"Bắt gi&aacute;m đốc CDC tỉnh Đồng Th&aacute;p ảnh 1\" data-image-id=\"1615608\" data-width=\"700\" data-height=\"513\" data-photo-original-src=\"\" data-src=\"https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/xqeioxdrky/2022_05_20/received-583278396565237-2364.jpeg\" /></a></td>\n</tr>\n<tr>\n<td class=\"caption\">\n<p>Gi&aacute;m đốc CDC Đồng Th&aacute;p Trần Văn Hai.</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>Trước đ&oacute; Cơ quan CSĐT C&ocirc;ng an tỉnh Đồng Th&aacute;p đ&atilde; khởi tố vụ &aacute;n h&igrave;nh sự vi phạm quy định về đấu thầu g&acirc;y hậu quả nghi&ecirc;m trọng xảy ra tại CDC Đồng Th&aacute;p v&agrave; c&aacute;c đơn vị, cơ sở y tế kh&aacute;c tr&ecirc;n địa b&agrave;n.</p>\n<p>Theo th&ocirc;ng b&aacute;o kết luận thanh tra tỉnh Đồng Th&aacute;p về việc mua sắm trang thiết bị, vật tư y tế, sinh phẩm, kit x&eacute;t nghiệm, vaccine, thuốc ph&ograve;ng chống COVID-19 cho thấy c&oacute; 30 g&oacute;i thầu về hồ sơ, tr&igrave;nh tự, thủ tục cơ bản c&aacute;c chủ đầu tư tu&acirc;n thủ quy định về mua sắm.</p>\n<p>Tuy nhi&ecirc;n, vẫn c&ograve;n một số hạn chế được ghi nhận l&agrave; một v&agrave;i Chủ đầu tư ứng h&agrave;ng trước khi k&yacute; hợp đồng; việc theo d&otilde;i nhập, xuất kho chưa hợp l&yacute;.</p>\n<p>Một số hồ sơ dự thầu, tr&uacute;ng thầu thiếu Tờ khai hải quan, chứng nhận xuất xứ (CO), chứng nhận chất lượng (CQ) đối với c&aacute;c h&agrave;ng h&oacute;a nhập khẩu. Bi&ecirc;n bản b&agrave;n giao v&agrave; nghiệm thu h&agrave;ng h&oacute;a chưa c&oacute; chữ k&yacute; của c&aacute;n bộ kỹ thuật. Thiếu hồ sơ chứng minh xuất xứ, m&atilde; k&yacute; hiệu, nh&atilde;n m&aacute;c, t&iacute;nh hợp lệ của sản phẩm, h&agrave;ng h&oacute;a.</p>\n<p>Trong c&aacute;c g&oacute;i thầu n&oacute;i tr&ecirc;n, c&aacute;c đơn vị tr&ecirc;n địa b&agrave;n tỉnh đ&atilde; mua sắm 10 g&oacute;i thầu với gi&aacute; trị hợp đồng l&agrave; hơn 233 tỉ đồng với C&ocirc;ng ty Cổ phần C&ocirc;ng nghệ Việt &Aacute;. Gi&aacute; trị thực tế mua sắm l&agrave; hơn 197 tỉ đồng, đ&atilde; thanh to&aacute;n hơn 156 tỉ đồng.</p>\n</div>\n</div>', 1, 0, 0, 0, 0, 55, ' GIỚI THIỆU TỔNG QUAN ADOBE PREMIERE');

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
(72, 49, '0904195755', 3, '[89]', '1234', 20.00, '1234', '2022-05-20 12:33:25');

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
(19, 'Quản trị viên', '0374668113', 'admin@edu.com', 'Thanh Hóa ', '{\"introduce\":\"<p>L&agrave; một trong giảng vi&ecirc;n ưu t&uacute;&nbsp;&nbsp;</p>\"}', '[]', 0, 'admin', 0, '123456789', 1, '[zu8]-1ae8eba774712b4350f5f61beb3a4119.jpg', 1, '2021-04-22 19:50:32', ''),
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
(61, ' Bài 1: Giới Thiệu Tổng Quan Phần Mềm Adobe Premiere CC', '[BtW]-Quy-trình-dựng-phim-HD-trên-Adobe-Premiere-CC_m_1597897525.jpg', '[wtA]-Islands---2119.mp4', '', 53, 55, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `test_exercises`
--
ALTER TABLE `test_exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
