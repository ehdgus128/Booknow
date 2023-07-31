-- 테이블 생성 2023.06.25 김영환

-- users 테이블
CREATE TABLE tlbook.tbl_users (
userId VARCHAR2(50),
username VARCHAR2(30) NOT NULL,
userPassword VARCHAR2(200) NOT NULL,
userEmail VARCHAR2(50) NOT NULL,
userAddress VARCHAR2(24) NOT NULL,
userMileage NUMBER(10,0) NOT NULL,
userBday DATE NOT NULL,
userPhoneNumber VARCHAR2(15) NOT NULL,
userRegDate TIMESTAMP(0) default systimestamp(0),
userModDate TIMESTAMP(0) default systimestamp(0),
userStorage NUMBER(3) DEFAULT 1 , -- 0=탈퇴시, 1=1년, 2=3년, 3=5년
enabled CHAR(1) DEFAULT '1' -- '0' 비활성(false) , '1' 활성(true)
) TABLESPACE USERS;

--ALTER TABLE tlbook.tbl_users MODIFY userPassword VARCHAR2(200);

-- tbl_users 기본키
ALTER TABLE tlbook.tbl_users 
ADD CONSTRAINT PK_userId_users PRIMARY KEY (userId);

-- authoritys 테이블 security
CREATE TABLE tlbook.tbl_user_authoritys (
userId VARCHAR2(30),
authority VARCHAR2(50),
grantedDate TIMESTAMP(0) default systimestamp(0)
)TABLESPACE USERS;

-- tbl_user_authoritys 기본키
ALTER TABLE tlbook.tbl_user_authoritys 
ADD CONSTRAINT pk_user_authoritys PRIMARY KEY (userId, authority);

-- tbl_user_authoritys 왜래키
ALTER TABLE tlbook.tbl_user_authoritys
ADD CONSTRAINT FK_userId_authoritys FOREIGN KEY(userId)
REFERENCES tlbook.tbl_users(USERID); --FK(tbl_users 참조) : FK_userId_authoritys

-- spring_security 자동 로그인 테이블 정해진 테이블임
CREATE TABLE tlbook.tbl_user_remember (
series VARCHAR2(65) PRIMARY KEY,
username VARCHAR2(64) NOT NULL,
token VARCHAR2(66) NOT NULL,
last_used VARCHAR2(67) NOT NULL
)TABLESPACE USERS;


-- 여행 커뮤니티 게시판 테이블
CREATE TABLE tlbook.tbl_travel_Comm_boards (
tvcBno number(10,0),
tvcBtitle VARCHAR2(200) NOT NULL,
tvcBcontent VARCHAR2(2000) NOT NULL,
tvcBwriter VARCHAR2(50) NOT NULL,
tvcBregDate DATE DEFAULT sysdate,
tvcBmodDate TIMESTAMP(0) DEFAULT systimestamp(0),
tvcBviewsCnt NUMBER(10) DEFAULT 0,
tvcBreplyCnt NUMBER(10) DEFAULT 0,
tvcBdelFlag NUMBER(1) DEFAULT 0,
tvcCatid number(10,0)
)TABLESPACE USERS;

-- 여행 커뮤니티 게시판 기본키
ALTER TABLE tlbook.tbl_travel_Comm_boards 
ADD CONSTRAINT PK_tvcBno_TCBoards PRIMARY KEY (tvcBno);

-- 여행 커뮤 외래키 tbl_travel_Comm_cats 참조
ALTER TABLE tlbook.tbl_travel_Comm_boards
ADD CONSTRAINT FK_tvcCatid_TCBoards FOREIGN KEY(tvcCatid)
REFERENCES tlbook.tbl_travel_Comm_cats(tvcCatid);


-- 여행 커뮤니티 게시판의 카테고리 종류 테이블
CREATE TABLE tlbook.tbl_travel_Comm_cats(
tvcCatid number(10,0),
tvcCatname VARCHAR2(200) NOT NULL
)TABLESPACE USERS;

-- 여행 커뮤니티 게시판의 카테고리 종류 테이블 기본키
ALTER TABLE tlbook.tbl_travel_Comm_cats 
ADD CONSTRAINT pk_tvcCatid_tccats PRIMARY KEY (tvcCatid);


-- 여행 커뮤니티 첨부파일 테이블
CREATE TABLE tlbook.tbl_travel_Comm_attfiles(
tvcUuid VARCHAR2(50),
tvcUploadPath VARCHAR2(250) NOT NULL,
tvcFileName VARCHAR2(50) NOT NULL,
tvcFileType VARCHAR2(1) DEFAULT 'F',
tvcBno NUMBER(10)
)TABLESPACE USERS;

-- 여행 커뮤니티 첨부파일 테이블 기본키 PK_tvcUuid_TCAttfiles
ALTER TABLE tlbook.tbl_travel_Comm_attfiles 
ADD CONSTRAINT PK_tvcUuid_TCAttfiles PRIMARY KEY (tvcUuid);

-- 여행 커뮤니티 첨부파일 테이블 외래키 FK(tbl_travel_Comm_boards) : FK_tvcBno_TCAttfiles
ALTER TABLE tlbook.tbl_travel_Comm_attfiles
ADD CONSTRAINT FK_tvcBno_TCAttfiles FOREIGN KEY(tvcBno)
REFERENCES tlbook.tbl_travel_Comm_boards(tvcBno);


-- 여행 커뮤니티 게시판 댓글 테이블
CREATE TABLE tlbook.tbl_travel_Comm_replys(
tvcRno number(10,0),
tvcBno number(10,0),
tvcRwriter VARCHAR2(50) NOT NULL,
tvcRcontent VARCHAR2 (4000) NOT NULL,
tvcRregDate DATE DEFAULT sysdate,
tvcRmodDate TIMESTAMP(0) DEFAULT systimestamp(0),
tvcRdelFlag NUMBER(1) DEFAULT 0,
tvcPrno NUMBER(10,0)
)TABLESPACE USERS;

-- 여행 커뮤니티 게시판 댓글 테이블 인덱스
CREATE INDEX tlbook.idx_TCReplys_tvcBno_tvcRno ON tlbook.tbl_travel_Comm_replys(tvcBno, tvcRno);

-- 여행 커뮤니티 게시판 댓글 테이블 기본키
ALTER TABLE tlbook.tbl_travel_Comm_replys
ADD CONSTRAINT PK_TCReplys PRIMARY KEY (tvcBno, tvcRno)
USING INDEX tlbook.idx_TCReplys_tvcBno_tvcRno;

-- 여행 커뮤니티 게시판 댓글 테이블 외래키
-- tbl_travel_Comm_boards tvcBno 참조
ALTER TABLE tlbook.tbl_travel_Comm_replys
ADD CONSTRAINT FK_tvcBno_TCReplys FOREIGN KEY(tvcBno)
REFERENCES tlbook.tbl_travel_Comm_boards(tvcBno);

-- 여행 커뮤니티 게시판 댓글 테이블 외래키
-- tbl_travel_Comm_replys 참조 tvcBno, tvcRno 
ALTER TABLE tlbook.tbl_travel_Comm_replys
ADD CONSTRAINT FK_tvcBno_tvcRno_TCReplys FOREIGN KEY(tvcBno, tvcPrno)
REFERENCES tlbook.tbl_travel_Comm_replys(tvcBno, tvcRno) ON DELETE CASCADE;

-- 자주하는 질문 게시판 테이블
CREATE TABLE tlbook.tbl_FAQ_boards(
faqNo number(10,0),
faqQuestion VARCHAR2(2000) NOT NULL,
faqAnswer VARCHAR2(2000) NOT NULL,
faqCategory VARCHAR2(50) NOT NULL,
faqSubcategory VARCHAR2(50) NOT NULL, 
faqLike NUMBER(10) default 0
)TABLESPACE USERS;

--자주하는 질문 게시판 테이블 기본키 PK_faqNo_FAQ_boards
ALTER TABLE tlbook.tbl_FAQ_boards
ADD CONSTRAINT PK_faqNo_FAQ_boards PRIMARY KEY (faqNo);

-- 항공사 리뷰 정보 테이블
CREATE TABLE tlbook.TBL_AIRLINE_REV(
airLineRevno number(10,0),
userId VARCHAR2(50),
AIRLINEID VARCHAR2(3),
airLineStar number(10,1) NOT NULL,
airLineLike number(10) DEFAULT 0,
airLineRevTitle VARCHAR2(50) NOT NULL,
airLineRevContents VARCHAR2(1000) NOT NULL,
airLineRevRegDate Timestamp(0) DEFAULT systimestamp(0),
airLineRevDelFlag number(1) DEFAULT 0 --(미신고 0, 신고 1)
)TABLESPACE USERS;

-- 항공사 리뷰 정보 테이블 기본키: PK_no_airLineRev
ALTER TABLE tlbook.TBL_AIRLINE_REV
ADD CONSTRAINT PK_no_airLineRev PRIMARY KEY (airLineRevno);

-- 항공사 리뷰 정보 테이블 외래키 FK(tbl_users  참조): FK_userId_airLineRev
ALTER TABLE tlbook.TBL_AIRLINE_REV
ADD CONSTRAINT FK_userId_airLineRev FOREIGN KEY(userId)
REFERENCES tlbook.tbl_users(userId);

-- 항공사 리뷰 정보 테이블 외래키 FK(tbl_airLine 참조): FK_airLineno_airLinRev 미작업
ALTER TABLE tlbook.TBL_AIRLINE_REV
ADD CONSTRAINT FK_AIRLINEID_airLineRev FOREIGN KEY(AIRLINEID)
REFERENCES tlbook.TBL_AIRLINE(AIRLINEID);


-- 테이블 생성 2023.06.25 김영환
-- 쿼리문

SELECT U.USERID, U.USERNAME, U.USERPASSWORD, U.USEREMAIL, U.USERADDRESS, U.USERMILEAGE, 
U.USERBDAY, U.USERPHONENUMBER, U.USERREGDATE, U.USERMODDATE, U.USERSTORAGE, U.ENABLED,
A.AUTHORITY, A.GRANTEDDATE
FROM tlbook.TBL_USERS U
INNER JOIN tlbook.TBL_USER_AUTHORITYS A
ON U.USERID = A.USERID
WHERE U.USERID = 's';

SELECT U.USERID, U.USERNAME, U.USERPASSWORD, U.USEREMAIL, U.USERADDRESS, U.USERMILEAGE, 
U.USERBDAY, U.USERPHONENUMBER, U.USERREGDATE, U.USERMODDATE, U.USERSTORAGE, U.ENABLED,
A.AUTHORITY, A.GRANTEDDATE
FROM tlbook.TBL_USERS U
LEFT OUTER JOIN tlbook.TBL_USER_AUTHORITYS A
ON U.USERID = A.USERID
WHERE U.USERID = 's5';

INSERT INTO tlbook.TBL_USERS
VALUES('s5','김영환','sss55555','p','s',1, SYSDATE,'1',DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO tlbook.TBL_USER_AUTHORITYS
VALUES('userAdmin', 'ADMIN',DEFAULT);


DELETE FROM TBL_USERS
WHERE USERID = 's5';

DELETE FROM TBL_USER_AUTHORITYS
WHERE USERID = 's5';

COMMIT;



































