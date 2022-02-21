<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고조회</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style type="text/css">
.content {
	height: 100vh;
	padding: 50px 0px;
	margin-left: auto;
	margin-right: auto;
	overflow-y: auto;
}

  #searchBtn{
        
        float: right;
        color: #F5D042;
        background-color: #0A174E;
       	margin-left: 10px;
        
        }


    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>

<body>

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />





						<div class="content col-8">
							<h2>재고조회</h2>
							<hr>

							<div class="search form-inline">
								<!-- form-inline : 한줄에 배치 -->
								<form method="post" id="searchList" name="searchList">
									<select class="search-select form-control" id="category"
										name="category" required onchange="selectCategory()">
										<option value="0"
											<c:if test='${category == 0 }'> selected</c:if>>상품코드</option>
										<option value="1"
											<c:if test='${category == 1 }'> selected</c:if>>상품명</option>
									</select> <input type="text" required name="search" id="search"
										value="${search}"><input hidden="hidden">
									<!-- enter 눌렀을 때 submit 방지 -->
									<input class="btn" id="searchBtn" type="button"
										value="검색" onclick='return searchSubmit()'>
								</form>
							</div>
							<br>
							<table class="table table-bordered table-hover" id="invenList">
								<thead class="thead-light">
									<tr>
										<th>상품코드</th>
										<th>상품명</th>
										<th>카테고리</th>
										<th>세부 카테고리</th>
										<th>재고량</th>
										<th>단위</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${searchList}" var="i">

										<tr>
											<td>${i.snackNo}</td>
											<td>${i.snackName}</td>
											<td>${i.category}</td>
											<td>${i.detail}</td>
											<td>${i.stock}</td>
											<td>${i.unit}</td>
										</tr>

									</c:forEach>
								</tbody>

							</table>
							<c:if test=" ${category == 0 }">

								<div id="pagingArea" class="content col-8" align="center">
									<ul class="pagination">
										<c:choose>
											<c:when test="${ pi.currentPage ne 1 }">
												<li class="page-item"><a class="page-link"
													href="searchSno.pm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="">Previous</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
											var="p">
											<c:choose>
												<c:when test="${ pi.currentPage ne p }">
													<li class="page-item"><a class="page-link"
														href="searchSno.pm?currentPage=${ p }">${ p }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														href="">${ p }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${ pi.currentPage ne pi.maxPage }">
												<li class="page-item"><a class="page-link"
													href="invenList.pm?currentPage=${ pi.currentPage+1 }">Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="invenList.pm?currentPage=${ pi.currentPage+1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>


							</c:if>

							<c:if test="${category == 1 }">


								<div id="pagingArea" class="content col-8" align="center">
									<ul class="pagination">
										<c:choose>
											<c:when test="${ pi.currentPage ne 1 }">
												<li class="page-item"><a class="page-link"
													href="searchSname.im?currentPage=${ pi.currentPage-1 }">Previous</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="">Previous</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
											var="p">
											<c:choose>
												<c:when test="${ pi.currentPage ne p }">
													<li class="page-item"><a class="page-link"
														href="searchSname.im?currentPage=${ p }">${ p }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														href="">${ p }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${ pi.currentPage ne pi.maxPage }">
												<li class="page-item"><a class="page-link"
													href="searchSname.im?currentPage=${ pi.currentPage+1 }">Next</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													href="searchSname.im?currentPage=${ pi.currentPage+1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>


							</c:if>


						</div>
					</div>
				</div>



			<script>
				$(function() {
					$("#invenList tbody tr").click(
							function() {
								location.href = "invenDetail.im?snackNo="
										+ $(this).children().eq(0).text();
							});

				});

				function searchSubmit(category) {

					var category = $("#category").val();
					console.log(category);
					if (category == 0) {

						document.searchList.action = "searchSno.im";

					}
					if (category == 1) {

						document.searchList.action = "searchSname.im";

					}

					document.searchList.submit();
					// return true; 
				}
				
				
				function selectCategory() {
					
					var category = $("#category").val();
					console.log(category);
					if (category == 0) {
						var search = $("#search").val();
						console.log("selectCategory0");
						console.log(search);
						$( '#search' ).attr( 'onKeyup', "this.value=this.value.replace(/[^-0-9]/g,'');" );

					}else if (category == 1) {
						console.log("selectCategory1");
						var search = $("#search").val();
						console.log(search);
						$( '#search' ).removeAttr( 'onKeyup' );

					}
			
					
					
				}
				
				$(document).ready(function() {
					console.log("기본 값 : " + ${category});
					var category = $("#category").val();
					console.log(category);
					if (category == 0) {
						var search = $("#search").val();
						console.log("ready0");
						console.log(search);
						$( '#search' ).attr( 'onKeyup', "this.value=this.value.replace(/[^-0-9]/g,'');" );

					}else if (category == 1) {
						console.log("ready1");
						var search = $("#search").val();
						console.log(search);
						$( '#search' ).removeAttr( 'onKeyup' );

					
					
				}
				   });
				
			</script>

</body>
</html>