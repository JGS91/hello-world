-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 14, 2018 at 06:40 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `published` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_key` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `body`, `created`, `modified`, `published`) VALUES
(1, 1, 'Blog Issue 1', 'blog-issue-1', 'The interview task begins.', '2018-02-13 20:51:00', NULL, '2018-02-13'),
(2, 3, 'Blog Issue 2', 'blog-issue-2', 'The invincible iron man takes a crack.', '2018-02-13 20:52:00', NULL, '2018-02-13'),
(3, 1, 'Blog Issue 3', 'blog-issue-3', 'More to come soon.', '2018-02-13 20:54:00', NULL, '2018-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

DROP TABLE IF EXISTS `articles_tags`;
CREATE TABLE IF NOT EXISTS `articles_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `tag_key` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
(1, 6),
(1, 8),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_key` (`article_id`),
  KEY `user_key` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `user_id`, `text`, `created`) VALUES
(1, 1, 1, 'Test comment for the first article', '2018-02-13 03:00:00'),
(2, 2, 3, 'Test article for the 2 article.', '2018-02-13 20:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(6, 'sad', '2018-02-13 21:03:23', '2018-02-13 21:04:31'),
(5, 'funny', '2018-02-13 21:03:18', '2018-02-13 21:03:18'),
(7, 'boring', '2018-02-13 21:03:28', '2018-02-13 21:04:40'),
(8, 'action', '2018-02-13 21:03:35', '2018-02-13 21:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'reader',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `password`, `created`, `modified`) VALUES
(1, 'Joshua Singh', 'author', 'jgs23101991@gmail.com', '$2y$10$WR2u1bWSkNtgR3.0OfVP0eVSasfnLJWtnEGfpP9NerTMxlmW4git.', '2018-02-13 20:46:00', '2018-02-13 21:01:49'),
(2, 'Peter Parker', 'author', 'peterparker@gmail.com', '$2y$10$47a3GeGrX8TZsT1EdbKVyOEGfipn3JtvfeK2ZjCQU.vUapw1lXIUe', '2018-02-13 20:47:00', '2018-02-13 21:02:08'),
(3, 'Tony Stark', 'author', 'tonystark@gmail.com', '$2y$10$AfmVNkUcyZ8NkIiTvtvvc.nT1GsSdBqAq2J/K8X1vbV4/Ibzv1lKO', '2018-02-13 20:48:00', '2018-02-13 21:02:16');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
