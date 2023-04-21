--getGroupList()
-- TOP-N
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM STUDY WHERE SCOMPLETE = 'N' ORDER BY SID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- TOTCNT
SELECT COUNT(*) FROM STUDY WHERE SCOMPLETE = 'N';
--registerGroup(studyDto)
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(STUDY_SEQ.NEXTVAL, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/05/01','23/06/04','서울');
--MID로 방금 등록한(완료되지 않은 스터디) 글의 번호를 가져옴
SELECT SID FROM STUDY WHERE MID = 'test1-1' AND  SCOMPLETE = 'N';
--가져온 SID와 세션의 MID로 히스토리에 저장
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS)
            VALUES (SSTATUS_SEQ.NEXTVAL, 'test1-1',100,2);
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
--deleteStudy(sId)
UPDATE SSTATUS SET SSSTATUS = 4 WHERE SID = 1;
UPDATE STUDY SET SCOMPLETE = 'D' WHERE SID = 1;
-- comment(commentDto)
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(SCOMMENT_SEQ.NEXTVAL, 'test1-1','ㅎㅎ','182','1');
-- commentContent(sid)
SELECT * FROM SCOMMENT WHERE SID = 1;
-- commentModify(commentDto)
UPDATE SCOMMENT SET SCCONTENT = 'AA'
                    WHERE SCID=8;
-- commentDelete(scId)
DELETE SCOMMENT WHERE SCID=8;
--joinStudy(sId,mId)
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS)
            VALUES (SSTATUS_SEQ.NEXTVAL, 'teemo',1,1);
--acceptStudy(mId)
UPDATE SSTATUS SET SSSTATUS = 2 WHERE MID = 'teemo';
--completeStudy(sId)
UPDATE SSTATUS SET SSSTATUS = 3 WHERE SID = 1;