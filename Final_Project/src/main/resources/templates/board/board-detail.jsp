tn<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <li class="breadcrumb-item active" aria-current="page">게시글 보기</li>
          </ol>
        </nav>

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
              <div class="container">
                <div class="mb-4">
                  <h3>국립중앙박물관 후기</h3>
                </div>
                <table class="table">
                 
                  <tr>
                    <div class="row">
                    
                    </div>
                    <div class="row">
                      <td><P style="color: #E8AE50;">작성자</P></td>
                      <td><c:out vlaue=${board.name}"</td>
                      <td></td>
                      <td></td>
                      <td><p style="color: #E8AE50;">조회수</p></td>
                      <td><c:out value="${board.views}"</td>
                      <td></td>
                      <td></td>
                      <td><p style="color: #E8AE50;">등록일</p></td>
                      <td><fmt:formatDate type="both" vlaue="${board.writeTime}"/></td>
                      <td></td>
                      <td></td>
                    </div>    
                  </tr>
                  </table>
                  
                <div class="mb-lg-5">
                  <a>첨부파일&nbsp&nbsp&nbsp&nbsp</a>
                  <c:if test="${not empty board.fileName}">
					<a href="javascript:fileDownload('${board.fileName}',
																'${board.reFileName}');">
						<c:out value="${board.reFileName}"></c:out>		
					</a>
				</c:if>
				
				<c:if test="${empty board.fileName}">
					<span> - </span>
                </div>
                
                <div>
                  <p> <c:out value="${board.content}"/>   
                   <!-- Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis
                    Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis//
                    --> 
                  </p>
                </div>
              </div>
              <div class="mt-4">
                <a class="btn btn-primary" href="#">목록</a>
              </div>
              <!--공유버튼-->
              <div class="container" style="text-align: right;">
                <div class="pt-4 me-3">
                  <h5>Share post:</h5>
                  <div class="d-flex" style="float: right;">
                    <a href="#" class="nav-link p-2 me-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Instagram">
                    <i class="ai-instagram"></i>
                    </a>
                    <a href="#" class="nav-link p-2 me-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Facebook">
                      <i class="ai-facebook"></i>
                    </a>
                    <a href="#" class="nav-link p-2 me-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Telegram">
                      <i class="ai-telegram fs-sm"></i>
                    </a>
                    <a href="#" class="nav-link p-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Twitter">
                      <i class="ai-twitter"></i>
                    </a>
                  </div>
                </div>
              </div>
              <!--댓글-->
              <div id="comment-container class="container mt-4">
                <!--comments-->
                <div class="border-bottom pb-4">
                  <div class="d-flex align-items-center pb-1 mb-3">
                    <img th:src="@{/assets/img/avatar/11.jpg}" class="rounded-circle" width="48" alt="Comment author">
                    <div class="ps-3">
                      <h6 class="mb-0">Jenny Wilson</h6>
                      <span class="fs-sm text-muted">2 days ago at 9:20</span>
                    </div>
                  </div>
                  <p class="pb-2 mb-0">Pellentesque urna pharetra, quis maecenas. Sit dolor amet nulla aenean eu, ac. Nisl mi tempus, iaculis viverra vestibulum scelerisque imperdiet montes mauris massa elit pretium elementum eget tortor quis</p>
                  <button type="button" class="nav-link fs-sm fw-semibold px-0 py-2">
                    Reply
                    <i class="ai-redo fs-xl ms-2"></i>
                  </button>
                  <!-- Comment reply -->
                  <div class="card card-body border-0 bg-secondary mt-4">
                    <div class="d-flex align-items-center pb-1 mb-3">
                      <img th:src="@{/assets/img/avatar/10.jpg}" class="rounded-circle" width="48" alt="Comment author">
                      <div class="ps-3">
                        <h6 class="mb-0">Ralph Edwards</h6>
                        <span class="fs-sm text-muted">2 days ago at 11:45</span>
                      </div>
                    </div>
                    <p class="mb-0"><a href="#" class="fw-bold text-decoration-none">@Jenny Wilson</a> Massa morbi duis et ornare urna dictum vestibulum pulvinar nunc facilisis ornare id at at ut arcu integer tristique placerat non turpis nibh turpis ullamcorper est porttitor.</p>
                  </div>
                </div>
                <!-- Comment form-->
                <div class="pt-4" id="comments">
                  <div class="card border-0 bg-secondary">
                    <div class="card-body">
                      <h4 class="pb-2">댓글 남기기</h4>
                      <form class="row needs-validation g-4" novalidate action="${path}/templates.board.reply>
                        <div class="col-12">
                          <textarea class="form-control" rows="1" placeholder="댓글을 입력하세요." required id="c-comment"></textarea>
                        </div>
                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">등록하기</button>
                        </div>
                      </form>
                      	<c:if test="${!empty replyList}">
							<c:forEach var="reply" items="${replyList}">
								<tr>
									<td>
										<sub class="comment-writer">${reply.id}</sub>
										<sub class="comment-date"><fmt:formatDate type="both" value="${reply.createDate}"/></sub>	
										<br>
											<c:out value="${reply.content}"/>
										</td>
									<td>
										<c:if test="${ !empty loginMember && (loginMember.id == reply.id 	|| loginMember.role == 'ROLE_ADMIN') }">
										<button class="btn-delete" onclick="deleteReply('${reply.RNo}','${board.bno}');" >삭제</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
		
                    </div>
                  </div>
                </div>
              </div>
              <!-- Sidebar toggle button-->
              <button class="d-lg-none btn btn-sm fs-sm btn-primary w-100 rounded-0 fixed-bottom" data-bs-toggle="offcanvas" data-bs-target="#sidebarBlog"><i class="ai-layout-column me-2"></i>Sidebar</button>
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