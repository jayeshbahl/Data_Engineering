-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AIRBNB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AIRBNB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AIRBNB` DEFAULT CHARACTER SET utf8 ;
USE `AIRBNB` ;

-- -----------------------------------------------------
-- Table `AIRBNB`.`Neighborhood_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Neighborhood_Details` (
  `Neighborhood_ID` INT NOT NULL,
  `Neighborhood_Overview` VARCHAR(1000) NULL,
  `Neighborhood` VARCHAR(45) NULL,
  `Neighborhood_Cleansed` VARCHAR(45) NULL,
  `Neighborhood_Group_Cleansed` VARCHAR(45) NULL,
  PRIMARY KEY (`Neighborhood_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Listing_URL_Information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Listing_URL_Information` (
  `listing_Url_ID` INT NOT NULL,
  `Listing_URL` VARCHAR(45) NOT NULL,
  `Medium_Url` VARCHAR(45) NOT NULL,
  `Thumbnail_Url` VARCHAR(45) NOT NULL,
  `Xl_Picture_Url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`listing_Url_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Pricing_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Pricing_details` (
  `Price_ID` INT NOT NULL,
  `Price` DECIMAL(20) NOT NULL,
  `Weekly_Price` DECIMAL(20) NOT NULL,
  `Monthly_Price` DECIMAL(20) NOT NULL,
  `Security_Deposit` DECIMAL(10) NOT NULL,
  `Cleaning_fee` DECIMAL(10) NOT NULL,
  `Guests_included` DECIMAL(10) NOT NULL,
  `Extra_people` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`Price_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Availabilty_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Availabilty_details` (
  `Availabilty_ID` INT NOT NULL,
  `Has_Availability` VARCHAR(1) BINARY NULL,
  `Availability_30` DECIMAL(10) NOT NULL,
  `Availability_60` DECIMAL(10) NOT NULL,
  `Availability_90` DECIMAL(10) NOT NULL,
  `Availability_365` DECIMAL(10) NOT NULL,
  `Calendar_Updated` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Availabilty_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`ListingReview_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`ListingReview_score` (
  `ListingReview_score_ID` INT NOT NULL,
  `Number_Of_Reviews` DECIMAL(10) NOT NULL,
  `Review_Scores_Rating` DECIMAL(10) NOT NULL,
  `First_Review` DATE NOT NULL,
  `Last_Review` DATE NOT NULL,
  `Review_Scores_Accuracy` DECIMAL(10) NOT NULL,
  `Review_Scores_Cleanliness` DECIMAL(10) NOT NULL,
  `Review_Scores_Checkin` DECIMAL(10) NOT NULL,
  `Review_Scores_Communication` DECIMAL(10) NOT NULL,
  `Review_Scores_Location` DECIMAL(10) NOT NULL,
  `Review_Scores_Value` DECIMAL(10) NOT NULL,
  `Reviews_Per_Month` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`ListingReview_score_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Scrape_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Scrape_details` (
  `Scrape_Id` INT NOT NULL,
  `Last_Scrape_Date` DATETIME NULL,
  `Calender_Last_Scraped` DATETIME NULL,
  PRIMARY KEY (`Scrape_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Exp_Offered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Exp_Offered` (
  `Experiences_Offered_ID` INT NOT NULL,
  `Experiences_offered` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Experiences_Offered_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Property_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Property_Details` (
  `Property_ID` INT NOT NULL,
  `Property_Type` VARCHAR(45) NOT NULL,
  `Room_Type` VARCHAR(45) NOT NULL,
  `Accommodates` DECIMAL(10) NOT NULL,
  `Bathrooms` DECIMAL(10) NOT NULL,
  `Bedrooms` DECIMAL(10) NOT NULL,
  `Beds` DECIMAL(10) NOT NULL,
  `Bed_Type` VARCHAR(10) NOT NULL,
  `Square_feet` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Property_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Licence_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Licence_Details` (
  `License_ID` INT NOT NULL,
  `Requires_Licence` VARCHAR(10) BINARY NULL,
  `Licence` VARCHAR(45) NULL,
  `Jurisdiction_Names` VARCHAR(45) NULL,
  PRIMARY KEY (`License_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Location_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Location_Details` (
  `Location_ID` INT NOT NULL,
  `Street_Name` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(45) NULL,
  `Market` VARCHAR(15) NULL,
  `Country_Code` VARCHAR(5) NULL,
  `Country` VARCHAR(20) NULL,
  `Latitude` DECIMAL(20) NULL,
  `Longitude` DECIMAL(20) NULL,
  `Is_Location_Exact` VARCHAR(10) BINARY NULL,
  `state` VARCHAR(45) NULL,
  PRIMARY KEY (`Location_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Host_Url`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Host_Url` (
  `Host_Url_ID` INT NOT NULL,
  `Host_Url` VARCHAR(45) NOT NULL,
  `Host_Thumbnail_Url` VARCHAR(45) NOT NULL,
  `Host_Picture_Url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Host_Url_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`HOST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`HOST` (
  `Host_ID` INT NOT NULL,
  `Host_Url_ID` INT NOT NULL,
  `Listing_ID` DECIMAL(10) NOT NULL,
  `Host_Name` VARCHAR(45) NOT NULL,
  `Host_Since` DATE NOT NULL,
  `Host_City` VARCHAR(10) NOT NULL,
  `Host_State` VARCHAR(20) NOT NULL,
  `Host_Country` VARCHAR(10) NOT NULL,
  `Host_about` VARCHAR(45) NOT NULL,
  `Host_Response_time` VARCHAR(10) NOT NULL,
  `Host_Response_rate` VARCHAR(10) NOT NULL,
  `Host_acceptance_Rate` VARCHAR(10) NOT NULL,
  `Host_is_superhost` VARCHAR(1) BINARY NULL,
  `Host_neighbourhood` VARCHAR(45) NOT NULL,
  `Host_listings_count` DECIMAL(5) NOT NULL,
  `Host_Total_Listings_Count` DECIMAL(5) NOT NULL,
  `Host_Has_Profile_Pic` VARCHAR(1) BINARY NULL,
  `Host_Identity_Verified` VARCHAR(1) BINARY NULL,
  PRIMARY KEY (`Host_ID`),
  INDEX `fk_HOST_Host_Url1_idx` (`Host_Url_ID` ASC) VISIBLE,
  CONSTRAINT `fk_HOST_Host_Url1`
    FOREIGN KEY (`Host_Url_ID`)
    REFERENCES `AIRBNB`.`Host_Url` (`Host_Url_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Listings` (
  `Listing_ID` INT NOT NULL,
  `Neighborhood_ID` INT NOT NULL,
  `Listing_URL_ID` INT NOT NULL,
  `Price_ID` INT NOT NULL,
  `Availabilty_ID` INT NOT NULL,
  `ListingReview_ID` INT NOT NULL,
  `Scrape_ID` INT NOT NULL,
  `Experiences_Offered_ID` INT NOT NULL,
  `Property_ID` INT NOT NULL,
  `License_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Summary` VARCHAR(1000) NULL,
  `Space` VARCHAR(1000) NULL,
  `Description` VARCHAR(1000) NULL,
  `Notes` VARCHAR(1000) NULL,
  `Transit` VARCHAR(1000) NULL,
  `Instant_Bookable` VARCHAR(10) BINARY NULL,
  `cancellation_Policy` VARCHAR(45) NULL,
  `Require_Guest_Profile_Picture` VARCHAR(10) BINARY NULL,
  `Require_Guest_Phone_Verification` VARCHAR(10) BINARY NULL,
  `Calculated_Host_Listing_Count` INT NULL,
  `Minimum_Nights` INT NULL,
  `Maximum_Nights` INT NULL,
  `Location_ID` INT NOT NULL,
  `Host_ID` INT NOT NULL,
  PRIMARY KEY (`Listing_ID`),
  INDEX `fk_Listings_Neighbourhood_Details1_idx` (`Neighborhood_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Listing_URL_Information1_idx` (`Listing_URL_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Pricing_details1_idx` (`Price_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Availabilty_details1_idx` (`Availabilty_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Availabilty_details2_idx` (`ListingReview_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Scrape_details1_idx` (`Scrape_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Exp_Offered1_idx` (`Experiences_Offered_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Property_Details1_idx` (`Property_ID` ASC) VISIBLE,
  INDEX `fk_Listings_license1_idx` (`License_ID` ASC) VISIBLE,
  INDEX `fk_Listings_Location_Details1_idx` (`Location_ID` ASC) VISIBLE,
  INDEX `fk_Listings_HOST1_idx` (`Host_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listings_Neighbourhood_Details1`
    FOREIGN KEY (`Neighborhood_ID`)
    REFERENCES `AIRBNB`.`Neighborhood_Details` (`Neighborhood_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Listing_URL_Information1`
    FOREIGN KEY (`Listing_URL_ID`)
    REFERENCES `AIRBNB`.`Listing_URL_Information` (`listing_Url_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Pricing_details1`
    FOREIGN KEY (`Price_ID`)
    REFERENCES `AIRBNB`.`Pricing_details` (`Price_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Availabilty_details1`
    FOREIGN KEY (`Availabilty_ID`)
    REFERENCES `AIRBNB`.`Availabilty_details` (`Availabilty_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Availabilty_details2`
    FOREIGN KEY (`ListingReview_ID`)
    REFERENCES `AIRBNB`.`ListingReview_score` (`ListingReview_score_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Scrape_details1`
    FOREIGN KEY (`Scrape_ID`)
    REFERENCES `AIRBNB`.`Scrape_details` (`Scrape_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Exp_Offered1`
    FOREIGN KEY (`Experiences_Offered_ID`)
    REFERENCES `AIRBNB`.`Exp_Offered` (`Experiences_Offered_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Property_Details1`
    FOREIGN KEY (`Property_ID`)
    REFERENCES `AIRBNB`.`Property_Details` (`Property_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_license1`
    FOREIGN KEY (`License_ID`)
    REFERENCES `AIRBNB`.`Licence_Details` (`License_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_Location_Details1`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `AIRBNB`.`Location_Details` (`Location_ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Listings_HOST1`
    FOREIGN KEY (`Host_ID`)
    REFERENCES `AIRBNB`.`HOST` (`Host_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Smart_location_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Smart_location_Details` (
  `Smart_location_ID` INT NOT NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Location_ID` INT NOT NULL,
  PRIMARY KEY (`Smart_location_ID`, `Location_ID`),
  INDEX `fk_Smart_location_Details_Location_Details1_idx` (`Location_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Smart_location_Details_Location_Details1`
    FOREIGN KEY (`Location_ID`)
    REFERENCES `AIRBNB`.`Location_Details` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Reviewer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Reviewer_details` (
  `Reviewer_ID` INT NOT NULL,
  `Reviewer_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Reviewer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Reviews` (
  `Reviews_ID` INT NOT NULL,
  `Listing_ID` INT NOT NULL,
  `Reviews_Date` DATETIME NULL,
  `reviews_Comment` VARCHAR(1000) NULL,
  `Reviewscol` VARCHAR(45) NULL,
  `Reviewer_ID` INT NOT NULL,
  PRIMARY KEY (`Reviews_ID`),
  INDEX `fk_Reviews_Listings1_idx` (`Listing_ID` ASC) VISIBLE,
  INDEX `fk_Reviews_Reviewer_details1_idx` (`Reviewer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Listings1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `AIRBNB`.`Listings` (`ListingReview_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reviews_Reviewer_details1`
    FOREIGN KEY (`Reviewer_ID`)
    REFERENCES `AIRBNB`.`Reviewer_details` (`Reviewer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Calendar` (
  `Calendar _ID` INT NOT NULL,
  `Calendar_Date` DATETIME NULL,
  `` VARCHAR(10) NULL,
  PRIMARY KEY (`Calendar _ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Calendar_listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Calendar_listing` (
  `Listings_Listing_ID` INT NOT NULL,
  `Calendar_Calendar _ID` INT NOT NULL,
  `Listing_Availability` VARCHAR(45) NULL,
  PRIMARY KEY (`Listings_Listing_ID`, `Calendar_Calendar _ID`),
  INDEX `fk_Listings_has_Calendar_Calendar1_idx` (`Calendar_Calendar _ID` ASC) VISIBLE,
  INDEX `fk_Listings_has_Calendar_Listings1_idx` (`Listings_Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listings_has_Calendar_Listings1`
    FOREIGN KEY (`Listings_Listing_ID`)
    REFERENCES `AIRBNB`.`Listings` (`Listing_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Listings_has_Calendar_Calendar1`
    FOREIGN KEY (`Calendar_Calendar _ID`)
    REFERENCES `AIRBNB`.`Calendar` (`Calendar _ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Host_Verification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Host_Verification` (
  `Host_Verifications_ID` INT NOT NULL,
  `Host_Verification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Host_Verifications_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Host_has _Verification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Host_has _Verification` (
  `Host_Verifications_ID` INT NOT NULL,
  `Host_ID` INT NOT NULL,
  PRIMARY KEY (`Host_Verifications_ID`, `Host_ID`),
  INDEX `fk_Host_Verification_has_HOST_HOST1_idx` (`Host_ID` ASC) VISIBLE,
  INDEX `fk_Host_Verification_has_HOST_Host_Verification1_idx` (`Host_Verifications_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Host_Verification_has_HOST_Host_Verification1`
    FOREIGN KEY (`Host_Verifications_ID`)
    REFERENCES `AIRBNB`.`Host_Verification` (`Host_Verifications_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Host_Verification_has_HOST_HOST1`
    FOREIGN KEY (`Host_ID`)
    REFERENCES `AIRBNB`.`HOST` (`Host_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Amenities_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Amenities_Details` (
  `Amenities_ID` INT NOT NULL,
  `Amenities` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Amenities_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AIRBNB`.`Listings_Amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AIRBNB`.`Listings_Amenities` (
  `Listings_Listing_ID` INT NOT NULL,
  `Amenities_ID` INT NOT NULL,
  PRIMARY KEY (`Listings_Listing_ID`, `Amenities_ID`),
  INDEX `fk_Listings_has_Amenities_Details_Amenities_Details1_idx` (`Amenities_ID` ASC) VISIBLE,
  INDEX `fk_Listings_has_Amenities_Details_Listings1_idx` (`Listings_Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listings_has_Amenities_Details_Listings1`
    FOREIGN KEY (`Listings_Listing_ID`)
    REFERENCES `AIRBNB`.`Listings` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Listings_has_Amenities_Details_Amenities_Details1`
    FOREIGN KEY (`Amenities_ID`)
    REFERENCES `AIRBNB`.`Amenities_Details` (`Amenities_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
