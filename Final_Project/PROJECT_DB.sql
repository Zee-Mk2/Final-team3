DROP SCHEMA final_db;
CREATE SCHEMA final_db;
USE final_db;


------------------------------------------------
--------------- EXHIBITION 관련 테이블 ------------------
------------------------------------------------

DROP TABLE if exists EXHIBITION;
CREATE TABLE EXHIBITION(
	exno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    sumary VARCHAR(1000),
    museum VARCHAR(100),
    gallery VARCHAR(100),
    url VARCHAR(1000),
    img VARCHAR(1000),
    mediaType VARCHAR(20)
    );

SELECT * FROM EXHIBITION;


------------------------------------------------
--------------- museum 관련 테이블 ------------------
------------------------------------------------

DROP TABLE if exists museum;
CREATE TABLE museum (
	musNo INT, 
	name VARCHAR(100), 
	summary VARCHAR(1000), 
	viewHours VARCHAR(100), 
	fee VARCHAR(100), 
	tel VARCHAR(100), 
	img VARCHAR(1000), 
	sumImg VARCHAR(1000), 
	la INT, 
	lo INT, 
	ProgramImg VARCHAR(1000), 
	address VARCHAR(100)
);

SELECT * FROM museum;


------------------------------------------------
--------------- HERITAGE 관련 테이블 ------------------
------------------------------------------------


DROP TABLE if exists HERITAGE;
CREATE TABLE HERITAGE (
	hNo INT PRIMARY KEY,
    KIND VARCHAR(100),
    NAME VARCHAR(100),
    NAME2 VARCHAR(100),
    KINDCODE VARCHAR(100),
    CITYCODE VARCHAR(100),
    CCBAASNO VARCHAR(100),
    LO DOUBLE,
    LA DOUBLE,
    GCODENAME VARCHAR(100),
    BCODENAME VARCHAR(100),
    MCODENAME VARCHAR(100),
    SCODENAME VARCHAR(100),
    ASDATE DATETIME,
    LOCATION VARCHAR(1000),
    ERA VARCHAR(100),
    IMG VARCHAR(3000),
    CONTENT VARCHAR(3000)
);

SELECT * FROM HERITAGE;


------------------------------------------------
--------------- PRODUCT 관련 테이블 ------------------
------------------------------------------------


DROP TABLE if exists PRODUCT;
CREATE TABLE PRODUCT (
    PRODUCTID VARCHAR(100) PRIMARY KEY,
    PRODUCTTYPE VARCHAR(100),
    TITLE VARCHAR(100),
    IMAGE VARCHAR(3000),
    LPRICE INT,
    CATEGORY1 VARCHAR(100),
    CATEGORY2 VARCHAR(100),
    CATEGORY3 VARCHAR(100),
    CATEGORY4 VARCHAR(100),
    MALLNAME VARCHAR(100)
);

SELECT * FROM PRODUCT;


------------------------------------------------
--------------- MEMBER 관련 테이블 ------------------
------------------------------------------------

DROP TABLE MEMBER;
CREATE TABLE MEMBER (
    MNO      INT  PRIMARY KEY AUTO_INCREMENT,
    ROLE 	 VARCHAR(10) DEFAULT 'ROLE_USER',
    NAME 	 VARCHAR(15),
    EMAIL 	 VARCHAR(100) NOT NULL,
    PASSWORD VARCHAR(100) NOT NULL,
    PHONE 	 VARCHAR(13),
    STATE 	 VARCHAR(1) DEFAULT 'Y' CHECK(STATE IN('Y', 'N')),
    ENROLL_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM MEMBER;

------------------------------------------------
--------------- Event 관련 테이블 ------------------
------------------------------------------------

DROP TABLE Event;
CREATE TABLE Event (
	evntNo INT PRIMARY KEY,
    name VARCHAR(100),
    summary VARCHAR(1000),
    startDate VARCHAR(100),
    endDate VARCHAR(100),
    ageLimit VARCHAR(100),
    fee VARCHAR(100),
    location VARCHAR(1000),
    poster VARCHAR(1000)
);

SELECT * FROM Event;

Drop TABLE EventProgram;

CREATE TABLE EventProgram (
	programNo INT PRIMARY KEY,
    evntNo INT,
    view VARCHAR(100),
    street VARCHAR(1000),
    story VARCHAR(1000),
    history VARCHAR(1000),
    picture VARCHAR(1000),
    market VARCHAR(1000),
    food VARCHAR(1000),
    sleep VARCHAR(1000),
    img1 VARCHAR(1000),
    img2 VARCHAR(1000),
    img3 VARCHAR(1000),
    FOREIGN KEY (evntNo) REFERENCES Event(evntNo)
);


--------------- 박물관 INSERT ------------------

INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립중앙박물관", "시대와 주제별로 제시된 6개의 상설전시관, 다양한 내용을 선보이는 특별전시관, 관람의 이해를 돕는 전시해설 프로그램, 오감으로 즐기고 배우는 어린이박물관, 다채로운 교육 프로그램, 첨단기술을 활용한 실감콘텐츠 등을 마음껏 누리고 즐기실 수 있습니다.", "월, 화, 목, 금, 일요일: 10:00am ~ 18:00pm (입장 마감: 17:30) / 수, 토요일: 10:00am ~ 21:00pm (입장 마감: 20:30)", "무료", "02-2077-9000", 
"https://www.museum.go.kr/ux/content/images/intro/temp/img_intro_bg02.jpg", "https://www.museum.go.kr/ux/content/images/intro/temp/img_intro_bg.jpg", 37.523827, 126.980747, 
"https://www.museum.go.kr/uploadfile/ecms/media/2023/01/2923999D-4175-39CB-89ED-B9AA0EB4E41E_thumb.png", "04383 서울시 용산구 서빙고로 137(용산동6가 168-6)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립춘천박물관", "우리는 박물관을 숲처럼 가꾸는 사람들입니다. 사랑하는 사람들과 편한 옷차림으로 찾아와 이야기꽃을 피우는 곳, 연중 열리는 다채로운 공연의 아름다운 선율에 흠뻑 젖어드는 곳, 햇살이 가득 쏟아지는 초록빛 가든의 뮤지엄 카페에서 혼자만의 여유를 갖는 곳, 앞서 살다 간 사람들의 이야기로 오늘 우리의 삶을 다시 돌아보는 곳, 이제껏 경험해 보지 못한 새로운 박물관을 여러분에게 선사하겠습니다.", "화~일 - 09:00am ~ 18:00pm", "무료", "033-260-1500", 
"https://chuncheon.museum.go.kr/thumbnail/archive/photo/87/1920_PDB_202112201154359100.JPG", "https://chuncheon.museum.go.kr/images/kor/sub01/main-visual.mp4", 37.863747, 127.752480, 
"https://chuncheon.museum.go.kr/thumbnail/eduPrg/300_eduPrg_202303071107008821.png", "24325 강원특별자치도 춘천시 우석로 70 국립춘천박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립청주박물관", "국립청주박물관은 국립중앙박물관의 소속기관이다. 청주와 충주를 중심으로 하는 충북지역의 문화유산을 수집·발굴·전시하고, 문화유산 연구에 중추적 역할을 담당하려는 목적으로 1987년 10월 30일에 개관하였다.", "화~일 - 10:00am ~ 18:00pm", "무료", "043-229-6300", 
"https://chuncheon.museum.go.kr/thumbnail/archive/photo/87/1920_PDB_202112201154359100.JPG", "https://cheongju.museum.go.kr/common/images/contents/intro_img1.png", 37.863747, 127.752480, 
"https://lh3.googleusercontent.com/p/AF1QipPBWAzCQZFPt1sxCagfblaCgnPkdzFCMRh60MNd=s680-w680-h510", "24325 강원특별자치도 춘천시 우석로 70 국립춘천박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립공주박물관", "백제의 비상을 꿈꾸었던 웅진에 자리한 국립공주박물관은 1946년 4월 1일 웅진 백제 문화를 중심으로 충청남도의 역사와 문화를 보존, 전시하기 위해 새롭게 태어났습니다. 따라서 웅진백제를 주제로 하는 전시실과 충청남도의 역사문화를 주제로 한 전시실은 항상 여러분께 열려 있으며, 다양한 주제의 특별전시도 수시로 여러분을 찾아가고 있습니다.", "4월 ~ 10월 - 10:00am ~ 21:00pm / 11월 ~ 3월 : 10:00am ~ 19:00pm", "무료", "041-850-6300", 
"https://www.gongju.go.kr/thumbnail/tursmCn/920_TUCN_202004141141585782.jpg", "https://t1.daumcdn.net/cfile/tistory/2143F34853C1B8E621", 36.465383, 127.112118, 
"https://gongju.museum.go.kr/_prog/download/?func_gbn_cd=eduprog&atch=imgfile&mng_no=150322&site_dvs_cd=gongju", "[32535] 충청남도 공주시 관광단지길 34 (웅진동 360번지)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립부여박물관", "국립부여박물관은 이러한 문화적 배경 아래 1929년 발족한 부여고적보존회를 시작으로 현재까지 84년에 이르는 깊은 역사를 간직하고 있습니다. 그동안 우리 박물관은 충남 서부지역의 선사문화를 비롯하여 특히 백제의 문화유산을 보존 관리하는데 중심 역할을 다하여 왔습니다. 이외에도 유적·유물의 전시와 조사연구, 문화교육, 국제교류 등 다양한 활동을 통해 백제의 역사와 문화를 널리 선양하는 데에 최선의 노력을 경주하고 있습니다.", "화 ~ 일 - 09:00am ~ 18:00pm", "무료", "041-833-8562", 
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Buyeo_National_Museum_%2820160719_1%29.png/1200px-Buyeo_National_Museum_%2820160719_1%29.png", "https://post-phinf.pstatic.net/MjAxOTAyMjBfMjA3/MDAxNTUwNjY4NjQzMTAw.DHZWdlNEWJrQ1y4nnJJkT8ugO4QwLLIh24eZIcjs2dMg.0Kq5OKjq2icNS0Fv12Swe8tTdsvZJctMPJiHG10R1Ccg.JPEG/01%EA%B5%AD%EB%A6%BD%EB%B6%80%EC%97%AC%EB%B0%95%EB%AC%BC%EA%B4%80%28%EC%97%BD%EC%84%9C%29.jpg?type=w1200", 36.276326, 126.919027, 
"https://buyeo.museum.go.kr/atch/getImg.do?atchFileSn=11317", "우)33156 충청남도 부여군 부여읍 금성로 5 국립부여박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립전주박물관", "국립전주박물관은 전라북도의 대표 국립박물관입니다. 국립전주박물관은 전북에서 발굴 출토된 고고유물을 비롯하여 역사 자료, 서화, 도자기, 공예 미술품 등 전라북도 관련 중요 문화재를 4만여 점 소장하고 있습니다. 이중 대표 문화재를 선별하여 상설전시실과 야외 정원에 전시하고 있으며, 학술 조사와 연구 활동을 기반으로 기획한 다양한 주제의 특별전시도 진행하고 있습니다. 전통 문화를 어린이 눈높이에 맞춘 어린이박물관도 운영하고 있으며, 박물관 교육프로그램을 통해 청소년과 성인에게 박물관 기반의 열린 교육과 평생 학습의 기회를 제공하고 있습니다. 또한 다양한 문화행사를 통해 국내 관람객과 외국인들에게도 한국 전통 문화와 전라북도의 문화를 소개해 오고 있습니다.", "평일 : 10:00am ~ 18:00pm / 토 ·일 및 공휴일 : 10:00am ~ 19:00pm", "무료", "063-223-5651", 
"https://i.namu.wiki/i/xd7xPSvPCLNjK5KShDKEDn140_0i8pNbwXWOU7Fa_O00jzZu59nfCIIoBV_DXDtwxq3S3iBLExv6kO-D7wF3iw.webp", "https://t1.daumcdn.net/cfile/tistory/2310504D54D871B225", 35.801263, 127.0898498, 
"https://jeonju.museum.go.kr/upload/education/m_202307241543565651.jpg", "(우)55070 전라북도 전주시 완산구 쑥고개로 249");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립익산박물관", "국립익산박물관은 국립중앙박물관의 소속기관이다. 2015년 12월 30일 발족하였으며, 전라북도 익산시 금마면 미륵사지로 362에 위치하고 있다.", "화 ~ 일 - 09:00am ~ 18:00pm", "무료", "063-830-0915", 
"https://cdn.imweb.me/upload/S201902135c63b326c54d7/31fe441d6033e.jpg", "https://cdn.imweb.me/upload/S20190826b37f71874f1cc/c13d5cc1ff7bc.png", 36.010594, 127.028104, 
"https://iksan.museum.go.kr/_prog/download/?d_type=1&site_dvs_cd=kor&func_gbn_cd=eduprog&filename=20230613105321_00bfopsvxhr36lhm8sf3wmuqb9sanx.jpg&file_realname=%EC%A0%9C%EB%AA%A9%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-001%20(2).jpg", "(54574) 전라북도 익산시 금마면 미륵사지로 362 (기양리) 국립익산박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립광주박물관", "국립광주박물관은 1976년 수중발굴이 시작된 신안해저문화재를 비롯한 호남지역의 문화유산을 수집·보관하고, 지역의 역사와 문화를 소개하기 위해 1978년 12월 6일 개관하였습니다. 호남지역의 첫 박물관이자 광복 이후 우리 손으로 지은 최초의 지역 국립박물관이라는 자부심이 있습니다. 국립광주박물관은 국보·보물 등의 지정문화재를 포함하여 160,000여 점의 소장품을 보존·관리하며 성설전시와 특별전시를 통해 다양한 주제로 관람객들이 문화를 향유할 수 있도록 노력하고 있습니다.", "월 ~ 일 - 10:00am ~ 18:00pm", "무료", "062-570-7000", 
"https://playgwangju.co.kr/data/file/hall/1028682196_oaz2ZV8i_ae6cc79944a12aff813bb2ba928dc3dd4ce76ed3.jpg", "https://gwangju.museum.go.kr/images/kor/sub06/sub061008_img01.jpg", 35.188564, 126.883138, 
"https://gwangju.museum.go.kr/cmm/fms/getImage.do?atchFileId=FILE_000000006947Sh8&fileSn=0&kind=920", "61066 광주광역시 북구 하서로 110(매곡동 430번지)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립나주박물관", "국립나주박물관은 영산강 유역에 남아있는 고고자료를 보존하고 전시하며 호남지역 발굴매장 문화재에 대한 수장고의 기능을 수행하기 위해 건립되었습니다. 국립박물관으로서는 처음으로 도심이 아닌 전원속에 자리잡은 나주박물관은 바쁜 현대인들에게 느림을 통해 휴식의 시간을 제공하는 역사공원의 기능도 수행할 것입니다.", "화 ~ 금 - 09:00am ~ 18:00pm / 주말,공휴일 - 09:00am ~ 19:00pm", "무료", "061-330-7800",
"https://naju.museum.go.kr/images/kor/main/mVisual-img03.jpg", "https://naju.museum.go.kr/pcms/dist/img/c01/greetings_se01c.jpg", 34.914911, 126.659112, 
"https://naju.museum.go.kr/thumbnail/edu/920_edu_202307180239319211.png", "[58301] 전라남도 나주시 반남면 고분로 747 (신촌리 152-25 ) 국립나주박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립대구박물관", "국립대구박물관은 대구와 경상북도의 문화유산을 보존·연구·전시·교육하는 문화시설로 1994년 12월 7일에 문을 열었습니다. 2006년 10월 19일에 박물관 건물의 남쪽에 수장고를 추가하고, 북쪽에 사회교육관인 해솔관과 특별전시실을 증축하였습니다. 이후에 지방 국립박물관 전시의 특성화와 안정적인 전시 환경을 확보하고자 상설전시실 재개편공사를 시행하여 2010년 7월 19일에 고대문화실, 중세문화실, 복식문화실로 새롭게 문을 열었습니다.", "화 ~ 일 : 09:00am ~ 18:00pm", "무료", "053-768-6051",
"https://t1.daumcdn.net/cfile/tistory/99438A335A2A7A540A", "https://daegu.museum.go.kr/images/kor/sub01/dgm_greeting_pic.png", 35.845898, 128.638545, 
"https://daegu.museum.go.kr/thumbnail/edu/920_edu_20230711133722203Bu30.jpg", "(42111) 대구광역시 수성구 청호로 321 국립대구박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립경주박물관", "국립경주박물관은 국립중앙박물관의 소속기관이다. 1975년 8월 20일 발족하였으며, 경상북도 경주시 일정로 186에 위치하고 있다. 관장은 고위공무원단 나등급에 속하는 학예연구관으로 보한다.", "월 ~ 금 - 10:00am ~ 18:00pm / 토 - 10:00am ~ 21:00pm / 일 - 10:00am ~ 19:00pm", "무료", "054-740-7500",
"https://tong.visitkorea.or.kr/cms/resource/68/2743468_image2_1.jpg", "https://gyeongju.museum.go.kr/kor/images/common/svisual_img10.jpg", 35.829268, 129.228134, 
"https://gyeongju.museum.go.kr/_prog/download/?site_dvs_cd=kor&func_gbn_cd=eduprog&mng_no=1367&atch=imgfile&d_type=", "(38171)경상북도 경주시 일정로 186 국립경주박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립진주박물관", "1984년에 개관한 국립진주박물관은 경상남도 최초의 국립박물관으로서 임진왜란 최대 격전지 중 하나인 진주성晉州城 (사적 제118호)에 위치하고 있습니다. 개관 당시 경상남도를 중심으로 성장 발전하였던 ‘가야加耶’의 역사와 문화를 소개하는 대표박물관으로 출발하였다가, 1998년부터 경상남도 서부지역의 역사 문화와 임진왜란壬辰倭亂을 전시 중심 주제로 하는 ‘임진왜란 특성화 박물관’으로 거듭났습니다.", "09:00am ~ 18:00pm (평일·주말 동일)", "무료", "055-740-0698",
"https://www.jinju.go.kr/CmsMultiFile/view.do?multifileId=MF00000605&idx=80671", "https://www.jinju.go.kr/CmsMultiFile/view.do?multifileId=MF00000605&idx=80670", 35.189093, 128.076764, 
"https://jinju.museum.go.kr/_prog/download/?func_gbn_cd=edu&site_dvs_cd=kor&atch=atch_img&mng_no=976", "(52692) 경남 진주시 남강로 626-35 국립진주박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립김해박물관", "금관가야의 중심지로 가야의 건국 신화가 깃든 구지봉 언덕에 자리 잡은 국립김해박물관은 1998년 7월 29일 개관했습니다. 가야의 역사와 문화를 보존, 전시하기 위한 고고학 중심의 박물관이며, 우리나라 대표 가야사 특화 박물관입니다. 국립김해박물관은 가야 연구의 핵심 센터 기능을 강화하고, 역사와 문화가 생동하는 박물관을 실현하며, 복합문화공간으로서의 시설 기반을 구축하기 위한 다양한 사업을 추진하며 가야사 바로 세우기에 노력하고 있습니다.", "화 ~ 금 - 09:00am ~ 18:00pm / 토 - 09:00am ~ 21:00pm / 토 - 09:00am ~ 19:00pm", "무료", "055-320-6800",
"https://upload.wikimedia.org/wikipedia/commons/4/43/Gimhae_national_museum.JPG", "https://www.kukinews.com/data/kuk/image/2022/10/21/kuk202210210196.jpg", 35.242730, 128.873571, 
"https://gimhae.museum.go.kr/_prog/download/?func_gbn_cd=edu&site_dvs_cd=kr&atch=atch_img&mng_no=653", "[50911]경상남도 김해시 가야의길 190(구산동 232번지)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립제주박물관", "국립제주박물관은 이러한 제주의 역사와 문화에 관한 다양한 자료와 유물을 수집·보존하는 한편, 체계적인 전시와 학술조사·연구를 목적으로 2001년 6월 15일 처음으로 문을 연 고고역사박물관입니다. 우리 박물관은 설립 목적과 함께 지역사회의 중심 문화기관으로서의 소명을 다하기 위해 '격조있고 사랑받는 박물관'이란 미래 비전의 설정과 탐라 및 해양문화전문 박물관으로의 특화, 고객과 함께 하는 열린 박물관의 실현, 지역문화 네트워크의 구축 및 중심역활을 정책목표로 삼아 세부 실천 과제를 충실히 수행해 갈 것입니다.", "화 ~ 일 - 09:00am ~ 18:00pm", "무료", "064-720-8000",
"https://t1.daumcdn.net/cfile/tistory/99F2DF3F5D0094032A", "https://jeju.museum.go.kr/Img/kr/sub01/0101_img01.jpg", 33.513465, 126.548952, 
"https://jeju.museum.go.kr/Upl/kr/edunew/edu_0_1677479759.jpg", "63284 제주특별자치도 제주시 일주동로-17");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립고궁박물관", "조선 왕실과 대한제국 황실의 문화와 역사의 이해를 돕는 좋은 동반자, 국립고궁박물관에 오신 것을 환영합니다. 광복 60주년이던 2005년 8월 15일, 첫발을 내디딘 국립고궁박물관은 조선시대 최고 수준의 문화와 정신이 집약되어 있는 왕실 유물의 과학적이고 체계적인 보존과 복원을 통해 다양하고 시의성 있는 왕실 문화 전시를 기획하고, 왕실 소장품을 꾸준히 확충하여 전시 유물을 확대해나가고 있습니다. 또한 왕실 문화를 주제로 한 다양한 교육 프로그램을 운영하고, 국내‧외의 왕실 문화 기관과의 교류 활성화에도 많은 노력을 기울여왔습니다.", "월, 화, 목, 금, 일 - 10:00am ~ 18:00pm / 수, 토 - 10:00am ~ 21:00pm", "무료", "02-3701-7500",
"https://ak-d.tripcdn.com/images/100w1f000001gwd2w150E.jpg?proc=source%2Ftrip", "https://www.gogung.go.kr/resources/gogung/images/sub/sub_greeting.jpg", 37.576447, 126.975176, 
"https://www.gogung.go.kr/cmmn/file/imageSrc.do?atchFileId=ce2b9212e4ed4e7e91aebe9f9721ad76&fileSn=1", "03045 서울특별시 종로구 효자로 12(세종로1-57)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립무형유산원", "국립무형유산원은 인류의 무형문화유산을 체계적으로 보호하고, 후손들에게 온전히 전승하기 위해 설립된 세계 최초의 무형유산 복합행정기관입니다. 우리나라 무형문화유산의 의미와 가치에 대해 알아볼 수 있는 상설전시실, 다양한 주제들로 꾸며진 기획전시실, 전통의 멋과 흥을 느낄 수 있는 공연장, 무형유산 영상(자료)을 통해 과거를 만날 수 있는 아카이브 자료실, 해외 무형유산과의 활발한 교류가 이루어지는 국제회의실, 무형유산의 즐거움을 온몸으로 체험할 수 있는 교육 공간 등 분야별 특성에 맞는 시설들을 갖추고 있습니다. 또한 손에 잡히지 않는 무형문화유산을 생생히 느끼고, 만지고, 체험할 수 있도록 다양한 프로그램들을 준비하고 있습니다.", "화 ~ 일 - 09:30am~17:30pm", "무료", "063-280-1400",
"https://mblogthumb-phinf.pstatic.net/MjAxOTEyMThfMTA1/MDAxNTc2NjY4MjgwMzY1.wLehE8mIlCfML5la9cOpC2_IrTAJsXO3IsobRRJY36kg.pFFWNekhY4fmhZgkpbYHrlGrlrYAg1pqO1Ug3d4lqgAg.JPEG.jcjkks/SE-c84bee3e-7621-4b96-8fdf-598cda2c4e37.jpg?type=w800", "https://www.cha.go.kr/unisearch/imagefiles/newsfile/NEWS_201409220942289230", 35.809909, 127.160419, 
"https://www.nihc.go.kr/planweb/upload/402880863251923e01325193a7480005/board/ff8080816ecaefcf016ecfc31e210243/original/4944122f-5f7b-4a3b-b53a-f4adc7e76d49.png", "(우)55101 전라북도 전주시 완산구 서학로 95(동서학동 896-1)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "석조전 대한제국역사관", "석조전은 자주 근대국가를 염원했던 대한제국의 대표적인 서양식 건물입니다. 영국인 존 레지날드 하딩(John Reginald Harding)이 석조전 설계를 맡았고, 1900년부터 1910년까지 10년에 걸쳐 공사가 진행되었습니다. 고종(광무황제)에 의해 황제국이 선포된 후 대한제국 황궁의 정전으로 만들어졌으며, 엄격한 비례와 좌우대칭이 돋보이는 신고전주의 양식으로 내부에는 접견실과 대식당, 침실, 서재 등을 갖추었습니다. 신고전주의 양식은 그리스와 로마 시대의 건축물을 모방한 양식으로, 엄격한 비례와 균형, 대칭의 질서와 조화를 추구합니다.", "화 ~ 일 - 09:00am ~ 21:00pm", "개인 : 1,000원 / 단체 : 800원", "02-771-9951",
"https://storage.doopedia.co.kr/upload/_upload/image5/travel/editor/2020/10/31/20201031014808038_thumb.jpg", "https://www.deoksugung.go.kr/ko/assets/images/sub/2s1s.jpg", 37.566305, 126.974432, 
"https://www.deoksugung.go.kr/ko/assets/images/event/1.jpg", "서울 중구 세종대로 99 (우 04519)");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "충무공이순신기념관", "충무공이순신기념관은 2005년 현충사종합정비 기본계획에 따라 2006년 기본설계, 2007년 실시설계를 거쳐 2008년에 착공하여 2011년 4월 28일 준공·개관하였습니다. 기념관은 충무공관련 유물과 임진왜란 당시 해전 사료를 수집하고, 이를 전시·교육하기 위한 역사 테마관입니다. 연면적 3,104㎡(939평)에 지하 1층, 지상 1층의 철근콘크리트 구조입니다.", "3월 ~ 10월 - 09:00am ~ 18:00pm / 11월 ~ 2월 - 09:00am ~ 17:00pm", "무료", "041-539-4600",
"https://cdn.daejonilbo.com/news/photo/201504/1164758_175277_614.jpg", "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/6Bcd/image/TKIwASr4Smu9G5SNl2PkcF8q-Ls", 36.805980, 127.032004, 
"https://hcs.cha.go.kr/images/content/hall/img_hall030101.gif", "(우)31451 충청남도 아산시 염치읍 현충사길 126");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "세종대왕역사문화관", "세종대왕역사문화관은 사적인 조선 제4대 임금 세종대왕의 영릉(英陵)과 제17대 효종대왕의 영릉(寧陵)이 있는 경기도 여주에 위치하고 있으며, 3개의 상설전시실과 1개의 기획전시실, 영상실, 카페, 수장고 등을 갖추고 있다. 세종대왕과 효종대왕 그리고 조선왕릉에 대한 이해를 돕고, 세종대왕께서 후손에게 남긴 훌륭한 업적들과 그 업적의 바탕이 된 애민정신을 느껴볼 수 있도록 다양한 볼거리와 즐길거리로 꾸며져 있다.", "2월 ~ 5월, 9월 ~ 10월 - 09:00am~18:00pm / 6월 ~ 8월 - 09:00am~18:30pm / 11월 ~ 1월 - 09:00am~17:30pm", "개인 : 500원 / 단체(10인 이상) : 400원", "031-885-3123",
"https://ss1.gcloud.kt.com:1000/place/%EC%97%AC%EC%A3%BC/%EC%84%B8%EC%A2%85%EB%8C%80%EC%99%95%EC%97%AD%EC%82%AC%EB%AC%B8%ED%99%94%EA%B4%80%202.JPG", "https://sejong.cha.go.kr/SEJONG/images/content/img_intro_sejong.jpg", 37.304696, 127.611657, 
"https://royaltombs.cha.go.kr/new/images/content/2021/dgr_exhibit.png", "12642 경기도 여주시 세종대왕면 영릉로 269-10");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립민속박물관", "국립민속박물관은 우리나라의 대표적인 생활문화박물관으로서, 1946년 개관한 이래로 우리 문화의 본 모습을 올바르게 전달하기 위해 노력하여 왔습니다. 관람객들이 민속문화를 쉽게 접하고 이해할 수 있는 전시와 교육프로그램을 통해 민속자료의 올바른 이해를 돕고자 항상 노력하고 있습니다.", "3월 ~ 10월 - 09:00am~18:00pm / 11월~2월 - 09:00am~17:00pm", "무료", "02-3704-3114",
"https://t1.daumcdn.net/cfile/tistory/99DAF6395B3854D615", "https://webzine.nfm.go.kr/wp-content/uploads/2020/06/%EC%9B%B9_%EB%82%B4%EC%A7%80%EC%9D%B4%EB%AF%B8%EC%A7%8030.jpg", 37.581602, 126.979128, 
"https://www.nfm.go.kr/site/home/upload/eduPlan/eduPlan_20230724104130_01882513d5fa7c329e940dda99b12147.jpg", "[03045] 서울시 종로구 삼청로 37");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립현대미술관", "1969년 경복궁에서 개관한 국립현대미술관은 이후 1973년 덕수궁 석조전 동관으로 이전하였다가 1986년 현재의 과천 부지에 국제적 규모의 시설과 야외조각장을 겸비한 미술관을 완공, 개관함으로써 한국 미술문화의 새로운 장을 열게 되었습니다. 1998년에는 서울 도심에 위치한 덕수궁 석조전 서관을 국립현대미술관의 분관인 덕수궁미술관으로 개관하여 근대미술관으로서 특화된 역할을 수행하고 있습니다. 그리고 2013년 11월 과거 국군기무사령부가 있었던 서울 종로구 소격동에 전시실을 비롯한 프로젝트갤러리, 영화관, 다목적홀 등 복합적인 시설을 갖춘 국립현대미술관 서울을 건립·개관함으로써 다양한 활동을 통해 한국의 과거, 현재, 미래의 문화적 가치를 구현하고 있습니다. 또한 2018년에는 충청북도 청주시 옛 연초제조창을 재건축한 국립현대미술관 청주를 개관하여 중부권 미술문화의 명소로 육성하고자 노력하고 있으며, 2019년에는 개관 50주년을 맞이하여 기념식을 개최하고 미술문화를 나누는 세계 속 열린 미술관으로 발돋움하고 있습니다.", "월, 화, 목, 금, 일요일 - 10:00am-18:00pm / 수,토요일 - 10:00am-21:00pm", "개별관람권 : 2,000원 / 통합관람권 : 5,000원", "02‒3701‒9500",
"https://mblogthumb-phinf.pstatic.net/MjAyMjA5MDhfMjMg/MDAxNjYyNTYzNDE2NjYy.636T5g6dzp8Lki8A9lwqd051uSo2t40la5DFNDqMeqUg.XVlw2NN3-jRzAyTm56wvsfO9hj3t9Q6_ovvi5RbRAAsg.JPEG.kjw5313/%EF%BB%BF9%EC%9B%94_%EC%A0%84%EC%8B%9C%ED%9A%8C_%EA%B5%AD%EB%A6%BD_%ED%98%84%EB%8C%80%EB%AF%B8%EC%88%A0%EA%B4%80(MMCA)_%EA%B3%BC%EC%B2%9C-16.jpg?type=w800", "https://www.kocis.go.kr/CONTENTS/BOARD/images/MMCA-131023-1.jpg", 37.579366, 126.980400, 
"https://www.kocis.go.kr/CONTENTS/BOARD/images/333MMCA-131023-4.jpg", "서울특별시 종로구 삼청로5길 30");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "대한민국역사박물관", "대한민국역사박물관은 대한민국의 탄생과 발전을 이끌어온 우리 국민들의 다양한 역사적 경험을 함께 나누고 공감하는 역사문화공간입니다. 우리 박물관은 객관적인 사실과 균형 잡힌 해석을 제시하고, 상호 이해와 공존을 통해 우리 국민들이 과거의 갈등과 상처를 딛고 일어나 화합할 수 있는 문화의 장이 되고자 합니다. 또한 우리 역사의 주역이었던 보통 사람들의 일상을 깊이 들여다보고, 우리 국민들이 모두 관심을 기울이고 있는 금융, 보건, 에너지, 재해 등 다양한 주제를 살펴보고자 합니다.", "월, 화, 목, 금, 일요일 - 10:00am-18:00pm / 수,토요일 - 10:00am-21:00pm", "무료", "02-3703-9200",
"https://mediahub.seoul.go.kr/uploads/mediahub/2021/04/eFDsszTdanDVUPzbiFDOpXhOeeREhQDl.jpg", "https://t3.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/owx/image/xOxySI0uxQ4j0chfGxLYSLGszbA.jpg", 37.573739, 126.978003, 
"https://www.much.go.kr/cmm/fms/getFirstImage.do?atchFileId=FILE_000000000017883", "03141 서울특별시 종로구 세종대로 198");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립한글박물관", "국립한글박물관은 우리 문화의 기초이자 그 자체로서 우리문화의 정수인 한글과 관련한 자료의 수집·조사·연구를 통해 다양한 전시·교육·행사를 국민들에게 제공함으로써 국내외에 한글과 한글문화의 가치를 알리고 확산하는 데 이바지하고 있습니다.", "월~금 - 10:00am-18:00pm / 토요일 - 10:00am-21:00pm", "무료", "02-2124-6200",
"https://publicdesign.kr/festival/uploads/2022/09/1.png", "https://d2qgx4jylglh9c.cloudfront.net/kr/wp-content/uploads/2018/10/1005_02.png", 37.520950, 126.980984, 
"https://www.hangeul.go.kr/upload/EDU_202304180219050860.jpg", "04383 서울시 용산구 서빙고로 139 국립한글박물관");
INSERT INTO museum (musNo, name, summary, viewHours, fee, tel, img, sumImg, la, lo, ProgramImg, address) 
VALUES (DEFAULT, "국립세계문자박물관", "문자에서 태동한 역사와 문화, 인류 문명의 과거와 현재 그리고 미래를 통찰하고 공감할 수 있는곳, 국립세계문자박물관에 오신 것을 진심으로 환영합니다. 국립세계문자박물관은 프랑스 샹폴리옹세계문자박물관, 중국문자박물관과 같이 세계의 다양한 문자를 주제로 하는 문자 전문 박물관입니다.", "화요일~일요일 - 10:00am~18:00pm", "무료", "032-290-2000",
"https://www.micepost.kr/news/photo/old/bbf1feaf582258cc900c59dac5fb7a5c_63bc8AzdEU5nio4peEVBZqlXLNU2f.jpg", "https://www.kocis.go.kr/CONTENTS/editImage/20230629153316123_ZZU2JBRJ.jpg", 37.394389, 126.638054, 
"https://www.mow.or.kr/thumbnail/appnCrlts/AC_20230718173715080Qd80.jpg", "22004 인천광역시 센트럴로 217(송도동 24-8) 국립세계문자박물관");


SELECT * FROM museum;


--------------- 전시 INSERT ------------------

INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '도자기에 담긴 동서교류 600년', '세계도자실은 특정 지역 문화를 소개하는 것을 넘어 세계 여러 문화가 만나고 발전하는 과정을 동서교류의 대표적인 산물인 도자기를 매개로 보여주기 위해 마련하였다.', '국립중앙박물관', '세계문화관 세계도자실', 'https://my.matterport.com/show/?m=tLzw9A4Bvp9', 'assets/img/exhibition/national_museum_of_korea/relic1.png', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '삶, 죽음, 부활의 이야기', '세계 4대 문명 가운데 하나로 꼽히는 이집트 문명은 기원전 3천년경 나일강 하구에서 시작되었다. 나일강은 매년 범람하여 이집트 사람들에게 비옥한 토지를 선물하였고, 홍수를 극복하려는 노력에서 천문학과 수학, 달력이 생겨났다. 또 상형문자를 이용한 기록 문화가 발달하여 이집트 역사는 오늘날까지 생생하게 전한다.', '국립중앙박물관', '세계문화관 이집트실', 'https://my.matterport.com/show/?m=hLX8yBzeh2p', 'assets/img/exhibition/national_museum_of_korea/relic2.png', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '금강산에 오르다','백옥같이 우뚝 선 일만 이천 봉우리, 신비한 금강산 조선시대 사람들 누구나 꿈꿨던 금강산 여행. 지금은 쉽게 갈 수 없는 금강산의 사계를 감상하며 잠시나마 편안한 치유의 시간을 보내시기 바랍니다.', '국립중앙박물관', '디지털실감영상관 실감콘텐츠', 'https://www.youtube.com/watch?v=b8TsnrZZeAs&t=328s', 'assets/img/exhibition/national_museum_of_korea/relic3.png', '360° 영상');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '왕의 행차, 백성과 함께하다', '1795년 8일간의 정조와 어머니 혜경궁의 화성행차, 1796년의 화성 낙성연. 조선시대 궁궐 밖으로 나선 왕의 행차는 왕의 위엄을 상징하는 의례이면서 백성들의 큰 볼거리였습니다. 성대하면서도 흥겨운 왕의 행차, 춤과 음악이 어우러진 잔치, 군사훈련을 축제의 이미지로 재구성한 200여년 전 그날로 함께 가볼까요?', '국립중앙박물관', '디지털실감영상관 실감콘텐츠', 'https://www.youtube.com/watch?v=dg-ytQzgkJ0&t=30s', 'assets/img/exhibition/national_museum_of_korea/relic4.png', '360° 영상');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'공간으로 보는 한국현대사, 광화문', '이번 특별전을 통해 대한민국의 대표적 상징공간인 광화문 거리가 한국 현대사의 주요한 현장이었음을 재발견하고, 공간 변천에 따라 한국인들의 기억에 각인된 다양한 의미를 되새겨 광화문 공간의 미래를 전망해 보는 기회가 되기를 바랍니다.', '대한민국역사박물관',	'온라인 박물관', 'https://www.much.go.kr/online_exhi/gwangHwamun_VR/index.htm', 'https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000014707&fileSn=1', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'구 상설전시실', '대한민국의 태동 - 대한민국의 기초확립 - 대한민국의 성장과 발전 - 대한민국의 선진화, 세계로의 도약', '대한민국역사박물관', '온라인 박물관', 'https://www.much.go.kr/online_exhi/sangsulJunsi/index.html', 'http://www.junglim.co.kr/upload/works/201801/496/worksViewHorizontal/20180112171224433/20180112171224433.jpg_1920.jpg', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'대한민국 역사꿈마을', '그때 그 시절 꿈마을 - 우리나라 대한민국 - 지구촌 여러 나라 - 그때 그 시절 장난감 - 우리나라의 미래 나의 꿈', '대한민국역사박물관', '어린이 박물관', 'https://www.much.go.kr/online_exhi/childMuseum/index.html', 'https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000014639&fileSn=1', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '우리 모두 어린이', '노 키즈존이 유행하고, 초유의 저출산 시대를 맞이하며 우리 시대의 어린이는 과연 어떤 존재인가 다시 한 번 묻게 됩니다. 다소 투박할 수 있지만, 전시에서 생각해 본 어린이와 우리의 모습을 언어를 뛰어넘어 그려보기 바랍니다.', '대한민국역사박물관', '기획전시실', 'https://look360.kr/vr/much_2022_special_exhibition/much_2022_special_exhibition/29221', 'https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000016475&fileSn=1', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '시민이 만든 박물관', '시민들로부터 기증받은 주요 유물을 한자리에서 펼쳐 보이는 개관 20주년 기증유물특별전을 엽니다. 지금까지 개최하였던 기증유물특별전을 중심으로 기증유물에 스며있는 기증자의 소중한 기억과 삶의 흔적을 시민들과 나누고 공감하고자 합니다.', '서울역사박물관', '기획전시실', 'https://museum.seoul.go.kr:8088/ARCHIVE_DATA/vr/the_museum_loved_by_seoul_citizens/index.html', 'https://museum.seoul.go.kr/upload/bbs/2023/6/13/c66c08b0-239d-4bc0-8bf9-99edebeba16e.jpg', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'명품도시 한양', '개관 20주년 특별전으로 조선 왕실과 한양 양반의 고급스러운 취향을 담아 전국 각지에서 생산되고 한양에서 소비되었던 명품들을 감상하시면서, 우리 조상의 지혜와 솜씨를 엿볼 수 있는 자리가 되기를 바라며 시민의 자산인 박물관의 소장품에 대해서도 이해를 높이는 기회가 되기를 바랍니다.', '서울역사박물관', '기획전시실', 'https://museum.seoul.go.kr/CHM_HOME/jsp/MM03/vr/treasures_of_hanyang/index.html', 'https://museum.seoul.go.kr/upload/bbs/2022/10/19/8b60a42e-e23b-42ac-84c7-caf3266d1710.jpg', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'서울 책방거리', '서울의 대표적인 책방거리인 청계천 대학천 책방거리의 형성과 변화를 살펴보며 현대 서울의 도시화 과정에서 대학천, 청계천 책방거리가 갖는 시대적인 의미를 되새겨 보고, 다양한 책들을 통해 잊혀졌던 꿈과 추억을 회상하는 기회가 되시길 기대합니다.', '서울역사박물관', '기획전시실', 'https://museum.seoul.go.kr:8088/ARCHIVE_DATA/vr/seoul_book_streets/index.html', 'https://museum.seoul.go.kr/upload/bbs/2023/5/4/0fc44317-1d49-4f8f-8ac6-f73ea6bd8231.jpg', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT,	'그날, 혜화문에서는 무슨 일이 있었던 걸까', '지금으로부터 500여 년 전, 혜화문을 관리하는 과정에서 있었던 몇 가지 일화들을 소개합니다. 수도 한양의 출입구를 지키고 방비하는 과정에서 있었던 사건, 사고를 통해 옛 혜화문의 모습을 떠올려보는 기회가 되시길 바랍니다.', '서울역사박물관', '기획전시실', 'https://museum.seoul.go.kr:8088/ARCHIVE_DATA/vr/what_happened_at_hyehwamun_that_day/index.html', 'https://museum.seoul.go.kr/upload/bbs/2023/5/4/6f70587b-a145-4f16-b1b1-2e2329557abe.jpg', 'VR 전시');
INSERT INTO EXHIBITION (exno, title, sumary, museum, gallery, url, img, mediaType) VALUES (DEFAULT, '국립고궁박물관 투어', '조선의 국왕 - 조선의 궁궐 - 왕실의 생활 - 대한제국 - 어차 - 궁중서화 - 왕실의례 - 과학문화 - 고궁배움터', '국립고궁박물관', '온라인박물관', 'https://www.gogung.go.kr/VR/index.html', 'https://www.m-i.kr/news/photo/202012/772354_550181_132.jpg', 'VR 전시');


SELECT * FROM EXHIBITION;


--------------- 행사 INSERT ------------------

insert into event values(1, '서울문화재야행
(정동야행)', '정동 지역문화재를 활용한 도심 야간 문화행사 7夜 - 야간개방 : 정동역사 문화시설(박물관, 미술관, 종교시설, 대사관등)
- 문화행사 : 덕수궁 고궁음악회, 중명전 퓨전 음악공연, 정동극장 샌드아트, 시립미술관 인형극 등
- 역사체험존 : 정동 봄꽃길로의 초대 오얏꽃 문, 대한제국의 음악 피아노의 선율 등
- 거리예술존 : 궁민들 퍼포먼스, 곡호대 퍼레이드 돌담길 거리공연 등
- 도보투어 : 해설사와 함께하는 정동시간여행, 정동 어느봄날 등 ', '9월 예정 ', '9월 예정 ', '제한 없음 ', '무료 ', '서울 중구 정동 일대 ','https://www.sisa-news.com/data/photos/20220939/art_166414234408_1a29d6.jpg' );
insert into event values(2, '성북동문화재야행
(성밖마을이야기) ', '성북동 문화재 야행에서는 한양도성, 최순우 옛집, 심우장, 이종석별장, 우리옛돌박물관,한국가구박물관, 성북선잠박물관 등 야간에 접하기 어려운 유서 깊은 성북동의 문화재와 문화 시설을 해설과 함께 둘러볼 수 있음 ', '9월 18일(금) ', '9월 20일(일) ', '제한 없음 ', '무료 ', '성북동일대','https://blog.kakaocdn.net/dn/mHNZS/btrkfXi5XBc/67982lll2LGjz2cOrYlQSk/img.jpg' );
insert into event values(3, '피란수도부산문화재야행
(피란의역사를품고희망의밤을누비다) ', '대한민국의 피란수도 부산을 재발견하는 시간! 부산은 1,129일의 한국전쟁 기간 중 1,023일간 대한민국의 수도로서 다양한 역할을 수행하며 부산으로 내려온 피란민들을 품고 위기를 극복한 포용성과 개방성을 지닌 도시로, 지금까지도 도심 속 가까이에 살아있는 피란유산의 역사적 의미와 피란시절의 생활상을 전시, 공연, 체험 등을 통해 향유하는 프로그램 ', '8월 21일(금) ', '8월 22일(토) ', '제한 없음 ', '무료 ', '부산근현대역사관, 유라리광장 등 ','https://noiseframe35.com/files/attach/images/2023/07/21/c0bdad71a18f579f40c3c28ff2e092dc.jpg' );
insert into event values(4, '대구문화재야행 ', '대구의 근대골목 일원 밀집된 문화유산을 활용한 야경투어, 전시·공연·체험 등을 통해 대구 문화재 야행만의 특화된 프로그램 발굴·추진함 ', '8월 21일(금) ', '8월 22일(토) ', '제한 없음 ', '무료 ', '경상감영공원 일원 ','https://cdn.ksilbo.co.kr/news/photo/202110/914427_511944_1746.png' );
insert into event values(5, '광주문화재야행
(동구달빛걸음) ', '문화재 숲 정원, 명인과의 특별한 만남, 담장에 피어나는 문화재 작은 갤러리, 문화재 산책, 밤마실 등 30여개의 프로그램 ', '6월 16일(금) ', '6월 17일(토) ', '제한 없음 ', '무료 ', '재명석등 앞 광장(5·18민주광장), 광주읍성유허, 서석초 등 문화재 일원 ','https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_a8478f7f-2acc-48ef-a879-cfdd7f7b5852_3.jpg' );
insert into event values(6, '인천개항장문화재야행 ', '대한민국 근대화의 시작이었던 개항장, 그 당시의 문화재 그리고 역사와 스토리를 주제로 한 다양한 체험과 지역민들의 참여가 함께 하는 인천 개항장 문화재 야행임 ', '8월 26일(토) ', '8월 27일(일) ', '제한 없음 ', '무료 ', '중구 개항장 문화지구 일원 ','https://www.ito.or.kr/images/bbs/report/2022/2022_yahaeng_poseuteo.jpg' );
insert into event values(7, '강화문화재야행
(고려의밤을품다) ', '기존에 개방되지 않았던 강화의 지역문화재를 활용한 공연 및 전시, 해설이 있는 투어, 관광객 참여형 프로그램 등 8야(夜) 주제로 다채로운 문화재 참여프로그램 구성 ', '9월 11일(금) ', '9월 12일(토) ', '제한 없음 ', '무료 ', '인천 강화군 강화읍 용흥궁공원 일원 ','https://www.ganghwa.go.kr/images/bbs/report/2021/2021_ganghwamunhwajaeyahaeng_poseuteo.jpg' );
insert into event values(8, '수원문화재야행
(밤빛품은성곽도시) ', '우리나라 최초 계획도시로 설계된 수원, 1997년 유네스코 세계유산으로 선정된 수원화성의 아름다움과 가치를 높이고, 문화재와 문화시설을 활용한 야간명품브랜드 문화재 향유프로그램을 개발·운영하고자 함 ', '8월 14일(금) ', '8월 16일(일) ', '제한 없음 ', '무료 ', '화성행궁, 화성행궁광장 일원 ','https://www.swcf.or.kr/inc/img/sub/page207_2023nightsuwon.jpg' );
insert into event values(9, '양주문화재야행
(일곱빛깔양주목조선야행) ', '조선시대 양주목의 중심지였던 양주관아의 가치와 의미를 재발견하고, 문화콘텐츠로 새롭게 창조함으로서 국민과 함께하는 살아 있는 역사교육장이자 양주를 대표하는 지속가능한 역사문화자원으로 활용하고자 함 ', '10월 9일(금) ', '10월 11일(일) ', '제한 없음 ', '무료 ', '양주관아지 일원 ','https://www.newsro.kr/wp-content/uploads/2022/09/%ED%99%8D%EB%B3%B4%ED%8F%AC%EC%8A%A4%ED%84%B02022-%EC%96%91%EC%A3%BC%EB%AC%B8%ED%99%94%EC%9E%AC-%EC%95%BC%ED%96%89_%EC%A0%80%EC%9A%A9%EB%9F%89.jpg' );
insert into event values(10, '오산독산성문화재야행
(도시를깨우는비사량-독산야행,그리고힐링) ', '1500년의 역사를 품고 있는 독산성과 오산의 문화재를 관광객들에게 밤을 누비는 야간문화를 향유하고 체험하는 다양한 프로그램을 제공하여 관광지로 거듭날 수 있는 기회마련하였음 ', '6월 12일(금) ', '6월 14일(일) ', '제한 없음 ', '무료 ', '오산죽미령평화공원, 세마역로 마을정원, 꿈두레도서관 일원 ','https://oscc.or.kr/files/attach/images/175/743/002/174ee6daab189c6bd9d524bf50abcefb.jpg' );
insert into event values(11, '원주문화재야행
(강원감영의풍류달밤) ', '강원감영, 문화의거리, 원동성당 등 주변의 문화재를 활용하여 지역상권 활성화에 기여하고 강원감영 무형문화재 소개마당, 강원감영 야간 조명경관, 관찰사의 오색지령, 달빛과거시험, 관찰사 풍류마당, 공방교실, 달빛사랑장터임 ', '9월 25일(금) ', '9월 27일(일) ', '제한 없음 ', '무료 ', '강원감영 ','https://cdn.gukjenews.com/news/photo/202111/2342520_2334452_1020.jpg' );
insert into event values(12, '강릉문화재야행
(다시깨어나는천년의관아,강릉대도호부) ', '과거의 역사를 보존하는 기능으로만 머물던 문화재가 현대적 가치와 역할을 품고 살아있는 문화재로 시민들과 조우함
전국유일 ‘대도호부관아’에서 개최되는 강릉문화재야행(夜行)은 ‘다시 깨어나는 천년의 관아, 강릉대도호부’ 주제로 진행됨 ', '7월 08일(토) ', '7월 10일(월) ', '제한 없음 ', '무료 ', '강릉대도호부관아(사적), 서부시장 일원 ','https://cdn.kado.net/news/photo/202305/1181184_610881_5757.jpg' );
insert into event values(13, '청주문화재야행
(맑은고을고운달아) ', '청주의 유·무형문화재 및 원도심 문화유산을 활용한 창작 콘텐츠를 제공함, 특히 고려·조선시대 테마존(중앙공원~성안길)과 근·현대 테마존(북문로~옛청주역사공원)으로 공간을 구분하여 환경연출 및 프로그램이 운영되며, 행정 예술문화기관·예술인·청년·대학생·지역민·상인 등이 팀메이트를 구성하여 문화재 활용 사업을 주도적으로 추진함 ', '8월 28일(금) ', '8월 29일(토) ', '제한 없음 ', '무료 ', '청주 중앙공원, 용두사지철당간, 청주시청 임시청사(청녕각), 성안길, 남주남문로 한복문화의 거리 ','https://www.cj-ilbo.com/news/photo/202208/1085345_1000138_155.jpg' );
insert into event values(14, '옥천문화재야행
(달빛아래펼쳐지는구읍舊邑이야기) ', '조선시대부터 근대에 이르기까지 다양하게 남아있는 구읍의 문화재를 활용 하여 관심이 저조한 옥천의 문화재와 역사에 대한 인식 확충하고자 하며 유무형 문화재를 활용한 옥천의 역사이야기 등 스토리텔링 콘텐츠를 창작하고 지역 주민이 자발적으로 참여하여 지역민 간 화합을 도모하고 침체된 구도심을 활성화시키고자 함 ', '9월 4일(금) ', '9월 5일(토) ', '제한 없음 ', '무료 ', '옥천전통문화체험관(옥천읍 향수길 100) 일원 ','https://cdn.dongnamns.co.kr/news/photo/202008/1204_1532_312.jpg' );
insert into event values(15, '공주문화재야행
(근대,자세히보아야더예쁘다) ', '공주 근대문화재 활용 및 원도심 재생 사업 활성화 필요하고 지역예술인의 자발적 참여 및 지역경제 활성화 촉진하며 원도심 도시재생과 문화재 야행을 통한 지역 문화유산 인식 제고함 ', '9월 8일(금) ', '9월 10일(일) ', '제한 없음 ', '무료 ', '공주 제민천 일원 근대 문화재(구 공주읍사무소, 제일교회 등) ','https://gongju-culturenight.com/images/main/poster.png' );
insert into event values(16, '강경문화재야행
(타임머신타고시간여행) ', '‘강경근대역사문화촌’ 사업을 통해 조성되는 인프라를 활용하는 맞춤형 프로그램을 통해 강경의 문화유산을 알리고, 강경의 상권을 회복하고자 함 ', '8월 26일(금) ', '8월 28일(일) ', '제한 없음 ', '무료 ', '죽림서원일원, 근대문화거리, 옥녀봉 등 강경읍 일원 ','https://www.contestkorea.com/admincenter/files/meet/202208142336258556002.jpg' );
insert into event values(17, '부여문화재야행
(백제의밤세계유산을깨우다!) ', '문화재 야행사업의 초기부터 2019년까지 정림사지 위주의 행사구성에서 벗어나 유네스코 세계유산인 관북리유적을 새롭게 조명함으로써 부여군 문화재의 새로운 모습을 부각시고자 함 ', '9월 15일(금) ', '9월 17일(일) ', '제한 없음 ', '무료 ', '정림사지, 관북리유적 일원 ','https://www.daejonilbo.com/news/photo/202010/1442232_323872_3434.jpg' );
insert into event values(18, '홍성문화재야행
(홍주의병,다시깨어나다) ', '일제강점기 테마가 있는 공연 및 체험활동을 통해 지역주민이나 관광객들에게 문화유산을 알리고 활용하며 야간 문화재 볼거리 제공을 통한 지역 경제 활성화 및 주민의 삶의 질 개선함 ', '8월 12일(토) ', '8월 13일(일) ', '제한 없음 ', '무료 ', '홍주읍성 일원 ', 'https://scontent-gmp1-1.xx.fbcdn.net/v/t39.30808-6/362938449_6356482771094610_4325528004208109071_n.jpg?stp=dst-jpg_p960x960&_nc_cat=103&ccb=1-7&_nc_sid=36a2c1&_nc_ohc=VRQ49rVc83kAX_sYKDQ&_nc_ht=scontent-gmp1-1.xx&oh=00_AfCN8YXgL10qHkkHTHAAyI8_3XfmqnKO-KJkfR1poRVP7A&oe=64CE11D7' );
insert into event values(19, '전주문화재야행
(문화재술사의八야심작) ', '전주 문화재 야행은 지역의 젊은 기획자들이 모여 보다 젊은 감각, 신선한 발상을 내세워 앞으로의 문화재 활용에 초점을 맞춰 조명하고자 함 또한, 전주시는 전주 문화재 야행을 통해 국민과 문화재의 거리를 좁혀 문화재를 국민의 삶의 일부분으로 접목하고자 하며, 전주의 무형과 유형의 한국 문화유산이 국민의 마음속에 빼어난 작품으로 자리 잡길 바라는 마음에 전주 문화재 야행을 기획하고 추진함에 힘쓰고 있음 ', '5월 26일(금) ', '5월 27일(토) ', '제한 없음 ', '무료 ', '전주 한옥마을 / 경기전 / 전라감영 / 풍남문 / 풍패지관 ', 'http://www.jeonjunight.com/img/2021/info_2023.jpg' );
insert into event values(20, '군산문화재야행
(여름밤,근대문화유산빛의거리를걷다) ', '2023년 군산문화재야행은 8월10일부터  12일까지 3일간 군산 내항 및 원도심 일원에서 군산의 문화재, 문화시설과 함께 프로그램이 진행 됩니다.
2023년 군산문화재 야행은 군산 원도심과 함께 상생하며 문화재에 대하여 쉽고 재미있게 알 수 있는 체험 프로그램과 다양한 장르의 공연과 군산의 역사를 알 수 있는 전시 등  다양한 볼거리와 가족, 연인, 친구와 함께  특별한 추억을 만들 수 있는 아름다운 공간으로 준비되어있습니다. 지역과 함께 상생하는 군산문화재야행! ', '8월 10일(목) ', '8월 12일(토) ', '제한 없음 ', '무료 ', '군산 내항 및 원도심 일원 ', 'https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_9c61604a-7abf-4397-a916-8b6d64a70447_3.jpg' );
insert into event values(21, '익산문화재야행
(금마저백제왕궁을누리다) ', '백제왕궁은 살아있다 백제 무왕의 천도지인 왕궁리유적과 국보 제289호 왕궁리 오층 석탑이 살아 숨 쉬고 있는 익산 문화재 야행 밤이 내리면 아름다운 문화재들 사이로 익산의 역사가 흐르고 익산 문화재 야행이 시작됩니다. 찬란한 백제문화 숨결가득한 백제왕궁으로 여러분을 초대합니다. ', '4월 7일(금) ', '4월 9일(일) ', '제한 없음 ', '무료 ', '백제왕국(왕궁리유적)일원 ', 'https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_44bab281-8e00-4e18-8cf0-4efe60a8b32e_3.jpg' );
insert into event values(22, '남원문화재야행
(광한루의밤풍경) ', '남원이 가지고 있는 문화적 고유성과 정체성을 바탕으로 광한루의 가치를 격상하고 문화재 시설을 활용한 야간 프로그램 운영으로 숙박형 관광지로 자리매김하며 지역문화의 하드웨어, 소프트웨어, 휴먼웨어 구성을 통한 능력배양 및 문화재를 적극 활용한 문화관광 경쟁력 강화함 ', '9월 30일(금) ', '10월 2일(일) ', '제한 없음 ', '무료 ', '요천월궁광장, 광한루원 일대 ', 'https://mblogthumb-phinf.pstatic.net/MjAyMjA5MjNfMzcg/MDAxNjYzOTIzNjk4NDAy.ZBlbiG5WsekhC8iCe4M7z8_q726t6bgyTg4uxweRl-kg.3CQ9EeA6_SlHmL2HaaueT3qx90eCe45p1AMgUGeXLpYg.JPEG.goodnamwon/%EB%82%A8%EC%9B%90_%EB%AC%B8%ED%99%94%EC%9E%AC%EC%95%BC%ED%96%89_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?type=w800' );
insert into event values(23, '김제문화재야행
(징게맹갱밤마실가자~!) ', '문화재 및 민간 문화시설 야간 개방, 문화재 연계 체험 프로그램 운영, 야간 상시조명 설치 활용 문화재 재구성, 지역 특화 프로그램 운영, 각종 공연, 홍보 등 ', '9월 2일(금) ', '9월 4일(일) ', '제한 없음 ', '무료 ', '전라북도 김제시 향교길 89-3  ','http://jbpress.kr/data/tmp/2208/20220829105315_avshisxh.jpg' );
insert into event values(24, '고창문화재야행
(뿌리깊은역사·문화香을 담는 고창야행) ', '「고창 문화재 야행」은 문화재에 내재된 옛 선현들의 얼과 예지를 되살린 프로그램들과 지역의 전통문화와 정체성을 담아낸 프로그램들로 구성되어 있으며 군민들이 하나가 되어 직접 기획, 출연, 공연 제작·운영하는 문화역량으로 한반도 첫수도 고창에 걸 맞는 역사문화도시로 발돋움 하고자 함 ', '8월 7일(금) ', '8월 8일(토) ', '제한 없음 ', '무료 ', '고창읍성 일원 ' ,'https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2019/08/20/.cache/512/20190820266843.jpg');
insert into event values(25, '여수문화재야행
(전라좌수영에서 여수의 문화재를 배우다) ', '전라좌수영 내 진남관(국보 제304호)과 55점의 여수 문화재, 충무공 이순신 관련 문화재를 중심으로 ‘야간문화 향유 및 문화재활용 야간 프로그램’을 통해 새로운 문화유산 체험 기회를 제공함 ', '8월 7일(금) ', '8월 8일(토) ', '제한 없음 ', '무료 ', '여수시 진남관 일원 ','https://image.news1.kr/system/photos/2022/10/12/5624603/article.jpg' );
insert into event values(26, '순천문화재야행
(소강남小江南 순천順天) ', '소강남 순천이라는 이름 속에 담겨진 문화유산을 현대인들이 함께 느낄 수 있도록 문화재의 가치를 알리고, 활용하는 프로그램 ', '9월 4일(금) ', '9월 6일(일) ', '제한 없음 ', '무료 ', '순천문화의거리 및 매산뜰 일원 ','https://static.wixstatic.com/media/73bf21_73ff2263892e4d63bc3344c0b66816d8~mv2.jpg/v1/fill/w_560,h_794,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/%EC%95%BC%ED%96%892%EC%B0%A8%20%ED%8F%AC%EC%8A%A4%ED%84%B0%20(1).jpg' );
insert into event values(27, '나주문화재야행
(금성별곡, 별里 별里 달里셩) ', '나주시의 문화자원을 활용하여 특색 있는 야간(夜間)형 문화향유 프로그램을 운영함으로써 관람객에게 색다른 문화 체험 기회를 제공하고, 역사 문화도시 이미지 고취 및 새로운 관광콘텐츠 개발로 지역 명소로의 발돋움 및 지역경제 활성화를 도모하고, 나주시만의 독특한 문화콘텐츠 발굴을 통해 지역경제 활성화 및 부가가치 증대함 ', '9월 18일(금) ', '9월 20일(일) ', '제한 없음 ', '무료 ', '나주읍성권 일대 ','https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_19ab1881-4e7f-4ef1-8e4d-0940f5f5c1be_3.png' );
insert into event values(28, '보성문화재야행
(열선루의전설) ', '지역 내 문화유산과 그 주변의 문화 콘텐츠를 하나로 묶어 야간에 특화된 문화체험 기회를 제공하는 한편, 문화유산을 매개로 한 지역경제와 관광산업의 활성화를 도모하기 위한 사업임 ', '9월 18일(금) ', '9월 20일(일) ', '제한 없음 ', '무료 ', '보성군 일대 ','https://cdn.eachj.co.kr/news/photo/202108/3174_6494_2212.jpg' );
insert into event values(29, '목포문화재야행 ', '근대역사문화공간을 활용한 공연·전시·체험 등 야간문화 향유프로그램을 실시하여 목포의 문화재를 알리고 지역경제 활성화 도모함 ', '9월 23일(금) ', '9월 25일(일) ', '제한 없음 ', '무료 ', '목포근대역사문화공간 | 목포근대역사관 1·2관 | 공립심상소학교 | 목표진 역사공원 | 경동성당 | 대중음악전당 ','http://www.newsggam.com/news/photo/202207/97749_57312_4344.jpg' );
insert into event values(30, '경주문화재야행
(셔블밝긔다래밤드리노닐다가!) ', '신라와 조선을 품은 경주교촌 한옥마을과 신라 최고의 호화다리 월정교, 그리고 인심 후한 경주최부자댁 뜰에서 신라 처용이 그랬듯이 밤늦도록 8야(夜) 프로그램으로 노래하고 춤추며 경주의 밤을 일으켜 세움 ', '9월 30일(금) ', '10월 2일(일) ', '제한 없음 ', '무료 ', '경주 교촌한옥마을 ','https://www.gyeongju.go.kr/upload//board/board_1342/bod_244852//C3CD5C63CF684EDA8DBB27910B6E9089.jpg' );
insert into event values(31, '안동문화재야행
(월영야행) ', '우리 지역에 전승되고 있는 문화재와 세계보편정서인 사랑이라는 주제를 기반으로 하여 뉴미디어 트렌드에 발맞춘 빛을 테마로 하는 프로그램 운영함 ', '8월 4일(금) ', '8월 6일(일) ', '제한 없음 ', '무료 ', '월용교 일대 ','https://cdn.dkilbo.com/news/photo/202307/408436_290437_0600.jpg' );
insert into event values(32, '고령대가야문화재야행
(고분에걸린달빛소리) ', '대가야의 도읍지 고령에서 대가야의 역사를 여행하고 대가야의 문화를 체험해보세요. 고령 대가야 문화재 야행(夜行)은 지역의 역사성을 간직한 문화재를 중심으로 지역 문화유산과 문화시설을 기반으로 한밤에 역사와 문화의 색다른 매력을 체험하고 즐기는 축제의 장입니다. ', '10월 21일(금) ', '10월 22일(토) ', '제한 없음 ', '무료 ', '경상북도 고령군 대가야고분군, 대가야문화누리 일원 ','https://cdn.chilgoklife.com/news/photo/202110/13962_15288_1711.jpeg' );
insert into event values(33, '통영문화재야행
(신임통제사도임연회 통제공, 납시오!) ', '1592년 발발한 임진왜란에서 초대 삼도수군통제사였던 충무공이순신의 승리 후, 수군 군영으로써 중심이 된 통제영(통영)의 209대(209명) 통제사가 부임하는 내용을 재현하며 지역의 유·무형의 문화재를 활용한 문화재야행 프로그램으로 개최하고자 함 ', '5월 5일(금) ', '5월 6일(토) ', '제한 없음 ', '무료 ', '통영삼도수군통제영, 문화마당 일원 ','https://ty-night.com/theme/basic/images/sub/tynight_img2023.jpg' );
insert into event values(34, '김해문화재야행
(오래된미래-가야에서김해까지) ', '김해 대표 문화재인 수로왕릉을 중심으로 다양한 역사문화체험의 기회를 제공하며 문화유산을 매개로 김해시의 지역 관광을 활성화 하고자 함 ', '10월 13일(목) ', '10월 15일(토) ', '제한 없음 ', '무료 ', '수로왕릉, 수릉원, 대성동고분군 일대 ','https://cdn.gimhaenews.co.kr/news/photo/202209/46507_56186_725.jpg' );
insert into event values(35, '밀양문화재야행
(밀양도호부 풍월에 젖다) ', '밀양읍성 일원에 산재한 보물 제147호 영남루를 비롯한 유형문화재들과 지역의 무형문화재들을 접목, 연계한 행사이며 각종 문화시설에서 이루어지는 이야기를 지역민과 함께 만들어내는 야간 행사
밀양 야행은 남천강물에 비치는 달빛과 고기잡이 할 때 밝혀진 어화등불을 활용한 아름다운 야경의 모습과 오색 빛 등불을 활용하고 도호부의 옛길에서 펼쳐지는 역사인물 이야기 ', '8월 12일(토) ', '8월 14일(월) ', '제한 없음 ', '무료 ', '영남루 일원 ','https://static.wixstatic.com/media/26ec43_4275674e711a4a48b635f241a772a9a8~mv2.jpg/v1/fill/w_560,h_792,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/26ec43_4275674e711a4a48b635f241a772a9a8~mv2.jpg' );
insert into event values(36, '서귀포문화재야행
(300년전의 탐라순력도, 樂을 넘어 通하다) ', '탐라순력도(보물 제652-6)를 활용한 야간문화 향유 프로그램 운영을 통한 낙후된 구시가지권(송산동과 정방동, 서홍동 남성리)의 지역경제 활성화 및 지역발전의 핵심관광자원 역할 담당 ', '9월 15일(금) ', '9월 16일(토) ', '제한 없음 ', '무료 ', '천지연 폭포, 칠십리 야외 공연장, 새연교, 새섬 서귀포층 패류 화석 산지, 정방폭포, 자구리공원 외돌개, 문섬 범선 천연보호구역 일원 ','https://api.cdn.visitjeju.net/photomng/imgpath/202306/20/f603807b-3e64-45e4-9cc7-f921a7b189c8.png' );




INSERT INTO eventProgram VALUES(1 ,1 , '반딧불 정원
돌담길 미디어아
그림자 포토존
장소
덕수궁 돌담길 일원 ', '다같이 돌자 정동 한바퀴
재미있는 정동기행
대한제구그이 길 역사탐방
장소
덕수궁 일원 ', '돌담길 역사체험
장소
덕수궁 등 ', '고궁음악회
황제 고종을 이야기하다
역사특강
장소
덕수궁 일원 ', '궁(宮)민들 퍼포먼스
곡호대 퍼레이드
근대인물 석고마임
장소
덕수궁 돌담길 일원 ', '예술장터
한복대여
장소
정동길 일원 ', '푸드코트
한컵마트
장소
정동길 일원 ', '아직 준비중입니다. ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1124.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1129.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1127.jpg ');
INSERT INTO eventProgram VALUES(2 ,2 , '문화재 야간 개방
장소
최순우옛집, 이종석 별장 등 ', '성북전차
장소
성북동 문화재 야행 메인거리 ~ 문화재 및 문화시설 ', '해설야행
장소
최순우 옛집, 이종석 별장 등 ', '문화시설 야간개방
장소
성북구립미술관, 성북선잠박물관 등 ', '성북 명인 열전
성북동 콘서트
문화시설 공연
장소
메인거리 및 문화시설 ', '체험프로그램
장소
메인거리 및 문화시설 ', '성북동 일번 맛집
장소
메인거리 일대 ', '성북동에 머무는 밤
장소
성북동 일대 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1130.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1131.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1134.jpg ');
INSERT INTO eventProgram VALUES(3 ,3 , '피란수도 별빛거리
장소
임시수도 기념거리 일원 등 ', '피란길을 따라 걷는 역사이야기
장소
임시수도 기념거리 일원 ', '피란역사 이야기 마을
장소
임시수도 기념거리 일원 ', '피란벽화마을
장소
임시수도정부청사 외 2 ', '피란수도 문화 1번지
장소
임시수도 기념거리 일원 ', '국제야시장
장소
임시수도 정부청사 외 1 ', '피란먹거리촌
장소
임시수도정부청사, 중구 일원 ', '문화재에서 특별한 하룻밤
장소
대한성공회 부산주교좌 성당 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1136.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1140.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1139.jpg ');
INSERT INTO eventProgram VALUES(4 ,4 , '근대로의여행 오픈하우스
장소
근대골목, 청라언덕 ', '근대로 걷다
장소
근대골목, 청라언덕 ', '근대골목 이야기
장소
근대골목, 청라언덕 ', '근대를 보다
장소
근대골목, 청라언덕 ', '근대음악
장소
구대구제일교회, 근대근대골목, 청라언덕 ', '근대로 상회
장소
근대골목 ', '근대로 상회
장소
근대골목 ', '문화재에서 하룻밤
장소
근대골목 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1144.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1143.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1147.jpg ');
INSERT INTO eventProgram VALUES(5 ,5 , '문화재 숲 정원
장소
광주읍성유허 ', '명인과의 특별한 만남
장소
광주읍성유허 ', '동구 이야기꾼의 문화재 산책
장소
옛 전남도청, 광주읍성유허, 재먹석등, 서석초등학교 등 ', '문화재 밤 마실
장소
옛 전남도청, 서석초등학교 ', '미디어 퍼포먼스 4개의 문(門)이 열린다
장소
광주읍성유허 ', '동구 사회적경제마켓 가치 가게
장소
옛 전남도청(518민주광장) ', '허백련 춘설헌 달빛다회
열혈 청년 야행 맛집
장소
광주읍성유허 ', '코레일과 함께하는 광주문화재 야행열차 달빛 걸음
장소
동구 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1149.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1150.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1151.jpg ');
INSERT INTO eventProgram VALUES(6 ,6 , '문화재를 빛으로 밝히다
장소
개항장문화지구 일원 ', '문화재야행 스탬프 투어
장소
개항장문화지구 일원 ', '문화재에서 즐기는 개항장 체험
장소
개항장문화지구 일원 ', '문화재 야간 개방
장소
개항장문화지구 일원 ', '스토리텔링 도보탐방
장소
개항장문화지구 일원 ', '저잣거리
장소
개항장문화지구 일원 ', '개항장 문화마실
장소
개항장문화지구 일원 ', '야(夜)한밤
장소
하버파크 호텔 등 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1153.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1152.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1156.jpg ');
INSERT INTO eventProgram VALUES(7 ,7 , '고려의 밤길
장소
용흥궁, 성공회강화성당, 고려궁지 ', '문화재야행을 알리는 길거리 퍼레이드 공연
장소
김상용순절비, 용흥궁공원 일대 ', '스토리텔러와 함께한 보도투어
고려의 밤, 별자리 관측
장소
용흥궁, 성공회강화성당, 고려궁지 ', '강화문화재 SNS 사진전시
강화 과거이야기 사진전시
장소
강화초등학교 ', '개박실 및 초청공연, 고려궁지 버스킹, 마당놀이
장소
고려궁지, 용흥궁공원 일원 ', '강화지역 먹거리부스
장소
용흥궁공원 일원 ', '강화문화체험 부스
강화로컬마켓 부스
장소
강화소창, 고려문양, 화문석, 기념품 공모 ', '강화에서 하룻밤
장소
연계한 홍보 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1160.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1159.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1161.jpg ');
INSERT INTO eventProgram VALUES(8 ,8 , '성안 문화재
장소
수원화성 화성행궁 등 ', '성안 길따라
장소
화성행궁 일원 ', '성안 사람들 이야기
장소
화성행궁, 궁방거리, 생태교통마을 등 ', '밤빛 풍경
장소
화성행궁, 공방거리 등 ', '한바탕 놀음
장소
화성행궁 공방거리, 생태교통마을, 남문로데오거리 등 ', '성안장터
성안 먹거리
장소
공방거리, 생태교통마을, 수원화성박물관 ', '성안 먹기리
장소
공방거리, 남문로데오거리, 통닭거리 등 ', '성안에서 하룻밤
장소
수원화성 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1166.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1168.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1167.jpg ');
INSERT INTO eventProgram VALUES(9 ,9 , '양주고나아 달빛속으로
장소
양주관아지 일원 ', '양주목의 정취를 찾아서
오감만족 양주목
장소
양주관아지 일원, 양주향교 ', '정조, 관민동락을 꿈꾸다
장소
양주관아지 일원 ', '호시탐탐 양주목
장소
양주관아지 일원 ', '양주목,歌와 舞를 通하다
장소
별산대놀이 공연장, 무형문화재 통합공연장 ', '저자거리 한마당
장소
무형문화재 통합공연장 ', '버들찻집
장소
양주관아 내아 ', '문화재에서 하룻밤
장소
양주 관아지 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1172.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1173.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1174.jpg ');
INSERT INTO eventProgram VALUES(10 ,10 , '장군바위에서 비경
장소
독산성 ', '나라를 지키는 호국의 길
장소
독산성, 유엔군 초전기념관 ', '문화재의 역사속으로
장소
독산성, 궐리사, 유엔군 초전기념관 ', '독산성 전투 샌드아트
장소
독산성 세마대지 ', '궐리사 성적도 가치재조명
장소
궐리사 ', '도시를 깨우는 비사량
장소
고인돌공원 ', '독산성 음식문화거리 체험과 힐링
장소
독산성 음식문화거리 ', '독산성 운주당의 밤
행단에서 꾸는 꿈
장소
궐리사 행단, 독산성 세마대지 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1177.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1180.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1178.jpg ');
INSERT INTO eventProgram VALUES(11 ,11 , '강원도 무형문화재 소개마당
장소
강원감영 ', '관찰사의 오색지령
아카데미로의 초대
장소
강원감영, 구아카데미극장 ', '달빛과거시험
김금원 금강기행
장소
강원감영 ', '원주문화재 시각작품 전시회
장소
원주문화원 ', '개막축하연주회
장소
강원감영, 문화의거리 상설공연장 ', '감영의 은행나무 공방교실
옻칠전시회
달빛사랑장터
장소
문화의거리 ', '야식
선화당 찻자리
푸드바이크 음식거리
장소
강원감영, 문화의 거리 ', '아직 준비중입니다. ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_1.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_2.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_3.png ');
INSERT INTO eventProgram VALUES(12 ,12 , '빛으로 만나는 천년의 관아
장소
아문 ', '신나는 서부마당
달밤 愛 버스킹
장소
강릉 서부시장 ', '달빛 따라 걷는 강릉대도호부관아
강릉대도호부관아 수문장 교대식
장소
동헌 ', '강릉문화재야행 설치미술전
강릉 장인 학교
장소
문화마당 ', '강릉대도호부관아 의복 패션쇼
강릉대도호부사 주제 연희극 3탄
장소
관아마당 ', '저잣거리
달달한 서부시장 4色4味
장소
토성로, 강릉서부시장 ', '먹어야행 : 강릉문화재 푸드트럭
마셔야행 : 달빛아래 다도풍정
장소
의운루. 동대청 ', '강릉문화재야행 달밤 스테이
장소
선교장, 오죽헌 마을 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1182.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1181.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1183.jpg ');
INSERT INTO eventProgram VALUES(13 ,13 , '옛 청주읍성과 달빛 산책
장소
원도심 일대 ', '조선넘어 근대로
장소
원도심 일대 ', '명장의 손끝을 잇다
장소
중앙공원 광장 ', '천년의 기적, 망선루미디어 아트 퍼포먼스
장소
중앙공원, 망선루 ', '만담강자, 청주이야기꾼
장소
북문로 일대 ', '성안길 예술점포
장소
성안길 일대 ', '청주읍성 식도락 야행
장소
원도심일대 ', '아직 준비중입니다. ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_6.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_7.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_8.png ');
INSERT INTO eventProgram VALUES(14 ,14 , '달빛 아래서 지나간 세월을 추억하다
장소
옥천향교 외 6개소 ', '달빛 따라, 별빛 따라 스탬프 투어
장소
옥천향교 외 6개소 ', '딛고 있는 이 땅위에 살았던 옛 사람 이야기
장소
옥천향교 외 6개소 ', '사진으로 만나는 옥천의 문화유산 이야기
장소
전통문화 체험관 ', '금강보고 옥천의 흥
장소
전통문화 체험관 ', '이야기가 있는 구읍 시장
개장! 옥천 특산품 한마당
장소
문화재야행 거리 일원 ', '맛과 멋이 함께하는 구읍 거리
장소
문화재야행 거리 일원 ', '청청 옥천, 별빛 가득 담은 한오게서
장소
전통문화 체험관 숙박등 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_16.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_17.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_18.png ');
INSERT INTO eventProgram VALUES(15 ,15 , '제민천 별빛 음악회
월야장천(月夜長川) - 제민천에 달이 뜨다 -
장소
제민천 일원, 반죽동 역사공원 ', '모던 딴스구락부
제민천 인력거
원도심 견학단
장소
공주원도심 일원 ', '엽서로 보는 공주의 근대 풍경
박물관 앞
장소
공주역사영상관, 공주제일교회 등 ', '근대 아틀리에
색 그리고 빛
장소
공주우체국길, 제민천 일원 ', '근대 톡톡(talk)터지다
무형문화재 공연
장소
공주하숙마을, 반죽동 역사공원 ', '예술가의 거리
달밤 낭만 장터
장소
제민천변 하상길, 감영길 일원 ', '제민천 면(麵) 서다
근대 먹거리
공주 밤마실 야시장
장소
산성시장 문화공원, 제민천변 ', '기억의 공간, 공주하숙마을
장소
공주하숙마을 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_22.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_23.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_24.png ');
INSERT INTO eventProgram VALUES(16 ,16 , '강경 노을빛으로 물들다
장소
옥녀봉 강경읍 일원 ', '옛 강경을 걷다
장소
강경읍 일원 ', '그땐 그랬지
장소
강경노동조합 ', '노을 담은 강경
장소
강경구락부 ', '한밤의 오락실
장소
ㄱ자최초침례교예배지 ', '강경진상품 유료
장소
강경성결교회 ', '금강의 멋과 맛 유료
장소
근대문화거리 ', '강경구락부에서 하룻밤
장소
옥녀봉 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_27.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_26.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_30.png ');
INSERT INTO eventProgram VALUES(17 ,17 , '스탬프 투어 10개소
부여문화재 전문가와 함께하는 야행투어
장소
부여문화원, 부여향고 정림사지 오층석탑 등 ', '백제야행길(전둥)
백제포토존
장소
관북리유적, 미성삼거리~의혈로 입구 ', '백제체험 프로그램
장소
정림사지 일원 ', '세계유산 사진전
세계문화유산 특별 전시전
장소
국립부여박물관 ', '문화재명사 해설투어
백제역사퀴즈
장소
정림사지오층석탑 ', '백제저잣거리
장소
미성삼거리~의열로 입구 ', '백제의 맛을 찾아라!
장소
미성삼거리~의열로 입구 ', '부여문화재 야행과 함께하는 야숙
장소
부여군 관내 게스트하우스 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_34.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_35.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_36.png ');
INSERT INTO eventProgram VALUES(18 ,18 , '홍주의병 다시 깨어나다
홍성의 위인과 만나다
장소
조양문, 홍화문 ', '홍주성 천년여행길 등불을 밝혀라
천주교 순례길을 걷다
장소
홍주읍성 ', '나라사랑 영화제
역사거리 퍼포먼스
장소
홍주의사총
홍주읍성 ', '홍주읍성의 밤, 색을 입히다
홍성 옛사진 전시회
장소
홍주읍성 ', '홍주성탈환 재현극 그날의 함성이여!
장소
홍주읍성 ', '홍성저잣거리 야시장
장소
홍주읍성 ', '홍성저잣거리 야시장
장소
홍주읍성 ', '1박2일, 홍주목사 체험학교
장소
안회당 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_39.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_40.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_41.png ');
INSERT INTO eventProgram VALUES(19 ,19 , '빛의 술사들
내용
빛으로 문화재를 밝히다
한지등 만들기 체험 ', '문화재 술사들
내용
왕과의 산책
경기전 좀비 실록 ', '이야기 술사들
내용
이야기술사의 버스킹담화
국보를 찾아라 ', '그림 술사들
내용
거리의 화공
임금님, 용포를 입히다
뿌리 깊은 나무 ', '공연 술사들
내용
개(폐)막 공연
지역청년 예술가무대 동문 서문
문화재 극장 ', '흥정 술사들
내용
경기단길 청년 프리마켓
추억의 야행 문방구
뉴트로 야행 카페 ', '음식 술사들
내용
문화재 고물상
달빛 차회
한밤의계이득 ', '여행 술사들
내용
문활탄(문화재 활용가의 탄생)
야행을 품다! 아프리카BJ 탐방대 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_45.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_46.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_47.png ');
INSERT INTO eventProgram VALUES(20 ,20 , '밤에 비춰보는 아름다운 문화유산
장소
군산 내항 역사문화공간 및 원도심 일원 ', '밤에 걷는 문화유산의 qc의 거리
장소
군산 내항 역사문화공간 및 원도심 일원 ', '몸과 마음으로 느끼는 역사
장소
군산 내항 역사문화공간 및 원도심 일원 ', '한 여름밤에 보는 문화유산의 정취
장소
군산 내항 역사문화공간 및 원도심 일원 ', '밤에 펼쳐지는 문화공원
장소
군산 내항 역사문화공간 및 원도심 일원 ', '근대역사가 살아있는 문화장처
장소
군산 내항 역사문화공간 및 원도심 일원 ', '밤에 즐기는 맛의 거리
장소
군산 내항 역사문화공간 및 원도심 일원 ', '군산 역사이야기 속 하룻밤
장소
군산 내항 역사문화공간 및 원도심 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_50.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_51.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_52.png ');
INSERT INTO eventProgram VALUES(21 ,21 , '당신을 기다리며 천년을 서 있었네
내용
백제왕궁 달빛기원, 천년기원을 담은 탑돌이, 천년사랑의 소원 남기기, 내 손에서 피어나는 꽃등 만들기, 백제왕궁 소원연등 띄우기, 구르미 그린 달빛 포토존, 아닌밤중에 백제놀이터, 너랑 나랑 사랑팔찌 만들기, 백발백중 백제궁사, 퍼즐로 다시 쌓는 백제왕궁 ', '천녀의 길, 천 걸음
내용
어화등등 유등산책!, 백제왕궁 후원산책, 구르미 그린 달빛 포토존, 미션! 무왕을 따르라, 백제서예관(가훈써주기), 문화유산 스템프투어, 별빛 가득 청사초롱길을 걷다 ', '재미있게 백제 이야기
내용
별궁 달궁 모래동화, 석불연인의 사랑이야기, 왕궁에서 즐기는 공방체험, 누가 여기에 똥쌌어?, 아닌 밤중에 백제놀이터, 백제를 말하다 : 이야기꾼, 야(夜)심한 밤별여행, 봄바람 부는 백제의 선율 ', '아는 만큼 보인다
내용
탱화장과 풀어보는 탱화의 비밀, 문화유산 VR체험, 탑리갤러리, 헤리티지 페이스페인팅, 왕궁 수묵화교실, 백제 어라하의 초대, 헤리티지 홀로그램 ', '백제양궁 야연
내용
금마저, 무왕의 시대를 열다, 무형문화재와 어울림 한마당, 백제왕궁에 울리는 풍류, 탑리 버스킹 공연, 무왕의 호위무사 ', '탑리장터
내용
탑리 야시장(로컬푸드), 청년무왕의 프리마켓 ', '백제무왕의 야식
내용
무왕의 야식체험, 어머니의 손맛, 왕과 차, 무형문화재 전통주 체험, 백제 채소 악단 ', '한옥에서의 하룻밤
내용
한옥에서의 하룻밤(금마, 함라한옥 연계 체험) ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_53.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_54.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_55.png ');
INSERT INTO eventProgram VALUES(22 ,22 , '그네
월매집
오작교
장소
광한루원 ', '향토 박물관
춘향테마파크
천문대
장소
향토박물관,춘향테마파크,천문대 ', '광한루
완월정
방장정
장소
광한루원, 관서당남성재 ', '아! 정겨운 남원의 정취
장소
심수관도예전시관, 시립김병종미술관, 남원 다움관 ', '예술공연
심야버스킹
장소
광한루원 ', '게을러스 죄송해요!
푸드트럭 거리조성
장소
예촌문화마당 ', '장터 공연
장소
예촌문화마당 ', '소리체험관(한옥)
예촌(한옥호텔)
장소
함파우소리체험관, 한옥호텔예촌 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1187.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1185.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1188.jpg ');
INSERT INTO eventProgram VALUES(23 ,23 , '김제를 밝히는 나무등불 청사초롱길 금의환향길
장소
김제 관아와 향교 일원 ', '선비의 길, 관직의 길 과거에서온 문화해설사
장소
김제 관아와 향교 일원 ', '김제사또 부임행차 김제관아 민원상황극
장소
김제 관아와 향교 일원 ', '김제문화재 바로알기
장소
김제 관아와 향교 일원 ', '시와 풍류가 있는 음풍영월 성산 별빛 버스킹
장소
김제 관아와 향교 일원 ', '백투더 1960
장소
김제 관아와 향교 일원 ', '김제 전통 음식마당
장소
김제 관아와 향교 일원 ', '김제의 대표문화재에서의 하룻밤
장소
김제 관아와 향교 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_58.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_59.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_60.png ');
INSERT INTO eventProgram VALUES(24 ,24 , '고창읍성 달빛산책
장소
고창읍성(사적145호) ', '달빛공양 로수와 치성
장소
고창읍 일원 ', '고창읍성축성재현 기원의 거울 opertta
장소
고창읍성 광장 ', '고창 문화유산 길거리갤러리
고창문화재승경도
장소
문화체험거리 ', '도리화가
양머리 버스킹
플레시몹
장소
신재효고택, 문화체험거리 ', '지역 공방체험
장소
문화체험거리 ', '고창의 속 깊은 맛
산, 들, 바다에서 차린 고창 밥상
장소
고창읍 일원 ', '책마을 해리, 챗 짓는 하루
양반 잠으로 한옥호텔 하룻밤
장소
고창읍성 한옥마을, 북스테이 책마을해리 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1189.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1190.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1191.jpg ');
INSERT INTO eventProgram VALUES(25 ,25 , '진남관 스페셜 투어
장소
여수시 진남관 일원 ', '문화재 뺏지를 찾아라
장소
여수시 진남관 일원 ', 'LED 문화재 스트링아트 체험 외 15가지 문화재 활용 체험
장소
여수시 진남관 일원  ', '특별상영 여수, 시민의 삶과 모습
장소
여수시 진남관 일원 ', '좌수영 수군 야간 출정식
장소
여수시 진남관 일원 ', '내례포 장터
장소
이순신광장 ', '수군 주먹밥
장소
여수시 진남관 일원 ', '여수 게스트 하우스 연계프로그램
장소
여수시 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_65.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_66.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_67.png ');
INSERT INTO eventProgram VALUES(26 ,26 , '순천문화재탐방 문화재보물찾기
장소
팔마비, 행동 푸조나무, 순천시 청소년수련관, 한옥글방 등 ', '순천문화재LED거리
장소
서문안내소 옥천서원, 문화의 거리 ', '순천문화재 역사 체험
장소
팔마비, 행동 푸조나무, 순천시 청소년수련관, 한옥글방 등 ', '그림과 사진으로 보는 순천문화재
장소
순천향교 ', '문화재 공연
장소
옥천서원, 기독교역사박물관, 서문안내소, 한옥글방 ', '순천야행 장터
공방체험
장소
문화의 거리 ', '순천야식(주전부리)
장소
문화의 거리, 향교 장터길, 서문안내소 ', '야행패키지 순천만 별보기
장소
순천시 일원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_72.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_73.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_74.png ');
INSERT INTO eventProgram VALUES(27 ,27 , '빛보다 아름다운 나주의 夜
장소
목사내아, 금성관길 ', '천년, 과거로의 타임슬립
장소
금성관 ', '나주의 천년 야사
장소
목사내아 ', '청출어람 천연염색(천연염색 패션쇼)
장소
서성문 ', '천년의 樂, 나주 풍류열전(나주시립국악단 공연)
장소
금성관 ', '오감만족 야시장
야간 플리마켓
장소
향교길 ', '夜한 식사
나주 전통먹거리 체험
장소
향교길 ', '나주에서 하룻밤
나주목사내아 숙박체험
장소
목사내아 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_76.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_77.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_79.png ');
INSERT INTO eventProgram VALUES(28 ,28 , '보성문화재 야간탐방, 보성문화재 스탬프 투어
장소
보성향교, 보성 충의당, 보성읍 성지 등 10곳 ', '보성야로, 열선루 포토촌, 내삼문 포토존
장소
보성향교, 보성 충의당, 보성읍 성지 등 10곳 ', '장계만들기 체험 등 26개 프로그램
장소
열선루, 보성향교, 오청사 등 ', '보성충효전시회, 보성문화재 사진전시회, 보성무형문화재전시회
장소
보성향교, 보성군청, 방진관 ', '열선루 공연, 보성향교 무대공연, 보성군청 무대공여느 방진관 마당극, 5인의 전설
장소
열선루, 보성향교, 보성군청, 방진관, 오충사 ', '보성야행장터(아트마켓)
장소
보성읍성공원 ', '보성향교 다도체험, 보성수군감자 주먹밥 체험, 강하주시음과 향연
장소
보셩향교, 보성읍성공원 ', '보성야행 숙박 패키지, 보성하룻밤(야영체험)
장소
보성읍성공원 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_80.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_81.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_82.png ');
INSERT INTO eventProgram VALUES(29 ,29 , '목포 환타지 로드
장소
목포근대역사 문화공간 ', '夜한 워킹스트리트
장소
목포 근대역사 문화공간 ', '1897 목포문화재 투어
장소
목포근대역사 문화공간 ', '문화재 어닝아트
장소
목포근대역사 문화공간 ', '근대가요콘서트 청춘연가
장소
목포근대역사 문화공간 ', '1897 플리마켓
장소
목포근대역사 문화공간 ', '맛의 도시 백년 맛집
장소
목포근대역사 문화공간 ', '코레일 내일로 근대역사 체험단
장소
목포근대역사 문화공간 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_87.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_85.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_88.png ');
INSERT INTO eventProgram VALUES(30 ,30 , '문화재 밤을 잉태하다
장소
경주일원 문화재 ', '경주 교촌 달빛 story 답사
장소
경주교촌 일원 ', '전통민속놀이
남천 유등 띄우기
십이지 소원지 달기
장소
경주 교촌 일원 ', '경주세계문화유산 사진전
신라의 밤 천체관측
장소
경주 교촌 일원 ', '셔블밝긔대라 탈놀이 가자
신라설화 인형극
장소
장소
경주 교촌 일원 ', '교촌 아트마켓
장소
경주 교촌 일원 ', '교촌 먹거리
최부자의 인심을 맛보다
장소
경주 교촌 일원 ', '아직 준비중입니다. ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_95.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_96.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_97.png ');
INSERT INTO eventProgram VALUES(31 ,31 , '월영교 등간, 빛 정원
장소
월영교 일원 ', '달달애 투어 걷기, 빛 로드
장소
월영교 일원 ', '해설사와 함께 듣는 문화유산이야기
장소
월영교 일원 ', '하회탈 특별전시, 안동문화재 그림 및 사진전시
장소
월영교 일원 ', '관객과 함께하는 오픈라디오, 문화공연
장소
월영교 일원 ', '월영장터 푸드트럭
장소
월영교 일원 ', '종가 음식 및 안동의제사 체험
장소
월영교 일원 ', '고택체험프로그램, 한옥리조트
장소
구름에리조트, 임청각 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_101.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_102.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_103.png ');
INSERT INTO eventProgram VALUES(32 ,32 , '지산동고분군
대가야역사테마관광지
장소
지산동고분군, 대가야역사테마관광지 ', '달빛 고분산책
달빛소리
장소
지산동고분군 ', '가야금 소리마당
왜 순장을 했을꼬?
장소
대가야문화누리 야외공연장, 지산동고분군 ', '고령갤러리
세계유산 등재기원 사진전
장소
인진관, 디지털 관광홍보관 ', '왕들의 초대
현의 노래
달빛 환타지아
장소
대가야역사테마관관광지 ', '夜한 포토샵
고관점 방문기
대가야 夜시장
장소
대가야역사테마관광지 ', '야행도시락
감자39전
장소
대가야역사테마관광지 ', '월하야숙
별 헤는 달빛캠핑
장소
대가야생활촌, 체험캠프 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_109.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1194.jpg ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1193.jpg ');
INSERT INTO eventProgram VALUES(33 ,33 , '통제공, 납시오!
나도 삼도수군통제사
장소
통제영 세병관 ', '신임통제사도임참배길 따라가기
장소
통제영~충렬사 ', '조선수군 알아보기
조선시대 화폐만들기
장소
통제영 12공방, 주전소 ', '명조팔사품 및 수조도 그리기
장소
통제영 12공방 ', '개막식 및 폐막식
통제영 일원 ', '함께 해요! 프리마켓
장소
통제영 ~ 문화원 ', '양로연
제례음식 맛보기
장소
통제영 백화당,통영 충렬사 ', '통제사 내아 엿보기
장소
통제영 내아 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_111.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_112.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_113.png ');
INSERT INTO eventProgram VALUES(34 ,34 , '가야하늘에 6개의 달이 뜨다
가야 초롱길
장소
수로왕릉 ', '가야 달빛탐방
가야 후원을 거닐다
장소
가야유적지 일원, 수로왕릉 후원 ', '가아 톡
가야 유물 찾기
수로왕릉 바로알기
장소
수로왕릉 ', '가야를 보다
가야 의상실
장소
수로왕릉 ', '가야의 불을 밝히다
가야 작은극장
장소
수로왕릉 ', '가야 놀이터
가야 장터
가야 문화 만들기 체험
장소
수로왕릉 ', '가야구경도 식후경
가야살롱
장소
수로왕릉 ', '가야에서 하룻밤
장소
김해한옥체험관 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_116.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_117.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_118.png ');
INSERT INTO eventProgram VALUES(35 ,35 , '응천강 어화를 밝히다
장소
응천강 일원 ', '밀양도호부 옛 길 따라...
장소
밀양 읍성길, 성당, 박물관, 향교 ', '길 위의 인문학
장소
영남루, 밀양관아, 아랑각, 약전골목, 천진궁 ', '영남루 밝은 달빛아래 보다
장소
영남루, 천진궁 ', '공연으로 만나는 밀양읍성이야기
장소
영남루, 밀양관아, 아랑각, 천진궁 ', '야(夜)한 장시
장소
밀양관아, 천진궁 ', '야(夜)한 다리껄 식당
장소
전통시장, 남천교 다리위 ', '아랑사또와 취침하로 가세! 사전신청
장소
관아, 향교, 교동손씨 고가 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_122.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_123.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_124.png ');
INSERT INTO eventProgram VALUES(35 ,35 , '무병장수의 별 老人星을 보라
장소
남성대, 자구리공원 ', '시간여행그날(시민 참여배우 사전접수)
장소
서귀포시청-초원사거리-매일시장입구-솔동산입구-서귀진지 ', '300여년전의 비밀을 푼다
장소
서귀본향당-이중섭거리-소암전시관-서복전시관-자구리공원-서귀진지 일원 ', '코노래가 흥얼흥얼
장소
서귀진지 ', '모다들엉 놀아봅주
장소
서귀포 일원 ', '서귀포문화재 야행 유유자적
장소
서귀진지 일원 ', '해녀밥상 경연대회
장소
서귀진지 ', '야호! 서귀포문화재 야행!
장소
서귀진지 ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_131.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_130.png ', 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_133.png ');

select * from eventprogram;

---------

commit;