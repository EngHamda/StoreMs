-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2017 at 03:29 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `StoreMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'FirstCategory'),
(2, 'SecondCtegory');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `client_name` varchar(45) DEFAULT NULL,
  `client_phone` varchar(45) DEFAULT NULL,
  `client_address` varchar(45) DEFAULT NULL,
  `client_email` varchar(45) DEFAULT NULL,
  `client_type` varchar(45) DEFAULT NULL COMMENT 'Permanent client OR New client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Clients with these attributes: name, address,phone, mail, its items, number of buying from store, new or old , its review, its complaint, its suggestions.';

-- --------------------------------------------------------

--
-- Table structure for table `compliant`
--

CREATE TABLE `compliant` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_store_id` int(11) NOT NULL,
  `compliant_cause` varchar(45) DEFAULT NULL COMMENT 'item-user-both',
  `compliant_details` varchar(45) DEFAULT NULL,
  `compliant_solution` varchar(45) DEFAULT NULL,
  `compliant_confirm_solving` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Compliant with these attributes: user name, client name, compliant cause(item-user-both), compliant details, is_solved, confirm solving .....';

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_suprice` varchar(45) DEFAULT NULL COMMENT 'supplier price\n',
  `item_stprice` varchar(45) DEFAULT NULL COMMENT 'store price\n',
  `item_status` varchar(45) DEFAULT NULL COMMENT 'has error or not can repair,\nout of stock,avalible',
  `item_issue_date` varchar(45) DEFAULT NULL,
  `item_expiry_date` varchar(45) DEFAULT NULL,
  `item_purchase_date` varchar(45) DEFAULT NULL,
  `item_discount` varchar(45) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `receipt_client_id` int(11) NOT NULL,
  `receipt_client_store_id` int(11) NOT NULL,
  `receipt_user_id` int(11) NOT NULL,
  `receipt_user_store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='item (number, price from supplier , price for client, discount value, state itemdetails(has error or not can repair), product date,expire date,buy date)';

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `model_name` varchar(45) DEFAULT NULL,
  `model_quantity` varchar(45) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_representative_id` int(11) NOT NULL,
  `request_representative_supplier_id` int(11) NOT NULL,
  `request_user_id` int(11) NOT NULL,
  `model_request_quantity` varchar(45) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `category_id`, `model_name`, `model_quantity`, `supplier_id`, `request_id`, `request_representative_id`, `request_representative_supplier_id`, `request_user_id`, `model_request_quantity`, `store_id`) VALUES
(1, 1, 'firstModel', '3', 1, 1, 1, 1, 1, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_store_id` int(11) NOT NULL,
  `receipt_date` varchar(45) DEFAULT NULL,
  `receipt_tax` varchar(45) DEFAULT NULL,
  `receipt_discount` varchar(45) DEFAULT NULL,
  `receipt_payment` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Receipt with these attributes: \n	*receipt number,date \n			*user name,store address& phone, website, fb page,..\n			*client data type(new OR cont.) ,name,address, email,... \n			*item details: number, quantity, price\n	*tax, discounts, offers,payment method\n';

-- --------------------------------------------------------

--
-- Table structure for table `representative`
--

CREATE TABLE `representative` (
  `id` int(11) NOT NULL,
  `representative_name` varchar(45) DEFAULT NULL,
  `representative_phone` varchar(45) DEFAULT NULL,
  `representative_notices` varchar(45) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `representative`
--

INSERT INTO `representative` (`id`, `representative_name`, `representative_phone`, `representative_notices`, `supplier_id`) VALUES
(1, 'RepresentativeSupplier1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `representative_id` int(11) NOT NULL,
  `representative_supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assume one user for each request (create, cancel, receive)\nSuppliers Requests with these attributes: supplier representative, user name, supplier name, items (name-quantity-price) , notices ....';

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `representative_id`, `representative_supplier_id`, `user_id`, `store_id`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `store_name` varchar(45) DEFAULT NULL,
  `store_address` varchar(45) DEFAULT NULL,
  `store_website` varchar(45) DEFAULT NULL,
  `store_phone` varchar(45) DEFAULT NULL,
  `store_email` varchar(45) DEFAULT NULL,
  `store_working_days` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Assume store has one branch\nstore (name, address, phone, website, mail,  schedule, about us, users, admins, suppliers, clients, items, items categories)';

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `store_address`, `store_website`, `store_phone`, `store_email`, `store_working_days`) VALUES
(1, 'FirstStore', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(45) DEFAULT NULL,
  `supplier_address` varchar(45) DEFAULT NULL,
  `supplier_phone` varchar(45) DEFAULT NULL,
  `supplier_email` varchar(45) DEFAULT NULL,
  `supplier_notices` varchar(45) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Supplier with these attributes: name, address, phone,  email, item(name-price), supplier representative(name-phone-notices), notices ...';

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_name`, `supplier_address`, `supplier_phone`, `supplier_email`, `supplier_notices`, `store_id`) VALUES
(1, 'Supplier1', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_fname` varchar(45) DEFAULT NULL,
  `user_mname` varchar(45) DEFAULT NULL,
  `user_lname` varchar(45) DEFAULT NULL,
  `user_nid` varchar(45) DEFAULT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_bdate` varchar(45) DEFAULT NULL,
  `user_ppicture` varchar(45) DEFAULT NULL COMMENT 'image\n',
  `user_cv` varchar(45) DEFAULT NULL COMMENT 'file',
  `user_gender` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_passwd` varchar(45) DEFAULT NULL,
  `user_notices` varchar(45) DEFAULT NULL COMMENT 'text()',
  `user_swork` varchar(45) DEFAULT NULL,
  `user_ework` varchar(45) DEFAULT NULL,
  `user_sshift` varchar(45) DEFAULT NULL,
  `user_eshift` varchar(45) DEFAULT NULL,
  `user_isadmin` varchar(45) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User with these attributes: first name, middle name, last name, national id, address, phone, date of birth, gender,profile picture, email, password, cv, shift time, work time, is_admin, notices ..';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_fname`, `user_mname`, `user_lname`, `user_nid`, `user_address`, `user_phone`, `user_bdate`, `user_ppicture`, `user_cv`, `user_gender`, `user_email`, `user_passwd`, `user_notices`, `user_swork`, `user_ework`, `user_sshift`, `user_eshift`, `user_isadmin`, `store_id`) VALUES
(1, 'Ali', 'Ahmed', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@example.com', '123456', NULL, NULL, NULL, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`,`store_id`),
  ADD KEY `fk_client_store1_idx` (`store_id`);

--
-- Indexes for table `compliant`
--
ALTER TABLE `compliant`
  ADD PRIMARY KEY (`id`,`client_id`,`client_store_id`,`user_id`,`user_store_id`),
  ADD KEY `fk_compliant_client1_idx` (`client_id`,`client_store_id`),
  ADD KEY `fk_compliant_user1_idx` (`user_id`,`user_store_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`,`model_id`,`receipt_id`,`receipt_client_id`,`receipt_client_store_id`,`receipt_user_id`,`receipt_user_store_id`),
  ADD KEY `fk_item_model1_idx` (`model_id`),
  ADD KEY `fk_item_receipt1_idx` (`receipt_id`,`receipt_client_id`,`receipt_client_store_id`,`receipt_user_id`,`receipt_user_store_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`,`category_id`,`supplier_id`,`request_id`,`request_representative_id`,`request_representative_supplier_id`,`request_user_id`,`store_id`),
  ADD KEY `fk_model_category1_idx` (`category_id`),
  ADD KEY `fk_model_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_model_request1_idx` (`request_id`,`request_representative_id`,`request_representative_supplier_id`,`request_user_id`),
  ADD KEY `fk_model_store1_idx` (`store_id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`,`client_id`,`client_store_id`,`user_id`,`user_store_id`),
  ADD KEY `fk_receipt_client1_idx` (`client_id`,`client_store_id`),
  ADD KEY `fk_receipt_user1_idx` (`user_id`,`user_store_id`);

--
-- Indexes for table `representative`
--
ALTER TABLE `representative`
  ADD PRIMARY KEY (`id`,`supplier_id`),
  ADD KEY `fk_representative_supplier_idx` (`supplier_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`,`representative_id`,`representative_supplier_id`,`user_id`,`store_id`),
  ADD KEY `fk_request_representative1_idx` (`representative_id`,`representative_supplier_id`),
  ADD KEY `fk_request_user1_idx` (`user_id`),
  ADD KEY `fk_request_store1_idx` (`store_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`,`store_id`),
  ADD KEY `fk_supplier_store1_idx` (`store_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`store_id`),
  ADD KEY `fk_user_store1_idx` (`store_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `compliant`
--
ALTER TABLE `compliant`
  ADD CONSTRAINT `fk_compliant_client1` FOREIGN KEY (`client_id`,`client_store_id`) REFERENCES `client` (`id`, `store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compliant_user1` FOREIGN KEY (`user_id`,`user_store_id`) REFERENCES `user` (`id`, `store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_item_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_receipt1` FOREIGN KEY (`receipt_id`,`receipt_client_id`,`receipt_client_store_id`,`receipt_user_id`,`receipt_user_store_id`) REFERENCES `receipt` (`id`, `client_id`, `client_store_id`, `user_id`, `user_store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_model_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_model_request1` FOREIGN KEY (`request_id`,`request_representative_id`,`request_representative_supplier_id`,`request_user_id`) REFERENCES `request` (`id`, `representative_id`, `representative_supplier_id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_model_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_model_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `fk_receipt_client1` FOREIGN KEY (`client_id`,`client_store_id`) REFERENCES `client` (`id`, `store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receipt_user1` FOREIGN KEY (`user_id`,`user_store_id`) REFERENCES `user` (`id`, `store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `representative`
--
ALTER TABLE `representative`
  ADD CONSTRAINT `fk_representative_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_request_representative1` FOREIGN KEY (`representative_id`,`representative_supplier_id`) REFERENCES `representative` (`id`, `supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_request_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_request_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `fk_supplier_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
