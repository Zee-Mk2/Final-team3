

USE final_db;

DROP table Event;
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

DROP table EventProgram;
CREATE TABLE EventProgram (
	programNo INT PRIMARY KEY auto_increment,
    evntNo INT,
    title VARCHAR(100),
    content VARCHAR(1000),
    location VARCHAR(1000),
    FOREIGN KEY (evntNo) REFERENCES Event(evntNo) ON DELETE CASCADE
);

DROP table EventImg;
CREATE TABLE EventImg(
	imgNo INT PRIMARY KEY AUTO_INCREMENT,
    evntNO INT,
    url varchar(1000),
    FOREIGN KEY (evntNo) REFERENCES Event(evntNo) ON DELETE CASCADE
);

DROP table eventReview;
CREATE TABLE EventReview (
	evntReviewNo INT PRIMARY KEY auto_increment,
    evntNo INT,
    Mno INT,
    content VARCHAR(100),
    rating INT,
    writeTime DATETIME
);

DROP table EventStars;
CREATE TABLE EventStars(
	mno int,
    evntNo int,
    rating int,
    FOREIGN KEY (evntNo) REFERENCES Event(evntNo) ON DELETE CASCADE,
    FOREIGN KEY (mno) REFERENCES member(mno) ON DELETE CASCADE
);

 -- --------------insert문-------------------------

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




insert into EventImg(imgNo, evntNo, url) values (
	default, 1, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1124.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 1, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1129.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 1, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1127.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 2, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1130.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 2, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1131.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 2, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1134.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 3, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1136.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 3, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1140.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 3, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1139.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 4, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1144.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 4, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1143.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 4, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1147.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 5, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1149.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 5, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1150.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 5, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1151.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 6, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1153.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 6, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1152.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 6, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1156.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 7, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1160.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 7, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1159.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 7, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1161.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 8, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1166.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 8, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1168.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 8, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1167.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 9, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1172.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 9, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1173.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 9, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1174.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 10, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1177.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 10, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1180.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 10, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1178.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 11, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_1.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 11, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_2.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 11, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_3.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 12, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1182.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 12, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1181.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 12, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1183.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 13, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_6.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 13, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_7.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 13, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_8.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 14, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_16.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 14, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_17.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 14, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_18.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 15, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_22.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 15, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_23.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 15, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_24.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 16, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_27.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 16, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_26.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 16, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_30.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 17, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_34.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 17, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_35.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 17, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_36.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 18, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_39.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 18, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_40.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 18, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_41.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 19, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_45.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 19, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_46.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 19, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_47.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 20, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_50.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 20, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_51.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 20, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_52.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 21, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_53.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 21, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_54.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 21, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_55.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 22, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1187.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 22, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1185.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 22, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1188.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 23, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_58.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 23, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_59.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 23, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_60.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 24, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1189.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 24, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1190.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 24, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1191.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 25, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_65.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 25, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_66.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 25, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_67.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 26, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_72.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 26, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_73.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 26, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_74.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 27, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_76.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 27, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_77.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 27, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_79.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 28, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_80.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 28, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_81.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 28, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_82.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 29, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_87.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 29, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_85.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 29, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_88.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 30, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_95.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 30, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_96.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 30, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_97.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 31, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_101.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 31, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_102.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 31, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_103.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 32, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_109.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 32, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1194.jpg'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 32, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/1193.jpg'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 33, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_111.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 33, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_112.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 33, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_113.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 34, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_116.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 34, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_117.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 34, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_118.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 35, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_122.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 35, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_123.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 35, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_124.png'
);

insert into EventImg(imgNo, evntNo, url) values (
	default, 36, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_131.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 36, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_130.png'
);
insert into EventImg(imgNo, evntNo, url) values (
	default, 36, 'https://www.cha.go.kr/html/yuyu2020/nightTrip/images/sub/c_133.png'
);


insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야경', '반딧불 정원 \n 돌담길 \n 미디어아그림자 포토존', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야로', '다같이 돌자 정동 한바퀴 \n 재미있는 정동기행 \n 대한제국의 길 역사 탐방', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야설', '돌담길 역사체험', '덕수궁 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야사', '고궁음악회 \n 화제 고종을 이야기하다 \n 역사특상', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야화', '궁(宮)민들 퍼포먼스 \n 곡호대 퍼레이드 \n 근대인물 석고마임', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야시', '예술장터 \n 한복대여 \n 근대인물 석고마임', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야식', '푸드코트 \n 한컵마트 \n 근대인물 석고마임', '덕수궁 돌담길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 1, '야숙', '아직 준비중입니다.', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야경', '문화재 야간 개방', '최순우옛집, 이종석 별장 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야로', '성북전차', '성북동 문화재 야행 메인거리 ~ 문화재 및 문화시설');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야설', '해설야행', '최순우 옛집, 이종석 별장 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야사', '문화시설 야간개방', '성북구립미술관, 성북선잠박물관 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야화', '성북 명인 열전 \n 성북동 콘서트 \n 문화시설 공연', '메인거리 및 문화시설');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야시', '체험프로그램', '메인거리 및 문화시설');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야식', '성북동 일번 맛집', '메인거리 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 2, '야숙', '성북동에 머무는 밤', '성북동 일대');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야경', '피란수도 부산의 여름밤 \n 피란수도 부산의 기적 \n 피란수도 부산으로 가는 길', '부산항 제1부두 등 서구 및 중구 일원 문화재');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야로', '피란수도 드로잉 투어 \n 뚜벅뚜벅 AR 챌린지 \n 과거와 현재가 만나는 곳, 부산!', '피란수도 부산유산 유적지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야설', '피란수도 예술을 보여줘 \n 피란의 기억을 되돌아보다', '부산항 제1부두');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야사', '금순아 ~ 학교가자 \n 1023 피란 LAND', '피란수도 부산유산 유적지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야화', '피란수도 그림엽서 공모전 \n 금순이가 본 피란수도 이야기 \n 피란수도 부산으로 가는 길', '구 동양척식주식회사 부산지점 일원 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야시', '웰컴 투 피란촌 \n 그땐 그랬지, 피란 장터', '부산항 제1부두');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야식', '피란시장 맛탐방 \n  내가 만든 피란음식', '부산항 제1부두');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 3, '야숙', '금동이의 하루', '피란수도 부산 유산 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야경', '근대로의여행 오픈하우스', '근대골목, 청라언덕');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야로', '근대로 걷다', '근대골목, 청라언덕');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야설', '근대골목 이야기', '근대골목, 청라언덕');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야사', '근대를 보다', '근대골목, 청라언덕');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야화', '근대음악', '구대구제일교회, 근대근대골목, 청라언덕');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야시', '근대로 상회', '근대골목');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야식', '근대로 상회', '근대골목');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 4, '야숙', '문화재에서 하룻밤', '근대골목');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야경', '문화재 숲 정원', '광주읍성유허');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야로', '명인과의 특별한 만남', '광주읍성유허');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야설', '동구 이야기꾼의 문화재 산책', '옛 전남도청, 광주읍성유허, 재먹석등, 서석초등학교 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야사', '문화재 밤 마실', '옛 전남도청, 서석초등학교');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야화', '미디어 퍼포먼스 4개의 문(門)이 열린다', '광주읍성유허');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야시', '동구 사회적경제마켓 가치 가게', '옛 전남도청(518민주광장)');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야식', '허백련 춘설헌 달빛다회 \n 열혈 청년 야행 맛집', '광주읍성유허');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 5, '야숙', '코레일과 함께하는 광주문화재 야행열차 달빛 걸음', '동구 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야경', '문화재를 빛으로 밝히다', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야로', '문화재야행 스탬프 투어', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야설', '문화재에서 즐기는 개항장 체험', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야사', '문화재 야간 개방', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야화', '스토리텔링 도보탐방', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야시', '저잣거리', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야식', '개항장 문화마실', '개항장문화지구 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 6, '야숙', '야(夜)한밤', '하버파크 호텔 등');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야경', '고려의 밤길', '용흥궁, 성공회강화성당, 고려궁지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야로', '문화재야행을 알리는 길거리 퍼레이드 공연', '김상용순절비, 용흥궁공원 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야설', '스토리텔러와 함께한 보도투어 \n 고려의 밤, 별자리 관측', '용흥궁, 성공회강화성당, 고려궁지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야사', '강화문화재 SNS 사진전시 \n 강화 과거이야기 사진전시', '강화초등학교');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야화', '개박실 및 초청공연 \n 고려궁지 버스킹 \n 마당놀이', '고려궁지, 용흥궁공원 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야시', '강화지역 먹거리부스', '용흥궁공원 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야식', '강화문화체험 부스 \n 강화로컬마켓 부스', '강화소창, 고려문양, 화문석, 기념품 공모');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 7, '야숙', '강화에서 하룻밤', '연계한 홍보');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야경', '성안 문화재', '수원화성 화성행궁 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야로', '성안 길따라', '화성행궁 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야설', '성안 사람들 이야기', '화성행궁, 궁방거리, 생태교통마을 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야사', '밤빛 풍경', '화성행궁, 공방거리 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야화', '한바탕 놀음', '화성행궁 공방거리, 생태교통마을, 남문로데오거리 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야시', '성안장터 \n 성안 먹거리', '공방거리, 생태교통마을, 수원화성박물관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야식', '성안 먹기리', '공방거리, 남문로데오거리, 통닭거리 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 8, '야숙', '성안에서 하룻밤', '수원화성 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야경', '양주고나아 달빛속으로', '양주관아지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야로', '양주목의 정취를 찾아서 \n 오감만족 양주목', '양주관아지 일원, 양주향교');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야설', '정조, 관민동락을 꿈꾸다', '양주관아지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야사', '호시탐탐 양주목', '양주관아지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야화', '양주목,歌와 舞를 通하다', '별산대놀이 공연장, 무형문화재 통합공연장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야시', '저자거리 한마당', '무형문화재 통합공연장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야식', '버들찻집', '양주관아 내아');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 9, '야숙', '문화재에서 하룻밤', '양주 관아지 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야경', '장군바위에서 비경', '독산성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야로', '나라를 지키는 호국의 길', '독산성, 유엔군 초전기념관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야설', '문화재의 역사속으로', '독산성, 궐리사, 유엔군 초전기념관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야사', '독산성 전투 샌드아트', '양독산성 세마대지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야화', '궐리사 성적도 가치재조명', '궐리사');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야시', '도시를 깨우는 비사량', '고인돌공원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야식', '독산성 음식문화거리 체험과 힐링', '독산성 음식문화거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 10, '야숙', '독산성 운주당의 밤 \n 독산성 운주당의 밤', '궐리사 행단, 독산성 세마대지');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야경', '강원도 무형문화재 소개마당', '강원감영');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야로', '관찰사의 오색지령 \n 아카데미로의 초대', '강원감영, 구아카데미극장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야설', '달빛과거시험 \n 김금원 금강기행', '강원감영');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야사', '원주문화재 시각작품 전시회', '원주문화원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야화', '개막축하연주회', '강원감영, 문화의거리 상설공연장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야시', '감영의 은행나무 공방교실 \n 옻칠전시회 \n 달빛사랑장터', '문화의거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야식', '선화당 찻자리 \n 푸드바이크 음식거리', '강원감영, 문화의 거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 11, '야숙', '아직 준비중입니다.', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야경', '빛으로 만나는 천년의 관아', '아문');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야로', '신나는 서부마당 \n 달밤 愛 버스킹', '강릉 서부시장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야설', '달빛 따라 걷는 강릉대도호부관아 \n 강릉대도호부관아 수문장 교대식', '동헌');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야사', '강릉문화재야행 설치미술전 \n 강릉 장인 학교', '문화마당');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야화', '강릉대도호부관아 의복 패션쇼 \n 강릉대도호부사 주제 연희극 3탄', '관아마당');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야시', '저잣거리 \n 달달한 서부시장 4色4味', '토성로, 강릉서부시장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야식', '먹어야행 : 강릉문화재 푸드트럭 \n 마셔야행 : 달빛아래 다도풍정', '의운루, 동대청');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 12, '야숙', '강릉문화재야행 달밤 스테이', '선교장, 오죽헌 마을');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야경', '옛 청주읍성과 달빛 산책', '원도심 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야로', '조선넘어 근대로', '원도심 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야설', '명장의 손끝을 잇다', '중앙공원 광장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야사', '천년의 기적, 망선루미디어 아트 퍼포먼스', '중앙공원, 망선루');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야화', '만담강자, 청주이야기꾼', '북문로 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야시', '성안길 예술점포', '성안길 일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야식', '청주읍성 식도락 야행', '원도심일대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 13, '야숙', '아직 준비중입니다.', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야경', '달빛 아래서 지나간 세월을 추억하다', '옥천향교 외 6개소');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야로', '달빛 따라, 별빛 따라 스탬프 투어', '옥천향교 외 6개소');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야설', '딛고 있는 이 땅위에 살았던 옛 사람 이야기', '옥천향교 외 6개소');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야사', '사진으로 만나는 옥천의 문화유산 이야기', '전통문화 체험관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야화', '금강보고 옥천의 흥', '전통문화 체험관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야시', '이야기가 있는 구읍 시장 \n 개장! 옥천 특산품 한마당', '문화재야행 거리 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야식', '맛과 멋이 함께하는 구읍 거리', '문화재야행 거리 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 14, '야숙', '청청 옥천, 별빛 가득 담은 한오게서', '전통문화 체험관 숙박등');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야경', '제민천 별빛 음악회 \n 월야장천(月夜長川) - 제민천에 달이 뜨다 -', '제민천 일원, 반죽동 역사공원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야로', '모던 딴스구락부 \n 제민천 인력거 \n 원도심 견학단', '공주원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야설', '엽서로 보는 공주의 근대 풍경 \n 박물관 앞', '공주역사영상관, 공주제일교회 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야사', '근대 아틀리에 \n 색 그리고 빛', '공주우체국길, 제민천 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야화', '근대 톡톡(talk)터지다 \n 무형문화재 공연', '공주하숙마을, 반죽동 역사공원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야시', '예술가의 거리 \n 달밤 낭만 장터', '제민천변 하상길, 감영길 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야식', '제민천 면(麵) 서다 \n 근대 먹거리 \n 공주 밤마실 야시장', '산성시장 문화공원, 제민천변');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 15, '야숙', '기억의 공간, 공주하숙마을', '공주하숙마을');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야경', '강경 노을빛으로 물들다', '옥녀봉 강경읍 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야로', '옛 강경을 걷다', '강경읍 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야설', '그땐 그랬지', '강경노동조합');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야사', '노을 담은 강경', '강경구락부');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야화', '한밤의 오락실', 'ㄱ자최초침례교예배지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야시', '강경진상품 (유료)', '강경성결교회');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야식', '금강의 멋과 맛 (유료)', '근대문화거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 16, '야숙', '강경구락부에서 하룻밤', '옥녀봉');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야경', '스탬프 투어 10개소 \n 부여문화재 전문가와 함께하는 야행투어', '부여문화원, 부여향고 정림사지 오층석탑 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야로', '백제야행길(전둥) \n 백제포토존', '관북리유적, 미성삼거리~의혈로 입구');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야설', '백제체험 프로그램', '정림사지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야사', '세계유산 사진전 \n 세계문화유산 특별 전시전', '국립부여박물관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야화', '문화재명사 해설투어 \n 백제역사퀴즈', '정림사지오층석탑');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야시', '백제저잣거리', '미성삼거리~의열로 입구');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야식', '백제의 맛을 찾아라!', '미성삼거리~의열로 입구');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 17, '야숙', '부여문화재 야행과 함께하는 야숙', '부여군 관내 게스트하우스');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야경', '홍주의병 다시 깨어나다 \n 홍성의 위인과 만나다', '조양문, 홍화문');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야로', '홍주성 천년여행길 등불을 밝혀라 \n 천주교 순례길을 걷다', '홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야설', '나라사랑 영화제 \n 역사거리 퍼포먼스', '홍주의사총, 홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야사', '홍주읍성의 밤, 색을 입히다 \n 홍성 옛사진 전시회', '홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야화', '홍주성탈환 재현극 그날의 함성이여!', '홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야시', '홍성저잣거리 야시장', '홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야식', '홍성저잣거리 야시장', '홍주읍성');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 18, '야숙', '1박2일, 홍주목사 체험학교', '안회당');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야경', '빛의 술사들 \n 내용 \n 빛으로 문화재를 밝히다 \n 한지등 만들기 체험', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야로', '문화재 술사들 \n 내용 \n 왕과의 산책 \n 경기전 좀비 실록', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야설', '이야기 술사들 \n 내용 \n 이야기술사의 버스킹담화 \n 국보를 찾아라', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야사', '그림 술사들 \n 내용 \n 거리의 화공 \n 임금님, 용포를 입히다 \n 뿌리 깊은 나무', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야화', '공연 술사들 \n 내용 \n 개(폐)막 공연 \n 지역청년 예술가무대 동문 서문 \n 문화재 극장', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야시', '흥정 술사들 \n 내용 \n 경기단길 청년 프리마켓 \n 추억의 야행 문방구 \n 뉴트로 야행 카페', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야식', '음식 술사들 \n 내용 \n 문화재 고물상 \n 달빛 차회 \n 한밤의계이득', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 19, '야숙', '여행 술사들 \n 내용 \n 문활탄(문화재 활용가의 탄생) \n 야행을 품다! 아프리카BJ 탐방대', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야경', '밤에 비춰보는 아름다운 문화유산', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야로', '밤에 걷는 문화유산의 qc의 거리', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야설', '몸과 마음으로 느끼는 역사', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야사', '한 여름밤에 보는 문화유산의 정취', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야화', '밤에 펼쳐지는 문화공원', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야시', '근대역사가 살아있는 문화장처', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야식', '밤에 즐기는 맛의 거리', '군산 내항 역사문화공간 및 원도심 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 20, '야숙', '군산 역사이야기 속 하룻밤', '군산 내항 역사문화공간 및 원도심 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야경', '당신을 기다리며 천년을 서 있었네 \n 백제왕궁 달빛기원, 천년기원을 담은 탑돌이, 천년사랑의 소원 남기기, 내 손에서 피어나는 꽃등 만들기 등', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야로', '천녀의 길, 천 걸음 \n 어화등등 유등산책!, 백제왕궁 후원산책, 구르미 그린 달빛 포토존, 미션! 무왕을 따르라 등', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야설', '재미있게 백제 이야기 \n 별궁 달궁 모래동화, 석불연인의 사랑이야기, 왕궁에서 즐기는 공방체험, 누가 여기에 똥쌌어?, 아닌 밤중에 백제놀이터, 백제를 말하다 : 이야기꾼, 야(夜)심한 밤별여행, 봄바람 부는 백제의 선율', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야사', '아는 만큼 보인다 \n 탱화장과 풀어보는 탱화의 비밀, 문화유산 VR체험, 탑리갤러리, 헤리티지 페이스페인팅, 왕궁 수묵화교실, 백제 어라하의 초대, 헤리티지 홀로그램', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야화', '백제양궁 야연 \n 금마저, 무왕의 시대를 열다, 무형문화재와 어울림 한마당, 백제왕궁에 울리는 풍류, 탑리 버스킹 공연, 무왕의 호위무사', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야시', '탑리장터 \n 탑리 야시장(로컬푸드), 청년무왕의 프리마켓', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야식', '백제무왕의 야식 \n 무왕의 야식체험, 어머니의 손맛, 왕과 차, 무형문화재 전통주 체험, 백제 채소 악단', '');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 21, '야숙', '한옥에서의 하룻밤 \n 한옥에서의 하룻밤(금마, 함라한옥 연계 체험)', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야경', '그네 \n 월매집 \n 오작교', '광한루원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야로', '향토 박물관 \n 춘향테마파크 \n 천문대', '향토박물관,춘향테마파크,천문대');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야설', '광한루 \n 완월정 \n 방장정', '광한루원, 관서당남성재');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야사', '아! 정겨운 남원의 정취', '심수관도예전시관, 시립김병종미술관, 남원 다움관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야화', '예술공연 \n 심야버스킹', '광한루원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야시', '게을러스 죄송해요! \n 푸드트럭 거리조성', '예촌문화마당');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야식', '장터 공연', '예촌문화마당');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 22, '야숙', '소리체험관(한옥) \n 예촌(한옥호텔)', '함파우소리체험관, 한옥호텔예촌');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야경', '김제를 밝히는 나무등불 청사초롱길 금의환향길', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야로', '선비의 길, 관직의 길 과거에서온 문화해설사', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야설', '김제사또 부임행차 김제관아 민원상황극', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야사', '김제문화재 바로알기', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야화', '시와 풍류가 있는 음풍영월 성산 별빛 버스킹', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야시', '백투더 1960', '김제 관아와 향교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야식', '김제 전통 음식마당');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 23, '야숙', '김제의 대표문화재에서의 하룻밤', '김제 관아와 향교 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야경', '고창읍성 달빛산책', '고창읍성(사적145호)');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야로', '달빛공양 로수와 치성', '고창읍 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야설', '고창읍성축성재현 기원의 거울 opertta', '고창읍성 광장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야사', '고창 문화유산 길거리갤러리 \n 고창문화재승경도', '문화체험거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야화', '도리화가 \n 양머리 버스킹 \n 플레시몹', '신재효고택, 문화체험거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야시', '지역 공방체험', '문화체험거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야식', '고창의 속 깊은 맛 \n 산, 들, 바다에서 차린 고창 밥상', '고창읍 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 24, '야숙', '책마을 해리, 챗 짓는 하루 \n 양반 잠으로 한옥호텔 하룻밤', '고창읍성 한옥마을, 북스테이 책마을해리');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야경', '진남관 스페셜 투어', '여수시 진남관 일원');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야로', '문화재 뺏지를 찾아라', '여수시 진남관 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야설', 'LED 문화재 스트링아트 체험 외 15가지 문화재 활용 체험', '여수시 진남관 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야사', '특별상영 여수, 시민의 삶과 모습', '여수시 진남관 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야화', '좌수영 수군 야간 출정식', '여수시 진남관 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야시', '내례포 장터', '이순신광장');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야식', '수군 주먹밥', '여수시 진남관 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 25, '야숙', '여수 게스트 하우스 연계프로그램', '여수시 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야경', '순천문화재탐방 문화재보물찾기', '팔마비, 행동 푸조나무, 순천시 청소년수련관, 한옥글방 등');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야로', '순천문화재LED거리', '서문안내소 옥천서원, 문화의 거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야설', '순천문화재 역사 체험', '팔마비, 행동 푸조나무, 순천시 청소년수련관, 한옥글방 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야사', '그림과 사진으로 보는 순천문화재', '순천향교');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야화', '문화재 공연', '옥천서원, 기독교역사박물관, 서문안내소, 한옥글방');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야시', '순천야행 장터 \n 공방체험', '문화의 거리');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야식', '순천야식(주전부리)', '문화의 거리, 향교 장터길, 서문안내소');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 26, '야숙', '야행패키지 순천만 별보기', '순천시 일원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야경', '빛보다 아름다운 나주의 夜', '목사내아, 금성관길');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야로', '천년, 과거로의 타임슬립', '금성관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야설', '나주의 천년 야사', '목사내아');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야사', '청출어람 천연염색(천연염색 패션쇼)', '서성문');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야화', '천년의 樂, 나주 풍류열전(나주시립국악단 공연)', '금성관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야시', '오감만족 야시장 \n 야간 플리마켓', '향교길');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야식', '夜한 식사 \n 나주 전통먹거리 체험', '향교길');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 27, '야숙', '나주에서 하룻밤 \n 나주목사내아 숙박체험', '목사내아');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야경', '보성문화재 야간탐방, 보성문화재 스탬프 투어', '보성향교, 보성 충의당, 보성읍 성지 등 10곳');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야로', '보성야로, 열선루 포토촌, 내삼문 포토존', '보성향교, 보성 충의당, 보성읍 성지 등 10곳');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야설', '장계만들기 체험 등 26개 프로그램', '열선루, 보성향교, 오청사 등');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야사', '보성충효전시회, 보성문화재 사진전시회, 보성무형문화재전시회', '보성향교, 보성군청, 방진관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야화', '열선루 공연, 보성향교 무대공연, 보성군청 무대공여느 방진관 마당극, 5인의 전설', '열선루, 보성향교, 보성군청, 방진관, 오충사');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야시', '보성야행장터(아트마켓)', '보성읍성공원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야식', '보성향교 다도체험, 보성수군감자 주먹밥 체험, 강하주시음과 향연', '보셩향교, 보성읍성공원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 28, '야숙', '보성야행 숙박 패키지, 보성하룻밤(야영체험)', '보성읍성공원');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야경', '목포 환타지 로드', '목포근대역사 문화공간');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야로', '夜한 워킹스트리트', '목포 근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야설', '1897 목포문화재 투어', '목포근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야사', '문화재 어닝아트', '목포근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야화', '근대가요콘서트 청춘연가', '목포근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야시', '1897 플리마켓', '목포근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야식', '맛의 도시 백년 맛집', '목포근대역사 문화공간');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 29, '야숙', '코레일 내일로 근대역사 체험단', '목포근대역사 문화공간');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야경', '문화재 밤을 잉태하다', '경주일원 문화재');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야로', '경주 교촌 달빛 story 답사', '경주교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야설', '전통민속놀이 \n 남천 유등 띄우기 \n 십이지 소원지 달기', '경주 교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야사', '경주세계문화유산 사진전 \n 신라의 밤 천체관측', '경주 교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야화', '셔블밝긔대라 탈놀이 가자 \n 신라설화 인형극', '경주 교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야시', '교촌 아트마켓', '경주 교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야식', '교촌 먹거리 \n 최부자의 인심을 맛보다', '경주 교촌 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 30, '야숙', '아직 준비중입니다.', '');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야경', '월영교 등간, 빛 정원', '월영교 일원');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야로', '달달애 투어 걷기, 빛 로드', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야설', '해설사와 함께 듣는 문화유산이야기', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야사', '하회탈 특별전시, 안동문화재 그림 및 사진전시', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야화', '관객과 함께하는 오픈라디오, 문화공연', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야시', '월영장터 푸드트럭', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야식', '종가 음식 및 안동의제사 체험', '월영교 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 31, '야숙', '고택체험프로그램, 한옥리조트', '구름에리조트, 임청각');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야경', '지산동고분군 \n 대가야역사테마관광지', '지산동고분군, 대가야역사테마관광지');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야로', '달빛 고분산책 \n 달빛소리', '지산동고분군');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야설', '가야금 소리마당 \n 왜 순장을 했을꼬?', '대가야문화누리 야외공연장, 지산동고분군');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야사', '고령갤러리 \n 세계유산 등재기원 사진전', '인진관, 디지털 관광홍보관');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야화', '왕들의 초대 \n 현의 노래 \n 달빛 환타지아', '대가야역사테마관관광지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야시', '夜한 포토샵 \n 고관점 방문기 \n 대가야 夜시장', '대가야역사테마관광지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야식', '야행도시락 \n 감자39전', '대가야역사테마관광지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 32, '야숙', '월하야숙 \n 별 헤는 달빛캠핑', '대가야생활촌, 체험캠프');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야경', '통제공, 납시오! \n 나도 삼도수군통제사', '통제영 세병관');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야로', '신임통제사도임참배길 따라가기', '통제영~충렬사');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야설', '조선수군 알아보기 \n 조선시대 화폐만들기', '통제영 12공방, 주전소');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야사', '명조팔사품 및 수조도 그리기', '통제영 12공방');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야화', '개막식 및 폐막식', '통제영 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야시', '함께 해요! 프리마켓', '통제영 ~ 문화원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야식', '양로연 \n 제례음식 맛보기', '통제영 백화당,통영 충렬사');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 33, '야숙', '통제사 내아 엿보기', '통제영 내아');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야경', '가야하늘에 6개의 달이 뜨다 \n 가야 초롱길', '수로왕릉');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야로', '가야 달빛탐방 \n 가야 후원을 거닐다', '가야유적지 일원, 수로왕릉 후원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야설', '가아 톡 \n 가야 유물 찾기 \n 수로왕릉 바로알기', '수로왕릉');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야사', '가야를 보다 \n 가야 의상실', '수로왕릉');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야화', '가야의 불을 밝히다 \n 가야 작은극장', '수로왕릉');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야시', '가야 놀이터 \n 가야 장터 \n 가야 문화 만들기 체험', '수로왕릉');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야식', '가야구경도 식후경 \n 가야살롱', '수로왕릉');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 34, '야숙', '가야에서 하룻밤', '김해한옥체험관');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야경', '응천강 어화를 밝히다', '응천강 일원');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야로', '밀양도호부 옛 길 따라...', '밀양 읍성길, 성당, 박물관, 향교');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야설', '길 위의 인문학', '영남루, 밀양관아, 아랑각, 약전골목, 천진궁');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야사', '영남루 밝은 달빛아래 보다', '영남루, 천진궁');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야화', '공연으로 만나는 밀양읍성이야기', '영남루, 밀양관아, 아랑각, 천진궁');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야시', '야(夜)한 장시', '밀양관아, 천진궁');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야식', '야(夜)한 다리껄 식당', '전통시장, 남천교 다리위');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 35, '야숙', '아랑사또와 취침하로 가세! 사전신청', '관아, 향교, 교동손씨 고가');
    
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야경', '무병장수의 별 老人星을 보라', '남성대, 자구리공원');
insert into eventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야로', '시간여행그날(시민 참여배우 사전접수)', '서귀포시청-초원사거리-매일시장입구-솔동산입구-서귀진지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야설', '300여년전의 비밀을 푼다', '서귀본향당-이중섭거리-소암전시관-서복전시관-자구리공원-서귀진지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야사', '코노래가 흥얼흥얼', '서귀진지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야화', '모다들엉 놀아봅주', '서귀포 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야시', '서귀포문화재 야행 유유자적', '서귀진지 일원');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야식', '해녀밥상 경연대회', '서귀진지');
insert into EventProgram (programNo, evntNo, title, content, location) values (
	default, 36, '야숙', '야호! 서귀포문화재 야행!', '서귀진지');

