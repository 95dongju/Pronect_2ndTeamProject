--getGroupList()
-- StudyList() TOP-N

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM STUDY WHERE SCOMPLETE = 'N' ORDER BY SID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- studyTotCnt
SELECT COUNT(*) FROM STUDY WHERE SCOMPLETE = 'N';
-- groupLeader(mid)
SELECT COUNT(*) FROM STUDY WHERE MID = 'test4-3' AND SCOMPLETE='N';
--registerGroup(studyDto)
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(STUDY_SEQ.NEXTVAL, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/05/01','23/06/04','서울');
--MID로 방금 등록한(완료되지 않은 스터디) 글의 번호를 가져옴
--getRegisteredSid(mid)
DELETE FROM STUDY WHERE SID = 1;
SELECT SID FROM STUDY WHERE MID = 'test4-3' AND  SCOMPLETE = 'N';
--가져온 SID와 세션의 MID로 히스토리에 저장
--insertHistory(sid,mid)
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS)
            VALUES (SSTATUS_SEQ.NEXTVAL, 'test1-1',100,2);
--hitUp(sId)
UPDATE STUDY SET SHIT=SHIT+1 WHERE SID = 1;
--getStudyDetail(sId)
SELECT * FROM STUDY WHERE SID = 1;
--modifyStudy(studyDto)
UPDATE STUDY SET STITLE = '스터디 모집합니다(수정)',
                SCONTENT = '모집합니다(수정)',
                SPEOPLE = 4,
                SLANGUAGE1 = 'JavaScript',
                SLANGUAGE2 = 'Spring',
                SLANGUAGE3 = 'Java',
                SSDATE = '23/05/02',
                SFDATE = '23/06/05',
                SLOC = NULL
        WHERE SID = 1;
--deleteHistory(sId)
UPDATE SSTATUS SET SSSTATUS = 4 WHERE SID = 1;
--deleteStudy(sId)
UPDATE STUDY SET SCOMPLETE = 'D' WHERE SID = 1;
-- comment(scomment)
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(SCOMMENT_SEQ.NEXTVAL, 'test1-1','ㅎㅎ','182','1');
-- commentContent(sid)
SELECT * FROM SCOMMENT WHERE SID = 3;
-- commentModify(scomment)
UPDATE SCOMMENT SET SCCONTENT = 'AA'
                    WHERE SCID=8;
-- commentDelete(scId)
DELETE SCOMMENT WHERE SCID=8;
--joinCheck(mId,sId)
SELECT COUNT(*) FROM SSTATUS WHERE MID = 'test2-3' AND SID = 2 AND SSSTATUS = 1;
--joinStudy(sId,mId)
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS)
            VALUES (SSTATUS_SEQ.NEXTVAL, 'teemo',1,1);
--acceptStudy(mId)
UPDATE SSTATUS SET SSSTATUS = 2 WHERE MID = 'teemo';
--completeStudy(sId)
UPDATE SSTATUS SET SSSTATUS = 3 WHERE SID = 1;