<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OfficeSanckSendingDetail</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- css style -->
<link rel="stylesheet" type="text/css" href="resources/css/snackListAndOrder.css">

</head>
<body>

    <section class="snack-d-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">


                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 상세 내역</h5>
                    <hr>

                    <div class="company">
                       
                        <span class="com-name">${sList.comName}</span><br>
						
						<span>리스트 번호: ${sList.snackListNo}</span>
                        <span>리스트 발송일: ${sList.transDate}</span><br>
                        <span>예산: <fmt:formatNumber value="${sList.budget}" groupingUsed="true"/>원 </span>
                        <span>총 금액: <fmt:formatNumber value="${sList.totalPrice}" groupingUsed="true"/>원 </span>

                    </div>
                    <hr>

                    <table class="table table-bordered ">
                        <thead class="thead-light">
                            <tr>
                                <th>카테고리</th>
                                <th>상세 카테고리</th>
                                <th>이미지</th>
                                <th>품목명</th>
                                <th>공급가</th>
                                <th>수량</th>
                                <th>금액</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${dList}" var="d">
                        		<tr>
	                                <td>${d.categoryName}</td>
	                                <td>${d.subCategoryName}</td>
	                                <td><img class="image" src="${ pageContext.servletContext.contextPath }/resources/images/${d.imageName}"></td>
	                                <td>${d.snackName}</td>
	                                <td><fmt:formatNumber value="${d.releasePrice}" groupingUsed="true"/></td>
	                                <td>${d.amount}</td>
	                                <td><fmt:formatNumber value="${d.releasePrice*d.amount}" groupingUsed="true"/></td>
                           		</tr>
                        	</c:forEach>

                        </tbody>

                    </table>

                    <button type="button" class="btn commBtn" onclick="location.href='sendingList.sn'">목록으로</button>

                </div>
            </div>
        </div>
    
    </section>



</body>
</html>