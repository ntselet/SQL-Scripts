DROP TABLE DimCUSTOMER;
CREATE TABLE DimCUSTOMER 
(
customer_dim_id         INTEGER NOT NULL,
Customer_ID             INT NOT NULL,
Customer_FIRST_NAME         VARCHAR(20),
Customer_LAST_NAME          VARCHAR(40),
STREET_ADDRESS          VARCHAR(40),
POSTAL_CODE             VARCHAR(10),
CITY                    VARCHAR(40),
STATE_PROVINCE          VARCHAR(10),
COUNTRY_ID              INT,
COUNTRY_NAME            VARCHAR(30),
REGION_ID               INTEGER,
CREDIT_LIMIT            double(10,2),
Customer_EMAIL              VARCHAR(50),
PRIMARY_PHONE_INT    VARCHAR(16),
ACCOUNT_Manager_ID          INT,
CONSTRAINT PK_CUSTOMER_DIM PRIMARY KEY (customer_dim_id)
);

DROP TABLE Dimemployee;
CREATE TABLE DimEmployee
(
EMPLOYEE_DIM_ID   INTEGER NOT NULL,
EMPLOYEE_ID       INT(6) NOT NULL,
EMPLOYEE_FIRST_NAME        VARCHAR(20),
EMPLOYEE_LAST_NAME         VARCHAR(25),
EMPLOYEE_EMAIL             VARCHAR(25),
EMPLOYEE_PHONE_INT      VARCHAR(20),
EMPLOYEE_HIRE_DATE         DATE,
EMPLOYEE_JOB_ID            VARCHAR(10),
EMPLOYEE_SALARY            double(8,2),
MANAGER_ID        INT(6) NOT NULL,
DEPARTMENT_ID     INT(4) NOT NULL,
CONSTRAINT employee_dim_pk PRIMARY KEY (employee_dim_id)
);

DROP TABLE DimPRODUCT;
CREATE TABLE DimPRODUCT
(
PRODUCT_DIM_ID      INTEGER NOT NULL,
PRODUCT_ID          INTEGER NOT NULL,
PRODUCT_NAME        VARCHAR(50),
PRODUCT_DESCRIPTION VARCHAR(2000),
CATEGORY_ID         INT(2) NOT NULL,
CATEGORY_NAME       VARCHAR(50),
WEIGHT_CLASS        INT(1),
WARRANTY_PERIOD     INTEGER,
SUPPLIER_ID         INT(6),
PRODUCT_STATUS      VARCHAR(20),
LIST_PRICE          double(8,2),
MIN_PRICE           double(8,2),
CATALOG_URL         VARCHAR(50),
PARENT_CATEGORY_ID   INTEGER,
PARENT_CATEGORY_NAME VARCHAR(50),
PARENT_CATEGORY_DESCRIPTION VARCHAR(50),
CONSTRAINT product_pk PRIMARY KEY (product_dim_id)
);

DROP TABLE Dimdate;
CREATE TABLE Dimdate
(
 date_dim_id        INTEGER NOT NULL,
 sales_date         DATE,
 sales_day_of_year  INTEGER,
 sales_month        INTEGER,
 sales_year         INTEGER,
 sales_quarter      INTEGER,
 sales_month_name   VARCHAR(20),
 CONSTRAINT date_pk PRIMARY KEY (date_dim_id)
);
 
DROP TABLE sales_fact;
CREATE TABLE sales_fact
(
 product_dim_id     INTEGER NOT NULL,
 promotion_dim_id   INTEGER NOT NULL,
 customer_dim_id    INTEGER NOT NULL,
 employee_dim_id    INTEGER NOT NULL,
 date_dim_id        INTEGER NOT NULL,
 order_id           INTEGER,
 dollars_sold       double(12,2),
 quantity_sold      double(12,2)
 );
 
ALTER TABLE sales_fact 
ADD CONSTRAINT sales_product_fk 
FOREIGN KEY (product_dim_id) REFERENCES dimproduct (product_dim_id);



ALTER TABLE sales_fact 
ADD CONSTRAINT sales_customer_fk 
FOREIGN KEY (customer_dim_id) REFERENCES dimcustomer (customer_dim_id);

ALTER TABLE sales_fact 
ADD CONSTRAINT sales_employee_fk 
FOREIGN KEY (employee_dim_id) REFERENCES dimemployee (employee_dim_id);

ALTER TABLE sales_fact 
ADD CONSTRAINT sales_dates_fk 
FOREIGN KEY (date_dim_id) REFERENCES dimdate (date_dim_id);