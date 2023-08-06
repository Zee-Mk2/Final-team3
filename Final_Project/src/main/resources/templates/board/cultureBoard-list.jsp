<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <!-- Vendor styles-->
    <link rel="stylesheet" media="screen" th:href="@{/assets/vendor/nouislider/dist/nouislider.min.css}" />
    <link rel="stylesheet" media="screen" th:href="@{/assets/vendor/swiper/swiper-bundle.min.css}" />
    <head th:fragment="head" th:replace="~{common/layout :: head}"></head>
    
  <!-- Body-->
  <body>
    <main class="page-wrapper">
      <!-- 헤더 시작 -->
      <header th:replace="~{common/layout :: #header}"></header>

      <section>
        <div class="jarallax bg-dark py-5" data-jarallax data-type="scroll-opacity" data-speed="0.7"
          style="height: 70vh !important;">
          <div class="position-absolute top-0 start-0 w-100 h-100 bg-black opacity-60"></div>
          <div class="jarallax-img"
            style="background-image: url(https://plus.unsplash.com/premium_photo-1661948404806-391a240d6d40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fCVFQSVCMiVCRCVFQiVCMyVCNSVFQSVCNiU4MXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80);">
          </div>
          <div class="container position-relative zindex-5">
            <!-- Text + button-->
            <div class="row pt-lg-2 py-xl-4 py-xxl-5 mb-md-4 mb-lg-5">
              <div class="col-md-10 col-lg-9 col-xl-8 col-xxl-7 pt-5 mb-5 mb-lg-5">
                <h4 class="display-4 text-light pb-sm-2 pb-md-3 mb-lg-5">커뮤니티</h4>
                <br><br><br><br><br>
              </div>
              <form class="row g-3 bg-white rounded-pill align-items-center">
                <div class="col-2 my-1">
                  <select class="form-select" style="border: none;">
                    <option selected>자유게시판</option>
                    <option>문화소식</option>
                    <option>포토게시판</option>
                  </select>
                </div>
                <div class="col-9 my-1">
                  <input type="text" class="form-control" style="border: none;" placeholder="키워드로 검색">
                </div>
                <div class="col-1 my-1">
                  <button type="submit" class="btn py-2 ms-3"><i class='ai-search'
                      style="font-size: 26px; color: #202020;"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>

      <!-- Page content-->
      <div class="container py-3 mt-3 mb-lg-4 mb-xl-5">
        <!-- Breadcrumb-->
        <nav aria-label="breadcrumb">
          <ol class="pb-md-1 pb-lg-3 breadcrumb">
            <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
            <li class="breadcrumb-item active" aria-current="page">문화소식</li>
          </ol>
        </nav>
        <!-- Page title-->
        <div class="row mt-n1">
          <div class="col-lg-9 offset-lg-3">
            <h2 style="color: #E8AE50;">문화소식</h2>
            <div style="text-align: right;">
              <a href="curltureboard_write.html"><button type="button" class="btn text-white"
                style="background-color: #E8AE50;">글 작성하기</button>
              </a>
            </div>
          </div>
        </div>

        <div class="row pb-2 pb-sm-4">
          <aside class="col-lg-3">
            <div class="offcanvas-lg offcanvas-start" id="shopSidebar">
              <form>
                <div class="offcanvas-body pt-2 pt-lg-0 pe-lg-4">
                  <ul class="nav flex-column">
                    <li class="h4 nav-item px-0 pb-3">카테고리</li>
                    <li class="nav-item"><a class="nav-link fw-normal px-0 py-1" href="community_freeboard_list.html">자유게시판</a></li>
                    <li class="nav-item"><a class="nav-link fw-normal px-0 py-1" href="culture-list.html">문화소식</a></li>
                    <li class="nav-item"><a class="nav-link fw-normal px-0 py-1" href="photoboard_list.html">포토게시판</a></li>
                  </ul>
                </div>
              </form>
            </div>
          </aside>

          <div class="col-lg-9">
            <div class="row mt-5">
              <table class="table" id="table-board">
                <tbody>
                  <tr>
                    <div>
                      <div class="row">
                        <td>번호</td>
                        <td>제목</td>
                      </div>
                      <div class="row">
                        <td>작성자</td>
                        <td>등록일</td>
                        <td>조회수</td>
                      </div>
                    </div>
                  </tr>


				  <c:if test="${empty list}">
				  	<tr>
				  		<td>조회된 글이 없습니다.</td>
				  	</tr>
				  </c:if>
				  
				  <c:if test="${not empty list}">
				  	<c:forEach var="item" items=${list}"/>
				  	<tr>
                    	<div>
                      	<div class="row">
                        	<td><c:out value="${item.bno}"</td>
                        	<td><a class="nav-link fw-normal" href="${path}/board/view?/no=${item.bno}">
                        			<c:out value="${item.title}"/>
                        		</a>
                        	</td>
                      	</div>
                      	<div class="row">
                        	<td>관리자</td>
                        	<td><fmt:formatDate type="date" value="${item.createDate}"/></td>
                        	<td><c:out value="${item.readCount}"</td>
                      	</div>
                    	</div>
                  	</tr>
                  		</c:forEach>
				  </c:if>	


				  <tr>
                    <div>
                      <div class="row">
                        <td>1</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 하반기 뮷즈 공모 안</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-06-13</td>
                        <td>1764</td>
                      </div>
                    </div>
                  </tr>
				  
				  
				  
				  
				  
                  <tr>
                    <div>
                      <div class="row">
                        <td>1</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 하반기 뮷즈 공모 안</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-06-13</td>
                        <td>1764</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>2</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 국립중앙박물관 식음료매장 및 운영시간 안내</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-06-22</td>
                        <td>6</td>
                      </div>
                    </div>
                  </tr>
                  
                  <tr>
                    <div>
                      <div class="row">
                        <td>3</td>
                        <td><a class="nav-link fw-normal" href="#">국립중앙박물관 특별전 영원한 여정 특별한 동행 운영인력 추가모집(마감)</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-06-19</td>
                        <td>372</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>4</td>
                        <td><a class="nav-link fw-normal" href="#">극장 '용' 공연장 안내원 모집공고(~6/18)</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-05-30</td>
                        <td>1478</td>
                      </div>
                    </div>
                  </tr>
        
                  <tr>
                    <div>
                      <div class="row">
                        <td>5</td>
                        <td><a class="nav-link fw-normal" href="#">국립중앙박물관 특별전 영원한 여정,특별한 동행 인력모집</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>1426</td>
                      </div>
                    </div>
                  </tr>
        
                  <tr>
                    <div>
                      <div class="row">
                        <td>6</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 극장 '용' 토닥토닥 예술나눔 무료대관 지원사업 공모</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>669</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>7</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 극장 '용' 토닥토닥 예술나눔 무료대관 지원사업 공모</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>669</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>8</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 극장 '용' 토닥토닥 예술나눔 무료대관 지원사업 공모</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>669</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>9</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 극장 '용' 토닥토닥 예술나눔 무료대관 지원사업 공모</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>669</td>
                      </div>
                    </div>
                  </tr>

                  <tr>
                    <div>
                      <div class="row">
                        <td>10</td>
                        <td><a class="nav-link fw-normal" href="#">2023년 극장 '용' 토닥토닥 예술나눔 무료대관 지원사업 공모</a></td>
                      </div>
                      <div class="row">
                        <td>관리자</td>
                        <td>2023-04-28</td>
                        <td>669</td>
                      </div>
                    </div>
                  </tr>
                </tbody> -->
              </table>

              <div class="col col-md-4 col-12 order-md-2 order-3 text-center"></div>
              <div class="col col-md-4 col-6 order-md-3 order-2 mt-5">
                <nav aria-label="Page navigation">
                  <ul class="pagination pagination-sm justify-content-center">
                    <li class="page-item active" aria-current="page">
                      <span class="page-link" style="font-size: 1.2rem;">
                        1
                        <span class="visually-hidden">(current)</span>
                      </span>
                    </li>
                    <li class="page-item"><a class="page-link" href="#" style="font-size: 1.2rem;">2</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="font-size: 1.2rem;">3</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="font-size: 1.2rem;">4</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="font-size: 1.2rem;">5</a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Footer-->
    <footer th:replace="~{common/layout :: #footer}"></footer>
	
    <!-- Back to top button-->
    <a class="btn-scroll-top" href="#top" data-scroll>
      <svg viewBox="0 0 40 40" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <circle cx="20" cy="20" r="19" fill="none" stroke="currentColor" stroke-width="1.5" stroke-miterlimit="10"></circle>
      </svg>
      <i class="ai-arrow-up"></i>
    </a>
    <!-- Vendor scripts: js libraries and plugins-->
    <script th:src="@{/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js}"></script>
    <script th:src="@{/assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js}"></script>
    <script th:src="@{/assets/vendor/nouislider/dist/nouislider.min.js}"></script>
    <script th:src="@{/assets/vendor/swiper/swiper-bundle.min.js}"></script>
    <!-- Main theme script-->
    <script th:src="@{/assets/js/theme.min.js}"></script>
  </body>
</html>
