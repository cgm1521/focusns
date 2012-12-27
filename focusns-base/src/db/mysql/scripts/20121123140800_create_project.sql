--// Create Project
-- Migration SQL that makes the change goes here.

CREATE TABLE ${Project} (
	`ID` BIGINT NOT NULL AUTO_INCREMENT ,
	`CODE` VARCHAR(100) NOT NULL ,
	`TITLE` VARCHAR(100) NOT NULL ,
	`DESCRIPTION` VARCHAR(255) NOT NULL ,
	`CREATE_AT` TIMESTAMP NOT NULL ,
	`MODIFY_AT` TIMESTAMP NOT NULL ,
	`CREATE_BY_ID` BIGINT NOT NULL ,
	`MODIFY_BY_ID` BIGINT NOT NULL ,
	`CATEGORY_ID` BIGINT NOT NULL ,
    `LOGO_ID` BIGINT ,
	`PRIVATE` BOOLEAN DEFAULT FALSE ,
	PRIMARY KEY (`ID`) , 
	UNIQUE INDEX `CODE_UNIQUE` (`CODE` ASC) ,
	CONSTRAINT FK_CREATE_BY_ID_${Project} FOREIGN KEY (`CREATE_BY_ID`) REFERENCES ${User}(`ID`) ,
	CONSTRAINT FK_MODIFY_BY_ID_${Project} FOREIGN KEY (`MODIFY_BY_ID`) REFERENCES ${User}(`ID`) ,
	CONSTRAINT FK_CATEGORY_ID_${Project} FOREIGN KEY (`CATEGORY_ID`) REFERENCES ${ProjectCategory}(`ID`) ,
    CONSTRAINT FK_LOGO_ID_${Project} FOREIGN KEY (`LOGO_ID`) REFERENCES ${ProjectLogo}(`ID`)
);

--//@UNDO
-- SQL to undo the change goes here.

DROP TABLE ${Project}
