-- �� �� �� Member.xml �� �� �� 
-- Member.xml�� idConfirm (id�ߺ�üũ) 
SELECT COUNT(*) FROM MEMBER WHERE MemberId='AAA'; 
 

-- Member.xml�� id=joinMember(ȸ������) 
INSERT INTO MEMBER(MemberId, MemberPw, MemberName, MemberBirth, MemberPhone, MemberEmail, MemberAddress, MemberPost)
  VALUES('AAA', 'AAA', 'AAA', TO_DATE('941201', 'YYMMDD'), '01075596366', 'AAA@AAA', '��������', '04255'); 
      
-- Memeber.xml�� id=getMember(MemberId�� ȸ������ ��������) 
SELECT * FROM MEMBER WHERE MemberId='AAA'; 

-- Memeber.xml�� id=searchMemberId(�̸��� ��ȭ��ȣ�� ȸ�����̵� ��������) 
SELECT MemberId FROM MEMBER WHERE MemberName='���浿' and MemberPhone='01099998888';

-- Memeber.xml�� id=searchMemberPw(���̵�� ��ȭ��ȣ�� ȸ�����̵� ��������) 
SELECT MemberPw FROM MEMBER WHERE MemberId='AAA' and MemberPhone='01099998888';
 
 
-- Member.xml�� id=modifyMember(ȸ�����������ϱ�) 
UPDATE MEMBER SET 
     MemberPw='111', 
     MemberName='���浿', 
     MemberPhone='010-9999-8888',
     MemberEmail='hybrid@tj.com', 
     MemberAddress='����� ��걸',
     MemberPost='����� ��걸'
     WHERE MemberId='AAA'; 
 commit; 
 
 
 -- Member.xml�� id=callLogin(��ȭ��ȣ�� �α����ϱ�)
SELECT * FROM MEMBER WHERE MEMBERPHONE='01077777777';
 

-- �� �� �� Admin.xml �� �� �� 
-- Admin.xml�� id=MemberListAll (ȸ���̸�������� ���) 
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM MEMBER order by MemberName desc ) A) 
     WHERE RN BETWEEN 1 AND 15; 
     
SELECT * FROM (SELECT ROWNUM RN, A.*
		FROM (SELECT m.*, MemberGradeName FROM MEMBER m, membergrade mg 
        WHERE m.MemberGradeNo=mg.MemberGradeNo ORDER BY MemberName DESC ) A)
		WHERE RN BETWEEN 1 AND 15;


-- Admin.xml�� id=MemberGradeList(MemberId�� ȸ������ ��������) 
SELECT * FROM MEMBER WHERE MemberId='AAA'; 

-- Admin.xml�� id=MemberGradeUpdate(MemberId�� ȸ������ ��������)   
UPDATE MEMBER SET
		MemberGradeNo='1' WHERE MemberId='AAA';
        
-- Admin.xml�� id=MemberStop(MemberId�� ȸ��������Ű��)           
UPDATE MEMBER SET
		MemberState=1
		WHERE MemberId='AAA';
    
select * from member;
    
commit;

-- �� �� �� Notice.xml �� �� �� 
-- Notice.xml�� id=NoticeListPaging(������� top-N����) 
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM Notice order by NoticeNo desc) A) 
     WHERE RN BETWEEN 1 AND 15; 
     
SELECT * FROM (SELECT ROWNUM RN, A.* 
             FROM (SELECT * FROM Notice order by NoticeNo desc) A) 
     WHERE RN BETWEEN 1 AND 15; 

-- Notice.xml�� id=registerNotice(å���) 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent, NoticeFile) VALUES 
     (NOTICESEQUENCE.NEXTVAL, 'html','�ֹ���','noimg.jpg');    
 
INSERT INTO Notice (NoticeNo, NoticeTitle, NoticeContent) VALUES 
     (NOTICESEQUENCE.NEXTVAL, 'python','ȫ�浿'); 
     
-- Notice.xml�� id=modifyNotice(å��������) 
UPDATE Notice SET 
     NoticeTitle='jsp servlet', 
     NoticeContent='��',  
     NoticeFile='noimg.jpg'
     WHERE NoticeNo=2; 

UPDATE Notice SET 
     NoticeTitle='jsp servlet', 
     NoticeContent='��'
     WHERE NoticeNo=1; 
     
select * from notice;

-- Notice.xml�� id=ReadCountNotice(��ȸ�� ��)
UPDATE Notice SET NoticeReadCount = NoticeReadCount +1 WHERE NoticeNo=1;
    
-- Notice.xml�� id=DeleteNotice(������ ����) 
DELETE FROM Notice WHERE NoticeNo=2;

-- Notice.xml�� id=NoticeCount(������ ����) 
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
