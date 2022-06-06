CREATE TABLE IF NOT EXISTS `dbt_admin_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet_address` varchar(50) NOT NULL,
  `wallet_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dbt_backed_encrypt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypt_val` text NOT NULL,
  `hash` varchar(5) NOT NULL,
  `wallet_type` varchar(7) NOT NULL,
  `user_id` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dbt_encrypt_data` (
  `encrypt_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` tinyint(2) NOT NULL,
  `id` varchar(40) NOT NULL,
  `address` varchar(45) NOT NULL,
  `ciphertext` varchar(70) NOT NULL,
  `iv` varchar(35) NOT NULL,
  `cipher` varchar(15) NOT NULL,
  `kdf` varchar(8) NOT NULL,
  `dklen` tinyint(3) NOT NULL,
  `salt` varchar(70) NOT NULL,
  `n` int(8) NOT NULL,
  `r` tinyint(2) NOT NULL,
  `p` tinyint(2) NOT NULL,
  `mac` varchar(70) NOT NULL,
  `user_id` varchar(12) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `wallet_type` varchar(30) NOT NULL,
  PRIMARY KEY (`encrypt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dbt_erc20_deposit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 NOT NULL,
  `transaction_hash` varchar(255) DEFAULT NULL,
  `wallet_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `currency_symbol` varchar(50) DEFAULT NULL,
  `wallet_balance` double(25,8) DEFAULT NULL,
  `amount` double(25,8) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Pending, 1= gas fee send, 2=user to admin transfer, 3=deposit success, 4=cancel',
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `dbt_gas_fee_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_erc20_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `tnx_type` varchar(30) DEFAULT NULL,
  `tx_hash` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `amount` float(11,8) NOT NULL,
  `hit_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '0=pending, 1=success',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `dbt_user_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(12) NOT NULL,
  `wallet_type` varchar(20) NOT NULL,
  `wallet_address` varchar(50) DEFAULT NULL,
  `balance` varchar(1000) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `wallet_address` (`wallet_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dbt_erc20_api_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(55) NOT NULL,
  `port` varchar(10) NOT NULL,
  `db_name` varchar(100) NOT NULL,
  `user_name` varchar(120) NOT NULL,
  `password` varchar(55) NOT NULL,
  `infura_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `dbt_erc20_transaction_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_symbol` varchar(30) NOT NULL,
  `tnx_type` varchar(55) NOT NULL,
  `min_amount` double(25,8) NOT NULL,
  `max_amount` double(25,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `dbt_cryptocoin` ADD COLUMN IF NOT EXISTS `user_id` VARCHAR(55) NULL AFTER `cid`;
ALTER TABLE `dbt_cryptocoin` ADD COLUMN IF NOT EXISTS `decimal_value` VARCHAR(55) NULL AFTER `symbol`;
ALTER TABLE `dbt_market` ADD COLUMN IF NOT EXISTS `market_type` VARCHAR(55) NULL AFTER `symbol`;
ALTER TABLE `dbt_coinpair` ADD COLUMN IF NOT EXISTS `pair_type` VARCHAR(55) NULL AFTER `symbol`;
ALTER TABLE `dbt_erc20_transaction_setup` ADD COLUMN IF NOT EXISTS `network_type` VARCHAR(55) NULL AFTER `max_amount`;

DROP INDEX IF EXISTS symbol ON dbt_cryptocoin;

UPDATE `language` SET `english` = 'Withdraw Confirm' WHERE `phrase` = 'withdraw_confirm';
UPDATE `language` SET `english` = 'URL' WHERE `phrase` = 'url';

INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'admin_password','Admin Password','Mot De Passe D administrateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='admin_password');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'admin_wallet','Admin Wallet','Portefeuille Administrateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='admin_wallet');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'contact_address','Contract Address','Adresse De Contract') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='contact_address');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'creator_wallet','Creator Address','Creator Address French') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='creator_wallet');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'coin_symbol','Coin Symbol','Coin Symbol F') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='coin_symbol');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'initial_price','Initial Price','Initial Price Fr') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='initial_price');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'coin_logo','Coin Logo','Logo De Pièce De Monnaie') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='coin_logo');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'contract_address','Contract Address','Adresse de contact') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='contract_address');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'creator','Creator ','CrÃ©ateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='creator');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'proof_type','Proof Type','Preuve Type') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='proof_type');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'add_coin','Add Coin','Ajouter une piÃ¨ce') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='add_coin');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'token_symbol','Token Symbol','Token Symbol fr') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='token_symbol');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'decimal_value','Decimal Value','valeur dÃ©cimale') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='decimal_value');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'creator_address','Creator Address','Adresse Du Créateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='creator_address');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'deposit_confirm','Deposit Confirm','Dépôt Confirmer') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='deposit_confirm');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'balance_receive_from_user','Balance Receive From User','Solde Reçu De L\'utilisateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='balance_receive_from_user');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'sent_user_balance','Sent User Balance','Solde De L\'utilisateur Envoyé') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='sent_user_balance');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'decimal','Decimal ','Décimal') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='decimal');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'supply','Supply ','La Fourniture') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='supply');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'position','Position ','Positionner') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='position');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'server_ip','Server IP','IP Du Serveur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='server_ip');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'database_name','Database Name','Nom De La Base De Données') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='database_name');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'user_name','User Name','Nom D\'utilisateur') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='user_name');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'infura_id','Infura ID','Identifiant Infura') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='infura_id');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'minimum_amount','Minimum Amount','Montant Minimal') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='minimum_amount');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'maximum_amount','Maximum Amount','Quantité Maximale') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='maximum_amount');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'maximum_amount','Maximum Amount','Quantité Maximale') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='maximum_amount');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'documentation','Documentations','Documentations fr') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='documentation');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'note','Note ','Noter') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='note');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'you_can_use_above_link_for_cron_job_copy_and_past_at_cron_job_command_box','You Can Use Above Link For Cron Job. Copy And Past At Cron Job Command Box','Vous Pouvez Utiliser Le Lien Ci-dessus Pour Le Travail Cron.') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='you_can_use_above_link_for_cron_job_copy_and_past_at_cron_job_command_box');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'set_cron_job_once_per_2_minutes','Set Cron Job Once Per 2 Minutes','Définir La Tâche Cron Une Fois Toutes Les 2 Minutes') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='set_cron_job_once_per_2_minutes');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'set_cron_job_once_per_5_minutes','Set Cron Job Once Per 5 Minutes','Définir La Tâche Cron Une Fois Toutes Les 5 Minutes') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='set_cron_job_once_per_5_minutes');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'initial','Initial ','Initiale') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='initial');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'create_your_infura_account','Create Your Infura Account','Créez Votre Compte Infura') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='create_your_infura_account');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'data_not_found','Data Not Found','Données Non Trouvées') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='data_not_found');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'fund_received','Fund Received','Fonds Reçu') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='fund_received');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'please_note','Please Note','Veuillez Noter') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='please_note');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'coins_will_be_deposited_when_you_add_amount_in_this_wallet','Coins Will Be Deposited, When You Add Amount In This Wallet','Les Pièces Seront Déposées Lorsque Vous Ajoutez Un Montant Dans Ce Portefeuille') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='coins_will_be_deposited_when_you_add_amount_in_this_wallet');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'your_transaction_validity_24_hours_please_deposit_this_wallet_immediately','Your Transaction Validity 24 Hours  Please Deposit This Wallet Immediately','Validité De Votre Transaction 24 Heures Veuillez Déposer Ce Portefeuille Immédiatement') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='your_transaction_validity_24_hours_please_deposit_this_wallet_immediately');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'server_error_please_try_again','Server Error Please Try Again','Erreur De Serveur, Veuillez Réessayer') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='server_error_please_try_again');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'please_enter_minimum_amount','Please Enter Minimum Amount','Veuillez Saisir Le Montant Minimum') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='please_enter_minimum_amount');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'and_maximum_amount','And Maximum Amount','Et Montant Maximum') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='and_maximum_amount');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'token_logo_url','Token Logo Url','URL Du Logo Du Jeton') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='token_logo_url');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'this_symbol_already_exist','This Symbol Already Exist','Ce Symbole Existe Déjà') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='this_symbol_already_exist');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'this_url_is_invalid','This URL Is Invalid','Cette URL N\'est Pas Valide') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='this_url_is_invalid');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'coin_logo_not_found','Coin Logo Not Found','Logo De La Pièce Introuvable') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='coin_logo_not_found');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'coin_added_successfully','Coin Added Successfully','Pièce Ajoutée Avec Succès') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='coin_added_successfully');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'your_withdraw_transaction_successfully_sent_please_wait_for_confirmation','Your Withdraw Transaction Successfully Sent, Please Wait For Confirmation','Votre Transaction De Retrait A été Envoyée Avec Succès, Veuillez Attendre La Confirmation') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='your_withdraw_transaction_successfully_sent_please_wait_for_confirmation');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'your_confirmation_already_placed','Your Confirmation Already Placed', 'Votre Confirmation Déjà Placée') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='your_confirmation_already_placed');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'your_user_name_or_password_is_wrong','Your User Name Or Password Is Wrong','Votre Nom D\'utilisateur Ou Mot De Passe Est Incorrect') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='your_user_name_or_password_is_wrong');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'please_try_again','Please Try Again','Veuillez Réessayer') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='please_try_again');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'don_not_use_your_existing_database_in_your_project_please_use_another_database','Don Not Use Your Existing Database In Your Project,please Use Another Database','N\'utilisez Pas Votre Base De Données Existante Dans Votre Projet, Veuillez Utiliser Une Autre Base De Données') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='don_not_use_your_existing_database_in_your_project_please_use_another_database');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'this_symbol_already_exists','This Symbol Already Exists','Ce Symbole Existe Déjà') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='this_symbol_already_exists');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'market_symbol','Market Symbol','Symbole Du Marché') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='market_symbol');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'available_serial','Available Serial','série disponible') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='available_serial');

INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_wallet','ERC20 Wallet Address','Portefeuille ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_wallet');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_private_key','ERC20 Private Key','Clé Privée ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_private_key');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20','ERC20 ','ERC20 fr') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'admin_bep20_wallet_setup','Admin BEP20 Wallet Setup','Configuration Du Portefeuille Administrateur BEP20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='admin_bep20_wallet_setup');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_coin','ERC20 Coin','Pièce De Monnaie ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_coin');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'add_erc20_coin','Add ERC20 Coin','Add Coin ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='add_erc20_coin');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_market','ERC20 Market','Marché ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_market');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_coin_pair','ERC20 Coin Pair','Paire De Pièces ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_coin_pair');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'create_erc20_wallet','Admin ERC20 Wallet Setup','Créer Un Portefeuille ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='create_erc20_wallet');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_balance','ERC20 Balance','Balance ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='erc20_balance');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'erc20_diposit_address','ERC20 Diposit Address','Adresse De Dépôt ERC20') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='bep20_diposit_address');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'rpc_url','RPC URL','URL RPC') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='rpc_url');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'subscription_payment','Subscription Payment','Paiement de labonnement') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='subscription_payment');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'set_cron_job_once_per_5_hours','Set Cron Job Once Per 5 Hours','définir la tâche cron une fois toutes les 5 heures') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='set_cron_job_once_per_5_hours');
INSERT INTO language (phrase,english,french) SELECT * FROM (SELECT 'your_transaction_validity_24_hours__please_deposit_this_wallet_immediately','Your transaction validity 24 hours please deposit this wallet immediately','Your transaction validity 24 hours please deposit this wallet as soon as possible') AS tmp WHERE NOT EXISTS (SELECT phrase,english,french FROM language WHERE phrase='your_transaction_validity_24_hours__please_deposit_this_wallet_immediately');