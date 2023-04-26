--getGroupList()
-- MYGROUPList() TOP-N

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MYGROUP WHERE GCOMPLETE = 'N' ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- MYGROUPTotCnt
SELECT COUNT(*) FROM MYGROUP WHERE GCOMPLETE = 'N';
-- groupLeader(mid)
SELECT COUNT(*) FROM MYGROUP WHERE MID = 'test4-3' AND GCOMPLETE='N';

--registerSTUDY(MYGROUPDto)
INSERT INTO MYGROUP (GID, GCHARACTER, MID, GTITLE, GCONTENT, GPEOPLE, 
                    GLANGUAGE1, GLANGUAGE2, GLANGUAGE3, 
                    GDEV, GDESIGN, GPM,
                    GSDATE, GFDATE, GLOC)
            VALUES(MYGROUP_SEQ.NEXTVAL, 'S', 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,
                    NULL, NULL, NULL, -- 스터디는 개발자/디자이너/기획자 NULL
                    '23/05/01','23/06/04','서울');

                    
--registerPROJECT(MYGROUPDto)
INSERT INTO MYGROUP (GID, GCHARACTER, MID, GTITLE, GCONTENT, GPEOPLE, 
                    GLANGUAGE1, GLANGUAGE2, GLANGUAGE3, 
                    GDEV, GDESIGN, GPM,
                    GSDATE, GFDATE, GLOC)
            VALUES(MYGROUP_SEQ.NEXTVAL, 'P', 'test1-1','프로젝트 사이트','모집합니다',3,
                    'Java','JavaScript',null,
                    'N', 'N', 'N',
                    '23/05/01','23/06/04','서울');
--MID로 방금 등록한(완료되지 않은 스터디) 글의 번호를 가져옴
--getRegisteredGID(mid)
DELETE FROM MYGROUP WHERE GID = 1;
SELECT GID FROM MYGROUP WHERE MID = 'test1-1' AND GCOMPLETE = 'N';
--가져온 GID와 세션의 MID로 히스토리에 저장
--insertHistory(GID,mid)
INSERT INTO GSTATUS (GSID, MID, GID, GSSTATUS)
            VALUES (GSTATUS_SEQ.NEXTVAL, 'test1-1',1,2);
--hitUp(GID)
UPDATE MYGROUP SET GHIT=GHIT+1 WHERE GID = 1;
--getMYGROUPDetail(GID)
SELECT * FROM MYGROUP WHERE GID = 1;
--modifyMYGROUP(MYGROUPDto)
UPDATE MYGROUP SET GTITLE = '스터디 모집합니다(수정)',
                GCONTENT = '모집합니다(수정)',
                GPEOPLE = 1,
                GLANGUAGE1 = 'JavaScript',
                GLANGUAGE2 = 'Spring',
                GLANGUAGE3 = 'Java',
                GSDATE = '23/05/02',
                GFDATE = '23/06/05',
                GLOC = NULL
        WHERE GID = 1;

--modifyMYGROUP(MYGROUPDto)
UPDATE MYGROUP SET GTITLE = '프로젝트 모집합니다(수정)',
                GCONTENT = '모집합니다(수정)',
                GPEOPLE = 3,
                GLANGUAGE1 = 'JavaScript',
                GLANGUAGE2 = 'Spring',
                GLANGUAGE3 = 'Java',
                GDEV = 'Y',
                GDESIGN = 'Y',
                GPM = 'Y',
                GSDATE = '23/05/02',
                GFDATE = '23/06/05',
                GLOC = NULL
        WHERE GID = 2;
        
--deleteHistory(GID)
UPDATE GSTATUS SET GSSTATUS = 4 WHERE GID = 1;
--deleteMYGROUP(GID)
UPDATE MYGROUP SET GCOMPLETE = 'D' WHERE GID = 1;
-- comment(GCOMMENT)
INSERT INTO GCOMMENT (GCID, MID, GCCONTENT, GCIP, GID)
            VALUES(GCOMMENT_SEQ.NEXTVAL, 'test1-1','ㅎㅎ','182','1');
-- commentContent(GID)
SELECT * FROM GCOMMENT WHERE GID = 1;
-- commentModify(GCOMMENT)
UPDATE GCOMMENT SET GCCONTENT = 'AA'
                    WHERE GCID= 1 ;
-- commentDelete(scId)
DELETE GCOMMENT WHERE GCID = 2;
--joinCheck(mId,GID)
SELECT * FROM GSTATUS WHERE MID = 'test1-1' AND GID = 4 AND GSSTATUS = 4;
--joinMYGROUP(GID,mId)
INSERT INTO GSTATUS (GSID, MID, GID, GSSTATUS)
            VALUES (GSTATUS_SEQ.NEXTVAL, 'teemo',1,1);
--unJoin(GID,mId)
DELETE FROM GSTATUS WHERE MID='test1-1' AND GID='2' AND GSSTATUS = 1;
SELECT * FROM GSTATUS;
SELECT COUNT(*) FROM GSTATUS WHERE MID = 'test1-1' AND GID = 2 AND GSSTATUS = 1;

--acceptMYGROUP(mId)
UPDATE GSTATUS SET GSSTATUS = 2 WHERE MID = 'teemo';
--completeMYGROUP(GID)
UPDATE GSTATUS SET GSSTATUS = 3 WHERE GID = 1;
