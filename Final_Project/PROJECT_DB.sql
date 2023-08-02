DROP SCHEMA final_db;
CREATE SCHEMA final_db;
USE final_db;


------------------------------------------------
--------------- EXHIBITION 관련 테이블 ------------------
------------------------------------------------

DROP TABLE if exists Exhibition;
CREATE TABLE Exhibition(
	exno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    sumary VARCHAR(1000),
    museum VARCHAR(100),
    gallery VARCHAR(100),
    url VARCHAR(1000),
    img VARCHAR(1000),
    mediaType VARCHAR(20)
    );

SELECT * FROM Exhibition;


------------------------------------------------
--------------- museum 관련 테이블 ------------------
------------------------------------------------

DROP TABLE if exists Museum;
CREATE TABLE Museum (
	musNo INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(100), 
	summary VARCHAR(1000), 
	viewHours VARCHAR(100), 
	fee VARCHAR(100), 
	tel VARCHAR(100), 
	img VARCHAR(1000), 
	sumImg VARCHAR(1000), 
	la DOUBLE, 
	lo DOUBLE, 
	ProgramImg VARCHAR(1000), 
	address VARCHAR(100)
);

SELECT * FROM Museum;


------------------------------------------------
--------------- HERITAGE 관련 테이블 ------------------
------------------------------------------------


DROP TABLE if exists Heritage;
CREATE TABLE Heritage (
	hNo INT PRIMARY KEY,
    kind VARCHAR(100),
    name VARCHAR(100),
    name2 VARCHAR(100),
    kindCode VARCHAR(100),
    cityCode VARCHAR(100),
    ccbaAsNo VARCHAR(100),
    lo DOUBLE,
    la DOUBLE,
    gcodeName VARCHAR(100),
    bcodeName VARCHAR(100),
    mcodeName VARCHAR(100),
    scodeName VARCHAR(100),
    asDate DATETIME,
    location VARCHAR(1000),
    era VARCHAR(100),
    img VARCHAR(3000),
    content VARCHAR(3000)
);

SELECT * FROM Heritage;


------------------------------------------------
--------------- PRODUCT 관련 테이블 ------------------
------------------------------------------------


DROP TABLE if exists Product;
CREATE TABLE Product (
    productId VARCHAR(100) PRIMARY KEY,
    productType VARCHAR(100),
    title VARCHAR(100),
    image VARCHAR(3000),
    lPrice INT,
    category1 VARCHAR(100),
    category2 VARCHAR(100),
    category3 VARCHAR(100),
    category4 VARCHAR(100),
    mallName VARCHAR(100)
);

SELECT * FROM Product;


------------------------------------------------
--------------- MEMBER 관련 테이블 ------------------
------------------------------------------------

DROP TABLE Member;
CREATE TABLE Member (
    mno      INT  PRIMARY KEY AUTO_INCREMENT,
    role 	 VARCHAR(10) DEFAULT 'ROLE_USER',
    name 	 VARCHAR(15),
    email 	 VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone 	 VARCHAR(13),
    state 	 VARCHAR(1) DEFAULT 'Y' CHECK(STATE IN('Y', 'N')),
    enrollDate DATETIME  DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Member;


------------------------------------------------
--------------- PRODUCT 관련 테이블 ------------------
------------------------------------------------

DROP TABLE Tour;
CREATE TABLE Tour (
	tno 		INT PRIMARY KEY AUTO_INCREMENT,
    mno 		INT,
    name		VARCHAR(20),
    state		VARCHAR(10),
    title		VARCHAR(100),
    region		VARCHAR(100),
    numOfPeople	INT,
    startDate	DATETIME,
    endDate		DATETIME,
    duration	DATETIME,
    category	VARCHAR(20),
    content		VARCHAR(4000),
    fileName	VARCHAR(1000),
    reFileName	VARCHAR(1000),
    FOREIGN KEY (mno) REFERENCES Member(mno) ON DELETE SET NULL
);

SELECT * FROM Tour;



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


---------

commit;