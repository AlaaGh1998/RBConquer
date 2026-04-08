CREATE DATABASE RBConquer;

USE RBConquer;

-- Players Table
CREATE TABLE Players (
    PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastLogin DATETIME
);

-- Characters Table
CREATE TABLE Characters (
    CharacterID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    CharacterName VARCHAR(50) NOT NULL,
    Level INT DEFAULT 1,
    Experience INT DEFAULT 0,
    Health INT DEFAULT 100,
    Mana INT DEFAULT 100,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- Items Table
CREATE TABLE Items (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    ItemType VARCHAR(50) NOT NULL,
    Rarity VARCHAR(20),
    Attributes JSON,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Skills Table
CREATE TABLE Skills (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    SkillName VARCHAR(100) NOT NULL,
    SkillType VARCHAR(50) NOT NULL,
    Effect JSON,
    RequiredLevel INT NOT NULL
);

-- Guilds Table
CREATE TABLE Guilds (
    GuildID INT AUTO_INCREMENT PRIMARY KEY,
    GuildName VARCHAR(100) UNIQUE NOT NULL,
    LeaderID INT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (LeaderID) REFERENCES Players(PlayerID)
);

-- Parties Table
CREATE TABLE Parties (
    PartyID INT AUTO_INCREMENT PRIMARY KEY,
    LeaderID INT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (LeaderID) REFERENCES Players(PlayerID)
);

-- Quests Table
CREATE TABLE Quests (
    QuestID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    ExperienceReward INT,
    ItemReward INT,
    Status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending'
);

-- NPCs Table
CREATE TABLE NPCs (
    NPCID INT AUTO_INCREMENT PRIMARY KEY,
    NPCName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Dialog TEXT
);

-- World Zones Table
CREATE TABLE WorldZones (
    ZoneID INT AUTO_INCREMENT PRIMARY KEY,
    ZoneName VARCHAR(100) NOT NULL,
    Description TEXT,
    LevelRequirement INT
);

-- Dungeons Table
CREATE TABLE Dungeons (
    DungeonID INT AUTO_INCREMENT PRIMARY KEY,
    DungeonName VARCHAR(100) NOT NULL,
    LevelRequirement INT,
    BossID INT,
    FOREIGN KEY (BossID) REFERENCES NPCs(NPCID)
);

-- Pets Table
CREATE TABLE Pets (
    PetID INT AUTO_INCREMENT PRIMARY KEY,
    CharacterID INT NOT NULL,
    PetName VARCHAR(100) NOT NULL,
    Level INT DEFAULT 1,
    Attributes JSON,
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
);

-- Mounts Table
CREATE TABLE Mounts (
    MountID INT AUTO_INCREMENT PRIMARY KEY,
    CharacterID INT NOT NULL,
    MountName VARCHAR(100) NOT NULL,
    Speed INT DEFAULT 1,
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
);

-- Achievements Table
CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    PointsAwarded INT
);

-- Rankings Table
CREATE TABLE Rankings (
    RankingID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    Rank INT NOT NULL,
    Score INT NOT NULL,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- Economy Table
CREATE TABLE Economy (
    EconomyID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT NOT NULL,
    Balance DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- Auction House Table
CREATE TABLE AuctionHouse (
    AuctionID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT NOT NULL,
    SellerID INT NOT NULL,
    StartingPrice DECIMAL(10, 2) NOT NULL,
    CurrentBid DECIMAL(10, 2),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (SellerID) REFERENCES Players(PlayerID)
);

-- Trading Table
CREATE TABLE Trading (
    TradeID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerFromID INT NOT NULL,
    PlayerToID INT NOT NULL,
    ItemID INT NOT NULL,
    TradeStatus ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (PlayerFromID) REFERENCES Players(PlayerID),
    FOREIGN KEY (PlayerToID) REFERENCES Players(PlayerID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);
