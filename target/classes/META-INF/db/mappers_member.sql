-- ★ ★ ★ Member.xml ★ ★ ★ 
-- Member.xml의 idConfirm (id중복체크) 
SELECT COUNT(*) FROM MEMBER WHERE MemberId='AAA'; 
 
-- Member.xml의 id=joinMember(회원가입) 
INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('ABC', 'ABC', 'ABC', TO_DATE('900101', 'YYMMDD'), '01075596366', 'ABC@ABC', '서울시 마포구 제기동', '02456'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('DEF', 'DEF', 'DEF', TO_DATE('910101', 'YYMMDD'), '01099546366', 'DEF@DEF', '대구광역시 강북구 신설동', '03584'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('GHI', 'GHI', 'GHI', TO_DATE('920101', 'YYMMDD'), '01071896366', 'GHI@GHI', '대전광역시 강남구 상봉동', '03974'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('ZKL', 'ZKL', 'ZKL', TO_DATE('930101', 'YYMMDD'), '01087096366', 'ZKL@ZKL', '부산광역시 종로구 가리봉동', '07935'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('MNO', 'MNO', 'MNO', TO_DATE('940101', 'YYMMDD'), '01081096366', 'MNO@MNO', '울산광역시 강동구 강도동', '09813'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('PQR', 'PQR', 'PQR', TO_DATE('950101', 'YYMMDD'), '01081816366', 'PQR@PQR', '강릉광역시 강서구 별관A동', '05684'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('STU', 'STU', 'STU', TO_DATE('960101', 'YYMMDD'), '01048606366', 'STU@STU', '원주광역시 일산구 오름동', '08644'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('VWX', 'VWX', 'VWX', TO_DATE('970101', 'YYMMDD'), '01046466366', 'VWX@VWX', '광주광역시 용산구 내름동', '01596'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('YZA', 'YZA', 'YZA', TO_DATE('980101', 'YYMMDD'), '01078896366', 'YZA@YZA', '전주광역시 여기구 알지동', '06417'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('BCD', 'BCD', 'BCD', TO_DATE('990101', 'YYMMDD'), '01055696366', 'BCD@BCD', '나주광역시 그렇구 이해했동', '03854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('EFG', 'EFG', 'EFG', TO_DATE('910201', 'YYMMDD'), '01097806366', 'EFG@EFG', '충주광역시 열리구 닫힘동', '04854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('HIJ', 'HIJ', 'HIJ', TO_DATE('930201', 'YYMMDD'), '01083306366', 'HIJ@HIJ', '청주광역시 모르구 안가동', '03574'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('KLM', 'KLM', 'KLM', TO_DATE('930201', 'YYMMDD'), '01047476366', 'KLM@KLM', '화성광역시 비싸구 돈업동', '04255'); 
  
  
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('AAA', 'AAA', 'AAA', TO_DATE('900101', 'YYMMDD'), '01063667559', 'ABC@ABC', '서울시 마포구 제기동', '02456'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('BBB', 'BBB', 'BBB', TO_DATE('910101', 'YYMMDD'), '01063669954', 'DEF@DEF', '대구광역시 강북구 신설동', '03584'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('CCC', 'CCC', 'CCC', TO_DATE('920101', 'YYMMDD'), '01063667189', 'GHI@GHI', '대전광역시 강남구 상봉동', '03974'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('DDD', 'DDD', 'DDD', TO_DATE('930101', 'YYMMDD'), '01063668709', 'ZKL@ZKL', '부산광역시 종로구 가리봉동', '07935'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('EEE', 'EEE', 'EEE', TO_DATE('940101', 'YYMMDD'), '01063668109', 'MNO@MNO', '울산광역시 강동구 강도동', '09813'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('FFF', 'FFF', 'FFF', TO_DATE('950101', 'YYMMDD'), '01063668181', 'PQR@PQR', '강릉광역시 강서구 별관A동', '05684'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('GGG', 'GGG', 'GGG', TO_DATE('960101', 'YYMMDD'), '01063664860', 'STU@STU', '원주광역시 일산구 오름동', '08644'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('HHH', 'HHH', 'HHH', TO_DATE('970101', 'YYMMDD'), '01063664646', 'VWX@VWX', '광주광역시 용산구 내름동', '01596'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('III', 'III', 'III', TO_DATE('980101', 'YYMMDD'), '01063667889', 'YZA@YZA', '전주광역시 여기구 알지동', '06417'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('JJJ', 'JJJ', 'JJJ', TO_DATE('990101', 'YYMMDD'), '01063665569', 'BCD@BCD', '나주광역시 그렇구 이해했동', '03854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('KKK', 'KKK', 'KKK', TO_DATE('910201', 'YYMMDD'), '01063669780', 'EFG@EFG', '충주광역시 열리구 닫힘동', '04854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('LLL', 'LLL', 'LLL', TO_DATE('930201', 'YYMMDD'), '01063668330', 'HIJ@HIJ', '청주광역시 모르구 안가동', '03574'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('MMM', 'MMM', 'MMM', TO_DATE('930201', 'YYMMDD'), '01063664747', 'KLM@KLM', '화성광역시 비싸구 돈업동', '04255'); 



INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('ABC12', 'ABC12', 'ABC', TO_DATE('900101', 'YYMMDD'), '01075636659', 'ABC@ABC', '서울시 마포구 제기동', '02456'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('DEF12', 'DEF12', 'DEF', TO_DATE('910101', 'YYMMDD'), '01099636654', 'DEF@DEF', '대구광역시 강북구 신설동', '03584'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('GHI12', 'GHI12', 'GHI', TO_DATE('920101', 'YYMMDD'), '01071636689', 'GHI@GHI', '대전광역시 강남구 상봉동', '03974'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('ZKL12', 'ZKL12', 'ZKL', TO_DATE('930101', 'YYMMDD'), '01087636609', 'ZKL@ZKL', '부산광역시 종로구 가리봉동', '07935'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('MNO12', 'MNO12', 'MNO', TO_DATE('940101', 'YYMMDD'), '01081636609', 'MNO@MNO', '울산광역시 강동구 강도동', '09813'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('PQR12', 'PQR12', 'PQR', TO_DATE('950101', 'YYMMDD'), '01081636681', 'PQR@PQR', '강릉광역시 강서구 별관A동', '05684'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('STU12', 'STU12', 'STU', TO_DATE('960101', 'YYMMDD'), '01048636660', 'STU@STU', '원주광역시 일산구 오름동', '08644'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('VWX12', 'VWX12', 'VWX', TO_DATE('970101', 'YYMMDD'), '01046636646', 'VWX@VWX', '광주광역시 용산구 내름동', '01596'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('YZA12', 'YZA12', 'YZA', TO_DATE('980101', 'YYMMDD'), '01078636689', 'YZA@YZA', '전주광역시 여기구 알지동', '06417'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('BCD12', 'BCD12', 'BCD', TO_DATE('990101', 'YYMMDD'), '01055636669', 'BCD@BCD', '나주광역시 그렇구 이해했동', '03854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('EFG12', 'EFG12', 'EFG', TO_DATE('910201', 'YYMMDD'), '01097636680', 'EFG@EFG', '충주광역시 열리구 닫힘동', '04854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('HIJ12', 'HIJ12', 'HIJ', TO_DATE('930201', 'YYMMDD'), '01083636630', 'HIJ@HIJ', '청주광역시 모르구 안가동', '03574'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('KLM12', 'KLM12', 'KLM', TO_DATE('930201', 'YYMMDD'), '01047636647', 'KLM@KLM', '화성광역시 비싸구 돈업동', '04255'); 
  
  
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('AAA12', 'AAA12', 'AAA', TO_DATE('900101', 'YYMMDD'), '01063755966', 'ABC@ABC', '서울시 마포구 제기동', '02456'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('BBB12', 'BBB12', 'BBB', TO_DATE('910101', 'YYMMDD'), '01063995466', 'DEF@DEF', '대구광역시 강북구 신설동', '03584'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('CCC12', 'CCC12', 'CCC', TO_DATE('920101', 'YYMMDD'), '01063718966', 'GHI@GHI', '대전광역시 강남구 상봉동', '03974'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('DDD12', 'DDD12', 'DDD', TO_DATE('930101', 'YYMMDD'), '01063870966', 'ZKL@ZKL', '부산광역시 종로구 가리봉동', '07935'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('EEE12', 'EEE12', 'EEE', TO_DATE('940101', 'YYMMDD'), '01063810966', 'MNO@MNO', '울산광역시 강동구 강도동', '09813'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('FFF12', 'FFF12', 'FFF', TO_DATE('950101', 'YYMMDD'), '01063818166', 'PQR@PQR', '강릉광역시 강서구 별관A동', '05684'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('GGG12', 'GGG12', 'GGG', TO_DATE('960101', 'YYMMDD'), '01063486066', 'STU@STU', '원주광역시 일산구 오름동', '08644'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('HHH12', 'HHH12', 'HHH', TO_DATE('970101', 'YYMMDD'), '01063464666', 'VWX@VWX', '광주광역시 용산구 내름동', '01596'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('III12', 'III12', 'III', TO_DATE('980101', 'YYMMDD'), '01063788966', 'YZA@YZA', '전주광역시 여기구 알지동', '06417'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('JJJ12', 'JJJ12', 'JJJ', TO_DATE('990101', 'YYMMDD'), '01063556966', 'BCD@BCD', '나주광역시 그렇구 이해했동', '03854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('KKK12', 'KKK12', 'KKK', TO_DATE('910201', 'YYMMDD'), '01063978066', 'EFG@EFG', '충주광역시 열리구 닫힘동', '04854'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('LLL12', 'LLL12', 'LLL', TO_DATE('930201', 'YYMMDD'), '01063833066', 'HIJ@HIJ', '청주광역시 모르구 안가동', '03574'); 
  
  INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('MMM12', 'MMM12', 'MMM', TO_DATE('930201', 'YYMMDD'), '01063474766', 'KLM@KLM', '화성광역시 비싸구 돈업동', '04255'); 
  
-- Memeber.xml의 id=getMember(MemberId로 회원정보 가져오기) 
SELECT * FROM MEMBER WHERE MemberId='AAA'; 

-- Memeber.xml의 id=searchMemberId(이름과 전화번호로 회원아이디 가져오기) 
SELECT MemberId FROM MEMBER WHERE MemberName='문길동' and MemberPhone='01099998888';

-- Memeber.xml의 id=searchMemberPw(아이디와 전화번호로 회원아이디 가져오기) 
SELECT MemberPw FROM MEMBER WHERE MemberId='AAA' and MemberPhone='01099998888';
 
 
-- Member.xml의 id=modifyMember(회원정보수정하기) 
UPDATE MEMBER SET 
     MemberPw='111', 
     MemberName='문길동', 
     MemberPhone='010-9999-8888',
     MemberEmail='hybrid@tj.com', 
     MemberAddress='서울시 용산구',
     MemberPost='서울시 용산구'
     WHERE MemberId='AAA'; 
 commit; 
 
 
 -- Member.xml의 id=callLogin(전화번호로 로그인하기)
SELECT * FROM MEMBER WHERE MEMBERPHONE='01077777777';
 
 
 
 -- .xml의 id=myQnA(내가쓴 QNA불러오기)
 SELECT ROWNUM, A.* FROM (SELECT * FROM QNA WHERE MEMBERID='AAA' order by qnano desc) A WHERE ROWNUM BETWEEN 1 AND 5;

 
 -- .xml의 id=myMovie(내가 예매한 내역 불러오기)
 select b.*, a.moviename from booking b, (select m.*, su.screenupno from screenup su, movie m where su.movieno=m.movieno) a
 where b.screenupno=a.screenupno and memberid='aaa' order by bookingno desc;
 
 
 select rownum, a.* from (select b.*, a.moviename, a.movieimage from booking b, 
 (select m.*, su.screenupno from screenup su, movie m where su.movieno=m.movieno) a
 where b.screenupno=a.screenupno and memberid='aaa' order by bookingno desc) a WHERE ROWNUM BETWEEN 1 AND 5;
 
 SELECT * FROM(SELECT ROWNUM, A.*, i.itemname FROM ITEM I, (SELECT P.*, pi.purchaseitemamount, PI.ITEMNO FROM PURCHASEITEM PI, PURCHASE P WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC)A WHERE I.ITEMNO = A.ITEMNO AND MEMBERID='AAA') WHERE ROWNUM BETWEEN 1 AND 5;
 
 -- .xml의 id=myMovieSeat(내가 예매한 내역 불러오기)
 SELECT * FROM BOOKINGSEAT;
 
select count(*) from booking where memberId='aaa';

 select * from member;
 
 SELECT * FROM SEAT;
 
SELECT b.*, seatno FROM BOOKING B, BOOKINGSEAT BS WHERE B.BOOKINGNO=BS.BOOKINGNO AND MEMBERID='aaa'; 
 
 
 select * from qna;
 -- .xml의 id=myMovie(내가 구매한 내역 불러오기)
SELECT * FROM PURCHASEITEM;
SELECT * FROM PURCHASE;
SELECT * FROM ITEM;

SELECT P.*, pi.purchaseitemamount, PI.ITEMNO FROM PURCHASEITEM PI, PURCHASE P 
WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC;

SELECT * FROM(SELECT ROWNUM, A.* FROM ITEM I, (SELECT P.*, pi.purchaseitemamount, PI.ITEMNO FROM PURCHASEITEM PI, PURCHASE P 
WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC)A WHERE I.ITEMNO = A.ITEMNO AND MEMBERID='AAA') WHERE ROWNUM BETWEEN 1 AND 5;


SELECT * FROM(SELECT ROWNUM, A.*, i.itemname FROM ITEM I, (SELECT P.*,
		pi.purchaseitemamount, pi.itemno FROM PURCHASEITEM PI, PURCHASE P
		WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC)A WHERE
		I.ITEMNO = A.ITEMNO AND MEMBERID='AAA') WHERE ROWNUM BETWEEN 1 AND 5;
        
        
        
    COMMIT;
 

-- ★ ★ ★ Admin.xml ★ ★ ★ 
-- Admin.xml의 id=MemberListAll (회원이름순서대로 출력) 
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM MEMBER order by MemberName desc ) A) 
     WHERE RN BETWEEN 1 AND 15; 
     
SELECT ROWNUM RN, A.*
		FROM (SELECT m.*, MemberGradeName FROM MEMBER m, membergrade mg 
        WHERE m.MemberGradeNo=mg.MemberGradeNo ORDER BY MemberName DESC ) A
 WHERE RN BETWEEN 1 AND 15;


-- Admin.xml의 id=MemberGradeList(MemberId로 회원정보 가져오기) 
SELECT * FROM MEMBER WHERE MemberId='AAA'; 

-- Admin.xml의 id=MemberGradeUpdate(MemberId로 회원정보 가져오기)   
UPDATE MEMBER SET
		MemberGradeNo='1' WHERE MemberId='AAA';
        
-- Admin.xml의 id=MemberStop(MemberId로 회원정지시키기)           
UPDATE MEMBER SET
		MemberState=1
		WHERE MemberId='AAA';
    
select * from member;
    
commit;

-- ★ ★ ★ Notice.xml ★ ★ ★ 
-- Notice.xml의 id=NoticeListPaging(순서대로 top-N구문) 
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM Notice order by NoticeNo desc) A) 
     WHERE RN BETWEEN 1 AND 15; 
     
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM Notice order by NoticeNo desc) A) 
     WHERE RN BETWEEN 1 AND 15; 

-- Notice.xml의 id=writerNotice(공지등록) 

INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '주자장 사용시간 변경을 알려드립니다.','주자장 사용시간이 이렇게 변경 되었음을 알려드립니다!','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '영화관 이용에 불편을 드려 죄송합니다.', '영화관 이용에 불편을 드려 죄송합니다'); 
     
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '영화 상영시간 변경을 알려드립니다.','최범석','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '12월 상영 예정작입니다','12월 상영 예정작입니다'); 
     
    INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '11월 상영 예정작입니다','11월 상영 예정작입니다','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '10월 상영 예정작입니다','10월 상영 예정작입니다'); 
     
     INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '09월 상영 예정작입니다','09월 상영 예정작입니다','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '08월 상영 예정작입니다','08월 상영 예정작입니다'); 
     
     INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '07월 상영 예정작입니다','07월 상영 예정작입니다','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '06월 상영 예정작입니다','06월 상영 예정작입니다'); 
     
     INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '05월 상영 예정작입니다','05월 상영 예정작입니다','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '04월 상영 예정작입니다','04월 상영 예정작입니다'); 
     
     INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '03월 상영 예정작입니다','03월 상영 예정작입니다','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '02월 상영 예정작입니다','02월 상영 예정작입니다'); 
     
     INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, '01월 상영 예정작입니다','01월 상영 예정작입니다','noimg.jpg');    
 
     

       
     
-- Notice.xml의 id=modifyNotice(공지수정) 
UPDATE Notice SET 
     NoticeTitle='jsp servlet', 
     NoticeContent='최',  
     NoticeFile='noimg.jpg'
     WHERE NoticeNo=2; 

UPDATE Notice SET 
     NoticeTitle='jsp servlet', 
     NoticeContent='최'
     WHERE NoticeNo=1; 
     
select * from notice;

-- Notice.xml의 id=ReadCountNotice(조회수 업)
UPDATE Notice SET NoticeReadCount = NoticeReadCount +1 WHERE NoticeNo=1;
    
-- Notice.xml의 id=DeleteNotice(공지글 삭제) 
DELETE FROM Notice WHERE NoticeNo=2;

-- Notice.xml의 id=NoticeCount(공지글 갯수) 
SELECT COUNT(*) FROM NOTICE;

commit;

SELECT * FROM NOTICE WHERE NoticeNo=(SELECT MIN(NoticeNo) FROM NOTICE WHERE NoticeNo > 1);

SELECT * FROM NOTICE WHERE NoticeNo=(SELECT MAX(NoticeNo) FROM NOTICE WHERE NoticeNo < 4);

-----------------------연습장--------------------------------

SELECT * FROM (SELECT ROWNUM RN, A.* FROM
		(select q.*, m.memberName from qna q, member m where m.memberid = q.memberid
		and m.MEMBERID='AAA' order by qnano desc)
		A) WHERE RN BETWEEN 4 AND 6;


SELECT A.* FROM (SELECT m.*, MemberGradeName FROM MEMBER m,
		MemberGrade mg WHERE m.MemberGradeNo=mg.MemberGradeNo AND
		memberName='aaa') A;


SELECT ROWNUM, A.* FROM 
(select q.*, m.memberName from qna q, member m where m.memberid = q.memberid and m.MEMBERID='AAA' order by qnano desc) 
A WHERE ROWNUM BETWEEN 1 AND 5;
select * from qna;
SELECT * FROM QNA WHERE MEMBERID='AAA' order by qnano desc;



select count(*) from (select rownum, a.* from (select b.*, a.moviename,
		a.movieimage from booking b, (select m.*, su.screenupno from screenup su, movie m where su.movieno=m.movieno) a
		where b.screenupno=a.screenupno and memberid='aaa' order by bookingno desc) a);
        
select * from (select rownum rn, a.* from (select b.*, a.moviename,
		a.movieimage from
		booking b, (select m.*, su.screenupno from screenup
		su, movie m where su.movieno=m.movieno) a
		where
		b.screenupno=a.screenupno and
		memberid='aaa'
		order by
		bookingno desc) a) WHERE rn BETWEEN 1 AND 5;
        
        
        select * from seatno;
        SELECT seatno FROM BOOKINGSEAT where bookingno=2;
        select * from bookingseat;


 
 -- .xml의 id=myMovie(내가 구매한 내역 불러오기)
SELECT * FROM PURCHASEITEM;
SELECT * FROM PURCHASE;
SELECT * FROM ITEM;

SELECT P.*, pi.purchaseitemamount, PI.ITEMNO FROM PURCHASEITEM PI, PURCHASE P 
WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC;

SELECT * FROM(SELECT ROWNUM, A.* FROM ITEM I, (SELECT P.*, pi.purchaseitemamount, PI.ITEMNO FROM PURCHASEITEM PI, PURCHASE P 
WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC)A WHERE I.ITEMNO = A.ITEMNO AND MEMBERID='AAA') WHERE ROWNUM BETWEEN 1 AND 5;


SELECT * FROM(SELECT ROWNUM rn, A.*, i.itemname, i.itemimage FROM ITEM I, (SELECT P.*,
		pi.purchaseitemamount, pi.itemno FROM PURCHASEITEM PI, PURCHASE P
		WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY p.purchasedate DESC)A WHERE
		I.ITEMNO = A.ITEMNO AND MEMBERID='AAA') WHERE rn BETWEEN 1 AND 5;
        
SELECT * FROM PURCHASEITEM;
SELECT * FROM PURCHASE;
SELECT * FROM ITEM;

commit;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
(select * from PURCHASE where memberid ='AAA' ORDER BY purchase.purchaseno DESC) A) 
WHERE rn BETWEEN 1 AND 5;

        
delete from member;
select * from member;
delete from notice;
select * from notice;


SELECT PI.*, i.itemname FROM purchaseitem PI, item I
		WHERE pi.itemno=i.itemno and Pi.purchaseno=1;
