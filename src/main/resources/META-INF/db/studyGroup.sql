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
DELETE FROM SSTATUS WHERE SID = 1;
DELETE FROM SCOMMENT WHERE SID = 1;
DELETE FROM STUDYPLAN WHERE SID = 1;
DELETE FROM STUDY WHERE SID = 1;
--joinStudy(sId,mId)

--acceptStudy(mId)
--completeStudy(sId)
