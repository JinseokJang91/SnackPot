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

.image{

width: "200px";
height: "200px";

}
</style>
</head>
<body>
	<section class="detail">
		<div class="container-fluid">
			<div class="row flex-nowrap">

				<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

				<div class="content col-8">
					<h2>재고조회</h2>
					<hr>



					<div class="container">

						<div class="row">

							<div class="productPicture col-sm-4" class="image">
								<img
									src="${ pageContext.servletContext.contextPath }/resources/images/${pa.changeName}" class="image"
									width="250px" height="250px">
							</div>


							<div class="product col-sm-8">

								<p>
									<label><b>상품명</b></label>&nbsp;<label>${snack.snackName}</label>
								</p>
								<p>
									<label><b>상품코드</b></label>&nbsp;<label>${snack.snackNo}</label>
								</p>

								<span><label><b>입고가</b></label>&nbsp;<label>${snack.purchasePrice}</label></span>
								<span><label><b>출고가</b></label>&nbsp;<label>${snack.releasePrice}</label></span>
								<p></p>
								<span><label><b>재고</b></label>&nbsp;<label>${snack.stock}</label></span>
								<span><label><b>단위</b></label>&nbsp;<label>${snack.unit}</label></span>
								<p></p>
								<span><label><b>카테고리</b></label>&nbsp;<label>${snack.category}</label></span>
								<span><label><b>세부카테고리</b></label>&nbsp;<label>${snack.detail}</label></span>
								<p></p>
								<span><label><b>맛</b></label>&nbsp;<label>${snack.taste}</label></span>
								<span><label><b>향</b></label>&nbsp;<label>${snack.aroma}</label></span>

							</div>
							<!--  <div class="btn">

								<button class="btn btn-primary">수정</button>
								<button class="btn btn-danger">삭제</button>


							</div>
							-->
							<!-- <div class="select">
                            <input type="radio" id="1" name="option" value="1"> 
                            <label for="1">입고</label>
                            <input type="radio" id="2" name="option" value="2"> 
                            <label for="2">출고</label>
                        </div>
                        <table class="table table-bordered" id="snackList">
                        <thead class="thead-light">
                            <tr>
                            	<th>입고 번호</th>
                                <th>회사명</th>
                                <th>리스트 발송일</th>
                                <th>발송 내역</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${sendingList}" var="s">
                        	
                        		<tr>
                        			<td>${s.snackListNo}</td>
	                                <td>${s.comName}</td>
	                                <td>${s.transDate}</td>
	                                <td>${s.content} 외...</td>
                            	</tr>
                        	
                        	</c:forEach>
                        </tbody>

                    </table>
     -->
						</div>
					</div>
				</div>
			</div>

		</div>


	</section>


</body>
</html>