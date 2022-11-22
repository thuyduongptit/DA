-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 21, 2021 lúc 02:52 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbunica`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `biodata`
--

CREATE TABLE `biodata` (
  `id_biodata` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `biodata`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
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
-- Đang đổ dữ liệu cho bảng `cart`
--

--
-- Cấu trúc bảng cho bảng `category`
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
-- Đang đổ dữ liệu cho bảng `category`
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
(172, 75, '', 1, 'Kỹ xảo', '', 1, '2021-07-14 21:41:36'),
(178, 1, '', 1, 'mong', '111', 1, '2021-07-15 08:57:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
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
-- Cấu trúc bảng cho bảng `feedback`
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
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `status_order` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
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
-- Cấu trúc bảng cho bảng `product_reviews`
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
-- Cấu trúc bảng cho bảng `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `right_answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'câu trả lời đúng',
  `study_program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `inedex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Cấu trúc bảng cho bảng `student_answers`
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
-- Cấu trúc bảng cho bảng `study_program`
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
-- Cấu trúc bảng cho bảng `test_exercises`
--

CREATE TABLE `test_exercises` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `study_program_id` int(11) NOT NULL,
  `point` int(11) NOT NULL COMMENT 'Điểm bài kiểm tra'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
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
-- Đang đổ dữ liệu cho bảng `transaction`
--


--
-- Cấu trúc bảng cho bảng `user`
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
  `create` varchar(100) COLLATE utf8_unicode_ci DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `address`, `info`, `list_product_open`, `rank`, `role`, `coin`, `password`, `status_user`, `avatar`, `gender`, `create`) VALUES
(19, 'Lê Văn Mong ', '0374668113', 'admin@utt.com', 'Thanh Hóa ', '{\"introduce\":\"<p>L&agrave; một trong giảng vi&ecirc;n ưu t&uacute;&nbsp;&nbsp;</p>\"}', '[39]', 0, 'admin', 0, '123456', 1, '[wBY]-[IC5]-hinh-anh-doraenom-300x300.jpg', 1, '2021-04-22 19:50:32'),
(36, '', '', '0374668113@gmail.com', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 21:27:09'),
(37, 'Người dùng mới', '0374668113', 'vkvk@gmail.com', '', '{\"introduce\":null}', '[]', 0, 'teacher', 0, '123456', 1, '', 0, '2021-07-14 22:38:16'),
(38, 'Người dùng mới', '0374668115', 'mama@gmail.com', 'mong', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 22:52:33'),
(39, 'Người dùng mới', '0904195777', '3213123@', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 23:22:51'),
(40, 'Người dùng mới', '0904195777', '111111@ffff', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 23:27:21'),
(41, 'Người dùng mới', '0904195776', '111111@com', 'vvv', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 23:32:18'),
(42, 'Người dùng mới', '0904195777', 'mongy@ma.com', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 23:43:52'),
(43, 'Người dùng mới', '0904195774', 'mongy@ma7.com', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-14 23:48:40'),
(44, 'Tài khoản test', '0904195771', 'test1@utt.com', '123456', '{\"introduce\":null}', '[39]', 0, 'teacher', 0, '123456', 1, '[DHX]-shopping-cart.png', 2, '2021-07-15 06:18:37'),
(45, 'Người dùng mới', '0904195733', 'test2@utt.com', '', '{\"introduce\":null,\"categoryFollow\":67}', '[40]', 0, 'teacher', 0, '123456', 1, '', 0, '2021-07-15 06:34:00'),
(46, 'Người dùng mới', '0904195776', 'test5@utt.com', '', '{}', '[]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-15 08:43:53'),
(47, 'Người dùng mới', '0904195727', 'mong123@gmail.com', '', '{}', '[41]', 0, 'user', 0, '123456', 1, '', 0, '2021-07-15 08:44:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
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
-- Đang đổ dữ liệu cho bảng `video`
--


--
-- Chỉ mục cho bảng `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id_biodata`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_video_id_foreign` (`video_id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_video_id_foreign` (`video_id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transaction_id_foreign` (`transaction_id`),
  ADD KEY `order_cart_id_foreign` (`cart_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_catalog_id_foreign` (`catalog_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_study_program_id_foreign` (`study_program_id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_answers_user_id_foreign` (`user_id`),
  ADD KEY `student_answers_test_examcises_id_foreign` (`test_examcises_id`),
  ADD KEY `student_answers_id_question_foreign` (`id_question`);

--
-- Chỉ mục cho bảng `study_program`
--
ALTER TABLE `study_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_program_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `test_exercises`
--
ALTER TABLE `test_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_exercises_user_id_foreign` (`user_id`),
  ADD KEY `test_exercises_study_program_id_foreign` (`study_program_id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `study_program`
--
ALTER TABLE `study_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `test_exercises`
--
ALTER TABLE `test_exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
--ALTER TABLE `cart`
--  ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
--  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
----
---- Các ràng buộc cho bảng `comment`
----
--ALTER TABLE `comment`
--  ADD CONSTRAINT `comment_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
--ALTER TABLE `feedback`
--  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
--  ADD CONSTRAINT `feedback_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
--ALTER TABLE `order`
--  ADD CONSTRAINT `order_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
--  ADD CONSTRAINT `order_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
--ALTER TABLE `product`
--  ADD CONSTRAINT `product_catalog_id_foreign` FOREIGN KEY (`catalog_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `product_reviews`
--
--ALTER TABLE `product_reviews`
--  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
--  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `question`
--
--ALTER TABLE `question`
--  ADD CONSTRAINT `question_study_program_id_foreign` FOREIGN KEY (`study_program_id`) REFERENCES `study_program` (`id`);

--
-- Các ràng buộc cho bảng `student_answers`
--
--ALTER TABLE `student_answers`
--  ADD CONSTRAINT `student_answers_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`),
--  ADD CONSTRAINT `student_answers_test_examcises_id_foreign` FOREIGN KEY (`test_examcises_id`) REFERENCES `test_exercises` (`id`),
--  ADD CONSTRAINT `student_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `study_program`
--
--ALTER TABLE `study_program`
--  ADD CONSTRAINT `study_program_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `test_exercises`
--
--ALTER TABLE `test_exercises`
--  ADD CONSTRAINT `test_exercises_study_program_id_foreign` FOREIGN KEY (`study_program_id`) REFERENCES `study_program` (`id`),
--  ADD CONSTRAINT `test_exercises_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `transaction`
--
--ALTER TABLE `transaction`
--  ADD CONSTRAINT `transaction_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
