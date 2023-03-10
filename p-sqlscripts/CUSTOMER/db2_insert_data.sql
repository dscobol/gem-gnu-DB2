connect to MURACH user userid using password;

-- first delete all customers
DELETE FROM CUSTOMERS;

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400001',
        'Keith',
        'Jones',
        '4501 W Mockingbird',
        'Dallas',
        'TX',
        '75209');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400002',
        'Karen',
        'Annelli',
        '40 Ford Rd',
        'Denville',
        'NJ',
        '07834');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400003',
        'Susan',
        'Howard',
        '1107 Second Ave',
        'Redwood City',
        'CA',
        '94063');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400004',
        'Carol Ann',
        'Evens',
        '74 Sutton Ct',
        'Great Lakes',
        'IL',
        '60088');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400005',
        'Elaine',
        'Roberts',
        '12914 Bracknell',
        'Cerritos',
        'CA',
        '90701');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400006',
        'Pat',
        'Hong',
        '73 High St',
        'San Francisco',
        'CA',
        '94114');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400007',
        'Phil',
        'Roach',
        '25680 Orchard',
        'Dearborn Hts',
        'MI',
        '48125');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400008',
        'Tim',
        'Johnson',
        '145 W 27th St',
        'So Chicago Hts',
        'IL',
        '60411');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400009',
        'Marianne',
        'Busbee',
        '3920 Berwyn Dr S',
        'Mobile',
        'AL',
        '36608');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400010',
        'Enrique',
        'Othon',
        'Box 26729',
        'Richmond',
        'VA',
        '23261');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400011',
        'William C',
        'Ferguson',
        'Box 1283',
        'Miami',
        'FL',
        '34002');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400012',
        'SD',
        'Hoehn',
        'PO Box 27',
        'Riddle',
        'OR',
        '97469');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400013',
        'David R',
        'Keith',
        'Box 1266',
        'Magnolia',
        'AR',
        '71757');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400014',
        'R',
        'Binder',
        '3425 Walden Ave',
        'Depew',
        'NY',
        '14043');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400015',
        'Vivian',
        'George',
        '229 S 18th St',
        'Philadelphia',
        'PA',
        '19103');

INSERT INTO CUSTOMERS
      ( CUSTNO,
        FNAME,
        LNAME,
        ADDR,
        CITY,
        STATE,
        ZIPCODE)
VALUES ('400016',
        'J',
        'Noethlich',
        '11 Kingston Ct',
        'Merrimack',
        'NH',
        '03054');

-- count all customers
SELECT COUNT(*) FROM CUSTOMERS;

connect reset;
