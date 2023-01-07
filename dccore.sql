CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(50) NOT NULL,
  `amount`  INT(100) NOT NULL,
  `type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8;

CREATE TABLE IF NOT EXISTS `mdw_reports` (
  `id` varchar(100) NOT NULL,
  `incident` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `ongoing` tinyint(1) NOT NULL,
  `expire` varchar(100) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdw_incidents` (
  `id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdw_evidence` (
  `id` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdw_announcements` (
  `id` int(11) NOT NULL,
  `announcement` longtext NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `vehicle_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(100) NOT NULL,
  `parts` longtext NOT NULL,
  `mileage` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT '0',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int DEFAULT '25000',
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_cash definition

CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT '2000',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_external_accounts definition

CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_invoices definition

CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT '0',
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_shared_accounts definition

CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_transactions definition

CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT '0',
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int DEFAULT NULL,
  `fromAccountId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`),
  CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles`
(
    `id`           int         NOT NULL AUTO_INCREMENT,
    `profile_name` varchar(90) NOT NULL,
    `identifier`   varchar(48) NOT NULL COLLATE 'utf8mb4_general_ci',
    `avatar_url`   varchar(255)         DEFAULT 'https://i.file.glass/QrEvq.png',
    `createdAt`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_phone_contacts`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48)           DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `avatar`     varchar(255)          DEFAULT NULL,
    `number`     varchar(20)           DEFAULT NULL,
    `display`    varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets`
(
    `id`         INT(11)       NOT NULL AUTO_INCREMENT,
    `message`    VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_general_ci',
    `createdAt`  TIMESTAMP     NOT NULL DEFAULT current_timestamp(),
    `updatedAt`  TIMESTAMP     NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `likes`      INT(11)       NOT NULL DEFAULT '0',
    `identifier` VARCHAR(48)   NOT NULL COLLATE 'utf8mb4_general_ci',
    `visible`    TINYINT(4)    NOT NULL DEFAULT '1',
    `images`     VARCHAR(1000) NULL     DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `retweet`    INT(11)       NULL     DEFAULT NULL,
    `profile_id` INT(11)       NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
    CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `npwd_twitter_likes`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `profile_id` int NOT NULL,
    `tweet_id`   int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
    KEY `profile_idx` (`profile_id`),
    KEY `tweet_idx` (`tweet_id`),
    CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
    CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `npwd_match_profiles`
(
    `id`            int          NOT NULL AUTO_INCREMENT,
    `identifier`    varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `name`          varchar(90)  NOT NULL,
    `image`         varchar(255) NOT NULL,
    `bio`           varchar(512)          DEFAULT NULL,
    `location`      varchar(45)           DEFAULT NULL,
    `job`           varchar(45)           DEFAULT NULL,
    `tags`          varchar(255) NOT NULL DEFAULT '',
    `voiceMessage`  varchar(512)         DEFAULT NULL,
    `createdAt`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier_UNIQUE` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_match_views`
(
    `id`         int         NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48) NOT NULL COLLATE 'utf8mb4_general_ci',
    `profile`    int         NOT NULL,
    `liked`      tinyint              DEFAULT '0',
    `createdAt`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `match_profile_idx` (`profile`),
    CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_notes`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `title`      varchar(255) NOT NULL,
    `content`    varchar(255) NOT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `identifier`  varchar(48)           DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `username`    varchar(255)          DEFAULT NULL,
    `name`        varchar(50)           DEFAULT NULL,
    `number`      varchar(255) NOT NULL,
    `title`       varchar(255)          DEFAULT NULL,
    `url`         varchar(255)          DEFAULT NULL,
    `description` varchar(255) NOT NULL,
    `createdAt`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `reported`    tinyint      NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_twitter_reports`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `profile_id` int NOT NULL,
    `tweet_id`   int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
    KEY `profile_idx` (`profile_id`),
    KEY `tweet_idx` (`tweet_id`),
    CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
    CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `npwd_messages`
(
    `id`              int(11)      NOT NULL AUTO_INCREMENT,
    `message`         varchar(512) NOT NULL COLLATE 'utf8mb4_general_ci',
    `user_identifier` varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `conversation_id` varchar(512) NOT NULL,
    `isRead`          tinyint(4)   NOT NULL DEFAULT 0,
    `createdAt`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updatedAt`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP,
    `visible`         tinyint(4)   NOT NULL DEFAULT 1,
    `author`          varchar(255) NOT NULL,
    `is_embed`        tinyint(4)   NOT NULL default 0,
    `embed`           varchar(512) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    INDEX `user_identifier` (`user_identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_messages_conversations`
(
    `id`                INT(11)      NOT NULL AUTO_INCREMENT,
    `conversation_list` VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
    `label`             VARCHAR(60)  NULL     DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `createdAt`         TIMESTAMP    NOT NULL DEFAULT current_timestamp(),
    `updatedAt`         TIMESTAMP    NOT NULL DEFAULT current_timestamp(),
    `last_message_id`   INT(11)      NULL     DEFAULT NULL,
    `is_group_chat`     TINYINT(4)   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE IF NOT EXISTS `npwd_messages_participants`
(
    `id`              INT(11)      NOT NULL AUTO_INCREMENT,
    `conversation_id` INT(11)      NOT NULL,
    `participant`     VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
    `unread_count`    INT(11)      NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
    CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `npwd_calls`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `identifier`  varchar(48)  DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `transmitter` varchar(255) NOT NULL,
    `receiver`    varchar(255) NOT NULL,
    `is_accepted` tinyint(4)   DEFAULT 0,
    `start`       varchar(255) DEFAULT NULL,
    end           varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_phone_gallery`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48) DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `image`      varchar(255) NOT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=20
;

CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
	`channel_id` INT(11) NOT NULL,
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`is_owner` TINYINT(4) NOT NULL DEFAULT '0',
	INDEX `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_id` INT(11) NOT NULL,
	`message` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`is_image` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=31
;

ALTER TABLE players ADD COLUMN `phone_number` VARCHAR(20) DEFAULT NULL;

ALTER TABLE `mdw_announcements`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `mdw_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `players`
ADD (`mdw_image` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `mdw_description` longtext COLLATE utf8mb4_bin NOT NULL,
  `mdw_alias` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `mdw_staffdata` longtext COLLATE utf8mb4_bin NOT NULL);
  
ALTER TABLE `players` CHANGE `mdw_description` `mdw_description` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL, CHANGE `mdw_staffdata` `mdw_staffdata` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL;

ALTER TABLE `player_vehicles` ADD `impounded` BOOLEAN NOT NULL, ADD `mdw_image` VARCHAR(200) NOT NULL;

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'character_room', '{"maxDistance":2,"coords":{"x":-809.2808837890625,"y":177.85536193847657,"z":76.89032745361328},"heading":201,"doors":false,"passcode":"5555","model":-384976104,"state":1}'),
	(2, 'character_house', '{"maxDistance":2,"coords":{"x":-816.411376953125,"y":178.30441284179688,"z":72.82737731933594},"state":1,"doors":[{"coords":{"x":-816.1068115234375,"y":177.5108642578125,"z":72.82737731933594},"heading":291,"model":-1686014385},{"coords":{"x":-816.7160034179688,"y":179.09796142578126,"z":72.82737731933594},"heading":291,"model":159994461}],"passcode":"5555"}'),
	(3, 'character_garage', '{"maxDistance":2,"coords":{"x":-815.2816162109375,"y":185.97499084472657,"z":72.99993133544922},"heading":291,"doors":false,"passcode":"5555","model":30769481,"state":1}'),
	(4, 'character_balcony_1', '{"maxDistance":2,"coords":{"x":-793.789794921875,"y":181.53773498535157,"z":73.04045104980469},"state":1,"doors":[{"coords":{"x":-793.3943481445313,"y":180.50746154785157,"z":73.04045104980469},"heading":111,"model":-1454760130},{"coords":{"x":-794.185302734375,"y":182.56800842285157,"z":73.04045104980469},"heading":111,"model":1245831483}],"passcode":"5555"}'),
	(5, 'character_balcony_2', '{"maxDistance":2,"coords":{"x":-795.535400390625,"y":177.61688232421876,"z":73.04045104980469},"state":1,"doors":[{"coords":{"x":-796.565673828125,"y":177.22137451171876,"z":73.04045104980469},"heading":21,"model":-1454760130},{"coords":{"x":-794.505126953125,"y":178.0123748779297,"z":73.04045104980469},"heading":21,"model":1245831483}],"passcode":"5555"}'),
	(6, 'character_gate', '{"maxDistance":2,"coords":{"x":-844.051025390625,"y":155.9619140625,"z":66.03221130371094},"heading":90,"doors":false,"passcode":"5555","model":-2125423493,"state":1}'),
	(7, 'character_gate2', '{"maxDistance":2,"coords":{"x":-848.934326171875,"y":179.307861328125,"z":70.02470397949219},"heading":265,"doors":false,"passcode":"5555","model":-1568354151,"state":1}');


INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
  ('police', 0, 'boss'),
  ('ambulance', 0, 'boss'),
  ('realestate', 0, 'boss'),
  ('taxi', 0, 'boss'),
  ('cardealer', 0, 'boss'),
  ('mechanic', 0, 'boss'),
  ('lostmc', 0, 'gang'),
  ('ballas', 0, 'gang'),
  ('vagos', 0, 'gang'),
  ('cartel', 0, 'gang'),
  ('families', 0, 'gang'),
  ('triads', 0, 'gang');