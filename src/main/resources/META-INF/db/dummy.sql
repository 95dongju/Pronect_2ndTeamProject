-------------------------------------------------------------------------------
------------------------------------MEMBER DUMMY-------------------------------
-------------------------------------------------------------------------------
--MANAGER (TEST)
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('manager1','manager1nick','1','매니저테스트1','zool212@naver.com',0,0,
                    'Y','Y','manager.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('manager2','manager2nick','1','매니저테스트2','hanwool.kim0312@gmail.com',0,0,
                    'Y','Y','manager.jpg');
-- MANAGER
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('pronect1','매니저_이민정','1','강동주','lmj@pronect.com',0,0,
                    'Y','Y','manager.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('pronect2','매니저_지민수','1','김한울','jms@pronect.net',0,0,
                    'Y','Y','manager.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('pronect3','매니저_최수빈','1','윤여송','csb@pronect.com',0,0,
                    'Y','Y','manager.jpg');
                    
--MEMBER_TEST_백엔드(IMG O, ROLE O / IMG O, ROLE X /IMG X, ROLE O / IMG X, ROLE X / STATE X) 
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test1-1','test1-1nick','1','멤버테스트1-1','zool212@naver.com',0,0,
                    'N','Y','test.jpg','백엔드 개발자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('test1-2','test1-2nick','1','멤버테스트1-2','zool212@naver.com',0,0,
                    'N','Y','test.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('test1-3','test1-3nick','1','멤버테스트1-3','zool212@naver.com',0,0,
                    'N','Y','백엔드 개발자');                    
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('test1-4','test1-4nick','1','멤버테스트1-4','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test1-5','test1-5nick','1','멤버테스트1-5','zool212@naver.com',0,0,
                    'N','N','test.jpg','백엔드 개발자');
                    
--MEMBER_TEST_프론트 엔드(IMG O, ROLE O / IMG O, ROLE X /IMG X, ROLE O / IMG X, ROLE X / STATE X) 
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test2-1','test2-1nick','1','멤버테스트2-1','zool212@naver.com',0,0,
                    'N','Y','test.jpg','프론트엔드 개발자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('test2-2','test2-2nick','1','멤버테스트2-2','zool212@naver.com',0,0,
                    'N','Y','test.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('test2-3','test2-3nick','1','멤버테스트2-3','zool212@naver.com',0,0,
                    'N','Y','프론트엔드 개발자');                    
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('test2-4','test2-4nick','1','멤버테스트2-4','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test2-5','test2-5nick','1','멤버테스트2-5','zool212@naver.com',0,0,
                    'N','N','test.jpg','프론트엔드 개발자');

--MEMBER_TEST_디자이너(IMG O, ROLE O / IMG O, ROLE X /IMG X, ROLE O / IMG X, ROLE X / STATE X) 
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test3-1','test3-1nick','1','멤버테스트3-1','zool212@naver.com',0,0,
                    'N','Y','test.jpg','디자이너');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('test3-2','test3-2nick','1','멤버테스트3-2','zool212@naver.com',0,0,
                    'N','Y','test.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('test3-3','test3-3nick','1','멤버테스트3-3','zool212@naver.com',0,0,
                    'N','Y','디자이너');                    
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('test3-4','test3-4nick','1','멤버테스트3-4','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test3-5','test3-5nick','1','멤버테스트3-5','zool212@naver.com',0,0,
                    'N','N','test.jpg','디자이너');
                    
--MEMBER_TEST_기획자(IMG O, ROLE O / IMG O, ROLE X /IMG X, ROLE O / IMG X, ROLE X / STATE X) 
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test4-1','test4-1nick','1','멤버테스트4-1','zool212@naver.com',0,0,
                    'N','Y','test.jpg','기획자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE)
            VALUES('test4-2','test4-2nick','1','멤버테스트4-2','zool212@naver.com',0,0,
                    'N','Y','test.jpg');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('test4-3','test4-3nick','1','멤버테스트4-3','zool212@naver.com',0,0,
                    'N','Y','기획자');                    
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('test4-4','test4-4nick','1','멤버테스트4-4','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('test4-5','test4-5nick','1','멤버테스트4-5','zool212@naver.com',0,0,
                    'N','N','test.jpg','기획자');
                    
-- MEMBER
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('zol212','박한','1','박한울','zool212@naver.com',0,0,
                    'N','Y', '백엔드 개발자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MIMAGE, MROLE)
            VALUES('teemo','^오^','1','김진호','zool212@naver.com',0,0,
                    'N','Y','teemo.jpg','디자이너');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('abc123','abc','1','박정민','zool212@naver.com',0,0,
                    'N','N','프론트엔드 개발자');                    
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('sososo','soso','1','이소정','zool212@naver.com',0,0,
                    'N','Y', '기획자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE, MROLE)
            VALUES('king99','왕구','1','이왕구','zool212@naver.com',0,0,
                    'N','Y','프론트엔드 개발자');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('goo','googoo','1','구스만','gool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('lolo112','lolo','1','최아루','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MSTATE)
            VALUES('suzume','문단속','1','김인호','zool212@naver.com',0,0,
                    'N','Y');
INSERT INTO MEMBER (MID, MNICKNAME, MPW, MNAME, MMAIL, MSCORE, MEVALNUM,
                    MANAGER, MIMAGE, MSTATE)
            VALUES('johnwick','존웍','1','박준익','zool212@naver.com',0,0,
                    'N','johnwick.jpg','Y');
SELECT * FROM MEMBER;
SELECT * FROM SSTATUS;
SELECT * FROM STUDY;
commit;
-------------------------------------------------------------------------------
------------------------------------FREEBOARD DUMMY----------------------------
-------------------------------------------------------------------------------
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (1, 'abc123', '오늘 점심 뭐먹을까요?','제곧내',
                    1,0,0,'192.0.0.1');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (2, 'suzume', '김치찌개 추천','신촌에 맛있는 김치찌개집 있어요',
                    1,1,1,'192.0.0.2');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (3, 'teemo', '요즘 막나가는 챗 GPT 근황','미안하다 이거 보여주려고 어그로끌었다',
                    3,0,0,'192.0.0.3');  
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (4, 'abc123', '오늘 점심 뭐먹을까요?','제곧내',
                    4,0,0,'192.0.0.1');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (5, 'suzume', '김치찌개 추천','신촌에 맛있는 김치찌개집 있어요',
                    4,1,1,'192.0.0.2');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (6, 'teemo', '요즘 막나가는 챗 GPT 근황','미안하다 이거 보여주려고 어그로끌었다',
                    6,0,0,'192.0.0.3');  
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (7, 'abc123', '오늘 점심 뭐먹을까요?','제곧내',
                    7,0,0,'192.0.0.1');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (8, 'suzume', '김치찌개 추천','신촌에 맛있는 김치찌개집 있어요',
                    7,1,1,'192.0.0.2');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (9, 'teemo', '요즘 막나가는 챗 GPT 근황','미안하다 이거 보여주려고 어그로끌었다',
                    9,0,0,'192.0.0.3');  
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (10, 'abc123', '오늘 점심 뭐먹을까요?','제곧내',
                    10,0,0,'192.0.0.1');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (11, 'suzume', '김치찌개 추천','신촌에 맛있는 김치찌개집 있어요',
                    10,1,1,'192.0.0.2');
INSERT INTO FBOARD (FID, MID, FTITLE, FCONTENT,
                    FGROUP, FSTEP, FINDENT, FIP)
            VALUES (12, 'teemo', '요즘 막나가는 챗 GPT 근황','미안하다 이거 보여주려고 어그로끌었다',
                    12,0,0,'192.0.0.3');  
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM FBOARD ORDER BY FGROUP DESC, FINDENT)A) 
WHERE RN BETWEEN 1 AND 20;
-------------------------------------------------------------------------------
------------------------------------FCOMMENT DUMMY-----------------------------
-------------------------------------------------------------------------------
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID)
            VALUES (1,'king99','버거킹 드세요 먹을거 없어요 근처에','197.0.0.1',1);
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID)
            VALUES (2,'johnwick','한국인은 국밥이죠 역시','196.0.0.2',1);
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID)
            VALUES (3,'zol212','ㄹㅇㅋㅋ','191.0.0.2',3);            
INSERT INTO FCOMMENT (FCID, MID, FCCONTENT, FCIP, FID)
            VALUES (4,'sososo','거기 맛있는데 점심에 1인 입장 안돼서 친구 없으면 못먹음','191.0.0.2',2); 
SELECT * FROM FCOMMENT;
-------------------------------------------------------------------------------
------------------------------------QBOARD DUMMY----------------------------------
-------------------------------------------------------------------------------
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(1, 'lolo112','스터디 그룹 정보를 수정하는 방법 알려주세요.','찾아봐도 안보입니다.',
                 1, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(2, 'pronect2','스터디 그룹 정보를 수정하는 방법 알려주세요.','프로젝트 그룹 관리 기능 중 수정 기능이 있습니다.',
                 1, 1, 1);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(3, 'sososo','스터디 그룹은 여러개 가입할 수 있나요?','가입 전 혹시몰라 문의드립니다.',
                 3, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(4, 'pronect2','스터디 그룹은 여러개 가입할 수 있나요?','여러 그룹에 가입 가능합니다.',
                 3, 1, 1);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(5, 'lolo112','스터디 그룹 정보를 수정하는 방법 알려주세요.','찾아봐도 안보입니다.',
                 5, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(6, 'pronect2','스터디 그룹 정보를 수정하는 방법 알려주세요.','프로젝트 그룹 관리 기능 중 수정 기능이 있습니다.',
                 5, 1, 1);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(7, 'sososo','스터디 그룹은 여러개 가입할 수 있나요?','가입 전 혹시몰라 문의드립니다.',
                 7, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(8, 'pronect2','스터디 그룹은 여러개 가입할 수 있나요?','여러 그룹에 가입 가능합니다.',
                 7, 1, 1);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(9, 'lolo112','스터디 그룹 정보를 수정하는 방법 알려주세요.','찾아봐도 안보입니다.',
                 9, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(10, 'pronect2','스터디 그룹 정보를 수정하는 방법 알려주세요.','프로젝트 그룹 관리 기능 중 수정 기능이 있습니다.',
                 9, 1, 1);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(11, 'sososo','스터디 그룹은 여러개 가입할 수 있나요?','가입 전 혹시몰라 문의드립니다.',
                 11, 0, 0);
INSERT INTO QBOARD (QID, MID, QTITLE, QCONTENT,
                 QGROUP, QSTEP, QINDENT)
         VALUES(12, 'pronect2','스터디 그룹은 여러개 가입할 수 있나요?','여러 그룹에 가입 가능합니다.',
                 11, 1, 1); 
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM QBOARD ORDER BY QGROUP DESC, QINDENT)A) 
WHERE RN BETWEEN 1 AND 20;
-------------------------------------------------------------------------------
------------------------------------NBOARD DUMMY-------------------------------
-------------------------------------------------------------------------------
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(1, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(2, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(3, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');      
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(4, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(5, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(6, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');    
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(7, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(8, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(9, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');    
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(10, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(11, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(12, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(13, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(14, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(15, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');      
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(16, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(17, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(18, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');    
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(19, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(20, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(21, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');    
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(22, 'pronect2','일정 게시판 이용시 주의사항','내용에는 상세 내용을 입력하면 팀원 모집 및 운영에 큰 도움이 됩니다. 이 점 참고하여 글 작성 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(23, 'pronect3','아이디와 닉네임 설정시 비속어 사용은 다른 이들을 불쾌하게 만들 수 있습니다.','최근 닉네임에 불쾌감을 유발하는 단어를 사용한 사례가 있었습니다. 자신의 닉네임을 체크해주시고 해당 사항이 있다면 수정 부탁드립니다.');
INSERT INTO NBOARD (NID, MID, NTITLE, NCONTENT)
                VALUES(24, 'pronect1','웹사이트 이용중 문의사항 관련','문의사항은 자유게시판이 아닌 문의 게시판에 올려주시면 조속한 조치 취해드리고 있습니다. 자유게시판은 모든 글 확인이 어려운 관계로 꼭 문의 게시판에 문의 부탁드립니다.');  
SELECT * FROM NBOARD;
-------------------------------------------------------------------------------
------------------------------------STUDY DUMMY--------------------------------
-------------------------------------------------------------------------------               
SELECT * FROM STUDY;

INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(1, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/05/01','23/06/04','서울');
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(2, 'test2-3','스터디원 모집','모집합니다',5,
                    null,null,null,'23/05/01','23/06/04',null);
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(3, 'test3-4','모각코 하실분 모집합니다','경기권 4명 모집합니다',5,
                    null,null,null,'23/05/20','23/07/30','경기');
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(4, 'test4-1','같이 공부하실분 모아요','혼자 하면 퍼져서 같이 공부하실 분 찾습니다',3,
                    null,null,null,'23/04/20','23/05/20','서울');
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(5, 'test1-3','같이 공부해요','같이 공부하실 분 찾습니다',4,
                    'Spring','Java','JavaScript','23/05/01','23/05/26','서울');
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(6, 'test3-3','같이 리액트 공부하실 분','같이 리액트 공부하실 분',3,
                    'React','Node',null,'23/05/01','23/05/16',null);
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(7, 'test4-2','6월부터 같이 공부하실분 있나요','6월부터 같이 공부하실 분 찾습니다',6,
                    'Spring',null,null,'23/06/05','23/07/14',null);
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC, SCOMPLETE)
            VALUES(8, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/02/01','23/04/04','서울','Y');
SELECT * FROM STUDY;
-------------------------------------------------------------------------------
-------------------------  STUDYCOMMENT DUMMY ---------------------------------
-------------------------------------------------------------------------------
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(1, 'test1-2','지역이 어떻게 되시나요?','193.0.0.1',5);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(2, 'test1-3','경기, 서울 다 가능합니다','192.0.0.2',5);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(3, 'teemo','마침 6월에 시작하는 그룹 찾고있었는데','191.0.0.2',7);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(4, 'johnwick','1등','183.0.0.3',3);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(5, 'abc123','유치하네요 난 2등','188.0.0.1',3);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(6, 'king99','모각코가 뭔가요?','193.0.0.1',3);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(7, 'lolo112','모여서 각자 코딩입니다','187.0.0.1',3);
INSERT INTO SCOMMENT (SCID, MID, SCCONTENT, SCIP, SID)
            VALUES(8, 'zol212','ㄹㅇㅋㅋ','191.0.0.2',3);
SELECT * FROM SCOMMENT;
-------------------------------------------------------------------------------
-------------------------  SSTATUS DUMMY  -------------------------------------
-------------------------------------------------------------------------------
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (1, 'test1-1',1,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (2, 'test2-3',2,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (3, 'test3-4',3,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (4, 'test4-1',4,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (5, 'test1-3',5,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (6, 'test3-3',6,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (7, 'test4-2',7,2);
INSERT INTO SSTATUS (SSID, MID, SID, SSSTATUS) VALUES (8, 'test1-1',8,3);
COMMIT;
-------------------------------------------------------------------------------
------------------------------------PROJECT DUMMY--------------------------------
-------------------------------------------------------------------------------               
SELECT * FROM PROJECT;

INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(1, 'test1-1','프로젝트모집','모집합니다',5,
                    'Java','JavaScript',null,'23/05/01','23/06/04',1,1,2,'서울');
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(2, 'test2-3','프로젝트원 모집','모집합니다',5,
                    null,null,null,'23/05/01','23/06/04',1,0,3,null);
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(3, 'test3-4','프로젝트 하실분 모집합니다','경기권 4명 모집합니다',5,
                    null,null,null,'23/05/20','23/07/30',1,1,2,'경기');
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(4, 'test4-1','같이 프로젝트하실분 모아요','혼자 하면 퍼져서 같이 공부하실 분 찾습니다',3,
                    null,null,null,'23/04/20','23/05/20',2,1,0,'서울');
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(5, 'test1-3','같이 공부해요','같이 공부하실 분 찾습니다',4,
                    'Spring','Java','JavaScript','23/05/01','23/05/26',1,1,2,'서울');
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(6, 'test3-3','같이 프로젝트하실 분','같이 리액트 공부하실 분',3,
                    'React','Node',null,'23/05/01','23/05/16',2,1,0,null);
INSERT INTO STUDY (SID, MID, STITLE, SCONTENT, SPEOPLE, 
                    SLANGUAGE1, SLANGUAGE2, SLANGUAGE3, SSDATE, SFDATE, SLOC)
            VALUES(7, 'test4-2','6월부터 같이 프로젝트 있나요','6월부터 같이 공부하실 분 찾습니다',6,
                    'Spring',null,null,'23/06/05','23/07/14',1,2,3,null);
INSERT INTO STUDY (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC,PCOMPLETE)
            VALUES(8, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/02/01','23/04/04',1,2,2,'서울','Y');
SELECT * FROM STUDY;