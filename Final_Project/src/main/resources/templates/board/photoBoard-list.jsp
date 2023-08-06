<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<!-- Vendor styles-->
    <link rel="stylesheet" media="screen" th:href="@{/assets/vendor/flatpickr/dist/flatpickr.min.css}"/>
    <head th:fragment="head" th:replace="~{common/layout :: head}"></head>
    
  <!-- Body-->
  <body>
    <!-- Page loading spinner-->
    <div class="page-loading active">
      <div class="page-loading-inner">
        <div class="page-spinner"></div><span>Loading...</span>
      </div>
    </div>
    <!-- Page wrapper-->
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
            <li class="breadcrumb-item active" aria-current="page">포토게시판</li>
          </ol>
        </nav>
        <!-- Page title-->
        <div class="row mt-n1">
          <div class="col-lg-9 offset-lg-3">
            <h2 style="color: #E8AE50;">포토게시판</h2>
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
              <div>
                <div class="row">
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://gongju.museum.go.kr/_prog/download/?site_dvs_cd=gongju&func_gbn_cd=main_visual&mng_no=68" class="rounded "alt=""/>
                    </a>
                    <p style="text-align: center;">부산박물관</p>
                  </div>
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://img.hankyung.com/photo/202112/AKR20211203068300005_01_i_P4.jpg" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">백제실 가야실</p>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f52c4e00-e91a-4f21-b97f-777203d04ca1" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">백제군사박물관</p>
                  </div>
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://www.seouldanurim.net/comm/getImage?srvcId=MEDIA&parentSn=45278&fileTy=MEDIA&fileNo=1&thumbTy=L" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">국립중앙박물관</p>
                  </div> 
                </div>
                
                <div class="row">
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://museum.seoul.go.kr:8088/ARCHIVE_DATA/view/6112523/A000000347/view_033ec788-0ae4-4deb-a325-72fe1a0fa196.jpg" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">서울역사박물관</p>
                  </div>
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://www.dwbnews.kr/news/photo/202207/25026_30500_829.jpg" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">해녀박물관</p>
                  </div>
                </div>
        
                <div class="row">
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://mblogthumb-phinf.pstatic.net/MjAyMjA4MTFfNTQg/MDAxNjYwMjE5MzYxNDMz.e-HLGOYHswmMtj5MAaBmkoUxJrK2kL-TsqIOIVeNrk0g.x4L1Yg_kxa__-gK_wb9TIUHWy3Rq_7ONgEdqoF68MM0g.JPEG.train95/%EA%B5%AD%EB%A6%BD%EA%B3%B5%EC%A3%BC%EB%B0%95%EB%AC%BC%EA%B4%8026.jpg?type=w800" class="rounded"alt=""/>
                    </a>
                    <p style="text-align: center;">국립공주박물관</p>
                  </div>
                  <div class="col-6">
                    <a href="#">
                      <img style="height: 250px; width: 500px;" src="https://museumonroad.org/wp-content/uploads/2023/05/%EB%B9%85%EB%AC%BC%EA%B4%80%EC%A0%84%EA%B2%BD%EC%82%AC%EC%A7%84-680x500.jpg" class="rounded" alt="">
                    </a>
                    <p style="text-align: center;">월정사 성보박물관</p>
                  </div>
                </div>  
              </div>  

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
	
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll>
      <svg viewBox="0 0 40 40" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <circle cx="20" cy="20" r="19" fill="none" stroke="currentColor" stroke-width="1.5" stroke-miterlimit="10"></circle>
      </svg><i class="ai-arrow-up"></i></a>
    <!-- Vendor scripts: js libraries and plugins-->
    <script th:src="@{/assets/vendor/bootstrap/dist/js/bootstrap.bundle.js}"></script>
    <script th:src="@{/assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.js}"></script>
    <script th:src="@{/assets/vendor/jarallax/dist/jarallax.min.js}"></script>
    <script th:src="@{/assets/vendor/flatpickr/dist/flatpickr.min.js}"></script>
    <script th:src="@{/assets/vendor/flatpickr/dist/plugins/rangePlugin.js}"></script>
    <!-- Main theme script-->
    <script th:src="@{/assets/js/theme.js}"></script>
</body>
</html>