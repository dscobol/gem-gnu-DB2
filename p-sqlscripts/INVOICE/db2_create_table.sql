connect to MURACH user userid using password;

DROP TABLESPACE TSINVOICE;

CREATE TABLESPACE TSINVOICE
      MANAGED BY AUTOMATIC STORAGE
      USING STOGROUP IBMSTOGROUP;

CREATE TABLE INVOICES (
       INVCUST            CHAR(6) NOT NULL,
       INVNO              CHAR(6) NOT NULL,
       INVDATE            DATE NOT NULL,
       INVSUBT            DECIMAL(9,2) NOT NULL,
       INVSHIP            DECIMAL(7,2) NOT NULL,
       INVTAX             DECIMAL(7,2) NOT NULL,
       INVTOTAL           DECIMAL(9,2) NOT NULL,
       INVPROM            CHAR(10) NOT NULL,
     CONSTRAINT INVNO_PK PRIMARY KEY
     (INVNO)
	)
	IN TSINVOICE;

connect reset;
