----------------------------------------------------------------------
-------------------------  DROP EVERYTHING  --------------------------
----------------------------------------------------------------------
-- DROP TABLE
DROP TABLE PSTATUS;
DROP TABLE SSTATUS;
DROP TABLE PCOMMENT;
DROP TABLE PROJECT;
DROP TABLE SCOMMENT;
DROP TABLE STUDY;
DROP TABLE NBOARD;
DROP TABLE QBOARD;
DROP TABLE FCOMMENT;
DROP TABLE FBOARD;
DROP TABLE MEMBER;

-- DROP SEQ
DROP SEQUENCE PSTATUS_SEQ;
DROP SEQUENCE SSTATUS_SEQ;
DROP SEQUENCE PCOMMENT_SEQ;
DROP SEQUENCE PROJECT_SEQ;
DROP SEQUENCE SCOMMENT_SEQ;
DROP SEQUENCE STUDY_SEQ;
DROP SEQUENCE NBOARD_SEQ;
DROP SEQUENCE QBOARD_SEQ;
DROP SEQUENCE FCOMMENT_SEQ;
DROP SEQUENCE FBOARD_SEQ;
----------------------------------------------------------------------
-----------------------------  MEMBER  -------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE MEMBER(
    MID       VARCHAR2(100) PRIMARY KEY,
    MNICKNAME VARCHAR2(100) NOT NULL,
    MPW       VARCHAR2(100) NOT NULL,
    MNAME     VARCHAR2(100) NOT NULL,
    MMAIL     VARCHAR2(100) NOT NULL,
    MDATE     DATE          DEFAULT SYSDATE,
    MSCORE    NUMBER(5)     DEFAULT 0,
    MEVALNUM  NUMBER(4)     DEFAULT 0,
    MANAGER   VARCHAR2(1)   DEFAULT 'N',
    MSTATE    VARCHAR2(1)   DEFAULT 'Y',
    MIMAGE    VARCHAR2(100),
    MROLE     VARCHAR2(100)
);
----------------------------------------------------------------------
----------------------------  FREEBOARD  -----------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE FBOARD(
    FID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    FTITLE   VARCHAR2(300)  NOT NULL,
    FCONTENT VARCHAR2(4000) NOT NULL,
    FFILE    VARCHAR2(100),
    FRDATE   DATE           DEFAULT SYSDATE,
    FGROUP   NUMBER(5)      NOT NULL,
    FSTEP    NUMBER(2)      NOT NULL,
    FINDENT  NUMBER(2)      NOT NULL,
    FIP      VARCHAR2(100)  NOT NULL,
    FHIT     NUMBER(7)      DEFAULT 0,
    FLIKE    NUMBER(5)      DEFAULT 0
);
-- SEQUENCE
CREATE SEQUENCE FBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------  FBOARD_COMMENT(FCOMMENT)  -----------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE FCOMMENT(
    FCID      NUMBER(5)      PRIMARY KEY,
    MID       VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    FCCONTENT VARCHAR2(1000) NOT NULL,
    FCIP      VARCHAR2(100)  NOT NULL,
    FCRDATE   DATE           DEFAULT SYSDATE,
    FID      NUMBER(5)       REFERENCES FBOARD(FID) NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE FCOMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
----------------------------  QNABOARD  -----------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE QBOARD(
    QID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    QTITLE   VARCHAR2(300)  NOT NULL,
    QCONTENT VARCHAR2(4000) NOT NULL,
    QFILE    VARCHAR2(100),
    QRDATE   DATE           DEFAULT SYSDATE,
    QGROUP   NUMBER(5)      NOT NULL,
    QSTEP    NUMBER(2)      NOT NULL,
    QINDENT  NUMBER(2)      NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE QBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
----------------------------  NBOARD  --------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE NBOARD(
    NID      NUMBER(5)      PRIMARY KEY,
    MID      VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    NTITLE   VARCHAR2(300)  NOT NULL,
    NCONTENT VARCHAR2(4000) NOT NULL,
    NFILE    VARCHAR2(100),
    NRDATE   DATE           DEFAULT SYSDATE
);
-- SEQUENCE
CREATE SEQUENCE NBOARD_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-----------------------------  STUDY  --------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE STUDY(
    SID        NUMBER(5)      PRIMARY KEY,
    MID        VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    STITLE     VARCHAR2(300)  NOT NULL,
    SCONTENT   VARCHAR2(4000) NOT NULL,
    SPEOPLE    NUMBER(2)      DEFAULT 1,
    SLANGUAGE1 VARCHAR2(100),
    SLANGUAGE2 VARCHAR2(100),
    SLANGUAGE3 VARCHAR2(100),
    SRDATE     DATE           DEFAULT SYSDATE,
    SSDATE     DATE           NOT NULL,
    SFDATE     DATE           NOT NULL,
    SHIT       NUMBER(5)      DEFAULT 0,
    SLOC       VARCHAR2(100),
    SCOMPLETE  VARCHAR2(1)    DEFAULT 'N'
);
-- SEQUENCE
CREATE SEQUENCE STUDY_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------------  STUDYCOMMENT  -----------------------------
----------------------------------------------------------------------
CREATE TABLE SCOMMENT(
    SCID      NUMBER(5)      PRIMARY KEY,
    MID       VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    SCCONTENT VARCHAR2(1000) NOT NULL,
    SCIP      VARCHAR2(100)  NOT NULL,
    SCRDATE   DATE           DEFAULT SYSDATE,
    SID       NUMBER(5)      REFERENCES STUDY(SID) NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE SCOMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
----------------------------  PROJECT  -------------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE PROJECT(
    PID        NUMBER(5)      PRIMARY KEY,
    MID        VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    PTITLE     VARCHAR2(300)  NOT NULL,
    PCONTENT   VARCHAR2(4000) NOT NULL,
    PPEOPLE    NUMBER(2)      DEFAULT 1,
    PLANGUAGE1 VARCHAR2(100),
    PLANGUAGE2 VARCHAR2(100),
    PLANGUAGE3 VARCHAR2(100),
    PRDATE     DATE           DEFAULT SYSDATE,
    PSDATE     DATE           NOT NULL,
    PFDATE     DATE           NOT NULL,
    PHIT       NUMBER(5)      DEFAULT 0,
    PDEV       VARCHAR2(1)    DEFAULT 'N',
    PDESIGN    VARCHAR2(1)    DEFAULT 'N',
    PM         VARCHAR2(1)    DEFAULT 'N',
    PLOC       VARCHAR2(100),
    PCOMPLETE  VARCHAR2(1)    DEFAULT 'N'
);
-- SEQUENCE
CREATE SEQUENCE PROJECT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------------  PROJECTCOMMENT  ---------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE PCOMMENT(
    PCID       NUMBER(5)      PRIMARY KEY,
    MID        VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    PCCONTENT  VARCHAR2(1000) NOT NULL,
    PCIP       VARCHAR2(100)  NOT NULL,
    PCRDATE    DATE           DEFAULT SYSDATE,
    PID        NUMBER(5)      REFERENCES PROJECT(PID) NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE PCOMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
--------------------------  STUDY STATUS  ----------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE SSTATUS(
    SSID       NUMBER(5)      PRIMARY KEY,
    MID        VARCHAR2(100)  REFERENCES MEMBER(MID) NOT NULL,
    SID        NUMBER(5)      REFERENCES STUDY(SID) NOT NULL,
    SSSTATUS   NUMBER(1)      NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE SSTATUS_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
----------------------------------------------------------------------
-------------------------  PROJECT STATUS  ---------------------------
----------------------------------------------------------------------
-- TABLE
CREATE TABLE PSTATUS(
    PSID     NUMBER(5)     PRIMARY KEY,
    MID      VARCHAR2(100) REFERENCES MEMBER(MID) NOT NULL,
    PID      NUMBER(5)     REFERENCES PROJECT(PID) NOT NULL,
    PSSTATUS NUMBER(1)     NOT NULL
);
-- SEQUENCE
CREATE SEQUENCE PSTATUS_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;