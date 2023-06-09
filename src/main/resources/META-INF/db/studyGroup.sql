--getGroupList()

SELECT * FROM MYGROUP;
select * from gstatus;
delete from gstatus where gid = 17 and mid = 'teemo';
-- MYGROUPList() TOP-N
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MYGROUP WHERE GCOMPLETE = 'N' ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- MYGROUPTotCnt
SELECT COUNT(*) FROM MYGROUP WHERE GCOMPLETE = 'N';
-- studyList() TOP-N
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT GID, GCHARACTER, M.MID MID, MIMAGE, MNICKNAME, GTITLE, GCONTENT, GPEOPLE, GCURPEOPLE,
            GLANGUAGE1, GLANGUAGE2, GLANGUAGE3, GDEV, GDESIGN, GPM, GRDATE, GSDATE, GFDATE, GHIT, GLOC, GCOMPLETE 
            FROM MYGROUP G,MEMBER M WHERE G.MID = M.MID AND GCOMPLETE = 'N' AND GCHARACTER='S' ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- studyTotCnt
SELECT COUNT(*) FROM MYGROUP WHERE GCOMPLETE = 'N' AND GCHARACTER='S';
-- projectList() TOP-N
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MYGROUP WHERE GCOMPLETE = 'N' AND GCHARACTER='P' ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10;
-- projectTotCnt
SELECT COUNT(*) FROM MYGROUP WHERE GCOMPLETE = 'N'AND GCHARACTER='P' ;
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
SELECT * FROM MEMBER;
UPDATE MEMBER SET MIMAGE='noprofile.jpg' WHERE MIMAGE = 'test.jpg';
UPDATE MEMBER SET MIMAGE='noprofile.jpg' WHERE MIMAGE is null;
--getMYGROUPDetail(GID)
SELECT M.MID MID, MIMAGE, MNICKNAME, GCHARACTER, GRDATE, GID ,GTITLE, GCONTENT, GPEOPLE, GLANGUAGE1, GLANGUAGE2, GLANGUAGE3, GDEV, GDESIGN, GPM, TO_CHAR(GSDATE, 'YYYY-MM-DD') GSDATE, TO_CHAR(GFDATE, 'YYYY-MM-DD') GFDATE, GLOC
    FROM MYGROUP G,MEMBER M WHERE G.MID=M.MID AND GID=1;
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
-- getCommentCnt(gid)
SELECT COUNT(*) FROM MYGROUP G, GCOMMENT C WHERE G.GID=C.GID AND G.GID = #{gid};
-- commentContent(GID)
SELECT * FROM GCOMMENT WHERE GID = 1;
-- commentModify(GCOMMENT)
UPDATE GCOMMENT SET GCCONTENT = 'AA'
                    WHERE GCID= 1 ;
-- commentDelete(scId)
DELETE GCOMMENT WHERE GCID = 2;
--joinCheck(mId,GID)
SELECT * FROM GSTATUS WHERE MID = 'test1-1' AND GID = 4 AND GSSTATUS = 4;
--joinGroup(gid,mId)
INSERT INTO GSTATUS (GSID, MID, GID, GSSTATUS)
            VALUES (GSTATUS_SEQ.NEXTVAL, 'teemo',1,1);
--unJoinGroup(gid,mId)
DELETE FROM GSTATUS WHERE MID = #{mid} AND GID = #{gid} AND GSSTATUS = 1;
--joinList(gid)
SELECT MIMAGE, M.MID MID, GID, GSID ,GSSTATUS,MNICKNAME FROM MEMBER M, GSTATUS G WHERE M.MID = G.MID AND G.GID = 1 AND GSSTATUS= 1;
--acceptGroup(mid,gid)
UPDATE GSTATUS SET GSSTATUS = 2 WHERE MID = 'test1-1' AND GID = 3 AND GSSTATUS = 1;
--memberPlus(gid)
UPDATE MYGROUP SET GCURPEOPLE = GCURPEOPLE+1 WHERE GID = #{gid};
--memberFullCheck(gid)
SELECT GPEOPLE, GCURPEOPLE FROM MYGROUP WHERE GID = 1;
SELECT * FROM MEMBER;
--peopleFull(gid)
UPDATE MYGROUP SET GCOMPLETE = 'F' WHERE GID = #{gid};
--groupMember(gid)
SELECT GSID, M.MID MID, MIMAGE, MNICKNAME, GID FROM MEMBER M, GSTATUS G WHERE M.MID = G.MID AND GID = #{gid} AND GSSTATUS = 2;
--memberOut(mid,gid)
UPDATE GSTATUS SET GSSTATUS = 1 WHERE MID = #{mid} AND GID = #{gid} AND GSSTATUS = 2;
--memberMinus(gid)
UPDATE MYGROUP SET GCURPEOPLE = GCURPEOPLE-1 WHERE GID = #{gid};
--peopleUnFull(gid)
UPDATE MYGROUP SET GCOMPLETE = 'N' WHERE GID = #{gid};
--completeGroup(gid)
UPDATE GSTATUS SET GSSTATUS = 3 WHERE GID = 1;
--joinDelete(gid)
DELETE FROM GSTATUS WHERE GID = #{gid} AND GSSTATUS = 1;
--MyStudyList(mid) 대기(1) & 진행 중(2)
SELECT * FROM (SELECT ROWNUM RN, A.*, COALESCE(C.COMMENT_COUNT, 0) AS COMMENT_COUNT
		FROM 
		    (SELECT S.GSSTATUS, G.GID, G.GCHARACTER, M.MID, M.MIMAGE, M.MNICKNAME, G.GTITLE, G.GCONTENT, G.GPEOPLE, G.GCURPEOPLE,
		           G.GLANGUAGE1, G.GLANGUAGE2, G.GLANGUAGE3, G.GDEV, G.GDESIGN, G.GPM, G.GRDATE, G.GSDATE, G.GFDATE, G.GHIT, G.GLOC, G.GCOMPLETE 
		    FROM MYGROUP G
		    INNER JOIN MEMBER M ON G.MID = M.MID 
            INNER JOIN GSTATUS S ON S.GID = G.GID 
		    WHERE G.GCOMPLETE = 'N' AND GCHARACTER = 'S'
            AND M.MID = 'test1-1' 
            AND S.GSSTATUS = 2 OR S.GSSTATUS = 1
		    ORDER BY G.GID DESC) A
		LEFT JOIN 
		    (SELECT GID, COUNT(*) AS COMMENT_COUNT
		    FROM GCOMMENT
		    GROUP BY GID) C
		ON A.GID = C.GID)
		WHERE RN BETWEEN 1 AND 10;
--totCntMyStudy_ing
SELECT * FROM GSTATUS S, MYGROUP G WHERE S.GID = G.GID AND S.MID = 'test1-1' AND GCHARACTER = 'S' AND (S.GSSTATUS = 2 OR S.GSSTATUS = 1);
--MyProjectList(mid) 대기(1) & 진행 중(2)
SELECT * FROM (SELECT ROWNUM RN, A.*, COALESCE(C.COMMENT_COUNT, 0) AS COMMENT_COUNT
		FROM 
		    (SELECT S.GSSTATUS, G.GID, G.GCHARACTER, M.MID, M.MIMAGE, M.MNICKNAME, G.GTITLE, G.GCONTENT, G.GPEOPLE, G.GCURPEOPLE,
		           G.GLANGUAGE1, G.GLANGUAGE2, G.GLANGUAGE3, G.GDEV, G.GDESIGN, G.GPM, G.GRDATE, G.GSDATE, G.GFDATE, G.GHIT, G.GLOC, G.GCOMPLETE 
		    FROM MYGROUP G
		    INNER JOIN MEMBER M ON G.MID = M.MID 
            INNER JOIN GSTATUS S ON S.GID = G.GID 
		    WHERE G.GCOMPLETE = 'N' AND GCHARACTER = 'P'
            AND M.MID = 'test1-1' 
            AND S.GSSTATUS = 2 OR S.GSSTATUS = 1
		    ORDER BY G.GID DESC) A
		LEFT JOIN 
		    (SELECT GID, COUNT(*) AS COMMENT_COUNT
		    FROM GCOMMENT
		    GROUP BY GID) C
		ON A.GID = C.GID)
		WHERE RN BETWEEN 1 AND 10;
--totCntMyProject_ing
SELECT * FROM GSTATUS S, MYGROUP G WHERE S.GID = G.GID AND S.MID = 'test1-1' AND S.GSSTATUS = 3;
--MyHistory(mid) 종료(3)
SELECT * FROM (SELECT ROWNUM RN, A.*, COALESCE(C.COMMENT_COUNT, 0) AS COMMENT_COUNT
		FROM 
		    (SELECT S.GSSTATUS, G.GID, G.GCHARACTER, M.MID, M.MIMAGE, M.MNICKNAME, G.GTITLE, G.GCONTENT, G.GPEOPLE, G.GCURPEOPLE,
		           G.GLANGUAGE1, G.GLANGUAGE2, G.GLANGUAGE3, G.GDEV, G.GDESIGN, G.GPM, G.GRDATE, G.GSDATE, G.GFDATE, G.GHIT, G.GLOC, G.GCOMPLETE 
		    FROM MYGROUP G
		    INNER JOIN MEMBER M ON G.MID = M.MID 
            INNER JOIN GSTATUS S ON S.GID = G.GID 
		    WHERE G.GCOMPLETE = 'N'
            AND M.MID = 'test1-1' 
            AND S.GSSTATUS = 3
		    ORDER BY G.GID DESC) A
		LEFT JOIN 
		    (SELECT GID, COUNT(*) AS COMMENT_COUNT
		    FROM GCOMMENT
		    GROUP BY GID) C
		ON A.GID = C.GID)
		WHERE RN BETWEEN 1 AND 10;
--hitGroup()
SELECT ROWNUM, A.* FROM (SELECT * FROM MYGROUP WHERE GCOMPLETE='N' ORDER BY GHIT DESC) A WHERE ROWNUM BETWEEN 1 AND 10;
--giveUp(gid)
UPDATE GSTATUS SET GSSTATUS = 4 WHERE GID = #{gid};

--Study/Project Search (title)
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MYGROUP WHERE GCOMPLETE = 'N' AND GTITLE LIKE '%'||'좌'||'%' ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10;
--Study/Project Search (language)
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM MYGROUP WHERE GCOMPLETE = 'N' AND (GLANGUAGE1 LIKE 'Spring' OR GLANGUAGE2 LIKE 'Spring' OR GLANGUAGE3 LIKE 'Spring') ORDER BY GID DESC) A) 
WHERE RN BETWEEN 1 AND 10;