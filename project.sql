-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2019 at 01:50 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(40) NOT NULL,
  `postid` int(40) NOT NULL,
  `ownerid` int(40) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `postid`, `ownerid`, `content`, `time`) VALUES
(5, 6, 3, 'Good picture!', '2019-12-08 22:37:19'),
(6, 6, 1, 'Thats LIT bro!', '2019-12-08 22:37:19'),
(9, 8, 4, 'Good', '2019-12-08 22:37:19'),
(12, 7, 1, 'OK!!!!', '2019-12-08 22:37:19'),
(13, 16, 2, 'Depqua', '2019-12-08 22:37:19'),
(15, 8, 2, 'Chat Day', '2019-12-08 22:37:19'),
(16, 6, 2, 'Thanks mans!', '2019-12-08 22:37:19'),
(19, 29, 1, 'Dep Do', '2019-12-08 22:37:19'),
(21, 10, 1, 'Dep Do', '2019-12-08 22:37:19'),
(22, 35, 3, 'So cute!', '2019-12-08 22:37:19'),
(23, 5, 3, 'Thanks, mate!', '2019-12-08 22:37:19'),
(24, 8, 1, 'Thanks mate!', '2019-12-08 22:39:11'),
(25, 37, 1, 'Thats Fun', '2019-12-08 22:40:58'),
(26, 38, 1, 'It\'s true', '2019-12-08 23:33:32'),
(27, 29, 2, 'So Good', '2019-12-09 21:46:37'),
(29, 29, 2, 'I love it', '2019-12-09 21:50:46'),
(31, 16, 2, 'Oh right!', '2019-12-09 23:08:00'),
(32, 36, 2, 'So cute', '2019-12-09 23:23:44'),
(33, 10, 2, 'Good Anh!', '2019-12-09 23:25:53'),
(34, 40, 3, 'LOL!', '2019-12-10 00:05:42'),
(35, 37, 3, 'Dcm vui vcl', '2019-12-10 00:14:41'),
(36, 36, 3, 'Xinh !', '2019-12-10 00:15:06'),
(37, 29, 3, 'ok ok !', '2019-12-10 00:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `like_of_comment`
--

CREATE TABLE `like_of_comment` (
  `id` int(40) NOT NULL,
  `ownerid` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like_of_post`
--

CREATE TABLE `like_of_post` (
  `id` int(40) NOT NULL,
  `ownerid` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `like_of_post`
--

INSERT INTO `like_of_post` (`id`, `ownerid`) VALUES
(5, 6),
(7, 2),
(10, 2),
(10, 3),
(29, 2),
(29, 3),
(35, 2),
(35, 3),
(35, 4),
(35, 6),
(36, 3),
(37, 3),
(38, 1),
(38, 2),
(38, 3),
(38, 4),
(38, 6),
(40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(40) NOT NULL,
  `description` text DEFAULT NULL,
  `ownerid` int(40) NOT NULL,
  `filename` text NOT NULL,
  `privacy` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `description`, `ownerid`, `filename`, `privacy`, `time`) VALUES
(5, 'This is the second picture', 3, 'e5fbd20faf4ffcd3449a614e69fde42f', 'no', '2019-12-05 11:05:41'),
(6, 'This is my first picture', 2, '2ecb11426c1f3705ecb399d8241d0e28', 'no', '2019-12-05 11:05:41'),
(7, 'This is my second picture', 2, 'b1ecc3f4baf5793ec1c61de41212d81f', 'no', '2019-12-05 11:05:41'),
(8, 'This is my first picture', 1, 'e32e94cf98d594eb1d3dba039710f146', 'no', '2019-12-05 11:05:41'),
(10, 'My dice 20', 4, '68aec82e385a82fe61fa5d6d6c921113', 'no', '2019-12-05 11:05:41'),
(16, 'Paul Pogba & Lukaku', 2, '37a8921fdd11b77f94dd51af9026d645', 'yes', '2019-12-05 11:05:41'),
(29, 'Good Morning', 2, '59a6d610e4c1526ff4b53e6fb2e654ef', 'no', '2019-12-06 20:50:58'),
(35, 'This is my dog', 3, '1575830230553_dog.jpeg', 'no', '2019-12-08 18:37:10'),
(36, 'Video', 3, '1575830850397_A7D58505-99D3-4E87-99BC-EAEACE57D569.mp4', 'no', '2019-12-08 18:47:30'),
(37, 'Kha Banh', 3, '1575832369605_2A43D8E9-1D07-4A9E-9F2D-A3A3909513AE.mp4', 'yes', '2019-12-08 19:12:49'),
(38, 'My project!', 1, '1575845971850_DCDE62A9-32B0-438E-8D53-8707C894C044.mp4', 'no', '2019-12-08 22:59:31'),
(40, 'asd', 1, '1575894979125_DFECB3E0-9254-4947-944A-E904AD5B26C9.jpeg', 'yes', '2019-12-09 12:36:19'),
(42, 'Corrona', 6, '1575938850451_35ADE248-337B-40E8-933E-853E51202998.mp4', 'yes', '2019-12-10 00:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(40) NOT NULL,
  `name` text DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `mainAdmin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `name`, `email`, `password`, `mainAdmin`) VALUES
(1, 'Quan Dao', 'quan@metropolia.fi', '$2a$10$5RzpyimIeuzNqW7G8seBiOzBiWBvrSWroDomxMa0HzU6K2ddSgixS', NULL),
(2, 'Ren Mai', 'ren@metropolia.fi', '$2a$10$5RzpyimIeuzNqW7G8seBiOzBiWBvrSWroDomxMa0HzU6K2ddSgixS', NULL),
(3, 'Nhan Nguyen', 'ron@metropolia.fi', '$2a$10$5RzpyimIeuzNqW7G8seBiOzBiWBvrSWroDomxMa0HzU6K2ddSgixS', 'yes'),
(4, 'Duc Vo', 'duc@metropolia.fi', '$2a$12$ORtS7St7ekj9AQ63Hvbv0OEUNDazSfwhd0A05ZRTmQnGdg3GZdlFG', NULL),
(6, 'Vy Nguyen', 'vy@metropolia.fi', '$2a$12$ORtS7St7ekj9AQ63Hvbv0OEUNDazSfwhd0A05ZRTmQnGdg3GZdlFG', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`postid`,`ownerid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `like_of_comment`
--
ALTER TABLE `like_of_comment`
  ADD UNIQUE KEY `id` (`id`,`ownerid`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `like_of_post`
--
ALTER TABLE `like_of_post`
  ADD UNIQUE KEY `id` (`id`,`ownerid`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `id` (`post_id`,`ownerid`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `id` (`user_id`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`ownerid`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like_of_comment`
--
ALTER TABLE `like_of_comment`
  ADD CONSTRAINT `like_of_comment_ibfk_2` FOREIGN KEY (`id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_of_comment_ibfk_3` FOREIGN KEY (`ownerid`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like_of_post`
--
ALTER TABLE `like_of_post`
  ADD CONSTRAINT `like_of_post_ibfk_1` FOREIGN KEY (`id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_of_post_ibfk_2` FOREIGN KEY (`ownerid`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
