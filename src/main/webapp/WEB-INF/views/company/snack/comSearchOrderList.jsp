<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderList</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="resources/css/snackListAndOrder.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<c:if test="${ !empty m }">
		<script>
			alert("${m}");
		</script>
		<c:remove var="m" scope="session" />
	</c:if>


    <section class="order-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <div class="content col-8">
                    <h5>간식 주문 내역</h5>
                    <hr>

                    <div class="search form-inline"><!-- form-inline : 한줄에 배치 -->
                    	<form action="comSearchOrder.sn" method="post" id="searchList">
	                        <select class="search-select form-control" id="category" name="category">
	                            <option value="0">정렬</option>
	                            <option value="1">날짜순</option>
	                            <option value="2">금액순</option>
	                        </select>
	
							<input hidden="hidden"><!-- enter 눌렀을 때 submit 방지 -->
							<span>주문일 : </span>
	                        <input type="date" class="form-control" name="startDate" id="startDate">
	                        <input type="date" class="form-control" name="endDate" id="endDate">
	
	                        <button class="btn btn-warning yellowBtn" type="button" id="searchBtn">검색</button>
                        </form>
                    </div>

                    <table class="table table-bordered" id="orderList">
                        <thead class="thead-light">
                            <tr>
                            	<th>주문일</th>
                            	<th>주문 번호</th>
                            	<th>예산</th>
                                <th>주문 금액</th>
                                <th>배송 예정일</th>
                                <th>상태</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${orderList}" var="o">
                        	
                        		<tr>
                        			<td>${o.orderDate}</td>
	                                <td>${o.orderNo}</td>
	                                <td><fmt:formatNumber value="${o.budget}" groupingUsed="true"/></td>
	                                <td><fmt:formatNumber value="${o.totalPrice}" groupingUsed="true"/></td>
	                                <td>${o.deliveryDate}</td>
	                                <td>${o.status}</td>
                            	</tr>
                        	
                        	</c:forEach>
                        </tbody>

                    </table>
                    
                    <div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage ne 1 }">
		                			<li class="page-item"><a class="page-link" href="comSearchOrder.sn?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                    	<c:choose>
			                		<c:when test="${ pi.currentPage ne p }">
		                    			<li class="page-item"><a class="page-link" href="comSearchOrder.sn?currentPage=${ p }">${ p }</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			                		</c:otherwise>
			                	</c:choose>
		                    </c:forEach>
		                    
		                    
		                    <c:choose>
		                		<c:when test="${ pi.currentPage ne pi.maxPage }">
		                			<li class="page-item"><a class="page-link" href="comSearchOrder.sn?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="comSearchOrder.sn?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                </ul>
		            </div>

                </div>
            </div>
        </div>
    
    </section>
    
<script>
	$(function(){
		$("#orderList tbody tr").click(function(){
			location.href="comOrderDetail.sn?orderNo=" + $(this).children().eq(1).text();
		});
		
		
		<%--날짜 값을 설정하지 않으면 형변환 에러가 발생하므로 disabled속성 주기, disabled는  객체 전송 안됨--%>
		$('#searchBtn').click(function(){
			
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			
			if(startDate == ''){
				$('#startDate').attr('disabled', true);
			}
			
			if(endDate == ''){
				$('#endDate').attr('disabled', true);
			}
			
			
			$('#searchList').submit();
			
		});
		
		
	});

</script>

</body>
</html>