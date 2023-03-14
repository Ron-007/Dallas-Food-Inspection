/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DalllasDimensional.DM1
 *
 * Date Created : Thursday, October 06, 2022 15:19:25
 * Target DBMS : Microsoft SQL Server 2019
 */

USE damg7370
go

/* 
 * TABLE: Dim_Address 
 */

CREATE TABLE Dim_Address(
    Address_SK         int             NOT NULL,
    StreetName         varchar(25)     NULL,
    StreetAddress      varchar(100)    NOT NULL,
    StreetNumber       int             NULL,
    StreetDirection    char(5)         NULL,
    StreetType         char(5)         NULL,
    StreetUnit         varchar(10)     NULL,
    ZipCode            int             NOT NULL,
    Latitude           varchar(500)    NULL,
    Longitude          varchar(500)    NULL,
    Location           varchar(500)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Address_SK)
)

go



/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Date_SK            int            NOT NULL,
    InspectionDate     datetime       NULL,
    InspectionMonth    varchar(50)    NULL,
    InspectionYear     varchar(50)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Date_SK)
)

go



/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    Inspection_SK     int             NOT NULL,
    InspectionType    varchar(254)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Inspection_SK)
)

go



/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    Restaurant_SK     int             NOT NULL,
    RestaurantName    varchar(254)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (Restaurant_SK)
)

go



/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE Dim_Violation(
    Violation_SK            int              NOT NULL,
    ViolationDescription    varchar(100)     NULL,
    ViolationDetail         varchar(2000)    NULL,
    ViolationMemo           varchar(4000)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (Violation_SK)
)

go


/* 
 * TABLE: Fact_Dallas_Food_Inspection 
 */

CREATE TABLE Fact_Dallas_Food_Inspection(
    Facts_SK           int    NOT NULL,
    Date_SK            int    NOT NULL,
    Inspection_SK      int    NOT NULL,
    Restaurant_SK      int    NOT NULL,
    Address_SK         int    NOT NULL,
    Violation_SK       int    NOT NULL,
    InspectionScore    int    NULL,
    ViolationPoints    int    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Facts_SK)
)

go



/* 
 * TABLE: Fact_Dallas_Food_Inspection 
 */

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDim_Inspection14 
    FOREIGN KEY (Inspection_SK)
    REFERENCES Dim_Inspection(Inspection_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDim_Restaurant15 
    FOREIGN KEY (Restaurant_SK)
    REFERENCES Dim_Restaurant(Restaurant_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDim_Address16 
    FOREIGN KEY (Address_SK)
    REFERENCES Dim_Address(Address_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDim_Violation19 
    FOREIGN KEY (Violation_SK)
    REFERENCES Dim_Violation(Violation_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDim_Date26 
    FOREIGN KEY (Date_SK)
    REFERENCES Dim_Date(Date_SK)
go


