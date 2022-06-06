SET sql_mode = '';

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `about` text,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `password_reset_token` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `ip_address` varchar(14) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `serial_position` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES
(5, 'news-sidebar-top', 9, 'upload/advertisement/dff78ee612b37fc12c9e7fa94839d855.jpg', NULL, 'https://www.bdtask.com/', 1, 1, '2018-07-09 07:00:40'),
(6, 'news-sidebar-bottom', 9, 'upload/advertisement/7fabc49dd69e0a0d6e111f3fcae0118a.jpg', NULL, 'https://www.bdtask.com/', 2, 1, '2018-07-09 07:02:18'),
(7, 'news-top', 9, 'upload/advertisement/ff5a204fdd1722068e78222fd1d24a82.jpg', NULL, 'https://www.bdtask.com/', 3, 1, '2018-07-09 06:54:51'),
(8, 'news-bottom', 9, '/upload/advertisement/1614672574_04f30fde1bca314f6013.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 20:09:34'),
(9, 'news details-top', 26, '/upload/advertisement/1614672536_9bb671550e7dbf3570a2.png', NULL, 'https://www.bdtask.com/', 3, 1, '2021-03-01 20:08:57'),
(10, 'news details-bottom', 26, '/upload/advertisement/1614672514_0ec53a71097b84c63a82.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 20:08:34'),
(11, 'news details-sidebar-top', 26, '/upload/advertisement/1614672490_566192aff15693225bd1.png', NULL, 'https://www.bdtask.com/', 1, 1, '2021-03-01 20:08:11'),
(12, 'news details-sidebar-bottom', 26, '/upload/advertisement/1614657834_eb2d5f67f41ab46b4194.png', NULL, 'https://www.bdtask.com/', 2, 1, '2021-03-01 16:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `coinpayments_payments`
--

CREATE TABLE `coinpayments_payments` (
  `id` int(11) NOT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `currency1` varchar(100) NOT NULL,
  `currency2` varchar(100) NOT NULL,
  `fee` double NOT NULL,
  `ipn_id` text NOT NULL,
  `ipn_mode` varchar(20) NOT NULL,
  `ipn_type` varchar(20) NOT NULL,
  `ipn_version` varchar(20) NOT NULL,
  `merchant` text NOT NULL,
  `received_amount` double NOT NULL,
  `received_confirms` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `status_text` text NOT NULL,
  `txn_id` text NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cryptolist`
--

CREATE TABLE `cryptolist` (
  `cid` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Url` varchar(300) DEFAULT NULL,
  `ImageUrl` varchar(300) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Symbol` varchar(100) NOT NULL,
  `CoinName` varchar(100) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Algorithm` varchar(100) DEFAULT NULL,
  `ProofType` varchar(100) DEFAULT NULL,
  `FullyPremined` varchar(100) DEFAULT NULL,
  `TotalCoinSupply` varchar(100) DEFAULT NULL,
  `PreMinedValue` varchar(100) DEFAULT NULL,
  `TotalCoinsFreeFloat` varchar(100) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `Sponsored` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int(11) UNSIGNED NOT NULL,
  `boxID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT 0.00000000,
  `amountUSD` double(20,8) NOT NULL DEFAULT 0.00000000,
  `unrecognised` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_affiliation`
--

CREATE TABLE `dbt_affiliation` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `commission` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_affiliation`
--

INSERT INTO `dbt_affiliation` (`id`, `type`, `commission`, `status`) VALUES
(1, 'PERCENT', 20.00000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_balance`
--

CREATE TABLE `dbt_balance` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `balance` double(19,8) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_balance_log`
--

CREATE TABLE `dbt_balance_log` (
  `log_id` bigint(22) NOT NULL,
  `balance_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `transaction_amount` double(19,8) NOT NULL,
  `transaction_fees` double(19,8) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_biding`
--

CREATE TABLE `dbt_biding` (
  `id` bigint(22) NOT NULL,
  `bid_type` varchar(50) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `bid_qty` double(19,8) NOT NULL,
  `bid_qty_available` double(19,8) NOT NULL,
  `total_amount` double(19,8) NOT NULL,
  `amount_available` double(19,8) NOT NULL,
  `coin_id` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int(100) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `open_order` timestamp NOT NULL DEFAULT current_timestamp(),
  `fees_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '"1=Complete, 2=Running"'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_biding_log`
--

CREATE TABLE `dbt_biding_log` (
  `log_id` bigint(22) NOT NULL,
  `bid_id` bigint(22) NOT NULL,
  `bid_type` varchar(10) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `complete_qty` double(19,8) NOT NULL,
  `complete_amount` double(19,8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `coin_id` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `success_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fees_amount` double(19,8) NOT NULL,
  `available_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_blocklist`
--

CREATE TABLE `dbt_blocklist` (
  `id` bigint(20) NOT NULL,
  `ip_mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_chat`
--

CREATE TABLE `dbt_chat` (
  `id` bigint(21) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_coinhistory`
--

CREATE TABLE IF NOT EXISTS `dbt_coinhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin_symbol` varchar(100) NOT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `last_price` double(19,8) NOT NULL,
  `total_coin_supply` double(19,8) NOT NULL,
  `price_high_1h` double(19,8) NOT NULL,
  `price_low_1h` double(19,8) NOT NULL,
  `price_change_1h` double(19,8) NOT NULL,
  `volume_1h` double(19,8) NOT NULL,
  `price_high_24h` double(19,8) NOT NULL,
  `price_low_24h` double(19,8) NOT NULL,
  `price_change_24h` double(19,8) NOT NULL,
  `volume_24h` double(19,8) NOT NULL,
  `open` double(19,8) NOT NULL,
  `close` double(19,8) NOT NULL,
  `volumefrom` double(19,8) NOT NULL,
  `volumeto` double(19,8) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_coinpair`
--

CREATE TABLE `dbt_coinpair` (
  `id` int(11) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `symbol` varchar(100) NOT NULL,
  `initial_price` double(19,8) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_coinpair`
--

INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `initial_price`, `status`) VALUES
(1, NULL, 'BTC', NULL, 'LTC', 'BTC/ LTC', 'Litecoin Exchange', 'LTC_BTC', NULL, 1),
(2, NULL, 'BTC', NULL, 'DASH', 'BTC/ DASH', 'DASH Exchange', 'DASH_BTC', 0.00000000, 1),
(3, NULL, 'BTC', NULL, 'DOGE', 'BTC/ DOGE', 'Dogecoin (DOGE) Exchange', 'DOGE_BTC', 0.00000000, 1),
(4, NULL, 'USD', NULL, 'BTC', 'USDT/ BTC', 'Bitcoin (BTC) Exchange', 'BTC_USD', 0.00000000, 1),
(5, NULL, 'USD', NULL, 'LTC', 'USDT/ LTC', 'Litecoin (LTC) Exchange', 'LTC_USD', 0.00000000, 1),
(6, NULL, 'USD', NULL, 'DASH', 'USDT/ DASH', 'DigitalCash (DASH) Exchange', 'DASH_USD', 0.00000000, 1),
(7, NULL, 'USD', NULL, 'DOGE', 'USDT/ DOGE', 'Dfrtrft', 'DOGE_USD', 0.00000000, 1),
(8, NULL, 'LTC', NULL, 'BTC', 'LTC/ BTC', 'Bitcoin (BTC) Exchange', 'BTC_LTC', 0.00000000, 1),
(9, NULL, 'BTC', NULL, 'ETH', 'ETH/BTC', 'Bitcoin (BTC) Exchange', 'ETH_BTC', 0.00000000, 1),
(10, NULL, 'BTC', NULL, 'XMR', 'XMR/BTC', 'Bitcoin (BTC) Exchange', 'XMR_BTC', 0.00000000, 1),
(11, NULL, 'BTC', NULL, 'ZEC', 'ZEC/BTC', 'Bitcoin (BTC) Exchange', 'ZEC_BTC', 0.00000000, 1),
(12, NULL, 'BTC', NULL, 'RDD', 'RDD/BTC', 'Bitcoin (BTC) Exchange', 'RDD_BTC', 0.00000000, 0),
(13, NULL, 'BTC', NULL, 'VTC', 'VTC/BTC', 'Bitcoin (BTC) Exchange', 'VTC_BTC', 0.00000000, 1),
(14, NULL, 'BTC', NULL, 'BCH', 'BCC/BTC', 'Bitcoin (BTC) Exchange', 'BCH_BTC', 0.00000000, 1),
(15, NULL, 'BTC', NULL, 'USD', 'USD/BTC', 'Bitcoin (BTC) Exchange', 'USD_BTC', 0.00000000, 1),
(16, NULL, 'USD', NULL, 'ETH', 'ETH/USDT', 'Bitcoin (BTC) Exchange', 'ETH_USD', 0.00000000, 1),
(17, NULL, 'BTC', NULL, 'XRP', 'XRP/BTC', 'Bitcoin (BTC) Exchange', 'XRP_BTC', 0.00000000, 1),
(18, NULL, 'BTC', NULL, 'XVG', 'XVG/BTC', 'Bitcoin (BTC) Exchange', 'XVG_BTC', 0.00000000, 1),
(19, NULL, 'BTC', NULL, 'ETC', 'ETC/BTC', 'Bitcoin (BTC) Exchange', 'ETC_BTC', 0.00000000, 1),
(20, NULL, 'BTC', NULL, 'XLM', 'XLM/BTC', 'Bitcoin (BTC) Exchange', 'XLM_BTC', 0.00000000, 1),
(21, NULL, 'BTC', NULL, 'XEM', 'XEM/BTC', 'Bitcoin (BTC) Exchange', 'XEM_BTC', 0.00000000, 1),
(22, NULL, 'BTC', NULL, 'SC', 'SC/BTC', 'Bitcoin (BTC) Exchange', 'SC_BTC', 0.00000000, 1),
(23, NULL, 'BTC', NULL, 'WAVES', 'WAVES/BTC', 'Bitcoin (BTC) Exchange', 'WAVES_BTC', 0.00000000, 1),
(24, NULL, 'BTC', NULL, 'NEO', 'NEO/BTC', 'Bitcoin (BTC) Exchange', 'NEO_BTC', 0.00000000, 1),
(25, NULL, 'BTC', NULL, 'GNT', 'GNT/BTC', 'Bitcoin (BTC) Exchange', 'GNT_BTC', 0.00000000, 1),
(26, NULL, 'BTC', NULL, 'BAT', 'BAT/BTC', 'Bitcoin (BTC) Exchange', 'BAT_BTC', 0.00000000, 1),
(27, NULL, 'BTC', NULL, 'OMG', 'OMG/BTC', 'Bitcoin (BTC) Exchange', 'OMG_BTC', 0.00000000, 1),
(28, NULL, 'BTC', NULL, 'IOT', 'IOTA/BTC', 'Bitcoin (BTC) Exchange', 'IOT_BTC', 0.00000000, 1),
(29, NULL, 'BTC', NULL, 'ONT', 'ONT/BTC', 'Bitcoin (BTC) Exchange', 'ONT_BTC', 0.00000000, 1),
(30, NULL, 'LTC', NULL, 'MUE', 'ADA/BTC', 'Bitcoin (BTC)Exchange', 'MUE_LTC', 0.00000000, 1),
(31, NULL, 'DOGE', NULL, 'LTC', 'cointest', 'cointest', 'LTC_DOGE', 0.00000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_country`
--

CREATE TABLE `dbt_country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_country`
--

INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'CCK', NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_cryptocoin`
--

CREATE TABLE `dbt_cryptocoin` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) NOT NULL,
  `coin_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `algorithm` varchar(100) DEFAULT NULL,
  `proof_type` varchar(100) DEFAULT NULL,
  `show_home` int(11) DEFAULT 0,
  `coin_position` int(11) DEFAULT 0,
  `premined_value` varchar(100) DEFAULT NULL,
  `total_coins_freefloat` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `sponsored` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_cryptocoin`
--

INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `url`, `image`, `name`, `symbol`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES
(1, 101, '/coins/eth/overview', '/upload/coinlist/eth_logo.png', 'ETH', 'ETH', 'Ethereum', 'Ethereum (ETH)', '', 'PoW', 1, 14, 'N/A', 'N/A', 2, '0', 1),
(2, 102, '/coins/xmr/overview', './upload/coinlist/xmr.png', 'XMR', 'XMR', 'Monero', 'Monero (XMR)', '', 'PoW', 1, 15, 'N/A', 'N/A', 5, '0', 1),
(3, 103, '/coins/doge/overview', './upload/coinlist/doge.png', 'DOGE', 'DOGE', 'Dogecoin', 'Dogecoin (DOGE)', '', 'PoW', 1, 5, 'N/A', 'N/A', 8, '0', 1),
(4, 104, '/coins/zec/overview', './upload/coinlist/zec.png', 'ZEC', 'ZEC', 'ZCash', 'ZCash (ZEC)', '', 'PoW', 1, 16, 'N/A', 'N/A', 9, '0', 1),
(5, 105, '/coins/ppc/overview', './upload/coinlist/peercoin-logo.png', 'PPC', 'PPC', 'PeerCoin', 'PeerCoin (PPC)', '', 'N/A', 1, 11, 'N/A', 'N/A', 14, '0', 1),
(6, 106, '/coins/ftc/overview', './upload/coinlist/ftc.png', 'FTC', 'FTC', 'FeatherCoin', 'FeatherCoin (FTC)', '', 'PoW', 1, 9, 'N/A', 'N/A', 120, '0', 1),
(7, 107, '/coins/rdd/overview', './upload/coinlist/rdd.png', 'RDD', 'RDD', 'ReddCoin', 'ReddCoin (RDD)', '', 'PoW/PoS', 1, 7, 'N/A', 'N/A', 188, '0', 1),
(8, 108, '/coins/xlm/overview', './upload/coinlist/str.png', 'XLM', 'XLM', 'Stellar', 'Stellar (XLM)', '', 'N/A', 1, 20, 'N/A', 'N/A', 208, '0', 1),
(9, 109, '/coins/vtc/overview', './upload/coinlist/vtc.png', 'VTC', 'VTC', 'VertCoin', 'VertCoin (VTC)', '', 'PoW', 1, 10, 'N/A', 'N/A', 232, '0', 1),
(10, 110, '/coins/xem/overview', './upload/coinlist/xem.png', 'XEM', 'XEM', 'NEM', 'NEM (XEM)', '', 'PoI', 1, 21, 'N/A', 'N/A', 254, '0', 1),
(11, 111, '/coins/unit/overview', './upload/coinlist/unit.png', 'UNIT', 'UNIT', 'Universal Currency', 'Universal Currency (UNIT)', '', 'PoW/PoS', 1, 13, 'N/A', 'N/A', 566, '0', 1),
(12, 112, '/coins/mue/overview', './upload/coinlist/mue.png', 'MUE', 'MUE', 'MonetaryUnit', 'MonetaryUnit (MUE)', '', 'PoW', 1, 12, 'N/A', 'N/A', 655, '0', 1),
(13, 113, '/coins/iot/overview', './upload/coinlist/iota_logo.png', 'IOT', 'IOT', 'IOTA', 'IOTA (IOT)', '', 'Tangle', 1, 18, 'N/A', 'N/A', 1247, '0', 1),
(14, 114, '/coins/omg/overview', './upload/coinlist/omisego.png', 'OMG', 'OMG', 'OmiseGo', 'OmiseGo (OMG)', '', 'PoS', 1, 17, 'N/A', 'N/A', 1362, '0', 1),
(15, 115, '/coins/bch/overview', './upload/coinlist/bch.jpg', 'BCH', 'BCH', 'Bitcoin Cash / BCC', 'Bitcoin Cash / BCC (BCH)', '', 'PoW', 1, 2, 'N/A', 'N/A', 1425, '0', 1),
(16, 116, '/coins/xvg/overview', './upload/coinlist/xvg.png', 'XVG', 'XVG', 'Verge', 'Verge (XVG)', '', 'PoW', 1, 22, 'N/A', 'N/A', 99, '0', 1),
(17, 117, '/coins/dash/overview', './upload/coinlist/imageedit_27_4355944719.png', 'DASH', 'DASH', 'DigitalCash', 'DigitalCash (DASH)', '', 'PoW/PoS', 1, 4, 'N/A', 'N/A', 4, '0', 1),
(18, 118, '/coins/spd/overview', './upload/coinlist/spd.png', 'SPD', 'SPD', 'Stipend', 'Stipend (SPD)', '', 'PoW/PoS', 1, 6, 'N/A', 'N/A', 2403, '0', 1),
(19, 119, '/coins/btc/overview', './upload/coinlist/btc.png', 'BTC', 'BTC', 'Bitcoin', 'Bitcoin (BTC)', '', 'PoW', 1, 1, 'N/A', 'N/A', 1, '0', 1),
(20, 120, '/coins/ont/overview', './upload/coinlist/ont.jpg', 'ONT', 'ONT', 'Ontology', 'Ontology (ONT)', '', 'N/A', 1, 19, 'N/A', 'N/A', 2446, '0', 1),
(21, 121, '/coins/ltc/overview', './upload/coinlist/litecoin-logo.png', 'LTC', 'LTC', 'Litecoin', 'Litecoin (LTC)', '', 'PoW', 1, 3, 'N/A', 'N/A', 3, '0', 1),
(22, 122, '/coins/eos/overview', './upload/coinlist/eos_1.png', 'EOS', 'EOS', 'EOS', 'EOS (EOS)', '', 'DPoS', 1, 23, 'N/A', 'N/A', 1274, '0', 1),
(23, 123, '/coins/chf/overview', '/upload/coinlist/1615179892_5da6602c1a189c9cc897.jpg', 'USD', 'USD', 'Dollar', 'USD Dollar', NULL, 'N/A', 0, 2000, 'N/A', 'N/A', 1, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_deposit`
--
CREATE TABLE IF NOT EXISTS `dbt_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `amount` double(19,8) NOT NULL,
  `method_id` varchar(50) NOT NULL,
  `fees_amount` double(19,8) NOT NULL,
  `comment` text DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Pending, 1= confirm, 2=Cancel',
  `ip` varchar(50) NOT NULL,
  `approved_cancel_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_fees`
--

CREATE TABLE `dbt_fees` (
  `id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `fees` double NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_market`
--

CREATE TABLE `dbt_market` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `full_name` varchar(300) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_market`
--

INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `status`) VALUES
(1, 'BTC', 'BTC Market', 'BTC', 1),
(2, 'USD', 'USDT Market', 'USD', 1),
(3, 'LTC', 'LTC Market', 'LTC', 1),
(4, 'Doge', 'Dogecoin Market', 'DOGE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_payout_method`
--

CREATE TABLE `dbt_payout_method` (
  `id` int(11) NOT NULL,
  `user_id` varchar(250) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `method` varchar(250) NOT NULL,
  `wallet_id` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_security`
--

CREATE TABLE `dbt_security` (
  `id` int(11) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `data` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_security`
--

INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES
(1, 'url', '{\"url\":\"http:\\/\\/localhost\\/tradebox_ci4_final_test\\/\"}', 0),
(2, 'login', '{\"duration\":\"30\",\"wrong_try\":\"3\",\"ip_block\":\"3\"}', 0),
(3, 'https', '{\"cookie_secure\":0,\"cookie_http\":0}', 0),
(4, 'xss_filter', '', 0),
(5, 'csrf_token', '', 1),
(6, 'capture', '{\"site_key\":\"6Lddh0AUAAAAAJm25vFsAOOG0Hixa1ZVg17jQ9ca\",\"secret_key\":\"6Lddh0AUAAAAAHNQXul04PdL7ponU4N9QiKywGt-\"}', 0),
(7, 'sms', '', 0),
(8, 'encryption', '', 0),
(9, 'password', '', 0),
(10, 'email', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_sms_email_template`
--

CREATE TABLE `dbt_sms_email_template` (
  `id` int(11) NOT NULL,
  `sms_or_email` varchar(10) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `subject_en` varchar(300) NOT NULL,
  `subject_fr` varchar(300) NOT NULL,
  `template_en` varchar(300) NOT NULL,
  `template_fr` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_sms_email_template`
--

INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES
(1, 'sms', 'transfer_verification', 'Transfer Verification Code', 'Transfer Verification Code', 'You are about to transfar %amount% to the account %receiver_id% Your code is %code%\r\n', 'Vous êtes sur le point de transférer %amount% sur le compte %receiver_id% Votre code est  %code%\r\n'),
(2, 'email', 'transfer_verification', 'Transfer Verification', 'Transfer Verification', 'You are about to transfar %amount% to the account %receiver_id%  Your code is %varify_code%', 'Vous êtes sur le point de transférer %amount% sur le compte %receiver_id% Votre code est %varify_code% '),
(3, 'sms', 'transfer_success', 'Transfer Confirm', 'Transfer Confirm', 'You successfully transfer The amount $%amount% to the account %receiver_id%. Your new balance is %new_balance%', 'You successfully transfer The amount $%amount% to the account %receiver_id%. Your new balance is %new_balance%'),
(4, 'email', 'transfer_success', 'Tranfer Confirm', 'Tranfer Confirm', 'You successfully transfer The amount $%amount% to the account %receiver_id%. Your new balance is %new_balance%', 'You successfully transfer The amount $%amount% to the account %receiver_id%. Your new balance is %new_balance%'),
(5, 'sms', 'withdraw_verification', '', '', 'You Withdraw The Amount Is %amount% The Verification Code is <h1>%varify_code%</h1>', 'You Withdraw The Amount Is %amount% The Verification Code is <h1>%varify_code%</h1>'),
(6, 'email', 'withdraw_verification', '', '', 'You Withdraw The Amount Is %amount% The Verification Code is <h1>%varify_code%</h1>', 'You Withdraw The Amount Is %amount% The Verification Code is <h1>%varify_code%</h1>'),
(7, 'sms', 'withdraw_success', 'Withdraw Success', 'Withdraw Success', 'Hi, %name% You successfully withdraw the amount is $%amount% from your account. Your new balance is $%new_balance%', 'Hi, %name% You successfully withdraw the amount is $%amount% from your account. Your new balance is $%new_balance%'),
(8, 'email', 'withdraw_success', 'Withdraw', 'Withdraw', 'You successfully withdraw the amount is $%amount% from your account. Your new balance is $%new_balance%', 'You successfully withdraw the amount is $%amount% from your account. Your new balance is $%new_balance%'),
(9, 'email', 'forgot_password', '', '', 'The Verification Code is <h1>%varify_code%</h1>', 'The Verification Code is <h1>%varify_code%</h1>'),
(10, 'sms', 'deposit_success', 'Deposit', 'Deposit', 'Hi, %name% You Successfully  Deposit The Amount Is %amount%  date %date%', 'Hi, %name% You Successfully  Deposit The Amount Is %amount%  date %date%'),
(11, 'email', 'deposit_success', 'Deposit', 'Deposit', 'You successfully deposit the amount is %amount%. ', 'You successfully deposit the amount is %amount%. '),
(12, 'email', 'registered', 'Account Activation', 'Account Activation', 'Your account was created successfully Please click on the link below to activate your account. %url%\r\n', 'Votre compte a &eacute;t&eacute; cr&eacute;&eacute; avec succ&egrave;s, veuillez cliquer sur le lien ci-dessous pour activer votre compte.&nbsp;%url%\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `dbt_theme`
--

CREATE TABLE IF NOT EXISTS `dbt_theme` (
  `id` int(11) NOT NULL,
  `settings` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbt_theme`
--


INSERT INTO `dbt_theme` (`id`, `settings`, `status`) VALUES
(1, '{\"body_background_color\":\"#060d13\",\"body_font_color\":\"#cdcfd0\",\"menu_bg_color\":\"#2e2f32\",\"menu_font_color\":\"#cdcfd0\",\"footer_bg_color\":\"#202124\",\"footer_font_color\":\"#cdcfd0\",\"btn_bg_color\":\"#137000\",\"btn_font_color\":\"#cdcfd0\",\"top_footer_horizontal_border_color\":\"#202124\",\"footer_menu_border_color\":\"#202124\",\"bottom_footer_background_color\":\"#202124\",\"bottom_footer_font_color\":\"#cdcfd0\",\"theme_color\":\"#a1a7ad\",\"newslatter_bg\":\"#202124\",\"newslatter_font\":\"#939699\",\"form_background_color\":\"#0d0d0d\",\"form_border_color\":\"#262d34\",\"form_label_color\":\"#cdcfd0\",\"form_input_field_background_color\":\"#121d27\",\"input_field_border_color\":\"#262d34\",\"input_field_color\":\"#cdcfd0\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_transaction_setup`
--

CREATE TABLE `dbt_transaction_setup` (
  `id` int(11) NOT NULL,
  `trntype` varchar(20) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) NOT NULL,
  `lower` double(19,8) NOT NULL,
  `upper` double(19,8) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_transfer`
--

CREATE TABLE `dbt_transfer` (
  `id` int(11) NOT NULL,
  `sender_user_id` varchar(255) DEFAULT NULL,
  `receiver_user_id` varchar(255) DEFAULT NULL,
  `amount` double(19,8) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `fees` double(19,8) NOT NULL,
  `request_ip` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='client to client transfer success, request data recorded.';

-- --------------------------------------------------------

--
-- Table structure for table `dbt_user`
--

CREATE TABLE `dbt_user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_reset_token` varchar(300) DEFAULT NULL,
  `googleauth` varchar(100) DEFAULT NULL,
  `referral_id` varchar(100) DEFAULT NULL,
  `referral_status` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '"0=Deactivated account, 1=Activated account, 2=Pending account, 3=Suspend account"',
  `verified` int(11) NOT NULL DEFAULT 0 COMMENT '0= did not submit info, 1= verified, 2=Cancel, 3=processing',
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_user_log`
--

CREATE TABLE `dbt_user_log` (
  `log_id` int(11) NOT NULL,
  `log_type` varchar(50) NOT NULL COMMENT '"acc_update = User Account Update, login=User Login info, deposit=User Deposit info, transfer=User Transfer info, withdraw=User Withdraw info, open_order="',
  `access_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_agent` varchar(300) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_user_verify_doc`
--

CREATE TABLE `dbt_user_verify_doc` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `verify_type` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `id_number` varchar(300) NOT NULL,
  `document1` varchar(300) NOT NULL,
  `document2` varchar(300) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_verify`
--

CREATE TABLE `dbt_verify` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(250) DEFAULT NULL,
  `session_id` varchar(250) DEFAULT NULL,
  `verify_code` varchar(250) DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_withdraw`
--

CREATE TABLE `dbt_withdraw` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `wallet_id` text NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `method` varchar(50) NOT NULL,
  `fees_amount` double NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `success_date` datetime DEFAULT NULL,
  `cancel_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Cancel request, 1=Approved request, 2=Pending request',
  `ip` varchar(50) NOT NULL,
  `approved_cancel_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `earning_id` int(11) NOT NULL,
  `user_id` varchar(250) NOT NULL,
  `Purchaser_id` varchar(250) DEFAULT NULL,
  `earning_type` varchar(45) NOT NULL,
  `package_id` varchar(250) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `comments` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Weekly ROI, Monthly ROI, team bonous, direct referal bonous';

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_gateway`
--

CREATE TABLE `email_sms_gateway` (
  `es_id` int(11) NOT NULL,
  `gatewayname` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `protocol` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mailtype` varchar(100) DEFAULT NULL,
  `charset` varchar(100) DEFAULT NULL,
  `api` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_sms_gateway`
--

INSERT INTO `email_sms_gateway` (`es_id`, `gatewayname`, `title`, `protocol`, `host`, `port`, `user`, `userid`, `password`, `mailtype`, `charset`, `api`) VALUES
(1, 'nexmo', 'Bdtask', NULL, NULL, NULL, NULL, NULL, 'TCtz6dx6s3G4nVQ1', NULL, NULL, '633b7084'),
(2, 'smtp', 'Bbtask mail', 'smtp', 'smtp.mailtrap.io', '2525', '199a525b4e1f88', '', '06f4bb0c453f48', 'html', 'utf-8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `external_api_setup`
--

CREATE TABLE `external_api_setup` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `external_api_setup`
--

INSERT INTO `external_api_setup` (`id`, `name`, `data`, `status`) VALUES
(1, 'coinmarketcap', '{\"api_key\":\"5cffd167-16c3-4c34-b345-6eef830ce5a3\", \"create_link\":\"https://coinmarketcap.com/api\"}', 1),
(2, 'maps', '{\"api_key\":\"AIzaSyAUmj7I0GuGJWRcol-pMUmM4rrnHS90DE8\", \"create_link\":\"https://developers.google.com/maps/documentation/javascript/get-api-key\"}', 1),
(3, 'Cryptocompare', '{\"api_key\":\"58a4ce00281069f74475bf860babe5a7bdcfe28c2e27fbf014bc6e8efbda8f37\", \"create_link\":\"https://www.cryptocompare.com\"}', 1);


-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL,
  `french` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `french`) VALUES
(NULL, 'creator_wallet', 'Creator Wallet Address', 'Creator Wallet Address fr'),
(NULL, 'contact_address', 'Contract Address', 'Contract Address fr'),
(NULL, 'email', 'Email', 'E-mail'),
(NULL, 'password', 'Password', 'Mot De Passe'),
(NULL, 'login', 'Login', 'S\'identifier'),
(NULL, 'incorrect_email_password', 'Incorrect Email/Password!', 'Mot de passe ou email incorrect'),
(NULL, 'user_role', 'User Role', 'RÃ´le Utilisateur'),
(NULL, 'please_login', 'Please Login', 'Veuillez Vous Connecter'),
(NULL, 'setting', 'Setting', 'Réglage'),
(NULL, 'profile', 'Profile', 'Profil'),
(NULL, 'logout', 'Log Out', 'DÃ©connexion'),
(NULL, 'please_try_again', 'Please Try Again', 'Essayez encore !'),
(NULL, 'admin', 'Admin', 'Admin'),
(NULL, 'dashboard', 'Dashboard', 'Tableau de Bord'),
(NULL, 'language_setting', 'Language Setting', 'Reglage Langue'),
(NULL, 'status', 'Status', 'Status'),
(NULL, 'active', 'Active', 'Actif'),
(NULL, 'inactive', 'Inactive', 'Inactif'),
(NULL, 'cancel', 'Cancel', 'Cancel'),
(NULL, 'save', 'Save', 'Sauver'),
(NULL, 'serial', 'Serial', 'En Série'),
(NULL, 'action', 'Action', 'Action'),
(NULL, 'edit', 'Edit ', 'Editer'),
(NULL, 'delete', 'Delete', 'Effacer'),
(NULL, 'save_successfully', 'Save Successfully!', 'Sauvegarde reussi'),
(NULL, 'update_successfully', 'Updated Successfully', 'Mise Ã  jour reussi'),
(NULL, 'delete_successfully', 'Delete Successfully', 'Supprimer Avec Succès'),
(NULL, 'are_you_sure', 'Are You Sure', 'êtes-vous Sûr'),
(NULL, 'ip_address', 'IP Address', 'Adresse IP'),
(NULL, 'application_title', 'Application title', 'Titre appli'),
(NULL, 'favicon', 'Favicon', 'favicon'),
(NULL, 'logo', 'Logo', 'Logo'),
(NULL, 'footer_text', 'Footer text', 'Footer text'),
(NULL, 'language', 'Language', 'Langue'),
(NULL, 'website_title', 'Website Title', 'Titre site web'),
(NULL, 'invalid_logo', 'Invalid Logo', 'Logo invalide'),
(NULL, 'submit_successfully', 'Submit Successfully!', 'Envoi reussi'),
(NULL, 'application_setting', 'Application Setting', 'Reglages appli'),
(NULL, 'invalid_favicon', 'Invalid Favicon', 'Favicon Invalide'),
(NULL, 'submit', 'Submit', 'Envoyez'),
(NULL, 'site_align', 'Website Align', 'Alignement site'),
(NULL, 'right_to_left', 'Right to Left', 'Doite vers la gauche'),
(NULL, 'left_to_right', 'Left to Right', 'Gauche Vers la droite'),
(NULL, 'subject', 'Subject', 'Sujet'),
(NULL, 'receiver_name', 'Send To', 'Nom BÃ©nÃ©ficiaire'),
(NULL, 'select_user', 'Select User', 'Selectionner Utilisateur'),
(NULL, 'message_sent', 'Messages Sent', 'Message EnvoyÃ©'),
(NULL, 'mail', 'Mail', 'Mail'),
(NULL, 'send_mail', 'Send Mail', 'Envoyer Mail'),
(NULL, 'mail_setting', 'Mail Setting', 'Reglage mail'),
(NULL, 'protocol', 'Protocol', 'Protocole'),
(NULL, 'mailpath', 'Mail Path', 'Repertoire Mail'),
(NULL, 'mailtype', 'Mail Type', 'Type mail'),
(NULL, 'validate_email', 'Validate Email Address', 'Validez votre Email'),
(NULL, 'true', 'True', 'Vraie'),
(NULL, 'false', 'False', 'faux'),
(NULL, 'attach_file', 'Attach File', 'Joindre un document'),
(NULL, 'wordwrap', 'Enable Word Wrap', 'Wordwrap'),
(NULL, 'send', 'Send', 'Envoyer'),
(NULL, 'app_setting', 'App Setting', 'Reglages appli'),
(NULL, 'sms', 'SMS', 'SMS'),
(NULL, 'gateway_setting', 'Gateway Setting', 'Reglage portail'),
(NULL, 'time_zone', 'Time zone', 'Time Zone'),
(NULL, 'provider', 'Provider', 'Fournisseur'),
(NULL, 'sms_template', 'SMS Template', 'Template SMS'),
(NULL, 'template_name', 'Template Name', 'Nom du template'),
(NULL, 'sms_schedule', 'SMS Schedule', 'Emploi du temps SMS'),
(NULL, 'schedule_name', 'Schedule Name', 'Nom d\'horaire'),
(NULL, 'time', 'Time', 'Temps'),
(NULL, 'already_exists', 'Already Exists', 'Existe dÃ©jÃ '),
(NULL, 'send_custom_sms', 'Send Custom SMS', 'Envoyer SMS personalisÃ©'),
(NULL, 'sms_sent', 'SMS Sent!', 'SMS envoyÃ©'),
(NULL, 'custom_sms_list', 'Custom SMS List', 'List SMS personalisÃ©'),
(NULL, 'reciver', 'Reciver', 'BÃ©nÃ©ficiaire'),
(NULL, 'auto_sms_report', 'Auto SMS Report', 'Rapport SMS Auto'),
(NULL, 'user_sms_list', 'User SMS List', 'Liste SMS utilisateurs'),
(NULL, 'send_sms', 'Send SMS', 'Envoyer SMS'),
(NULL, 'new_sms', 'New SMS', 'Nouveau Message'),
(NULL, 'update', 'Update', 'Mettre à Jour'),
(NULL, 'reset', 'Reset', 'Réinitialiser'),
(NULL, 'messages', 'Messages', 'Messages'),
(NULL, 'inbox', 'Inbox', 'Boite de rÃ©ception'),
(NULL, 'sent', 'Sent', 'EnvoyÃ©'),
(NULL, 'captcha', 'Captcha', 'Captcha'),
(NULL, 'welcome_back', 'Welcome back ', 'Bienvenue Ã  nouveau !'),
(NULL, 'inbox_message', 'Inbox Message', 'SMS Boite de rÃ©ception'),
(NULL, 'image_upload_successfully', 'Image Upload Successfully.', 'Upload d\'image reussi'),
(NULL, 'users', 'Users', 'Utilisateurs'),
(NULL, 'add_user', 'Add User', 'Ajouter utilisateur'),
(NULL, 'user_list', 'User List', 'Liste Utilisateurs'),
(NULL, 'firstname', 'First Name', 'Nom'),
(NULL, 'lastname', 'Last Name', 'PrÃ©noms'),
(NULL, 'about', 'About', 'A propos de nous'),
(NULL, 'preview', 'Preview', 'Visualliser'),
(NULL, 'last_login', 'Last Login', 'Dernière Connexion'),
(NULL, 'last_logout', 'Last Logout', 'Dernière Déconnexion'),
(NULL, 'image', 'Image', 'Image'),
(NULL, 'fullname', 'Full Name', 'Nom Complet'),
(NULL, 'new_message', 'New Message', 'Nouveau Message'),
(NULL, 'message', 'Message', 'Un Message'),
(NULL, 'sender_name', 'Sender Name', 'Nom de l\'expÃ©diteur'),
(NULL, 'sl_no', 'SL No.', 'NumÃ©ro SL'),
(NULL, 'message_details', 'Message Details', 'DÃ©tails message'),
(NULL, 'date', 'Date', 'Date'),
(NULL, 'select_option', 'Select Option', 'f'),
(NULL, 'edit_profile', 'Edit Profile', 'Editer Profile'),
(NULL, 'edit_user', 'Edit User', 'Editer utilisateur'),
(NULL, 'sent_message', 'Sent Message', 'Message EnvoyÃ©'),
(NULL, 'sub_admin', 'Sub Admin', 'Sub Administrateur'),
(NULL, 'admin_list', 'Admin List', 'List Administrateurs'),
(NULL, 'add_admin', 'Add Admin', 'Ajouter Administrateur'),
(NULL, 'edit_admin', 'Edit Admin', 'Modifier L\'administrateur'),
(NULL, 'username', 'Username', 'Nom utilisateur'),
(NULL, 'sponsor_id', 'Sponsor ID', 'ID sponsor'),
(NULL, 'mobile', 'Mobile', 'Mobile'),
(NULL, 'register', 'Register', 'Enregistrer'),
(NULL, 'conf_password', 'Confirm Password', 'Reglage mot de passe'),
(NULL, 'user_id', 'User ID', 'ID utilisateur'),
(NULL, 'package', 'Package', 'Pack'),
(NULL, 'create', 'Create', 'CrÃ©er'),
(NULL, 'package_name', 'Package Name', 'Nom du pack'),
(NULL, 'package_deatils', 'Package Deatils', 'Detail pack'),
(NULL, 'package_amount', 'Package Amount', 'Montant pack'),
(NULL, 'daily_roi', 'Daily ROI', 'ROI journalier'),
(NULL, 'weekly_roi', 'Weekly ROI', 'ROI Hebdomadaire'),
(NULL, 'monthly_roi', 'Monthly ROI', 'ROI Mensuel'),
(NULL, 'yearly_roi', 'Yearly ROI', 'ROI annuel'),
(NULL, 'total_percent', 'Total Percent', 'Poucentage Total'),
(NULL, 'add_package', 'Add Package', 'Ajouter un Pack'),
(NULL, 'transfer_add_msg', 'Transfer Successfully', 'Ajouter SMS transfert'),
(NULL, 'transfer', 'Transfer', 'Transfert'),
(NULL, 'deposit', 'Deposit', 'Dépôt'),
(NULL, 'edit_package', 'Edit Package', 'Editer Pack'),
(NULL, 'package_list', 'Package List', 'Liste Packs'),
(NULL, 'withdraw', 'Withdraw', 'Se Désister'),
(NULL, 'request', 'Request', 'RequÃªte'),
(NULL, 'success', 'Success', 'SuccÃ¨s ! '),
(NULL, 'request_date', 'Request Date', 'Date RequÃªte'),
(NULL, 'payment_method', 'Payment Method', 'Methode de paiement'),
(NULL, 'amount', 'Amount', 'f'),
(NULL, 'charge', 'Charge', 'Frais'),
(NULL, 'total', 'Total', 'Total'),
(NULL, 'comments', 'Comments', 'Commentaires'),
(NULL, 'pending', 'Pending', 'En cours'),
(NULL, 'cancel_date', 'Cancel Date', 'Annuler date'),
(NULL, 'block_list', 'Block List', 'Liste Noire'),
(NULL, 'commission', 'Commission', 'Commission'),
(NULL, 'setup', 'Setup', 'Regler'),
(NULL, 'setup_list', 'Setup List', 'Liste de reglage'),
(NULL, 'commission_list', 'Commission List', 'Liste Commission'),
(NULL, 'level_name', 'Level Name', 'Nom du stage'),
(NULL, 'personal_invest', 'Personal Invest', 'Mon investissement'),
(NULL, 'total_invest', 'Total Invest', 'Total Investissement'),
(NULL, 'team_bonous', 'Team Bonous', 'Bonus d\'Equipe'),
(NULL, 'referral_bonous', 'Referral Bonous', 'Bonus parrainage'),
(NULL, 'form_submit_msg', 'Insert Successfully', 'Envoyer formulaire'),
(NULL, 'transection_category', 'Transaction Category', 'CatÃ©gorie Transaction'),
(NULL, 'add_deposit', 'Add Deposit', 'Effectuer un Depot'),
(NULL, 'deposit_list', 'Deposit List', 'Liste depot'),
(NULL, 'team', 'Team', 'Equipe'),
(NULL, 'investment', 'Investment', 'Investissement personnel'),
(NULL, 'notification', 'Notification', 'Notification'),
(NULL, 'receiver_id', 'Receiver Id', 'ID BÃ©nÃ©ficiaire'),
(NULL, 'comment', 'Comments', 'Commentaire'),
(NULL, 'otp_send_to', 'OTP Send To', 'OTP envoyer Ã '),
(NULL, 'transection', 'Transaction', 'Transactions'),
(NULL, 'buy', 'Buy', 'Acheter'),
(NULL, 'deposit_amount', 'Deposit Amount', 'Montant Depot'),
(NULL, 'deposit_method', 'Deposit Method', 'Methode depot'),
(NULL, 'deposit_wallet_id', 'Deposit Wallet Id', 'Wallet ID'),
(NULL, 'confirm_transfer', 'Confirm Transfer', 'Confirmer transfert'),
(NULL, 'transfer_amount', 'Transfer Amount', 'Montant Transfert'),
(NULL, 'enter_verify_code', 'Enter Verify Code', 'Entrer code de vÃ©rification'),
(NULL, 'confirm', 'Confirm', 'Confirmer'),
(NULL, 'deopsit_add_msg', 'Deposit Add Successfully.', 'Depot effectuÃ© avec succÃ¨s'),
(NULL, 'transfar_recite', 'Transfer Recite', 'ReÃ§u de transfert'),
(NULL, 'earn', 'Earn', 'Gagner'),
(NULL, 'balance_is_unavailable', 'Balance Unavailable', 'Solde insuffisant'),
(NULL, 'package_buy_successfully', 'Package Buy Successfully!', 'Achat du package reussi ! '),
(NULL, 'withdraw_recite', 'Withdraw Recite', 'ReÃ§u de retrait'),
(NULL, 'withdraw_confirm', 'withdraw Confirm', 'Confirmation Retrait'),
(NULL, 'change_verify', 'Confirm Verify', 'Changer Verification'),
(NULL, 'change_password', 'Password Change', 'Changer mot de passe'),
(NULL, 'enter_confirm_password', 'Enter Confirm Password', 'Confirmer mot de passe'),
(NULL, 'enter_new_password', 'Enter New Password', 'Entrer nouveau mot de passe'),
(NULL, 'enter_old_password', 'Enter Old Password', 'Entrer ancien mot de passe'),
(NULL, 'change', 'Change', 'Changement'),
(NULL, 'password_change_successfull', 'Password Change Successfully', 'Mot de passe changÃ© avec succÃ¨s'),
(NULL, 'old_password_is_wrong', 'Old Password Is Wrong', 'Entrer ancien mot de passe incorrect'),
(NULL, 'fees_setting', 'Fees Setting', 'Reglages frais'),
(NULL, 'level', 'Level', 'Stage'),
(NULL, 'select_level', 'Select Level', 'Selectionner stage'),
(NULL, 'fees_setting_successfully', 'Fees Setting Successfully', 'Reglages Frais reussi'),
(NULL, 'bitcoin', 'Bitcoin', 'Bitcoin'),
(NULL, 'payeer', 'Payeer', 'Payeer'),
(NULL, 'name', 'Name', 'Nom'),
(NULL, 'order_id', 'Order Id', 'ID de commande'),
(NULL, 'fees', 'Fees', 'Frais'),
(NULL, 'period', 'Period', 'PÃ©riode'),
(NULL, 'commission_ret', 'Commission Ret', 'Commission ret'),
(NULL, 'title', 'Title', 'Titre'),
(NULL, 'details', 'Details', 'Details'),
(NULL, 'personal_info', 'Personal Information', 'Informations personnels'),
(NULL, 'sponsor_info', 'Sponsor Information', 'Info Sponsor'),
(NULL, 'affiliate_url', 'Affiliat Url', 'Lien parrainage'),
(NULL, 'copy', 'Copy', 'Copier'),
(NULL, 'my_payout', 'My Payout', 'Mes Paiements'),
(NULL, 'personal_sales', 'Personal Sales', 'Ventes Personnelles'),
(NULL, 'bank_details', 'Bank Details', 'Details de banque'),
(NULL, 'beneficiary_name', 'Beneficiary Name', 'Nom Beneficiaire'),
(NULL, 'bank_name', 'Bank Name', 'Nom de banque'),
(NULL, 'branch', 'Branch', 'Branche'),
(NULL, 'account_number', 'Account Number', 'NumÃ©ro de compte'),
(NULL, 'ifsc_code', 'IFC Code', 'Code IFSC'),
(NULL, 'account', 'Account', 'Compte'),
(NULL, 'my_commission', 'My Commission', 'Mes commissions'),
(NULL, 'finance', 'Finance', 'La Finance'),
(NULL, 'exchange', 'Exchange', 'Echange'),
(NULL, 'bitcoin_setting', 'Bitcoin Setting', 'Reglages bitcoin'),
(NULL, 'payeer_setting', 'Payeer Setting', 'Reglages Payeer'),
(NULL, 'bank_information', 'Bank Information', 'Infos de banque'),
(NULL, 'bitcoin_wallet_id', 'Bitcoin Wallet ID', 'Wallet Bitcoin'),
(NULL, 'payment_method_setting', 'Payment Method Setting', 'Reglage methode de paiement'),
(NULL, 'payeer_wallet_id', 'Payeer Wallet Id', 'ID Payeer'),
(NULL, 'my_package', 'My Package', 'Mes packs'),
(NULL, 'my_team', 'My Team', 'Mon Equipe'),
(NULL, 'receipt', 'Receipt', 'RÃ©Ã§u'),
(NULL, 'withdraw_successfull', 'Withdraw Successfully', 'Retrait reussi !'),
(NULL, 'team_bonus', 'Team Bonus', 'Bonus d\'Equipe'),
(NULL, 'withdraw_list', 'Withdraw List', 'Liste retraits'),
(NULL, 'pending_withdraw', 'Pending Withdraw', NULL),
(NULL, 'reciver_account', 'Receiver Account', 'Compte BÃ©nÃ©ficiaire'),
(NULL, 'french', 'French', 'FranÃ§ais'),
(NULL, 'commission_setup', 'Commission Setup', 'Reglage commission'),
(NULL, 'personal_investment', 'Personal Investment', 'Investissement personnel'),
(NULL, 'total_investment', 'Total investment', 'Total Investissement'),
(NULL, 'transfer_list', 'Transfer List', 'Liste transfert'),
(NULL, 'form_to', 'From To', ''),
(NULL, 'receive', 'Receive', ''),
(NULL, 'wallet_id', 'Wallet Id', 'ID Wallet'),
(NULL, 'withdraw_details', 'Withdraw Details', 'Details retraits'),
(NULL, 'generation_one', 'Generation One', 'GÃ©nÃ©ration 1'),
(NULL, 'generation_two', 'Generation Two', 'GÃ©nÃ©ration 2'),
(NULL, 'generation_three', 'Generation Three', 'GÃ©nÃ©ration 3'),
(NULL, 'generation_four', 'Generation Four', 'GÃ©nÃ©ration 4'),
(NULL, 'generation_five', 'Generation Five', 'GÃ©nÃ©ration 5'),
(NULL, 'generation_empty_message', 'You Have No Generation', ''),
(NULL, 'view', 'View', 'AperÃ§u'),
(NULL, 'cancle', 'Cancel', 'Annuler'),
(NULL, 'type', 'Type', 'Taper'),
(NULL, 'your_total_balance_is', 'Your Total Balance Is', 'Votre montant total est de'),
(NULL, 'bonus', 'Bonus', 'Bonus'),
(NULL, 'personal_turnover', 'Sponser Turnover', 'Mon Chiffre d\'affaire perso'),
(NULL, 'team_turnover', 'Team Turnover', 'Chiffre d\'affaire Equipe'),
(NULL, 'post_article', 'Post Article', ''),
(NULL, 'article_list', 'Article List', 'LIste article'),
(NULL, 'add_article', 'Add Article', 'Ajouter article'),
(NULL, 'headline_en', 'Headline English', 'Titre EN'),
(NULL, 'headline_fr', 'Headline French', 'Titre  FR'),
(NULL, 'article_en', 'Article EN', 'Article EN'),
(NULL, 'article_fr', 'Article FR', 'Article FR'),
(NULL, 'edit_article', 'Edit Article', 'Editer article'),
(NULL, 'cat_list', 'Category List', 'Liste panier'),
(NULL, 'add_cat', 'Add Category', 'Ajouter au panier'),
(NULL, 'parent_cat', 'Parent Category', ''),
(NULL, 'cat_name_en', 'Category Name English', 'Nom panier EN'),
(NULL, 'cat_name_fr', 'Category Name French', 'Nom panier FR'),
(NULL, 'cat_title_en', 'Category Title English', 'Titre Panier EN'),
(NULL, 'cat_title_fr', 'Category Title French', 'Titre panier FR'),
(NULL, 'select_cat', 'Select Category', 'Selectionner Cat'),
(NULL, 'edit_cat', 'Edit Category', 'Editer Panier'),
(NULL, 'position_serial', 'Position Serial', ''),
(NULL, 'currency_list', 'Currency List', 'Liste de devise'),
(NULL, 'currency', 'Currency', 'Devise'),
(NULL, 'cryptocurrency_name', 'CryptoCurrency  Name', 'Nom Crypto monnaie'),
(NULL, 'select_cryptocurrency', 'Select Cryptocurrency', 'Selectionner Crypto'),
(NULL, 'edit_currency', 'Edit Currency', 'Editer Devise'),
(NULL, 'exchange_list', 'Exchange List', 'Liste Ã©changes'),
(NULL, 'add_exchange', 'Add Exchange', 'Ajouter Echange'),
(NULL, 'edit_exchange', 'Edit Exchange', 'Editer Echange'),
(NULL, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet'),
(NULL, 'sell_adjustment', 'Sell Adjustment', 'Ajustement Vente'),
(NULL, 'buy_adjustment', 'Buy Adjustment', ''),
(NULL, 'exchange_wallet', 'Exchange Wallet', 'Wallet Echange'),
(NULL, 'exchange_wallet_list', 'Exchange Wallet List', 'Liste Wallet echange'),
(NULL, 'add_exchange_wallet', 'Add Exchange Wallet', 'Ajouter Wallet'),
(NULL, 'edit_exchange_wallet', 'Edit Exchange Wallet', 'Modifier Wallet echange'),
(NULL, 'local_currency_list', 'Local Currency List', 'LIste  Monnaies locales'),
(NULL, 'local_currency', 'Local Currency', 'Devise Locale'),
(NULL, 'add_local_currency', 'Add Local Currency', 'Ajouter Monnaie'),
(NULL, 'edit_local_currency', 'Edit Local Currency', 'Editer Devise locale'),
(NULL, 'currency_name', 'Currency Name', 'Nom devise'),
(NULL, 'currency_iso_code', 'Currency ISO Code', 'Code ISO devise '),
(NULL, 'usd_exchange_rate', 'USD Exchange Rate', 'Taux d\'echange USD'),
(NULL, 'currency_symbol', 'Currency Symbol', 'Symboles Devise'),
(NULL, 'symbol_position', 'Symbol Position', 'Position symbole'),
(NULL, 'currency_position', 'Currency Position', 'Position devise'),
(NULL, 'payment_gateway', 'Payment Gateway', 'Portail de paiement'),
(NULL, 'gateway_name', 'Gateway Name', 'Nom passerelle'),
(NULL, 'gateway_setting', 'Gateway Setting', 'Reglage portail'),
(NULL, 'add_payment_gateway', 'Add Payment Gateway', 'Ajouter Methode paiment'),
(NULL, 'public_key', 'Public Key', 'ClÃ© publique'),
(NULL, 'private_key', 'Private Key', ''),
(NULL, 'shop_id', 'Shop ID', 'ID shop'),
(NULL, 'secret_key', 'Secret Key', 'ClÃ© secrete'),
(NULL, 'edit_payment_gateway', 'Edit Payment Gateway', 'Editer Methode de paiement'),
(NULL, 'slider_list', 'Slider List', ''),
(NULL, 'add_slider', 'Add Slider', 'Ajouter Slider'),
(NULL, 'headline', 'Headline', 'Titre'),
(NULL, 'edit_slider', 'Edit Slider', ''),
(NULL, 'social_app', 'Social App', ''),
(NULL, 'edit_social_app', 'Edit Social App', 'Editer RS appli'),
(NULL, 'social_link', 'Social Link', ''),
(NULL, 'add_link', 'Add Link', 'Ajouter Lien'),
(NULL, 'link', 'Link', 'Lien'),
(NULL, 'icon', 'Icon', 'IcÃ´ne'),
(NULL, 'edit_social_link', 'Edit Social Link', 'Edit les liens RS'),
(NULL, 'transection_info', 'Transection Info', 'Info transaction'),
(NULL, 'sell', 'Sell', 'Vendre'),
(NULL, 'article', 'Article', 'Article'),
(NULL, 'coin_amount', 'Coin Amount', 'Montat Crypto'),
(NULL, 'coin_name', 'Coin Name', NULL),
(NULL, 'buy_amount', 'Buy Amount', 'Montant achat'),
(NULL, 'sell_amount', 'Sell Amount', 'Montant Ã  vendre'),
(NULL, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet'),
(NULL, 'usd_amount', 'USD Amount', 'Montant USD'),
(NULL, 'rate_coin', 'Coin Rate', 'Taux coin'),
(NULL, 'local_amount', 'Local Amount', 'Montant Local'),
(NULL, 'om_name', 'OM Name', 'Nom OM'),
(NULL, 'om_mobile_no', 'OM Phone No', 'NÂ° OM'),
(NULL, 'transaction_no', 'Transaction No', 'NÂ° de transaction'),
(NULL, 'idcard_no', 'ID Card No', 'NÂ° CNI'),
(NULL, 'buy_list', 'Buy List', 'Buy list'),
(NULL, 'add_buy', 'Add Buy', 'Ajouter Achat'),
(NULL, 'transection_type', 'Transection Type', 'Type de transaction'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©'),
(NULL, 'payment_cancel', 'Payment Cancel', 'Paiement annulÃ©'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©'),
(NULL, 'sell_list', 'Sell List', 'LIste de vente '),
(NULL, 'add_sell', 'Add Sell', 'Ajouter Vente'),
(NULL, 'edit_sell', 'Edit Sell', ''),
(NULL, 'account_active_mail', 'Please check Email to activate your account', 'Activer votre mail'),
(NULL, 'accept_terms_privacy', 'Crypto Privacy policy and Terms of Use', 'Accepter conditions et termes'),
(NULL, 'username_used', 'Username Already Used', 'Nom d\'utilisateur dÃ©jÃ  utilisÃ©'),
(NULL, 'account_create_success_social', 'Account Created Successfully and Your Account activated', 'Compte crÃ©e avec succÃ¨s'),
(NULL, 'email_used', 'Email Already Used', 'Adresse mail dÃ©jÃ  utilisÃ©'),
(NULL, 'account_create_active_link', 'Account Created Successfully. Activation link send your Email address', 'Lien d\'activation'),
(NULL, 'active_account', 'Active Account', 'Compte actif'),
(NULL, 'wrong_try_activation', 'Wrong Try', 'Mauvaise activation'),
(NULL, 'pay_now', 'Pay Now', 'Payer maintenant'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©'),
(NULL, 'sell_successfully', 'Sell Successfully', 'Vente effectuÃ©e avec succÃ¨s'),
(NULL, 'already_clicked', 'Already Clicked There', 'DÃ©ja ValidÃ©'),
(NULL, 'user_info', 'User Info', 'info utilisateur'),
(NULL, 'user_id', 'User ID', 'ID utilisateur'),
(NULL, 'registered_ip', 'Registered IP', ''),
(NULL, 'requested_ip', 'Requested IP', ''),
(NULL, 'transaction_status', 'Transaction Status', 'Status de la transaction'),
(NULL, 'receive_status', 'receive_status', ''),
(NULL, 'receive_complete', 'Receive Complete', ''),
(NULL, 'payment_status', 'Payment Status', 'Status de paiement'),
(NULL, 'payment_complete', 'Payment Complete', NULL),
(NULL, 'url', 'Url', 'URL'),
(NULL, 'app_id', 'App Id', 'ID appli'),
(NULL, 'app_secret', 'App Secret', 'Secret Appli'),
(NULL, 'api_key', 'API Key', 'Clé API'),
(NULL, 'app_name', 'App Name', 'Nom Appli'),
(NULL, 'social_list', 'Social List', ''),
(NULL, 'select_payment_method', 'Select Payment Method', 'Selectionner mode de paiement'),
(NULL, 'payable', 'Payable', ''),
(NULL, 'rate', 'Rate', NULL),
(NULL, 'how_do_you_receive_money', 'How do you receive money', 'Comment ReÃ§evoir votre argent'),
(NULL, 'withdraw_method', 'Withdraw Method', 'Methode de retrait'),
(NULL, 'select_withdraw_method', 'Select Withdraw Method', 'Selectionner mÃ©thode de retrait'),
(NULL, 'account_info', 'Account Info', 'Info compte'),
(NULL, 'upload_docunemts', 'Upload Docunemts', 'Ajouter fichier'),
(NULL, 'my_generation', 'My Generation', 'Mon Equipe'),
(NULL, 'category', 'Category', 'CatÃ©gorie'),
(NULL, 'slider_h1_en', 'Slider H1 English', ''),
(NULL, 'slider_h1_fr', 'Slider H1 French', ''),
(NULL, 'slider_h2_en', 'Slider H2 English', ''),
(NULL, 'slider_h2_fr', 'Slider H2 French', ''),
(NULL, 'slider_h3_en', 'Slider H3 English', ''),
(NULL, 'slider_h3_fr', 'Slider H3 French', ''),
(NULL, 'complete', 'Complete', NULL),
(NULL, 'refresh_currency', 'Refresh Currency', ''),
(NULL, 'cryptocurrency', 'Crypto Currency', 'Crypto Monnaie'),
(NULL, 'symbol', 'Symbol', NULL),
(NULL, 'please_select_cryptocurrency_first', 'Please Select CryptoCurrency First', 'Veuillez choisir une crypto monnaie'),
(NULL, 'please_select_diffrent_payment_method', 'Please select Diffrent Payment Method', 'Selectionner une autre mÃ©thode de paiement'),
(NULL, 'add_credit', 'Add Credit', 'Crediter Compte'),
(NULL, 'credit', 'Credit', 'CrÃ©dit'),
(NULL, 'credit_list', 'Credit List', 'Liste De Crédit'),
(NULL, 'notes', 'Note', 'Notes'),
(NULL, 'my_level_info', 'My Level Info', 'Info Niveau'),
(NULL, 'slider', 'Slider', 'Slider'),
(NULL, 'exchange_setting', 'Exchange Setting', 'Reglage Echange'),
(NULL, 'exchange_all_request', 'Exchange all Request', 'Toutes requÃªtes echanges'),
(NULL, 'total_user', 'Total User', 'Nombre d\'utilisateurs'),
(NULL, 'total_roi', 'Total ROI', 'Total ROI'),
(NULL, 'total_commission', 'Total Commission', 'Total commission'),
(NULL, 'download_pdf', 'Download PDF', 'TÃ©lÃ©charger '),
(NULL, 'view_all_news', 'View all news', 'AperÃ§u News'),
(NULL, 'download_company_brochure', 'Download Company Brochure', 'TÃ©lÃ©chargez notre brochure'),
(NULL, 'get_in_touch', 'Get in touch', 'Contactez-nous'),
(NULL, 'read_more', 'Read More', 'Lire plus'),
(NULL, 'know_more', 'Know more', 'Savoir plus'),
(NULL, 'choose_plan', 'Choose plan', 'acheter'),
(NULL, 'latest_jobs', 'Latest Jobs', 'Latest Jobs'),
(NULL, 'website', 'Website', 'website'),
(NULL, 'chose_one_of_the_following_methods', 'Chose One of the Following Methods.', 'chose_one_of_the_following_methods.'),
(NULL, 'sign_in_using_your_email_address', 'Sign in Using Your Email Address', 'Connectez-vous avec votre username ou email'),
(NULL, 'forgot_password', 'Forgot Password', 'Mot De Passe Oublié'),
(NULL, 'remember_me', 'Remember Me', 'Souviens-toi De Moi'),
(NULL, 'username_or_email', 'Username or email', 'Username or email'),
(NULL, 'dont_have_an_account', 'Don\'t have an account', 'Don\'t have an account'),
(NULL, 'sign_up_now', 'Sign up Now', 'CrÃ©er un compte maintenant'),
(NULL, 'send_code', 'Send Code', 'Send Code'),
(NULL, 'sign_up', 'Sign Up', 'S\'inscrire'),
(NULL, 'already_user', 'Already User', 'Already User'),
(NULL, 'sign_in_now', 'Sign In Now', 'Connectez-vous maintenant'),
(NULL, 'sign_up_for_free', 'Sign Up For Free', 'CrÃ©er un compte gratuitement'),
(NULL, 'join_thousands_of_companies_that_Use_globalcrypt_every_day', 'Join Thousands of Companies that Use Global Crypto Every Day', 'Join Thousands of Companies that Use Global Crypto Every Day'),
(NULL, 'your_password_at_global_crypto_are_encrypted_and_secured', 'Your Password At Global Crypto Are Encrypted And Secured', 'Votre Mot De Passe Chez Global Crypto Est Crypté Et Sécurisé'),
(NULL, 'email_username_used', 'Email/Username Already Used', 'Email/Username Already Used'),
(NULL, 'address', 'Address', 'Adresse'),
(NULL, 'phone', 'Phone', 'Phone'),
(NULL, 'admin_align', 'Admin alignment', 'Admin alignment'),
(NULL, 'office_time', 'Office time', 'Office time'),
(NULL, 'logo_web', 'Website logo', 'Website logo'),
(NULL, 'dashboard_logo', 'Dashboard logo', 'Dashboard logo'),
(NULL, 'advertisement', 'Advertisement', 'Advertisement'),
(NULL, 'script', 'Script', 'Script'),
(NULL, 'add_advertisement', 'Add Advertisement', 'Add Advertisement'),
(NULL, 'page', 'Page', NULL),
(NULL, 'embed_code', 'Embed code', 'Embed code'),
(NULL, 'add_type', 'Add Type', 'Add Type'),
(NULL, 'edit_advertisement', 'Edit Advertisement', 'Edit Advertisement'),
(NULL, 'host', 'Host', 'Host'),
(NULL, 'port', 'Port', 'Port'),
(NULL, 'apikey', 'API Key', 'API Key'),
(NULL, 'mail_type', 'Mail Type', 'Mail Type'),
(NULL, 'charset', 'Charset', 'Charset'),
(NULL, 'news', 'News', 'Nouvelles'),
(NULL, 'news_list', 'News List', 'News List'),
(NULL, 'edit_news', 'Edit News', 'Edit News'),
(NULL, 'post_news', 'Post News', 'Post News'),
(NULL, 'close', 'Close', 'Close'),
(NULL, 'contact_us', 'Contact Us', 'Contact Us'),
(NULL, 'watch_video', 'WATCH VIDEO', 'WATCH VIDEO'),
(NULL, 'about_bitcoin', 'About Bitcoin', 'About Bitcoin'),
(NULL, 'get_start', 'Get Start', 'Get Start'),
(NULL, 'cryptocoins', 'Crypto Coins', 'Crypto Coins'),
(NULL, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter!', 'Subscribe to our newsletter!'),
(NULL, 'email_newslatter', 'Email Newsletter', 'Email Newsletter'),
(NULL, 'services', 'Services', 'Services'),
(NULL, 'our_company', 'Our Company', 'Our Company'),
(NULL, 'sign_in', 'Sign In', 'Connectez-vous'),
(NULL, 'join_the_new_yera_of_cryptocurrency_exchange', 'Join the new Yera of cryptocurrency exchange', 'Join the new Yera of cryptocurrency exchange'),
(NULL, 'access_the_cryptocurrency_experience_you_deserve', 'Access the cryptocurrency experience you deserve', 'Access the cryptocurrency experience you deserve'),
(NULL, 'home', 'Home', 'Accueil'),
(NULL, 'scroll_to_top', 'Scroll to Top', 'Scroll to Top'),
(NULL, 'ticker', 'Ticker', 'Ticker'),
(NULL, 'price', 'Price', 'Prix'),
(NULL, 'capitalization', 'Capitalization', 'Capitalization'),
(NULL, '1d_change', '1D change', '1D change'),
(NULL, 'graph_24h', 'Graph 24H', 'Graph 24H'),
(NULL, 'recent_post', 'Recent Post', 'Recent Post'),
(NULL, 'my_social_link', 'My Social link', 'My Social link'),
(NULL, 'tell_us_about_your_project', 'Tell Us About Your Project', 'Tell Us About Your Project'),
(NULL, 'company', 'Company', 'Company'),
(NULL, 'reset_your_password', 'Reset Your Password', 'Réinitialisez Votre Mot De Passe'),
(NULL, '24h_change', '24H change', '24H change'),
(NULL, '24h_volume', '24H Volume', '24H Volume'),
(NULL, 'latitudelongitude', 'Latitude, Longitude', 'Latitude, Longitude'),
(NULL, 'send_money', 'Send Money', 'Send Money'),
(NULL, 'article', 'Article', 'article'),
(NULL, 'contact', 'Contact', 'Contact'),
(NULL, 'team', 'Team', 'team'),
(NULL, 'client', 'Client', 'client'),
(NULL, 'service', 'Service', 'service'),
(NULL, 'testimonial', 'Testimonial', 'testimonial'),
(NULL, 'faq', 'F.A.Q', 'faq'),
(NULL, 'short_description_en', 'Short description english', 'Short Description'),
(NULL, 'long_description_en', 'Long description English', 'Long Description'),
(NULL, 'short_description_fr', 'Short description english', 'Short Description'),
(NULL, 'long_description_fr', 'Long description English', 'Long Description'),
(NULL, 'info', 'Information', 'Information'),
(NULL, 'quote', 'Quote', 'Quote'),
(NULL, 'question_fr', 'Question French', 'Question French'),
(NULL, 'question_en', 'Question English', 'Question English'),
(NULL, 'answer_en', 'Answer English', 'Answer English'),
(NULL, 'answer_fr', 'Answer French', 'Answer French'),
(NULL, 'content', 'Page Content', 'Page Content'),
(NULL, 'add_content', 'Add Content', 'Add Content'),
(NULL, 'edit_content', 'Edit Content', 'Edit Content'),
(NULL, 'video', 'video (If Youtube Link)', 'video'),
(NULL, 'add_faq', 'Add F.A.Q', 'Add faq'),
(NULL, 'add_testimonial', 'Add Testimonial', 'Add testimonial'),
(NULL, 'add_service', 'Add Service', 'Add service'),
(NULL, 'add_client', 'Add Client', 'Add client'),
(NULL, 'add_team', 'Add Team', 'Add team'),
(NULL, 'add_contact', 'Add Contact', 'Add contact'),
(NULL, 'add_article', 'Add Article', 'Add article'),
(NULL, 'edit_article', 'edit Article', 'edit article'),
(NULL, 'edit_contact', 'edit Contact', 'edit contact'),
(NULL, 'edit_team', 'edit Team', 'edit team'),
(NULL, 'edit_client', 'edit Client', 'edit client'),
(NULL, 'edit_service', 'edit Service', 'edit service'),
(NULL, 'edit_testimonial', 'edit Testimonial', 'edit testimonial'),
(NULL, 'edit_faq', 'edit F.A.Q', 'edit faq'),
(NULL, 'article_list', 'Article List', 'article'),
(NULL, 'contact_list', 'Contact List', 'contact'),
(NULL, 'team_list', 'Team List', 'team'),
(NULL, 'client_list', 'Client List', 'client'),
(NULL, 'service_list', 'Service List', 'service'),
(NULL, 'testimonial_list', 'Testimonial List', 'testimonial'),
(NULL, 'faq_list', 'F.A.Q List', 'faq'),
(NULL, 'content_list', 'Page Content', 'Page Content'),
(NULL, 'add_teammember', 'Add Teammember', 'Add Teammember'),
(NULL, 'tooltip_package_name', 'Example: Silver Package', 'Example: Silver Package'),
(NULL, 'tooltip_package_details', 'This is for Package Short Details', 'This is for Package Short Details.'),
(NULL, 'tooltip_package_amount', 'Package Amount in Dollar. Example: 200', 'Package Amount in Dollar. Example: 200'),
(NULL, 'tooltip_package_daily_roi', 'Please Set this field with Zero. Example: 0', 'Please Set this field with Zero. Example: 0'),
(NULL, 'tooltip_package_weekly_roi', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period'),
(NULL, 'tooltip_package_monthly_roi', 'Sum of weekly ROI in a month', 'Sum of weekly ROI in a month'),
(NULL, 'tooltip_package_yearly_roi', 'Sum of weekly ROI in a Year', 'Sum of weekly ROI in a Year'),
(NULL, 'tooltip_package_total_percent_roi', 'Total Persent Of ROI', 'Total Persent Of ROI'),
(NULL, 'tooltip_package_period', 'Package Period', 'Package Period'),
(NULL, 'trading', 'Trading', 'Trade'),
(NULL, 'trade_history', 'Trade History', 'Histoire Du Commerce'),
(NULL, 'market', 'Market', 'Marché'),
(NULL, 'coin_pair', 'Coin Pair', 'Coin Pair'),
(NULL, 'pending_deposit', 'Pending Deposit', 'Demande de retrat en cours'),
(NULL, 'email_and_sms_setting', 'Email And SMS Setting', 'Paramètres D\'e-mail Et De SMS'),
(NULL, 'email_and_sms_gateway', 'Email And Sms Gateway', 'Email And Sms Gateway'),
(NULL, 'trade', 'Trade', 'Commerce'),
(NULL, 'referral_id', 'Referral ID', ''),
(NULL, 'please_enter_valid_email', 'Please Enter Valid Email !!!', 'Please Enter Valid Email !!!'),
(NULL, 'already_subscribe', 'This Email Address already subscribed', 'This Email Address already subscribed'),
(NULL, 'message_send_successfuly', 'TMessage send successfuly', 'Message send successfuly'),
(NULL, 'message_send_fail', 'Message send Fail', 'Message send Fail'),
(NULL, 'setup_payment_gateway', 'setup payment gateway', 'setup payment gateway'),
(NULL, 'user_profile', 'User Profile', 'User Profile'),
(NULL, 'client_id', 'Client Id', 'Client Id'),
(NULL, 'client_secret', 'Client Secret', 'Client Secret'),
(NULL, 'notice', 'Notice', 'Remarquer'),
(NULL, 'edit_notice', 'Edit Notice', 'Edit Notice'),
(NULL, 'language_list', 'Language List', 'Language List'),
(NULL, 'phrase_list', 'Phrase List', 'Phrase List'),
(NULL, 'edit_phrase', 'Edit Phrase', 'Edit Phrase'),
(NULL, 'label_added_successfully', 'Label added successfully!', 'Label added successfully!'),
(NULL, 'this_level_already_exist', 'This Level Already Exist!', 'This Level Already Exist!'),
(NULL, 'you_successfully_deposit_the_amount', 'You successfully deposit the amount', 'You successfully deposit the amount'),
(NULL, 'your_new_balance_is', 'Your new balance is', 'Your new balance is'),
(NULL, 'account_name', 'Account Name', 'Account Name'),
(NULL, 'account_no', 'Account No', 'Account No'),
(NULL, 'branch_name', 'Branch Name', 'Branch Name'),
(NULL, 'swift_code', 'SWIFT Code', 'SWIFT Code'),
(NULL, 'abn_no', 'ABN No', 'ABN No'),
(NULL, 'country', 'Country', 'Country'),
(NULL, 'bank_name', 'Bank Name', 'Bank Name'),
(NULL, 'there_is_no_phone_number', 'There is no Phone number!!!', 'There is no Phone number!!!'),
(NULL, 'coinpair', 'Coinpair', 'Coinpair'),
(NULL, 'edit_coinpair', 'Edit Coinpair', 'Edit Coinpair'),
(NULL, 'edit_coin', 'Edit coin', 'Edit coin'),
(NULL, 'coin_market', 'Coin Market', 'Marché Aux Pièces'),
(NULL, 'edit_market', 'Edit Market', 'Modifier Le Marché'),
(NULL, 'leave_us_a_message', 'Leave us a message', 'Leave us a message'),
(NULL, 'verify_type', 'verify type', 'verify type'),
(NULL, 'gender', 'Gender', 'Gender'),
(NULL, 'id_number', 'Id  Number', 'Id Number'),
(NULL, 'verification_is_being_processed', 'Verification Is being Processed', 'Verification Is being Processed'),
(NULL, 'cryptocoin', 'Cryptocoin', 'Cryptocoin french'),
(NULL, 'please_setup_your_bank_account', 'Please setup bank account', 'Please setup bank account'),
(NULL, 'this_gateway_deactivated', 'This Gateway Deactivated', 'This Gateway Deactivated'),
(NULL, 'otp_send_to', 'OTP Send To', 'OTP Send To'),
(NULL, 'your_weekly_limit_exceeded', 'Your weekly Limit exceeded', 'Your weekly exceeded '),
(NULL, 'there_is_no_order_for_cancel', 'There is no order for cancel', 'There is no order for cancel'),
(NULL, 'request_canceled', 'Request Canceled', 'Demande Annulée'),
(NULL, 'referral_id_is_invalid', 'Referral ID is invalid', 'Referral ID is invalid'),
(NULL, 'invalid_ip_address', 'Invalid IP address', 'Invalid IP address'),
(NULL, 'please_activate_your_account', 'Please activate your account', 'Please activate your account'),
(NULL, 'already_regsister', 'Already regsister!!!', 'Already regsister!!!'),
(NULL, 'this_account_is_now_pending', 'This account is now pending', 'This account is now pending'),
(NULL, 'this_account_is_suspend', 'This account is suspend', 'This account is suspend'),
(NULL, 'something_wrong', 'Something wrong !!!', 'Something wrong !!!'),
(NULL, 'password_missmatch', 'Password Missmatch', 'password missmatch'),
(NULL, 'invalid_authentication_code', 'Invalid Authentication Code', 'Invalid Authentication Code'),
(NULL, 'password_reset_code_send_check_your_email', 'Password reset code send.Check your email.', 'Password reset code send.Check your email.'),
(NULL, 'email_required', 'email required', 'email required'),
(NULL, 'password_changed', 'Password has been changed', 'Password has been changed'),
(NULL, 'google_authenticator_disabled', 'Google Authenticator Disabled', 'Google Authenticator Disabled'),
(NULL, 'google_authenticator_enabled', 'Google Authenticator Enabled', 'Google Authenticator Enabled'),
(NULL, 'this_account_already_activated', 'This account already activated', 'This account already activated'),
(NULL, 'total_balance', 'Total Balance', 'Total Balance'),
(NULL, 'available_balance', 'Available Balance', 'Available balance'),
(NULL, 'open', 'Open', NULL),
(NULL, 'qty', 'QTY', 'QTY'),
(NULL, 'finished_trade', 'Finished Trade', 'Finished Trade'),
(NULL, 'deposit_crypto_dollar', 'Deposit(Crypto/Dollar)', 'Deposit(Crypto/Dollar)'),
(NULL, 'us_dollar', 'US Dollar', 'US Dollar'),
(NULL, 'available', 'Available', 'Disponible'),
(NULL, 'buy_orders', 'Buy Orders', 'Buy Orders'),
(NULL, 'last_price', 'Last price', 'last price'),
(NULL, 'sell_orders', 'Sell Orders', 'Sell Orders'),
(NULL, '1hr_change', '1hr Change', '1hr Change'),
(NULL, '1hr_high', '1hr High', '1hr High'),
(NULL, '1hr_low', '1hr Low', '1hr Low'),
(NULL, '1hr_volume', '1hr Volume', '1hr Volume'),
(NULL, 'estimated_open_price', 'Estimated open price', 'Estimated open price'),
(NULL, 'open_fees', 'Open fees', 'Open fees'),
(NULL, 'market_depth', 'Market Depth', 'Market Depth'),
(NULL, 'coin', 'Coin', 'Pièce De Monnaie'),
(NULL, 'market_price', 'Market Price', 'Market Price'),
(NULL, 'volume', 'volume', 'volume'),
(NULL, 'live_chat', 'Live Chat', 'Live Chat'),
(NULL, 'market_trade_history', 'Market Trade History', 'Market Trade History'),
(NULL, 'Notices', 'notices', 'notices'),
(NULL, 'posted_by', 'Posted by', 'Posted by'),
(NULL, 'latest_form_our_blog', 'Latest form our blog', 'Latest form our blog'),
(NULL, 'auth_code', 'Auth Code', 'AuthCode'),
(NULL, 'scan_this_barcode_using', 'Scan this BarCode using', 'Scan this BarCode using'),
(NULL, 'google_authentication', 'Google Authentication', 'Google Authentication'),
(NULL, 'install_google_authentication', 'Install Google Authentication', 'Install Google Authentication'),
(NULL, 'if_you_are_unable_to_scan_the_qr_code_please_enter_this_code_manually_into_the_app.', 'If you are unable to scan the QR code, please enter this code manually into the app.', 'If you are unable to scan the QR code, please enter this code manually into the app.'),
(NULL, 'open_order', 'Open Order', 'Open Order'),
(NULL, 'complete_order', 'Complete Order', 'Complete Order'),
(NULL, 'bank_setting', 'Bank Setup', 'Bank Setup'),
(NULL, 'payout_setup', 'Payout Setup', 'Payout Setup'),
(NULL, 'account_login', 'Account Login', 'Account Login'),
(NULL, 'we_never_share_your_email_with_anyone_else', 'We\'ll never share your email with anyone else', 'We\'ll never share your email with anyone else'),
(NULL, 'news_details', 'News Details', 'News Details'),
(NULL, 'open_order_history', 'Open Order History', 'Open Order History'),
(NULL, 'required_qty', 'Required QTY', ''),
(NULL, 'available_qty', 'Available Quantity ', ''),
(NULL, 'required_amount', 'Required Amount', ''),
(NULL, 'available_amount', 'Available Amount', ''),
(NULL, 'complete_qty', 'Complete QTY', ''),
(NULL, 'complete_amount', 'Complete amount', ''),
(NULL, 'trade_time', 'Trade Time', 'Trade Time'),
(NULL, 'running', 'Running', NULL),
(NULL, '24hr_change', '24hr Change', '24hr Change'),
(NULL, '24hr_high', '24hr High', '24hr High'),
(NULL, '24hr_low', '24hr Low', '1hr Low'),
(NULL, '24hr_volume', '24hr Volume', '24hr Volume'),
(NULL, 'post_comment', 'Post Comment', 'Post Comment'),
(NULL, 'account_created', 'Account Created', 'Account Created'),
(NULL, 'access_time', 'Access Time', 'Access Time'),
(NULL, 'user_agent', 'User Agent', 'User Agent'),
(NULL, 'passport', 'Passport', 'Passport'),
(NULL, 'drivers_license', 'Driver license', 'Driver license'),
(NULL, 'government_issued_id_card', 'Government-issued ID Card', 'Government-issued ID Card'),
(NULL, 'given_name', 'Given Name', 'Given Name'),
(NULL, 'surname', 'Surname', 'Surname'),
(NULL, 'passport_nid_license_number', 'Passport/NID/License Number', 'Passport/NID/License Number'),
(NULL, 'account_register', 'Account Register', 'Account Register'),
(NULL, 'confirm_password', 'Confirm Password', 'Confirm Password'),
(NULL, 'canceled', 'Canceled', NULL),
(NULL, 'completed', 'Completed', NULL),
(NULL, 'crypto_dollar_currency', 'Crypto/Dollar Currency', 'Crypto/Dollar Currency'),
(NULL, 'withdraw_no', 'Withdraw No', 'Withdraw No'),
(NULL, 'male', 'Male', 'Male'),
(NULL, 'female', 'Female', 'Female'),
(NULL, 'verify', 'Verify', 'Verify'),
(NULL, 'server_problem', 'Server Problem', 'Server Problem'),
(NULL, 'verified', 'Verified', 'Vérifié'),
(NULL, 'footer_menu1', 'Footer menu 1', 'Footer menu 1'),
(NULL, 'footer_menu2', 'Footer menu 2', 'Footer menu 2'),
(NULL, 'footer_menu3', 'Social Service', 'Social Service'),
(NULL, 'terms_of_use', 'Terms Of Use', 'Terms Of Use'),
(NULL, 'receiver_not_valid', 'Receiver not valid!!!', 'Receiver not valid!!!'),
(NULL, 'first_name_required', 'Please enter your name!', 'Please enter your name!'),
(NULL, 'a_lowercase_letter', 'Please Enter a Lowercase letter !', 'Please enter a loswercase letter!'),
(NULL, 'password_required', 'Please enter your password!', 'Please enter yYour password!'),
(NULL, 'a_capital_uppercase_letter', 'Please Enter a Uppercase letter ! ', 'Please enter a upercase letter!'),
(NULL, 'a_number', 'Please Enter a Number!', 'Please enter a number!'),
(NULL, 'a_special', 'Please Enter a Special Character !', 'Please enter a  special character!'),
(NULL, 'please_enter_at_least_8_characters_input', 'Please enter at least eight characters!', 'Please enter at least eight characters!'),
(NULL, 'confirm_password_must_be_filled_out', 'Please enter Confirm password!', 'Please enter Confirm password!'),
(NULL, 'must_confirm_privacy_policy_and_terms_and_conditions', 'Must confirm privacy policy and terms and conditions', 'Must confirm privacy policy and terms and conditions'),
(NULL, 'phone_required', 'Enter your phone number!', 'Enter your phone number!'),
(NULL, 'email_required', 'Enter your email address!', 'Enter your email address!'),
(NULL, 'comments_required', 'Enter your comments!', 'Enter your comments!'),
(NULL, 'first_name', 'Please enter your first name!', 'Please enter your first name!'),
(NULL, 'c', NULL, NULL),
(NULL, 'f_name', 'First Name', 'First Name'),
(NULL, 'l_name', 'Last Name', 'Last Name'),
(NULL, 'coin_full_name', 'Coin Full Name', 'Nom complet de la piÃ¨ce'),
(NULL, 'coin_id', 'Coin Id', 'ID de piÃ¨ce'),
(NULL, 'rank', 'Rank', NULL),
(NULL, 'show_home', 'Show Home', 'Afficher la maison'),
(NULL, 'yes', 'Yes', 'Oui'),
(NULL, 'no', 'No', 'Non'),
(NULL, 'coin_image/icon/logo', 'Coin Image/Icon/Logo', 'Image de piÃ¨ce / icÃ´ne / logo'),
(NULL, 'coin_icon', 'Coin Icon', 'IcÃ´ne de piÃ¨ce de monnaie'),
(NULL, 'full_name', 'Full Name', 'Nom complet'),
(NULL, 'home_page/serial', 'Home Page/Serial', 'Page d\'accueil / SÃ©rie'),
(NULL, 'email_notification_settings', 'Email Notification Settings', 'Paramètres De Notification Par E-mail'),
(NULL, 'payout', 'Payout', NULL),
(NULL, 'commissin', 'Commissin', 'Commission'),
(NULL, 'team_bonnus', 'Team Bonnus', NULL),
(NULL, 'sms_sending', 'SMS Sending', 'Envoi De SMS'),
(NULL, 'exchange_market', 'Exchange Market', 'Marché Des Changes'),
(NULL, 'total_trade', 'Total Trade', 'Commerce Total'),
(NULL, 'total_crypto_fees', 'Total Crypto Fees', 'Total Des Frais De Crypto'),
(NULL, 'total_usd_fees', 'Total USD Fees', 'Frais Totaux En USD'),
(NULL, 'referral_bonus_usd', 'Referral Bonus USD', 'Bonus De Parrainage USD'),
(NULL, 'market_deposit', 'Market Deposit', 'DÃ©pÃ´t de marchÃ©'),
(NULL, 'fees_collect', 'Fees Collect', 'Frais collectÃ©s'),
(NULL, 'quantity', 'Quantity', 'QuantitÃ©'),
(NULL, 'required', 'Required', NULL),
(NULL, 'history', 'history', 'histoire'),
(NULL, 'back', 'Back', 'Retour'),
(NULL, 'important', 'Important', 'Important'),
(NULL, 'send_only', 'Send Only', 'Envoyer seulement'),
(NULL, 'deposit_address', 'deposit address', 'adresse de dÃ©pÃ´t'),
(NULL, 'sending_any_other_coin_or_token_to_this_address_may_result_in_the_loss_of_your_deposit', 'Sending any other coin or token to this address may result in the loss of your deposit', 'L\'envoi de toute autre piÃ¨ce ou jeton Ã  cette adresse peut entraÃ®ner la perte de votre dÃ©pÃ´t'),
(NULL, 'copy_address', 'Copy Address', 'Copier l\'adresse'),
(NULL, 'payment_process', 'Payment Process', NULL),
(NULL, 'balance', 'Balance', 'Ã©quilibre'),
(NULL, 'flag', 'Flag', NULL),
(NULL, 'menu_background_color', 'Menu Background Color', 'Couleur d\'arrière-plan du menu'),
(NULL, 'menu_font_color', 'Menu Font Color', 'Couleur de la police du menu'),
(NULL, 'footer_background_color', 'Footer Background Color', 'Couleur de fond du bas de page'),
(NULL, 'footer_font_color', 'Footer Font Color', 'Couleur de la police du pied de page'),
(NULL, 'button_background_color', 'Button Background Color', 'Couleur d\'arrière-plan du bouton'),
(NULL, 'button_font_color', 'Button Font Color', 'Couleur de la police du bouton'),
(NULL, 'theme_color', 'Theme Color', 'Couleur du thème'),
(NULL, 'newsletter_background_color', 'Newsletter Background Color', 'Couleur d\'arrière-plan de la newsletter'),
(NULL, 'newsletter_font_color', 'Newsletter Font Color', 'Couleur de police de la newsletter'),
(NULL, 'newsletter_images', 'Newsletter Images', 'Images de la newsletter'),
(NULL, 'pending-withdraw', 'Pending withdraw', 'En attente de retrait'),
(NULL, 'withdraw-list', 'Withdraw List', 'Retirer la liste'),
(NULL, 'pending-deposit', 'Pending Deposit', 'Dépôt en attente'),
(NULL, 'deposit-list', 'Deposit List', 'Liste de dépôt'),
(NULL, 'add-credit', 'Add Credit', 'Ajouter un crédit'),
(NULL, 'open-order', 'Open Order', 'Commande Ouverte'),
(NULL, 'trade-history', 'Trade History', 'Histoire Du Commerce'),
(NULL, 'exchanger', 'Exchanger', 'Échangeur'),
(NULL, 'coin-pair', 'Coin Pair', 'Paire De Pièces'),
(NULL, 'user', 'User', 'Utilisateur'),
(NULL, 'add-user', 'Add User', 'Ajouter un utilisateur'),
(NULL, 'user-list', 'user list', 'liste d\'utilisateur'),
(NULL, 'verify-user', 'Verify User', 'Vérifier L\'utilisateur'),
(NULL, 'subscriber-list', 'Subscriber List', 'Liste D\'abonnés'),
(NULL, 'app-setting', 'App Setting', 'Réglage De L\'application'),
(NULL, 'block-list', 'Block List', 'Liste De Blocage'),
(NULL, 'fees-setting', 'Fees Setting', 'établissement Des Frais'),
(NULL, 'transaction-setup', 'Transaction Setup', 'Configuration De La Transaction'),
(NULL, 'email-sms-gateway', 'Email Sms Gateway', 'Passerelle Sms Email'),
(NULL, 'payment-gateway', 'Payment Gateway', 'Passerelle De Paiement'),
(NULL, 'affiliation', 'Affiliation', 'Affiliation'),
(NULL, 'external-api-list', 'External Api List', 'Liste Des API Externes'),
(NULL, 'update-external-api', 'Update External Api', 'Mettre à Jour L\'API Externe'),
(NULL, 'phrase', 'Phrase', 'Phrase'),
(NULL, 'edit-phrase', 'Edit Phrase', 'Modifier La Phrase'),
(NULL, 'update-gateway', 'Update Gateway', 'Mettre à Jour La Passerelle'),
(NULL, 'edit-user', 'Edit User', 'Modifier L\'utilisateur'),
(NULL, 'add-admin', 'Add Admin', 'Ajouter Un Administrateur'),
(NULL, 'admin-list', 'Admin List', 'Liste D\'administrateurs'),
(NULL, 'cms', 'CMS', 'CMS'),
(NULL, 'themes-setting', 'Themes Setting', 'Réglage Des Thèmes'),
(NULL, 'page-content-list', 'Page Content List', 'Liste De Contenu De Page'),
(NULL, 'faq-list', 'Faq List', 'Liste De Faq'),
(NULL, 'notice-list', 'Notice List', 'Liste D\'avis'),
(NULL, 'edit-page-content', 'Edit Page Content', 'Modifier Le Contenu De La Page'),
(NULL, 'edit-faq', 'Edit Faq', 'Modifier La FAQ'),
(NULL, 'edit-notice', 'Edit Notice', 'Modifier L\'avis'),
(NULL, 'add-page-content', 'Add Page Content', 'Ajouter Du Contenu De Page'),
(NULL, 'add-faq', 'Add Faq', 'Ajouter Une FAQ'),
(NULL, 'news-list', 'News List', 'Liste De Nouvelles'),
(NULL, 'add-news', 'Add News', 'Ajouter Des Nouvelles'),
(NULL, 'edit-news', 'Edit News', 'Modifier Les Actualités'),
(NULL, 'category-list', 'Category List', 'Liste Des Catégories'),
(NULL, 'add-category', 'Add Category', 'Ajouter Une Catégorie'),
(NULL, 'edit-category', 'Edit Category', 'Modifier La Catégorie'),
(NULL, 'slider-list', 'Slider List', 'Liste De Curseurs'),
(NULL, 'add-slider', 'Add Slider', 'Ajouter Un Curseur'),
(NULL, 'edit-slider', 'Edit Slider', 'Modifier Le Curseur'),
(NULL, 'social-link-list', 'Social Link List', 'Liste De Liens Sociaux'),
(NULL, 'edit-social-link', 'Edit Social Link', 'Modifier Le Lien Social'),
(NULL, 'advertisement-list', 'Advertisement List', 'Liste De Publicités'),
(NULL, 'add-advertisement', 'Add Advertisement', 'Ajouter Une Publicité'),
(NULL, 'edit-advertisement', 'Edit Advertisement', 'Modifier La Publicité'),
(NULL, 'web-language-list', 'Web Language List', 'Liste Des Langues Web'),
(NULL, 'autoupdate', 'Autoupdate', 'Mise à Jour Automatique'),
(NULL, 'latest-version', 'Latest Version', 'Dernière Version'),
(NULL, 'current-version', 'Current Version', 'Version Actuelle'),
(NULL, 'subscriber', 'Subscriber', 'Abonné'),
(NULL, 'affiliation-setup', 'Affiliation Setup', 'Configuration De L\'affiliation'),
(NULL, 'external-api', 'External API', 'API Externe'),
(NULL, 'support', 'Support', 'Soutien'),
(NULL, 'no-update-available', 'No Update Available', 'Pas De Mise A Jour Disponible'),
(NULL, 'full-name', 'Full Name', 'Nom Complet'),
(NULL, 'initial-price', 'Initial Price', 'Prix ???initial'),
(NULL, 'test_bdtask', 'Bdtask Limited', NULL),
(NULL, 'email_sms_template', 'E-mail And SMS Template', 'E-mail And SMS Template'),
(NULL, 'template-english', 'Template English', 'Modèle Anglais'),
(NULL, 'template-french', 'Template French', 'Modèle Français'),
(NULL, 'template-name', 'Template Name', 'Nom Du Modèle'),
(NULL, 'template-type', 'Template Type', 'Type De Modèle'),
(NULL, 'template-update', 'Template-update', 'Template-update'),
(NULL, 'email-sms-template', 'Email Sms Template', 'Modèle De Courrier électronique SMS'),
(NULL, 'transfer_verification', 'Transfer Verification', 'Vérification Du Transfert'),
(NULL, 'transfer_success', 'Transfer Success', 'Succès Du Transfert'),
(NULL, 'withdraw_verification', 'Withdraw Verification', 'Retirer La Vérification'),
(NULL, 'withdraw_success', 'Withdraw Success', 'Retirer Le Succès'),
(NULL, 'profile_update', 'Profile Update', 'Mise à Jour Du Profil'),
(NULL, 'deposit_success', 'Deposit Success', 'Réussite Du Dépôt'),
(NULL, 'registered', 'Registered', 'Inscrit'),
(NULL, 'email_address', 'Email Address', 'Adresse E-mail'),
(NULL, 'template_type', 'Template Type', 'Type De Modèle'),
(NULL, 'subject_english', 'Subject English', 'Sujet Anglais'),
(NULL, 'subject_french', 'Subject French', 'Sujet Français'),
(NULL, 'purchase_key', 'Purchase Key', 'Clé D\'achat'),
(NULL, 'module', 'Module', 'Module'),
(NULL, 'add_module', 'Add Module', 'Ajouter Un Module'),
(NULL, 'overwrite', 'Overwrite', 'écraser'),
(NULL, 'theme_uploaded_successfully', 'Theme Uploaded Successfully', 'Thème Téléchargé Avec Succès'),
(NULL, 'there_was_a_problem_with_the_upload', 'There Was A Problem With The Upload', 'Il Y A Eu Un Problème Avec Le Téléchargement'),
(NULL, 'invalid_purchase_key', 'Invalid Purchase Key', 'Clé D\'achat Invalide'),
(NULL, 'buy_now', 'Buy Now', 'Acheter Maintenant'),
(NULL, 'install', 'Install', 'Installer'),
(NULL, 'invalid_module', 'Invalid Module', 'Module Invalide'),
(NULL, 'module_added_successfully', 'Module Added Successfully', 'Module Ajouté Avec Succès'),
(NULL, 'no_tables_are_registered_in_config', 'No Tables Are Registered_in Config', 'Aucune Table N\'est Enregistrée Dans La Configuration'),
(NULL, 'themes', 'Themes', 'Thèmes'),
(NULL, 'module_list', 'Module List', 'Liste Des Modules'),
(NULL, 'theme_active_successfully', 'Theme Active Successfully', 'Thème Actif Avec Succès'),
(NULL, 'theme_name', 'Theme Name', 'Nom Du Thème'),
(NULL, 'upload', 'Upload', 'Télécharger'),
(NULL, 'downloaded_successfully', 'Downloaded Successfully', 'Téléchargé Avec Succès'),
(NULL, 'failed_try_again', 'Failed Try Again', 'échec Réessayer'),
(NULL, 'no_theme_available', 'No Theme Available', 'Aucun Thème Disponible'),
(NULL, 'download', 'Download', 'Télécharger'),
(NULL, 'theme_list', 'Theme List', 'Liste De Thèmes'),
(NULL, 'addon', 'Addon', 'Ajouter'),
(NULL, 'add_theme', 'Add Theme', 'Ajouter Un Thème'),
(NULL, 'download_theme', 'Download Theme', 'Télécharger Le Thème'),
(NULL, 'uninstall', 'Uninstall', 'Désinstaller'),
(NULL, 'please_wait', 'Please Wait', 'S\'il Vous Plaît, Attendez'),
(NULL, 'current', 'Current', 'Actuel'),
(NULL, 'back_to_home', 'Back To Home', 'De Retour à La Maison'),
(NULL, 'trading_history', 'Trading History', 'Historique Du Trading'),
(NULL, 'latest_news', 'Latest News', 'Dernières Nouvelles'),
(NULL, 'create_an_account', 'Create An Account', 'Créer Un Compte'),
(NULL, 'to__trade', 'To  Trade', 'échanger'),
(NULL, 'log_in', 'Log In', 'S\'identifier'),
(NULL, 'white', 'WHITE', 'BLANC'),
(NULL, 'dark', 'DARK', 'FONCÉ'),
(NULL, 'enter_your_email_address_to_retrieve_your_password', 'Enter Your Email Address To Retrieve Your Password', 'Entrez Votre Adresse E-mail Pour Récupérer Votre Mot De Passe'),
(NULL, 'retrieve_password', 'Retrieve Password', 'Récupérer Mot De Passe');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`) VALUES
(NULL, 'not_a_member_yet', 'Not A Member Yet', 'Pas Encore Membre'),
(NULL, 'total_users', 'Total Users', 'Nombre Total D\'utilisateurs'),
(NULL, 'all_users', 'All Users', 'Tous Les Utilisateurs'),
(NULL, 'all_markets', 'All Markets', 'Tous Les Marchés'),
(NULL, 'method', 'Method', 'Méthode'),
(NULL, 'slider_title_engnilsh', 'Slider Title Engnilsh', 'Titre Du Curseur Engnilsh'),
(NULL, 'slider_h1', 'Slider H1', 'Curseur H1'),
(NULL, 'sub_title_english', 'Sub Title English', 'Sous-titre Anglais'),
(NULL, 'slider_h2', 'Slider H2', 'Curseur H2'),
(NULL, 'button_text', 'Button Text', 'Texte Du Bouton'),
(NULL, 'slider_h3', 'Slider H3', 'Curseur H3'),
(NULL, 'code', 'Code', 'Code'),
(NULL, 'language_name', 'Language Name', 'Nom De La Langue'),
(NULL, 'add_coin_pair', 'Add Coin Pair', 'Ajouter Une Paire De Pièces'),
(NULL, 'cryptocoin_add', 'Cryptocoin Add', 'Ajout De Crypto-monnaie'),
(NULL, 'add-coin-pair', 'Add-coin-pair', 'Ajouter Une Paire De Pièces'),
(NULL, 'security', 'Security', 'Sécurité'),
(NULL, 'edita_dmin', 'Edita Dmin', 'Edita Dmin'),
(NULL, 'edit-admin', 'Edit-admin', 'Edit-admin'),
(NULL, 'article1_en', 'Article1 En', 'Article1 Fr'),
(NULL, 'question_english', 'Question English', 'Question Anglais'),
(NULL, 'add-notice', 'Add-notice', 'Add-notice'),
(NULL, 'edit-profile', 'Edit-profile', 'Editer Le Profil'),
(NULL, '_phrase_name', ' Phrase Name', 'Nom De La Phrase'),
(NULL, 'cryptocoin-edit', 'Cryptocoin-edit', 'Crypto-monnaie-modifier'),
(NULL, 'edit-market', 'Edit-market', 'Edit-market'),
(NULL, 'edit-coin-pair', 'Edit-coin-pair', 'Modifier La Paire De Pièces'),
(NULL, 'transaction_type', 'Transaction Type', 'Type De Transaction'),
(NULL, 'account_type', 'Account Type', 'Type De Compte'),
(NULL, 'unverified', 'Unverified', 'Non Vérifié'),
(NULL, 'limit_amount', 'Limit Amount', 'Montant Limite'),
(NULL, 'percent', 'Percent', 'Pour Cent'),
(NULL, 'fixed', 'Fixed', 'Fixé'),
(NULL, 'api_name', 'API Name', 'Nom De L\'API'),
(NULL, 'merchant_id', 'Merchant Id', 'Identifiant Du Marchand'),
(NULL, 'email_gateway', 'Email Gateway', 'Passerelle De Messagerie'),
(NULL, 'sms_gateway', 'Sms Gateway', 'Passerelle Sms'),
(NULL, 'credit-list', 'Credit-list', 'Liste De Crédit'),
(NULL, 'cryptocoin-add', 'Cryptocoin-add', 'Ajout De Crypto-monnaie'),
(NULL, 'see_all_users', 'See All Users', 'Voir Tous Les Utilisateurs'),
(NULL, 'see_all_markets', 'See All Markets', 'Voir Tous Les Marchés'),
(NULL, 'see_trade_history', 'See Trade History', 'Voir L\'historique Du Commerce'),
(NULL, 'buy_&_sell', 'Buy & Sell', 'Acheter Vendre'),
(NULL, 'deposit,_withdraw,_transfer', 'Deposit, Withdraw, Transfer', 'Dépôt, Retrait, Transfert'),
(NULL, 'see_all_pending_withdraw', 'See All Pending Withdraw', 'Voir Tous Les Retraits En Attente'),
(NULL, 'see_all_trade_history', 'See All Trade History', 'Voir Toute L\'histoire Du Commerce'),
(NULL, 'user_growth_rate', 'USER GROWTH RATE', 'TAUX DE CROISSANCE DES UTILISATEURS'),
(NULL, 'email_sms_settings', 'Email Sms Settings', 'Paramètres De Messagerie électronique'),
(NULL, 'email-sms-settings', 'Email-sms-settings', 'Email-sms-settings'),
(NULL, 'fees_collection', 'Fees Collection', 'Perception Des Frais'),
(NULL, 'create_user', 'Create User', 'Créer Un Utilisateur'),
(NULL, 'create_admin', 'Create Admin', 'Créer Un Administrateur'),
(NULL, 'add-ons', 'Add-ons', 'Add-ons'),
(NULL, 'max_sell_currency_amount', 'Max Sell Currency Amount', 'Montant Maximal De La Devise De Vente'),
(NULL, 'max_buy_currency_amount', 'Max Buy Currency Amount', 'Montant Maximal De La Devise D\'achat'),
(NULL, 'account', 'Account', 'Compte'),
(NULL, 'google_captcha', 'Google Captcha', 'Google Capture'),
(NULL, 'add_captcha_at_your_domain', 'Add captcha at your domain', 'Domaine De Configuration'),
(NULL, 'pages', 'Pages', 'Pages'),
(NULL, 'useful_links', 'Useful Links', 'Liens Utiles'),
(NULL, 'check_your_email_server', 'Check Your Email Server', 'Vérifiez Votre Serveur De Messagerie'),
(NULL, 'check_your_sms_gateway_', 'Check Your Sms Gateway ', 'Vérifiez Votre Passerelle SMS'),
(NULL, 'mobile_no', 'Mobile No', 'Mobile Non'),
(NULL, 'email_gateway_setup', 'Email Gateway Setup', 'Configuration De La Passerelle De Messagerie'),
(NULL, 'sms_gateway_setup', 'SMS Gateway Setup', 'Configuration De La Passerelle SMS'),
(NULL, 'check_your_sms_gateway', 'Check Your Sms Gateway', 'Vérifiez Votre Passerelle SMS'),
(NULL, 'logo_type', 'Logo Type', 'Type De Logo'),
(NULL, 'log_type', 'Log Type', 'Type De Journal'),
(NULL, 'body_background_color', 'Body Background Color', 'Couleur D\'arrière-plan Du Corps'),
(NULL, 'body_font_color', 'Body Font Color', 'Couleur De La Police Du Corps'),
(NULL, 'top_footer_horizontal_border_color', 'Top Footer Horizontal Border Color', 'Couleur De La Bordure Horizontale Du Pied De Page Supérieur'),
(NULL, 'footer__menu_border_color', 'Footer  Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page'),
(NULL, 'footer_menu_border_color', 'Footer Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page'),
(NULL, 'bottom_footer_background_color', 'Bottom Footer Background Color', 'Couleur D\'arrière-plan Du Pied De Page Inférieur'),
(NULL, 'bottom_footer_font_color', 'Bottom Footer Font Color', 'Couleur De Police Du Pied De Page Inférieur'),
(NULL, 'form_background_color', 'Form Background Color', 'Couleur D\'arrière-plan Du Formulaire'),
(NULL, 'form_border_color', 'Form Border Color', 'Couleur De La Bordure Du Formulaire'),
(NULL, 'form_label_color', 'Form Label Color', 'Couleur De L\'étiquette Du Formulaire'),
(NULL, 'form_input_field_background_color', 'Form Input Field Background Color', ''),
(NULL, 'input_field_border_color', 'Input Field Border Color', 'Couleur De La Bordure Du Champ De Saisie'),
(NULL, 'input_field_color', 'Input Field Color', 'Couleur Du Champ De Saisie'),
(NULL, 'verify_profile', 'Verify Profile', 'Vérifier Le Profil'),
(NULL, 'contact_with_us', 'Contact With Us', 'En Contact Avec Nous'),
(NULL, 'working_hours', 'Working Hours', 'Heures D\'ouverture'),
(NULL, 'phone_number', 'Phone Number', 'Numéro De Téléphone'),
(NULL, 'bank_payment', 'Bank Payment', 'Paiement Bancaire'),
(NULL, 'themes_setting', 'Themes Setting', 'Réglage Des Thèmes'),
(NULL, 'page_content_list', 'Page Content List', 'Liste Du Contenu De La Page'),
(NULL, 'notice_list', 'Notice List', 'Liste Des Avis'),
(NULL, 'category_list', 'Category List', 'Liste Des Catégories'),
(NULL, 'social_link_list', 'Social Link List', 'Liste De Liens Sociaux'),
(NULL, 'advertisement_list', 'Advertisement List', 'Liste Des Publicités'),
(NULL, 'web_language_list', 'Web Language List', 'Liste Des Langues Web'),
(NULL, 'coinpayment', 'Coinpayment', 'Paiement Par Pièces'),
(NULL, 'gourl', 'Gourl', 'Gourle'),
(NULL, 'paypal', 'Paypal', 'Pay Pal'),
(NULL, 'paystack', 'Paystack', 'Paie'),
(NULL, 'transaction_setup', 'Transaction Setup', 'Configuration Des Transactions'),
(NULL, 'external_api_list', 'External Api List', 'Liste D\'API Externes'),
(NULL, 'bank_payment', 'Bank', 'Bank'),
(NULL, 'coinpayment', 'Coinpayment', 'Coinpayment'),
(NULL, 'gourl', 'Gourl', 'Gourl'),
(NULL, 'paypal', 'Paypal', 'Paypal'),
(NULL, 'paystack', 'Paystack', 'Paystack'),
(NULL, 'stripe', 'Stripe', 'Stripe'),
(NULL, 'token_payment', 'Token', 'Token'),
(NULL, 'page_content_list', 'Page Content List', 'Page Content List'),
(NULL, 'themes_setting', 'Themes Setting', 'Themes Setting'),
(NULL, 'notice_list', 'Notice List', 'Notice List'),
(NULL, 'category_list', 'Category List', 'Category List'),
(NULL, 'social_link_list', 'Social Link', 'Social Link'),
(NULL, 'advertisement_list', 'Advertisement List', 'Advertisement List'),
(NULL, 'web_language_list', 'Web Language List', 'Web Language List'),
(NULL, 'transaction_setup', 'Transaction Setup', 'Transaction Setup'),
(NULL, 'external_api_list', 'External Api List', 'External Api List'),
(NULL, 'verify_users', 'Verify Users', 'Verify Users'),
(NULL, 'subscriber_list', 'Subscriber List', 'Subscriber List'),
(NULL, 'order_book', 'Order Book', 'Order Book'),
(NULL, 'trades', 'trades', 'trades'),
(NULL, 'order_placement', 'Order Placement', 'Order Placement'),
(NULL, 'search_pair', 'Search Pair', 'Search Pair'),
(NULL, 'more', 'More', 'More'),
(NULL, 'from_date', 'From Date', 'Partir De La Date'),
(NULL, 'to_date', 'To Date', 'À Ce Jour'),
(NULL, 'coins', 'Coins', 'Pièces De Monnaie'),
(NULL, 'select_coin', 'Select Coin', 'Sélectionnez La Pièce'),
(NULL, 'select_status', 'Select Status', 'Sélectionnez Le Statut'),
(NULL, 'trade_type', 'Trade Type', 'Type De Commerce'),
(NULL, 'select_trade_type', 'Select Trade Type', 'Sélectionnez Le Type De Commerce'),
(NULL, 'open_trade', 'Open Trade', 'Commerce Ouvert'),
(NULL, 'complete_trade', 'Complete Trade', 'Commerce Complet'),
(NULL, 'canceled_trade', 'Canceled Trade', 'Commerce Annulé'),
(NULL, 'bid_type', 'Bid Type', 'Type D\'enchère'),
(NULL, 'select_bid_type', 'Select Bid Type', 'Sélectionnez Le Type D\'enchère'),
(NULL, 'receiver', 'Receiver', 'Receveur');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` varchar(250) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `notification_type` varchar(45) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `details` mediumtext DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='SMS and Email notified data will be stored in this table.';

-- --------------------------------------------------------

--
-- Table structure for table `payeer_payments`
--

CREATE TABLE `payeer_payments` (
  `id` int(11) NOT NULL,
  `m_operation_id` int(11) NOT NULL,
  `m_operation_ps` int(11) NOT NULL,
  `m_operation_date` varchar(100) NOT NULL,
  `m_operation_pay_date` varchar(100) NOT NULL,
  `m_shop` int(11) NOT NULL,
  `m_orderid` varchar(300) NOT NULL,
  `m_amount` varchar(100) NOT NULL,
  `m_curr` varchar(100) NOT NULL,
  `m_desc` varchar(300) NOT NULL,
  `m_status` varchar(100) NOT NULL,
  `m_sign` text NOT NULL,
  `lang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int(11) NOT NULL,
  `identity` varchar(50) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `shop_id` varchar(100) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateway`
--

INSERT INTO `payment_gateway` (`id`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `status`) VALUES
(1, 'bitcoin', 'GoUrl Payment', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', '', '', '', 1),
(2, 'payeer', 'Payeer', '485146745', 'VsdHofTsuI6XOdjL', '', '', '', 1),
(3, 'paystack', 'Paystack', 'pk_test_08e6678d24436a08e7cd2d236b4114c620811f9c', 'sk_test_ee101b8fea4c01b15631a16ded96b3a5c82b6540', '1ef69640753e1a57f651', 'efc16cf798cb00de6ef3', '', 1),
(4, 'phone', 'Mobile Money', '+880 1746 40 68 01', 'mobile', '', '', '', 1),
(5, 'paypal', 'Paypal', 'AfmTkhn-GYb_HAsPayWeLDVTG39jNjGsJ3siJSNDs6QGr52KDLnAT28fIv4TVni5P3Dax8w1y-Libl_j', 'EHGJveSf9GJcbyQwgYmouRi9baBPKLPqeSYjYesiG4UJTSnQ45q3gwQdkB6TvFQAjkYm42D1P_Hqn340', '', 'sandbox', '', 1),
(6, 'stripe', 'Stripe', 'pk_test_BPLwYal0sn4KkKaDTzuj5oRq', 'sk_test_6J6dcwXf8ruEZGCvlC09C9NK', '', '', '', 1),
(7, 'bank', 'Bank', '{\"ci_csrf_token\":\"\",\"id\":\"7\",\"identity\":\"bank\",\"agent\":\"Bank\",\"acc_name\":\"kanan tariq khan\",\"acc_no\":\"3646464643131313\",\"branch_name\":\"kaqbhsjkqbdq\",\"swift_code\":\"464kadh\",\"abn_no\":\"kfhw456454\",\"country\":\"PK\",\"bank_name\":\"mwezan\",\"status\":\"1\"}', '', '', '', '', 1),
(8, 'coinpayment', 'CoinPayments', '0ef5d693629164125849eee7f24deeea058fde91a232b3091525724a480c2c34', '0e1Efced49C5e902a4abF65A01e4F41c040f58aa48f4A6b041e0508D45dc1164', '', '', '{\"marcent_id\":\"f8224829cda4268f107089fd92a469c6\",\"ipn_secret\":\"Bdtask@#2021\",\"debug_email\":\"turan.vuiyan@gmail.com\",\"debuging_active\":1,\"withdraw\":\"0\"}', 1),
(9, 'token', 'Token', '51fec43efdeb1323d1a0854ffa807b64abf8', 'messege...', '', 'show', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_web` varchar(255) NOT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `office_time` varchar(255) DEFAULT NULL,
  `update_notification` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `title`, `description`, `email`, `phone`, `logo`, `logo_web`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`, `latitude`, `office_time`, `update_notification`) VALUES
(1, 'Crypto Currency Trading System', 'Bangladesh Office B-25, Mannan Plaza, 4th Floor, Khilkhet Dhaka-1229, Bangladesh', 'info@bdtask.com', '+8809666980047', '/upload/settings/5b3c74cacc762f373210b855dc9b885a.png', '////upload/settings/5b3c74cacc762f373210b855dc9b885a.png', '/upload/settings/6a32acfe674bbfb88ad1c8f3f1de332d.png', 'english', 'LTR', '2021 © Copyright bdtask Trading System', 'Asia/Dhaka', '40.6700, -73.9400', 'Monday - Friday: 08:00 - 22:00\r\nSaturday, Sunday: Closed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_email_send_setup`
--

CREATE TABLE `sms_email_send_setup` (
  `id` int(11) NOT NULL,
  `method` text NOT NULL,
  `deposit` int(11) DEFAULT NULL,
  `transfer` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `payout` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `team_bonnus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_email_send_setup`
--

INSERT INTO `sms_email_send_setup` (`id`, `method`, `deposit`, `transfer`, `withdraw`, `payout`, `commission`, `team_bonnus`) VALUES
(1, 'email', 1, 1, 1, NULL, NULL, NULL),
(2, 'sms', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tradebox_Default_Theme', 1, '2021-01-18 12:54:13', '2021-03-27 10:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `web_article`
--

CREATE TABLE `web_article` (
  `article_id` int(11) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) DEFAULT NULL,
  `headline_fr` varchar(300) DEFAULT NULL,
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `video` varchar(300) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `page_content` int(11) DEFAULT 0 COMMENT 'if this is a Page content set 1 else 0',
  `position_serial` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_article`
--

INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES
(1, NULL, 'Contact', 'Contact Français Français Français Français Turkey', NULL, '', '1355 Market Street, Suite 900 San Francisco, CA 94103', '<div>\r\n<p>Phone <font color=\"#72afd2\"><span xss=removed>+1 (514) 352-1010</span></font><br>Fax <span xss=removed>+1 (514) 352-7511</span></p></div>', '<ul class=\"opening_hours\">\r\n <li>\r\n<p>Monday-Wednesday</p>\r\n <p>10 am - 6 pm</p></li>\r\n</ul>', '', NULL, 12, 0, 0, '2020-09-15 12:02:49', 'admin@demo.com', 0),
(2, NULL, 'Marketing Consultancy', 'Lorem ipsum ', NULL, '', 'write your answer\r\n', 'write your answer\r\n', '', '', NULL, 30, 0, 0, '2021-03-10 03:09:55', 'admin@demo.com', 0),
(3, NULL, NULL, NULL, NULL, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam finibus vestibulum lacus non sodales. Aenean pretium augue tellus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam finibus vestibulum lacus non sodales. Aenean pretium augue tellus.', '', '', NULL, 29, 0, 0, '2020-09-15 12:26:52', 'admin@demo.com', 0),
(4, NULL, NULL, NULL, NULL, '', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:25', 'admin@demo.com', 0),
(5, NULL, NULL, NULL, NULL, '', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:55', 'admin@demo.com', 0),
(6, NULL, NULL, NULL, NULL, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', '', '', NULL, 29, 0, 0, '2018-10-10 10:58:48', 'admin@demo.com', 0),
(7, 'Make Each <span>Price Spike</span> And Dip Count', 'Make Each <span>Price Spike</span> And Dip Count', 'Make Each <span>Price Spike</span> And Dip Count', '', '', '<p><span style=\"color: rgb(165, 165, 165); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 15px; text-align: center;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span><br></p>', '<p><span style=\"color: rgb(165, 165, 165); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 15px; text-align: center;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span><br></p>', '', '', '', 34, 1, 1, '2018-11-03 06:15:00', 'admin@demo.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `web_category`
--

CREATE TABLE `web_category` (
  `cat_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `cat_name_en` varchar(100) NOT NULL,
  `cat_name_fr` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `cat_image` varchar(300) DEFAULT NULL,
  `cat_title1_en` varchar(100) DEFAULT NULL,
  `cat_title1_fr` varchar(100) DEFAULT NULL,
  `cat_title2_en` varchar(300) DEFAULT NULL,
  `cat_title2_fr` varchar(300) DEFAULT NULL,
  `menu` int(11) DEFAULT NULL COMMENT 'Header menu=1',
  `position_serial` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_category`
--

INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES
(1, 'home', 'Home', 'Maison', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 1, 1, 1),
(4, 'exchange', 'Exchange', 'Échange', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Exchange', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 1, 4, 1),
(8, 'about', 'About', 'Sur', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'About Us', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 0, NULL, 1),
(9, 'news', 'News', 'Nouvelles', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Latest form our blog', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', NULL, NULL, 1),
(16, 'register', 'Register', 'Register', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(17, 'forgot-password', 'Forgot Password', 'Mot de Passe oublié', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(19, 'btc', 'BTC', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(20, 'eth', 'ETH', 'ETH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(21, 'ltc', 'LTC', 'LTC', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(22, 'dash', 'DASH', 'DASH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(24, 'blockchain', 'Blockchain', 'Blockchain', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(25, 'trading', 'Trading', 'Trading', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(26, 'news-details', 'News Details', 'News Details', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(27, 'mining', 'Mining', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(28, 'terms', 'Terms', 'terms', 1, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'term title english', 'turki title', 'category title english', 'dsf', 2, NULL, 1),
(29, 'notice', 'Notice', 'Noticeo', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(30, 'faq', 'FAQ', 'FAQ', 30, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', ' Frequently asked questions', ' Frequently asked questions', ' frequently asked questions', ' Frequently asked questions', 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_language`
--

CREATE TABLE `web_language` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `flag` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_language`
--

INSERT INTO `web_language` (`id`, `name`, `flag`) VALUES
(1, 'French', 'fr');

-- --------------------------------------------------------

--
-- Table structure for table `web_news`
--

CREATE TABLE `web_news` (
  `article_id` int(11) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) NOT NULL,
  `headline_fr` varchar(300) NOT NULL,
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_serial` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_news`
--

INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES
(4, 'south-africa-puts-onus-on-taxpayers-to-declare-all-cryptocurrency-income', 'South Africa Puts Onus on Taxpayers to Declare All Cryptocurrency Income', '', 'upload/news/166e293c430bdf835f0c6d6a127e4e13.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:16', 'admin@demo.com', 0),
(5, 'neo-eos-litecoin-iota-and-stellar-technical-analysis-april-9-2018', 'NEO, EOS, Litecoin, IOTA and Stellar: Technical Analysis April 9, 2018', '', 'upload/news/b731dbe9143e088de015c0c844d40105.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:02', 'admin@demo.com', 0),
(6, 'why-invest-in-dash', 'Why Invest in Dash?', '', 'upload/news/9d5c09ab5b25569514fa852e2d2c1483.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 22, NULL, 0, '2018-07-10 09:10:50', 'admin@demo.com', 0),
(7, 'asic-resistance-increasingly-hot-topic-in-crypto-as-monero-forks', 'ASIC Resistance Increasingly Hot Topic in Crypto as Monero Forks', '', 'upload/news/32083222f2430503659756a60d3b0b6b.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 19, NULL, 0, '2018-07-17 10:30:35', 'admin@demo.com', 0),
(8, 'canadian-mining-giant-hyperblock-acquires-cryptoglobal-for-106-million', 'CANADIAN MINING GIANT HYPERBLOCK ACQUIRES CRYPTOGLOBAL FOR $106 MILLION', '', 'upload/news/e56c8562afa3795f3c4c3ecccc3bfa83.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 27, NULL, 0, '2018-07-17 10:30:23', 'admin@demo.com', 0),
(9, 'how-can-blockchains-remove-the-pay-to-trade-barrier-in-the-market', 'How Can Blockchains Remove the ‘Pay to Trade’ Barrier in the Market?', '', 'upload/news/2ff94094fcfbe19daf303a479b9fad68.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:25', 'admin@demo.com', 0),
(10, 'how-blockchain-is-making-it-easier-to-get', 'How Blockchain Is Making It Easier to Get', '', 'upload/news/44807c1619ecc1f8374b8930477187aa.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:16', 'admin@demo.com', 0),
(11, 'ripple-price-technical-analysis-xrpusd', 'Ripple Price Technical Analysis – XRP/USD', '', 'upload/news/3c9de71155211697f38a3820ba36670d.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-08 09:11:43', 'admin@demo.com', 0),
(12, 'bitfinex-introduces-trading-for-12-altcoins', 'Bitfinex Introduces Trading for 12 Altcoins', '', 'upload/news/bced67e1ee1ed3b2f3d4a10f9f71e78e.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-10 09:35:43', 'admin@demo.com', 0),
(13, 'bitcoin-cash-price-trend-including-tether', 'Bitcoin Cash Price Trend Including Tether', '', 'upload/news/0656fe700249acfe0a5535b4ae2c0088.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-10 09:36:00', 'admin@demo.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `web_slider`
--

CREATE TABLE `web_slider` (
  `id` int(11) NOT NULL,
  `slider_h1_en` varchar(900) DEFAULT NULL,
  `slider_h1_fr` varchar(900) DEFAULT NULL,
  `slider_h2_en` varchar(900) DEFAULT NULL,
  `slider_h2_fr` varchar(900) DEFAULT NULL,
  `slider_h3_en` varchar(900) DEFAULT NULL,
  `slider_h3_fr` varchar(900) DEFAULT NULL,
  `slider_img` varchar(300) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_slider`
--

INSERT INTO `web_slider` (`id`, `slider_h1_en`, `slider_h1_fr`, `slider_h2_en`, `slider_h2_fr`, `slider_h3_en`, `slider_h3_fr`, `slider_img`, `custom_url`, `status`) VALUES
(1, 'The Feature of Financing Technology is Here', '', 'It is a long established fact that a reader will be distracted.', '', 'Get in touch', '', 'upload/slider/1635412183_f2ae8cca01f1aa5cd933.png', 'https://www.bdtask.com/', 1),
(3, 'Take the world&#39;s  best  Cryptocurrency  Site.', '', 'Miker Ipsum is simply dummy text of the printing.', '', 'Start Now', '', 'upload/slider/1635412151_11703710f77dd17c1f6e.png', 'https://www.bdtask.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_social_link`
--

CREATE TABLE `web_social_link` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_social_link`
--

INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES
(1, 'Facebook', 'https://facebook.com', 'facebook', 1, '2020-12-07 05:52:22'),
(2, 'twitter', 'https://twitter.com', 'tumblr', 1, '2018-07-09 06:12:09'),
(3, 'linkedin', 'https:/linkdin.com', 'linkedin', 1, '2020-10-04 11:40:11'),
(4, 'youtube', 'https://www.youtube.com', 'dribbble', 0, '2021-03-08 18:47:57'),
(5, 'instagram', 'https://instagram.com', 'instagram', 0, '2021-03-08 18:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `web_subscriber`
--

CREATE TABLE `web_subscriber` (
  `sub_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coinpayments_payments`
--
ALTER TABLE `coinpayments_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptolist`
--
ALTER TABLE `cryptolist`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `Symbol` (`Symbol`);

--
-- Indexes for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);

--
-- Indexes for table `dbt_balance`
--
ALTER TABLE `dbt_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_balance_log`
--
ALTER TABLE `dbt_balance_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `dbt_biding`
--
ALTER TABLE `dbt_biding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_biding_log`
--
ALTER TABLE `dbt_biding_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `dbt_blocklist`
--
ALTER TABLE `dbt_blocklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_chat`
--
ALTER TABLE `dbt_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_coinpair`
--
ALTER TABLE `dbt_coinpair`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD UNIQUE KEY `symbol_2` (`symbol`);

--
-- Indexes for table `dbt_country`
--
ALTER TABLE `dbt_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_cryptocoin`
--
ALTER TABLE `dbt_cryptocoin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Id` (`cid`),
  ADD UNIQUE KEY `Symbol` (`symbol`);

--
-- Indexes for table `dbt_fees`
--
ALTER TABLE `dbt_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_market`
--
ALTER TABLE `dbt_market`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_payout_method`
--
ALTER TABLE `dbt_payout_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_security`
--
ALTER TABLE `dbt_security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_sms_email_template`
--
ALTER TABLE `dbt_sms_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_transaction_setup`
--
ALTER TABLE `dbt_transaction_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_transfer`
--
ALTER TABLE `dbt_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_user`
--
ALTER TABLE `dbt_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `dbt_user_log`
--
ALTER TABLE `dbt_user_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `dbt_user_verify_doc`
--
ALTER TABLE `dbt_user_verify_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_verify`
--
ALTER TABLE `dbt_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbt_withdraw`
--
ALTER TABLE `dbt_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`earning_id`);

--
-- Indexes for table `email_sms_gateway`
--
ALTER TABLE `email_sms_gateway`
  ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `external_api_setup`
--
ALTER TABLE `external_api_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `payeer_payments`
--
ALTER TABLE `payeer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sms_email_send_setup`
--
ALTER TABLE `sms_email_send_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_article`
--
ALTER TABLE `web_article`
  ADD PRIMARY KEY (`article_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `web_category`
--
ALTER TABLE `web_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `web_language`
--
ALTER TABLE `web_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_news`
--
ALTER TABLE `web_news`
  ADD PRIMARY KEY (`article_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `web_slider`
--
ALTER TABLE `web_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_social_link`
--
ALTER TABLE `web_social_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_subscriber`
--
ALTER TABLE `web_subscriber`
  ADD PRIMARY KEY (`sub_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `coinpayments_payments`
--
ALTER TABLE `coinpayments_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cryptolist`
--
ALTER TABLE `cryptolist`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `paymentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_balance`
--
ALTER TABLE `dbt_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_balance_log`
--
ALTER TABLE `dbt_balance_log`
  MODIFY `log_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_biding`
--
ALTER TABLE `dbt_biding`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_biding_log`
--
ALTER TABLE `dbt_biding_log`
  MODIFY `log_id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_blocklist`
--
ALTER TABLE `dbt_blocklist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_chat`
--
ALTER TABLE `dbt_chat`
  MODIFY `id` bigint(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_coinpair`
--
ALTER TABLE `dbt_coinpair`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `dbt_country`
--
ALTER TABLE `dbt_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `dbt_cryptocoin`
--
ALTER TABLE `dbt_cryptocoin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `dbt_fees`
--
ALTER TABLE `dbt_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_market`
--
ALTER TABLE `dbt_market`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dbt_payout_method`
--
ALTER TABLE `dbt_payout_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_security`
--
ALTER TABLE `dbt_security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dbt_sms_email_template`
--
ALTER TABLE `dbt_sms_email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dbt_transaction_setup`
--
ALTER TABLE `dbt_transaction_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_transfer`
--
ALTER TABLE `dbt_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_user`
--
ALTER TABLE `dbt_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_user_log`
--
ALTER TABLE `dbt_user_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_user_verify_doc`
--
ALTER TABLE `dbt_user_verify_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_verify`
--
ALTER TABLE `dbt_verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbt_withdraw`
--
ALTER TABLE `dbt_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `earning_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_gateway`
--
ALTER TABLE `email_sms_gateway`
  MODIFY `es_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `external_api_setup`
--
ALTER TABLE `external_api_setup`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=955;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payeer_payments`
--
ALTER TABLE `payeer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_email_send_setup`
--
ALTER TABLE `sms_email_send_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `web_article`
--
ALTER TABLE `web_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `web_category`
--
ALTER TABLE `web_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `web_language`
--
ALTER TABLE `web_language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_news`
--
ALTER TABLE `web_news`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `web_slider`
--
ALTER TABLE `web_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `web_social_link`
--
ALTER TABLE `web_social_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `web_subscriber`
--
ALTER TABLE `web_subscriber`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT;