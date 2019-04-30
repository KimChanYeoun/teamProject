-- ★ ★ ★ Event.xml(mapper) ★ ★ ★
-- id=eventListAll (최근순서대로 이벤트글 가져오기)
SELECT * FROM EVENT ORDER BY EVENTDATE DESC;
-- id=eventListPaging(이벤트 글목록)
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM EVENT ORDER BY EventNo DESC) A)
    WHERE RN BETWEEN 1 AND 4;
-- id=writeEvent(이벤트 글쓰기)
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '가가가이벤트', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '나나나이벤트', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '다다다이벤트', 'pic1.jpg', 0, SYSDATE);
INSERT INTO EVENT VALUES
    (EVENT_SEQ.NEXTVAL, '라라라이벤트', 'pic1.jpg', 0, SYSDATE);
SELECT * FROM EVENT ORDER BY EVENTNO DESC;
-- id=detailEvent(이벤트 글상세보기)
SELECT * FROM EVENT WHERE EventNo=1;
-- id=modifyEvent(이벤트 글수정)
UPDATE EVENT SET
    EventTitle='오라클이벤트',
    EventFile='pic3.jpg',
    EventDate=SYSDATE,
    EVENTReadCount = 0
    WHERE EventNo='2';
-- id=ReadcountEvent(이벤트 조회수 하나 올리기)
UPDATE EVENT SET EventReadCount = EventReadCount+1 WHERE EventNo=1;
-- id=deleteEvent(이벤트 글삭제)
DELETE FROM EVENT WHERE EventNo=2;
-- id=countEvent(이벤트 글갯수)
SELECT COUNT(*) FROM EVENT;
SELECT * FROM EVENT;
COMMIT;

-- ★ ★ ★ ITEM.xml(mapper) ★ ★ ★
-- id=writeItem(매점 아이템만들기)
INSERT INTO ITEM VALUES
    (ITEM_SEQ.NEXTVAL, '허니팝콘', 'HONNY.JPG', '5000');
-- id=listItem(매점 아이템 목록)
SELECT * FROM ITEM;
-- id=modifyItem(매점 아이템수정)
UPDATE ITEM SET
    ItemName='어니언팝콘',
    ItmeImage='ONION.JPG',
    ItemPrice='4000'
    WHERE ItemNo=2;
-- id=deleteItem(매점 아이템삭제)
DELETE FROM ITEM WHERE ItemNo=2;
SELECT * FROM ITEM;
-- id=getItem(아이템 가져오기)
SELECT * FROM ITEM WHERE ITEMNO=1;
-- id=countgetItem(가져온 아이템 갯수)
SELECT COUNT(*) FROM ITEM;



-- ★ ★ ★ PURCHASE.xml(mapper) ★ ★ ★
-- id=listPurchase(사용자의 매점 주문리스트)
SELECT * FROM PURCHASE;
-- id=addPurchase
INSERT INTO PURCHASE VALUES
    (PURCHASE_SEQ.NEXTVAL, 'AAA', '19000', SYSDATE);
-- id=getLastPurchaseNo
SELECT * FROM PURCHASE ORDER BY PURCHASENO DESC;

-- ★ ★ ★ PURCHASEITEM.xml(mapper) ★ ★ ★
-- id=listPurchaseItem
SELECT * FROM PURCHASEITEM;
-- id=addPurchaseItem
INSERT INTO PURCHASEITEM VALUES
    (PURCHASEITEM_SEQ.NEXTVAL, '1','1');
SELECT * FROM PURCHASEITEM WHERE PurchaseItemNo=14;
COMMIT;