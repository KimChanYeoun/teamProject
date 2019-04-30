-- ★ ★ ★ Member.xml ★ ★ ★ 
-- Member.xml의 idConfirm (id중복체크) 
SELECT COUNT(*) FROM MEMBER WHERE MemberId='AAA'; 
 

-- Member.xml의 id=joinMember(회원가입) 
INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('AAA', 'AAA', 'AAA', TO_DATE('941201', 'YYMMDD'), '01075596366', 'AAA@AAA', 'ㅁㅁㅁ시', '04255'); 
      
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
 

-- ★ ★ ★ Admin.xml ★ ★ ★ 
-- Admin.xml의 id=MemberListAll (회원이름순서대로 출력) 
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM MEMBER order by MemberName desc ) A) 
     WHERE RN BETWEEN 1 AND 15; 
     
SELECT * FROM (SELECT ROWNUM RN, A.*
		FROM (SELECT m.*, MemberGradeName FROM MEMBER m, membergrade mg 
        WHERE m.MemberGradeNo=mg.MemberGradeNo ORDER BY MemberName DESC ) A)
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

-- Notice.xml의 id=registerNotice(책등록) 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, 'html','최범석','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, 'python','홍길동'); 
     
-- Notice.xml의 id=modifyNotice(책정보수정) 
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






SELECT A.* FROM (SELECT m.*, MemberGradeName FROM MEMBER m,
		MemberGrade mg WHERE m.MemberGradeNo=mg.MemberGradeNo AND
		memberName='aaa') A;
        
        
        
        
        
SELECT P.*,
		pi.purchaseitemamount, PI.ITEMNO FROM
		PURCHASEITEM PI, PURCHASE P
		WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY
		p.purchasedate
		DESC;
        
SELECT * FROM(SELECT ROWNUM RN, A.*, i.itemname, i.itemimage
		FROM ITEM I, (SELECT P.*,
		 PI.ITEMNO FROM
		PURCHASEITEM PI, PURCHASE P
		WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY
		p.purchasedate
		DESC)A) A WHERE I.ITEMNO = A.ITEMNO AND
		MEMBERID='AAA') WHERE RN BETWEEN 1
		AND 5;


SELECT * FROM(SELECT ROWNUM RN, A.*, i.itemname, i.itemimage
		FROM ITEM I, (SELECT P.*, PI.ITEMNO FROM
		PURCHASEITEM PI, PURCHASE P
		WHERE PI.PURCHASENO=P.PURCHASENO ORDER BY
		p.purchasedate
		DESC)A WHERE I.ITEMNO = A.ITEMNO AND
		MEMBERID='AAA') WHERE RN BETWEEN 1
		AND 5
