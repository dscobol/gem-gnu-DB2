connect to MURACH user userid using password;

-- first delete all records
DELETE FROM INVOICES;

INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400012', '062308', '1997-12-22', 200.00, 4.45, 0.00, 204.45, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062309', '1998-02-22', 15.00, 0.00, 0.00, 15.00, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062310', '1998-02-22', 140.00, 7.50, 0.00, 147.50, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400014', '062311', '1998-02-22', 178.23, 3.19, 0.00, 181.42, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400002', '062312', '1998-02-22', 162.00, 11.07, 0.00, 173.07, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062313', '1998-03-14', 22.00, 0.50, 0.00, 22.50, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400003', '062314', '1998-03-14', 140.00, 0.00, 9.80, 149.80, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400004', '062315', '1998-03-14', 178.23, 3.19, 0.00, 181.42, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400010', '062316', '1998-03-14', 140.00, 7.50, 0.00, 147.50, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062317', '1998-03-17', 289.00, 9.00, 0.00, 298.00, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400012', '062318', '1998-03-17', 199.99, 0.00, 0.00, 199.99, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400015', '062319', '1998-03-17', 178.23, 3.19, 0.00, 181.42, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400015', '062320', '1998-03-17', 3245.00, 160.00, 0.00, 3450.00, 'RXTY      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400001', '062321', '1998-04-03', 200.00, 5.60, 0.00, 205.60, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400014', '062322', '1998-04-03', 15.00, 0.00, 0.00, 15.00, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062323', '1998-04-11', 925.00, 24.00, 0.00, 949.00, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400014', '062324', '1998-04-14', 178.23, 3.19, 0.00, 181.42, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400002', '062325', '1998-04-17', 140.00, 7.50, 0.00, 147.50, 'PCQ3      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062326', '1998-04-20', 178.23, 3.19, 0.00, 181.42, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400003', '062327', '1998-04-23', 200.00, 7.50, 14.00, 221.50, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400004', '062328', '1998-04-24', 178.23, 3.19, 0.00, 181.42, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400010', '062329', '1998-04-29', 140.00, 7.50, 0.00, 147.50, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400011', '062330', '1998-04-30', 2295.00, 14.00, 0.00, 2309.00, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400012', '062331', '1998-05-07', 178.23, 0.00, 0.00, 178.23, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400013', '062332', '1998-05-09', 178.23, 0.00, 0.00, 178.23, 'PCQ4      ');
INSERT INTO INVOICES (INVCUST, INVNO, INVDATE, INVSUBT, INVSHIP, INVTAX, INVTOTAL, INVPROM) VALUES ('400015', '062333', '1998-05-17', 178.23, 0.00, 0.00, 178.23, 'PCQ4      ');

-- count all records
SELECT COUNT(*) FROM INVOICES;

connect reset;
