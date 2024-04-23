-- CREATE DATABASE DCC_FLASK;
use dcc_flask;
-- CREATE TABLE EB_Redemption (
--     SrNo INT,
--     DateOfEncashment DATE,
--     NameOfPoliticalParty VARCHAR(255),
--     AccountNoOfPoliticalParty VARCHAR(255),
--     Prefix VARCHAR(50),
--     BondNumber BIGINT,
--     Denominations DECIMAL(12, 2),
--     PayBranchCode INT,
--     PayTeller BIGINT
-- );
-- CREATE TABLE EB_Purchase (
-- --     SrNo INT,
-- --     ReferenceNo VARCHAR(255),
-- --     JournalDate DATE,
-- --     DateOfPurchase DATE,
-- --     DateOfExpiry DATE,
-- --     PurchaserName VARCHAR(255),
-- --     Prefix VARCHAR(50),
-- --     BondNumber BIGINT,
-- --     Denominations DECIMAL(12, 2),
-- --     IssueBranchCode INT,
-- --     IssueTeller INT,
-- --     Status VARCHAR(50)
-- -- );
-- LOAD DATA INFILE 'EP-PUR.csv'
-- INTO TABLE eb_purchase
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (SrNo, ReferenceNo, @JournalDate, @DateOfPurchase, @DateOfExpiry, PurchaserName, Prefix, BondNumber, Denominations, IssueBranchCode, IssueTeller, Status)
-- SET
--     JournalDate = STR_TO_DATE(@JournalDate, '%d-%b-%y'),
--     DateOfPurchase = STR_TO_DATE(@DateOfPurchase, '%d-%b-%y'),
--     DateOfExpiry = STR_TO_DATE(@DateOfExpiry, '%d-%b-%y');
-- -- SHOW VARIABLES LIKE "secure_file_priv";

-- LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EP-PUR.csv" INTO TABLE eb_purchase FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES;
-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EP-Red.csv'
-- INTO TABLE eb_redemption
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- IGNORE 1 LINES;


-- SHOW VARIABLES LIKE "local_infile";
-- SET GLOBAL local_infile=ON;
-- ALTER TABLE eb_redemption
-- MODIFY Denominations decimal(12,0);



SELECT * FROM eb_purchase ;
ALTER TABLE results
modify COLUMN
      SrNo INT,
     MODIFY COLUMN ReferenceNo VARCHAR(255),
      MODIFY COLUMN JournalDate VARCHAR(50),
      MODIFY COLUMN DateOfPurchase VARCHAR(50),
      MODIFY COLUMN DateOfExpiry VARCHAR(255),
      MODIFY COLUMN PurchaserName VARCHAR(255),
      MODIFY COLUMN Prefix VARCHAR(50),
      MODIFY COLUMN BondNumber BIGINT,
      MODIFY COLUMN Denominations DEcimal(12, 2),
      MODIFY COLUMN IssueBranchCode INT,
      MODIFY COLUMN IssueTeller INT,
     MODIFY COLUMN Status VARCHAR(50);
  


select column_name from information_schema.columns where table_name='eb_purchase' ;

INSERT INTO results (SrNo) SELECT SrNo FROM eb_purchase WHERE BondNumber = 6258;

-- INSERT INTO results (SrNo,ReferenceNo,JournalDate,DateOfPurchase,DateOfExpiry,PurchaserName,Prefix,BondNumber,Denominations,IssueBranchCode,IssueTeller,Status)
--                     SELECT SrNo,ReferenceNo,JournalDate,DateOfPurchase,DateOfExpiry,PurchaserName,Prefix,BondNumber,Denominations,IssueBranchCode,IssueTeller,Status FROM eb_purchase WHERE BondNumber = %s",(bond,)
-- select * from results

create table results2 (