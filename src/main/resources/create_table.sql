CREATE SEQUENCE seq_personaltt;

CREATE TABLE IF NOT EXISTS tt_subject (
    code varchar(10) not null primary key,
    section varchar(10),
    major varchar(30) not null,
    title varchar(100) not null,
    classyear int,
    credit int not null, 
    professor varchar(50),
    classhour varchar(70),
    classroom varchar(100),
    campussort varchar(3),
    etc varchar(100)
);

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a1', '전공선택', '문헌정보학과',  '저작권', 4, 3, '이문학', '월7,화1~2', '1301330', '제물포', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a2', '교직', '교직',  '교육심리', 2, 2, '양태연', '월', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a3', '교양필수', '교양',  '인간과우주', 2, 3, '정연철', '화', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a4', '교양선택', '교양',  '인간과우주', 2, 3, '정연철', '수1~3', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a5', '전공기초', '컴퓨터공학부',  '컴퓨터네트워크보안', 1, 3, '정연철', '수1~3', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a6', '전공필수', '컴퓨터공학부',  '컴퓨터네트워크', 2, 3, '정연철', '목1~3', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a7', '전공선택', '컴퓨터공학부',  '데이터베이스', 3, 3, '정연철', '목1~3', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a8', '일반선택', '일반선택',  '인터넷특론', 2, 3, '정연철', '금1~3', 'SN204', '송도', '' );

INSERT INTO tt_subject ( code, section, major, title, classyear, credit, professor, classhour, classroom, campussort, etc )
VALUES ( 'a9', '군사학', '군사학',  '군사학(2)', 2, 3, '정연철', '금1~3', 'SN204', '송도', '' );


CREATE TABLE IF NOT EXISTS tt_personal (
    idx_no int not null primary key,
    member_srl int not null,
    semester varchar(10) not null,
    tt_no int not null,
    subject_list varchar(255),
    insertdate datetime not null,
    updatedate datetime
);

INSERT INTO tt_personal( idx_no, member_srl, semester, tt_no, subject_list, insertdate )
VALUES ( 1, 3465, '2014_2', 1, 'XAA2031001,0001250001,0001248001', '2012-02-12 11:22:10' );

CREATE TABLE IF NOT EXISTS xe_member (  
	member_srl int NOT NULL PRIMARY KEY,
	user_id varchar(80) NOT NULL
);

INSERT INTO xe_member (member_srl, user_id)
VALUES (3894, 'zakarose');

CREATE TABLE  IF NOT EXISTS tt_line_evaulation(
	le_no int not null primary key,
	subject_code varchar(10) not null, 
	member_srl int not null,
	comment varchar(100),
	star_score float not null,
	insertdate datetime not null
);

INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 1, '0001701002', 3894, '이거좋아용1-첫번째', 1, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 2, '0001701002', 3894, '이거싫어용2', 3, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 3, '0001701002', 3894, '이거그거그래요3', 5, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 4, '0001701002', 3894, '이거좋아용', 1, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 5, '0001701002', 3894, '이거싫어용', 3, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 6, '0001701002', 3894, '이거그거그래요', 5, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 7, '0001701002', 3894, '이거좋아용', 1, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 8, '0001701002', 3894, '이거싫어용', 3, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 9, '0001701002', 3894, '이거그거그래요', 5, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 10, '0001701002', 3894, '이거좋아용9', 1, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 11, '0001701002', 3894, '이거싫어용10', 3, '2012-02-12 11:22:10' );
INSERT INTO tt_line_evaulation( le_no, subject_code, member_srl, comment, star_score, insertdate)
VALUES ( 12, '0001701002', 3894, '이거그거그래요11-마지막', 5, '2012-02-12 11:22:10' );

CREATE TABLE IF NOT EXISTS tt_member(
    member_ino int not null primary key ,
    id varchar(50) not null,
    password varchar(50) not null,
    name varchar(50) not null,
    email varchar(50) not null,
    enrolldate varchar(100) not null,
    modifytime varchar(100) not null
);

INSERT INTO tt_member(member_ino, id, password, name, email, enrolldate, modifytime)
VALUES (1,'junha1','1234','김준하1','email@email','2012-02-12 11:22:10','2012-02-12 11:22:10');
INSERT INTO tt_member(member_ino, id, password, name, email, enrolldate, modifytime)
VALUES (2,'junha2','1234','김준하2','email@email','2012-02-12 11:22:10','2012-02-12 11:22:10');
INSERT INTO tt_member(member_ino, id, password, name, email, enrolldate, modifytime)
VALUES (3,'junha3','1234','김준하3','email@email','2012-02-12 11:22:10','2012-02-12 11:22:10');
INSERT INTO tt_member(member_ino, id, password, name, email, enrolldate, modifytime)
VALUES (4,'junha4','1234','김준하4','email@email','2012-02-12 11:22:10','2012-02-12 11:22:10');
INSERT INTO tt_member(member_ino, id, password, name, email, enrolldate, modifytime)
VALUES (5,'junha5','1234','김준하5','email@email','2012-02-12 11:22:10','2012-02-12 11:22:10');


CREATE TABLE IF NOT EXISTS  subject_evaluation(
    board_ino int not null primary key,
    subjectcode varchar(30) not null,
    member_ino int not null,
    prof_ino int not null,
    evaluationpoint float not null,
    content varchar(100) not null,
    semester varchar(50) null,
    registertime varchar(50) not null,
    modifytime varchar(50) not null
);

INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (1,'a1',1,1,3.7,'이거좋아용1','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (2,'a2',2,2,3.7,'이거좋아용2','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (3,'a3',3,3,3.7,'이거좋아용3','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (4,'a4',4,1,3.7,'이거좋아용4','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (5,'a5',1,2,3.7,'이거좋아용5','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (6,'a6',2,3,3.7,'이거좋아용6','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (7,'a7',3,4,3.7,'이거좋아용7','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')
INSERT INTO subject_evaluation( board_ino, subjectcode, member_ino, prof_ino, evaluationpoint, content, semester, registertime, modifytime)
VALUES (8,'a8',4,1,3.7,'이거좋아용8','2014-2','2012-02-12 11:22:10','2012-02-12 11:22:10')

CREATE TABLE IF NOT EXISTS professor(
    prof_ino int not null primary key,
    profname varchar(30) not null,
    dept_ino int null
);

INSERT INTO professor(prof_ino, profname, dept_ino)
VALUES (1,'정연철',1);
INSERT INTO professor(prof_ino, profname, dept_ino)
VALUES (2,'박문주',2);
INSERT INTO professor(prof_ino, profname, dept_ino)
VALUES (3,'민병준',3);
INSERT INTO professor(prof_ino, profname, dept_ino)
VALUES (4,'최승식',4);

CREATE TABLE IF NOT EXISTS dept_info(
    dept_ino int not null primary key,
    dept_name varchar(50) not null,
    dept_site varchar(100) null,
    dept_tel varchar(50) null
);

INSERT INTO dept_info(dept_ino, dept_name, dept_site, dept_tel)
VALUES (1,'교양','www.incheon.ac.kr','032-835-5555');
INSERT INTO dept_info(dept_ino, dept_name, dept_site, dept_tel)
VALUES (2,'컴퓨터공학부','www.incheon.ac.kr','032-835-5555');
INSERT INTO dept_info(dept_ino, dept_name, dept_site, dept_tel)
VALUES (3,'경제학과','www.incheon.ac.kr','032-835-5555');
INSERT INTO dept_info(dept_ino, dept_name, dept_site, dept_tel)
VALUES (4,'정보통신공학과','www.incheon.ac.kr','032-835-5555');