-- initialDB.sql
-- ���⾾�� ���� MEMBERGRADE�� MEMBER;
DROP TABLE MEMBERGRADE;
DROP TABLE MEMBER;
CREATE TABLE MEMBERGRADE(
MemberGradeNo VARCHAR2(20) DEFAULT '0' PRIMARY KEY,
MemberGradeName VARCHAR2(20) NOT NULL
);
SELECT * FROM MEMBERGRADE;
COMMIT;

CREATE TABLE MEMBER(
MemberId VARCHAR2(30) PRIMARY KEY,
MemberPw VARCHAR2(30) NOT NULL,
MemberName VARCHAR2(30) NOT NULL,
MemberBirth DATE NOT NULL,
MemberPhone VARCHAR2(30) NOT NULL,
MemberEmail VARCHAR2(100) NOT NULL,
MemberAddress VARCHAR2(255) NOT NULL,
MemberPoint NUMBER(8) DEFAULT 0 NOT NULL,
MemberGradeNo VARCHAR2(20) DEFAULT 0 REFERENCES MEMBERGRADE(MemberGradeNo),
MemberAmount NUMBER(10) DEFAULT 0 NOT NULL,
MemberState NUMBER(1) DEFAULT 0 NOT NULL
);
SELECT * FROM MEMBER;
COMMIT;

INSERT INTO MEMBERGRADE(MemberGradeNo, MemberGradeName) VALUES('0', 'NORMAL');
INSERT INTO MEMBERGRADE(MemberGradeNo, MemberGradeName) VALUES('1', 'VIP');
SELECT * FROM membergrade;

INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress)
  VALUES('AAA', 'AAA', 'AAA', TO_DATE('941201', 'YYMMDD'), '01075596366', 'AAA@AAA', '��������'); 
SELECT * FROM MEMBER;
COMMIT;

-- EVENT(�̺�Ʈ)
DROP TABLE EVENT;
DROP SEQUENCE EVENT_SEQ;
CREATE SEQUENCE EVENT_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE EVENT(
    EventNo NUMBER(10) PRIMARY KEY,
    EventTitle VARCHAR2(30) NOT NULL,
    EventFile VARCHAR2(300) NOT NULL,
    EventReadCount NUMBER(10) DEFAULT 0,
    EventDate DATE DEFAULT SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, 'BLING', 'pic2.jpg', '0', SYSDATE);
SELECT * FROM EVENT;

-- ITEM(������ǰ)
DROP TABLE ITEM;
DROP SEQUENCE ITEM_SEQ;
CREATE SEQUENCE ITEM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE ITEM(
    ItemNo NUMBER(10) PRIMARY KEY,
    ItemName VARCHAR2(20) NOT NULL,
    ItemImage VARCHAR2(200) NOT NULL,
    ItemPrice NUMBER(6) NOT NULL);
INSERT INTO ITEM VALUES
    (ITEM_SEQ.NEXTVAL, '�޺�BOX', 'COMBO.JSP', '13000');
SELECT * FROM ITEM;
COMMIT;

-- PURCHASE(�������ų���)
DROP TABLE PURCHASE;
DROP SEQUENCE PURCHASE_SEQ;
CREATE SEQUENCE PURCHASE_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE PURCHASE(
    PurchaseNo NUMBER(10) PRIMARY KEY,
    MemberId VARCHAR2(30) NOT NULL REFERENCES MEMBER(MEMBERID),
    PurchasePrice NUMBER(6) NOT NULL,
    PurchaseDate DATE DEFAULT SYSDATE);
INSERT INTO PURCHASE VALUES
    (PURCHASE_SEQ.NEXTVAL, 'AAA', '13000', SYSDATE);
SELECT * FROM PURCHASE;
COMMIT;

-- PURCHASEITEM(�������Ż�ǰ)
DROP TABLE PURCHASEITEM;
DROP SEQUENCE PURCHASEITEM_SEQ;
CREATE SEQUENCE PURCHASEITEM_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE TABLE PURCHASEITEM(
    PurchaseItemNo NUMBER(10) PRIMARY KEY,
    ItemNo NUMBER(10) REFERENCES item(ItemNo),
    PurchaseNo NUMBER(10) REFERENCES Purchase(PurchaseNo),
    PurchaseItemAmount NUMBER(2) NOT NULL);
INSERT INTO PURCHASEITEM VALUES
    (PURCHASEITEM_SEQ.NEXTVAL, '1','1','1');
COMMIT;
    