drop table goods;
drop table maker;
drop table stock;
drop table category;

CREATE TABLE IF NOT EXISTS `mydatabase01`.`maker` (
  `makercd` INT NOT NULL COMMENT '제조사코드',
  `name` VARCHAR(45) NULL COMMENT '제조사명',
  PRIMARY KEY (`makercd`))
ENGINE = InnoDB
COMMENT = '제조사마스타';


-- -----------------------------------------------------
-- Table `mydatabase01`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase01`.`goods` (
  `id` INT NOT NULL COMMENT '상품코드',
  `name` VARCHAR(45) NULL COMMENT '상품명',
  `priccate` INT NULL COMMENT '가격',
  `egory` INT NULL COMMENT '상품분류코드',
  `maker_makercd` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goods_maker_idx` (`maker_makercd` ASC),
  CONSTRAINT `fk_goods_maker`
    FOREIGN KEY (`maker_makercd`)
    REFERENCES `mydatabase01`.`maker` (`makercd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '상품정보마스타';


-- -----------------------------------------------------
-- Table `mydatabase01`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase01`.`stock` (
  `goods_id` INT NOT NULL,
  `seq` VARCHAR(45) NOT NULL COMMENT '순번',
  `stockday` DATETIME NULL COMMENT '입고/출고일자',
  `qty` INT NULL COMMENT '재고수량',
  PRIMARY KEY (`seq`, `goods_id`),
  INDEX `fk_stock_goods1_idx` (`goods_id` ASC),
  CONSTRAINT `fk_stock_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `mydatabase01`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '재고정보마스타';


-- -----------------------------------------------------
-- Table `mydatabase01`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase01`.`category` (
  `catid` INT NOT NULL COMMENT '상품분류코드',
  `categoryname` VARCHAR(45) NULL COMMENT '상품분류명')
ENGINE = InnoDB
COMMENT = '상품분류마스타';