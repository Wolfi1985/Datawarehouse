CREATE TABLE product (
  product_sk INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  product_category VARCHAR(255) NOT NULL,
  product_family VARCHAR(255) NOT NULL
);

INSERT INTO product VALUES (1, 'SuperSoftGum(R)', 'Chewing Gum', 'Medical');
INSERT INTO product VALUES (2, 'SoftGum(R)', 'Chewing Gum', 'Medical');
INSERT INTO product VALUES (3, 'Best Pina Colada', 'Cocktail', 'Alcohol');
INSERT INTO product VALUES (4, 'Zwickl Natural', 'Beer', 'Alcohol');
INSERT INTO product VALUES (5, 'IPA Juicy Fruit', 'Beer', 'Alcohol');
INSERT INTO product VALUES (6, 'Mashed Potato Deluxe', 'Baby Nutrition', 'Food');

CREATE TABLE time_by_day (
    time_sk INTEGER PRIMARY KEY,
    day_of_month INTEGER NOT NULL,
    month_of_year INTEGER NOT NULL,
    the_year INTEGER NOT NULL
);

INSERT INTO time_by_day VALUES (20120229, 29, 2, 2012);
INSERT INTO time_by_day VALUES (20120301, 1, 3, 2012);

CREATE TABLE location (
    location_sk INTEGER PRIMARY KEY,
    city VARCHAR(255) NOT NULL, -- this is the finest level of granularity here\n"
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

INSERT INTO location VALUES (1, 'Linz', 'Upper Austria', 'Austria');
INSERT INTO location VALUES (2, 'Vienna', 'Vienna', 'Austria');
INSERT INTO location VALUES (3, 'Portland', 'Oregon', 'United States');
INSERT INTO location VALUES (4, 'Eugene', 'Oregon', 'United States');


CREATE TABLE customer (
    customer_sk INTEGER PRIMARY KEY,
    customer_first_name VARCHAR(120) NOT NULL,
    customer_last_name VARCHAR(120) NOT NULL,
    location INTEGER NOT NULL REFERENCES location(location_sk)
);

INSERT INTO customer VALUES (1, 'Often Wrong', 'Scott', 3);
INSERT INTO customer VALUES (2, 'Often Right', 'Christoph', 1);
INSERT INTO customer VALUES (3, 'Scott', 'Tiger', 1);
INSERT INTO customer VALUES (5, 'Scott', 'Sloth', 1);
INSERT INTO customer VALUES (6, 'Montgomery', 'Scott', 3);

CREATE TABLE branch (
    branch_sk INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    sqft INTEGER NOT NULL, -- non-dimension (descriptive) attribute
    location INTEGER NOT NULL REFERENCES location(location_sk)
      );

INSERT INTO branch VALUES (1, 'PDX-1', 1210, 3);
INSERT INTO branch VALUES (2, 'PDX-2', 1250, 3);
INSERT INTO branch VALUES (3, 'LNZ', 950, 1);

CREATE TABLE sales_fact (
product INTEGER NOT NULL REFERENCES product(product_sk),
time_by_day INTEGER NOT NULL REFERENCES time_by_day(time_sk),
customer INTEGER NOT NULL REFERENCES customer(customer_sk),
branch INTEGER NOT NULL REFERENCES branch(branch_sk),
unit_sales INTEGER NOT NULL -- the measure\n"
);

INSERT INTO sales_fact VALUES (1, 20120229, 1, 1, 50);
INSERT INTO sales_fact VALUES (2, 20120229, 1, 1, 10);
INSERT INTO sales_fact VALUES (4, 20120229, 1, 1, 19);
INSERT INTO sales_fact VALUES (5, 20120229, 1, 1, 22);
INSERT INTO sales_fact VALUES (1, 20120229, 2, 3, 15);
INSERT INTO sales_fact VALUES (3, 20120229, 2, 3, 28);
INSERT INTO sales_fact VALUES (6, 20120229, 2, 3, 17);
INSERT INTO sales_fact VALUES (5, 20120229, 2, 3, 32);

INSERT INTO sales_fact VALUES (1, 20120301, 3, 3, 15);
INSERT INTO sales_fact VALUES (3, 20120301, 1, 1, 28);
INSERT INTO sales_fact VALUES (6, 20120301, 3, 2, 17);
INSERT INTO sales_fact VALUES (5, 20120301, 2, 3, 32);