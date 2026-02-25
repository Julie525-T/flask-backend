-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2026 at 06:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbasokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_photo`) VALUES
(7, 'Daisy shaped necklace', '2 piece daisy shaped and butterfly neclace for teenagers. gold and metallic details', 850, 'daisy shaoed butterfly necklace.jpg'),
(8, 'Heart decor bracelets', '4 piece wrist bracelets for teenagers. blue and gold colour combo. Heart shaped decor', 1250, 'heart decor bracelets.jpg'),
(9, 'Butterfly anklets', '5 piece anklets. Boho, pineapple,pearl, butterfly. Elegant and classic ankle bracelets', 750, 'boho pineapple pearl butterfly.jpg'),
(10, 'Men\'s watch', 'Elegant and classic men,s watch. silver and black color.', 5500, 'mens watch.jpg'),
(11, 'Ear wrap', '1 piece butterfly ringstone earwrap. elegant gold color', 550, 'butterfly decor earings.jpg'),
(12, 'creative butterfly bracelets', '4 Packs Girls\' Bohemian Creative Bracelets Girls\' Jewelry Butterfly Crystal Multi-Layer Beaded Fashion Bracelets Multicolor ABS Teen Jewelry & Watches, size features are:Bust: ,Length: ,Sleeve Length:', 200, 'butterfly bracelets.jpg'),
(13, 'Cat eyeglasses with rhinestones', 'New Cat Eye Glasses With Rhinestones Metal Frame Eyeglasses Can Be Accompanied by Myopia Anti Blue Light Eyewear Women', 300, 'cat eyeglasses.jpg'),
(14, 'stylish ornament watch', 'authentic, fashionable, trendy and unique designing wrist watch with ornaments 💚💙', 1300, 'stylish ornament watch.jpg'),
(16, 'Apple clear phone case', 'pple Clear Phone Case With Hand Strap Compatible With IPhone15/15Plus/15Pro/15Promax Kawaii Waterproof Shockproof Anti-Fall Scratch Resistant at SHEIN, part of our latest Phone Cases', 1500, 'Apple clear pnone case.jpg'),
(17, 'hip-hop punk chain', '1pc Multi-Layer Hip-Hop Punk Chain, Decorative Hanging Chain Summer, School Fall, Autumn, Halloween', 2500, 'hip-hop punk chain.jpg'),
(18, 'Cuban chain', '1pc Stingray Shaped Cuban Link Chain Necklace, Unisex Cross Pendant Necklace, High-End Minimalist Jewelry Gift Silver Punk Titanium Steel Women Fashion Jewelry, size features are:Bust: ,Length: ,Sleeve Length', 3500, 'cuban chain.jpg'),
(19, 'Mitten bracelet', 'Butterfly Charm Mittens Bracelet', 500, 'mitten bracelet.jpg'),
(20, 'gold themed arm cuff', '1pc Stylish Creative Gold-Tone Alloy 3D Flower Openwork Arm Cuff Bangle, Versatile Jewelry Gift Suitable For Daily, Date, Party, Holiday Wear Gold Zinc Alloy Women Fashion Jewelry, size features are:Bust: ,Length: ,Sleeve Length:', 200, 'arm cuff.jpg'),
(21, 'waist bead', '1pc Stylish Creative Gold-Tone Alloy 3D Flower Openwork Arm Cuff Bangle, Versatile Jewelry Gift Suitable For Daily, Date, Party, Holiday Wear Gold Zinc Alloy Women Fashion Jewelry, size features are:Bust: ,Length: ,Sleeve Length:', 200, 'waist bead.jpg'),
(22, 'gold anklets', 'Gold Fashionable Copper Anklet Embellished Jewelry', 100, 'anklet.jpg'),
(23, 'Animal nose clips', '1pc Fashionable New Animal Scorpion Nose Clip Fake Piercing Ornament Suitable For Women', 100, 'nose clip.jpg'),
(24, 'Belly button ring', 'Design Sexy Belly Button Ring With Butterfly Tassel Pendant, Clip-On Fake Navel Piercing For Any Occasion, Party Focal Point, Gift Choice Multicolor Trendy Personality Zinc Alloy Women Fashion Jewelry, size features are:Bust: ,Length: ,Sleeve Length:', 100, 'Belly button ring.jpg'),
(25, 'Stanley cup', 'Pink Stanley cup drinkware with name', 2000, 'Stanley cup.jpg'),
(26, 'Charm bangle', 'An adjustable charm bangle, with a stitch charm.', 200, 'Charm bungle.jpg'),
(27, 'Hair clip', '1pc Girls Fashion Crystal & Pearl Embellished Bow Hairclip, No Card Packaging Beige Casual Polyester Kids Accessories, size features are:Bust: ,Length: ,Sleeve Length', 250, 'hair clip.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `phone`) VALUES
(23, 'Jules', 'knspdmt2026', 'juleslit001@gmail.com', '+254 116835316'),
(24, 'Litsa', 'yaliefal', 'litsmaig@gmail.com', '+254 725603618');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;