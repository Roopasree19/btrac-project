-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 04:39 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `register_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app5_admin_tb`
--

CREATE TABLE `app5_admin_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app5_cart_tb`
--

CREATE TABLE `app5_cart_tb` (
  `id` bigint(20) NOT NULL,
  `totalamount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `pid_id` bigint(20) NOT NULL,
  `uid_id` bigint(20) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app5_cart_tb`
--

INSERT INTO `app5_cart_tb` (`id`, `totalamount`, `status`, `pid_id`, `uid_id`, `quantity`) VALUES
(1, '550.0', 'paid', 3, 1, '1'),
(2, '220.0', 'paid', 1, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `app5_log_tb`
--

CREATE TABLE `app5_log_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hashpass` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app5_log_tb`
--

INSERT INTO `app5_log_tb` (`id`, `name`, `email`, `password`, `hashpass`) VALUES
(1, 'anu', 'anu@gmail.com', '123', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `app5_payment_tb`
--

CREATE TABLE `app5_payment_tb` (
  `id` bigint(20) NOT NULL,
  `total` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `uid_id` bigint(20) NOT NULL,
  `time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app5_payment_tb`
--

INSERT INTO `app5_payment_tb` (`id`, `total`, `status`, `date`, `uid_id`, `time`) VALUES
(1, '770.0', 'paid', '2022-12-16', 1, '10:02:36.969277');

-- --------------------------------------------------------

--
-- Table structure for table `app5_pro_tb`
--

CREATE TABLE `app5_pro_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app5_pro_tb`
--

INSERT INTO `app5_pro_tb` (`id`, `name`, `price`, `desc`, `image`, `gender`, `category`) VALUES
(1, 'az', '200', 'black', 'product/ep4_KGoLozK.png', 'female', 'watches'),
(2, 'fd', '500', 'black', 'product/ep3_BD2V2VY.png', 'male', 'watches'),
(3, 'vb', '500', 'red', 'product/mw2_uYVO4p7.png', 'male', 'tshirts'),
(4, 'mn', '400', 'red', 'product/a7_i75ZrKR.png', 'female', 'tshirts'),
(5, 'kh', '600', 'brown', 'product/mw3_QzIZmWD.png', 'male', 'footwear'),
(6, 'ops', '850', 'lether', 'product/w1.png', 'female', 'footwear'),
(7, 'ht', '600', 'orange', 'product/w4_feQAcsk.png', 'female', 'bags');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add log_tb', 6, 'add_log_tb'),
(22, 'Can change log_tb', 6, 'change_log_tb'),
(23, 'Can delete log_tb', 6, 'delete_log_tb'),
(24, 'Can view log_tb', 6, 'view_log_tb'),
(25, 'Can add admin_tb', 7, 'add_admin_tb'),
(26, 'Can change admin_tb', 7, 'change_admin_tb'),
(27, 'Can delete admin_tb', 7, 'delete_admin_tb'),
(28, 'Can view admin_tb', 7, 'view_admin_tb'),
(29, 'Can add pro_tb', 8, 'add_pro_tb'),
(30, 'Can change pro_tb', 8, 'change_pro_tb'),
(31, 'Can delete pro_tb', 8, 'delete_pro_tb'),
(32, 'Can view pro_tb', 8, 'view_pro_tb'),
(33, 'Can add cart_tb', 9, 'add_cart_tb'),
(34, 'Can change cart_tb', 9, 'change_cart_tb'),
(35, 'Can delete cart_tb', 9, 'delete_cart_tb'),
(36, 'Can view cart_tb', 9, 'view_cart_tb'),
(37, 'Can add payment_tb', 10, 'add_payment_tb'),
(38, 'Can change payment_tb', 10, 'change_payment_tb'),
(39, 'Can delete payment_tb', 10, 'delete_payment_tb'),
(40, 'Can view payment_tb', 10, 'view_payment_tb');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'app5', 'admin_tb'),
(9, 'app5', 'cart_tb'),
(6, 'app5', 'log_tb'),
(10, 'app5', 'payment_tb'),
(8, 'app5', 'pro_tb'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'app5', '0001_initial', '2022-12-16 04:20:15.460024'),
(2, 'app5', '0002_admin_tb', '2022-12-16 04:20:15.642803'),
(3, 'app5', '0003_pro_tb', '2022-12-16 04:20:15.809389'),
(4, 'app5', '0004_pro_tb_category_alter_pro_tb_image', '2022-12-16 04:20:16.526010'),
(5, 'app5', '0005_pro_tb_quantity_cart_tb', '2022-12-16 04:20:17.845613'),
(6, 'app5', '0006_remove_pro_tb_quantity_cart_tb_quantity', '2022-12-16 04:20:18.196050'),
(7, 'app5', '0007_payment_tb', '2022-12-16 04:20:18.750983'),
(8, 'app5', '0008_payment_tb_time', '2022-12-16 04:20:18.913591'),
(9, 'app5', '0009_alter_payment_tb_time', '2022-12-16 04:20:19.296378'),
(10, 'app5', '0010_order_tb', '2022-12-16 04:20:19.467695'),
(11, 'app5', '0011_delete_order_tb_payment_tb_image', '2022-12-16 04:20:19.786709'),
(12, 'app5', '0012_log_tb_hashpass', '2022-12-16 04:20:19.972259'),
(13, 'app5', '0013_remove_payment_tb_image', '2022-12-16 04:20:20.092974'),
(14, 'contenttypes', '0001_initial', '2022-12-16 04:20:20.633383'),
(15, 'contenttypes', '0002_remove_content_type_name', '2022-12-16 04:20:21.051343'),
(16, 'auth', '0001_initial', '2022-12-16 04:20:24.926046'),
(17, 'auth', '0002_alter_permission_name_max_length', '2022-12-16 04:20:25.396784'),
(18, 'auth', '0003_alter_user_email_max_length', '2022-12-16 04:20:25.577728'),
(19, 'auth', '0004_alter_user_username_opts', '2022-12-16 04:20:25.624111'),
(20, 'auth', '0005_alter_user_last_login_null', '2022-12-16 04:20:25.955510'),
(21, 'auth', '0006_require_contenttypes_0002', '2022-12-16 04:20:25.990916'),
(22, 'auth', '0007_alter_validators_add_error_messages', '2022-12-16 04:20:26.046622'),
(23, 'auth', '0008_alter_user_username_max_length', '2022-12-16 04:20:26.157526'),
(24, 'auth', '0009_alter_user_last_name_max_length', '2022-12-16 04:20:26.336621'),
(25, 'auth', '0010_alter_group_name_max_length', '2022-12-16 04:20:26.532882'),
(26, 'auth', '0011_update_proxy_permissions', '2022-12-16 04:20:26.614373'),
(27, 'auth', '0012_alter_user_first_name_max_length', '2022-12-16 04:20:26.701885'),
(28, 'sessions', '0001_initial', '2022-12-16 04:20:26.936419');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('atvcqcqimarmnq2sflxbqf01c6heuvay', 'eyJteWlkIjoxLCJteW5hbWUiOiJhbnUifQ:1p62GH:V2WDmviJw6-yONJCMoPM4h9aoAdDd82VmaDJpAO3TJM', '2022-12-30 04:23:53.311781');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app5_admin_tb`
--
ALTER TABLE `app5_admin_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app5_cart_tb`
--
ALTER TABLE `app5_cart_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app5_cart_tb_pid_id_f13ea751_fk_app5_pro_tb_id` (`pid_id`),
  ADD KEY `app5_cart_tb_uid_id_0188df19_fk_app5_log_tb_id` (`uid_id`);

--
-- Indexes for table `app5_log_tb`
--
ALTER TABLE `app5_log_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app5_payment_tb`
--
ALTER TABLE `app5_payment_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app5_payment_tb_uid_id_8e112434_fk_app5_log_tb_id` (`uid_id`);

--
-- Indexes for table `app5_pro_tb`
--
ALTER TABLE `app5_pro_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app5_admin_tb`
--
ALTER TABLE `app5_admin_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app5_cart_tb`
--
ALTER TABLE `app5_cart_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app5_log_tb`
--
ALTER TABLE `app5_log_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app5_payment_tb`
--
ALTER TABLE `app5_payment_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app5_pro_tb`
--
ALTER TABLE `app5_pro_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app5_cart_tb`
--
ALTER TABLE `app5_cart_tb`
  ADD CONSTRAINT `app5_cart_tb_pid_id_f13ea751_fk_app5_pro_tb_id` FOREIGN KEY (`pid_id`) REFERENCES `app5_pro_tb` (`id`),
  ADD CONSTRAINT `app5_cart_tb_uid_id_0188df19_fk_app5_log_tb_id` FOREIGN KEY (`uid_id`) REFERENCES `app5_log_tb` (`id`);

--
-- Constraints for table `app5_payment_tb`
--
ALTER TABLE `app5_payment_tb`
  ADD CONSTRAINT `app5_payment_tb_uid_id_8e112434_fk_app5_log_tb_id` FOREIGN KEY (`uid_id`) REFERENCES `app5_log_tb` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
