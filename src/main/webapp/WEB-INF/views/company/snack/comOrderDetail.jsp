<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderDetail</title>

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


    <section class="order-d-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">
            
                <div class="content col-8">
                    <h5>주문 상세 내역</h5>
                    <hr>

                    <div class="company">
                       
                        <div class="com-name">${orders.comName}</div>

						<span>주문 번호: ${orders.orderNo}</span>
                        <br>
                        <span>주문일: ${orders.orderDate}</span>
                        <span>발송 예정일: ${orders.deliveryDate}</span>
                        <span>발송일: ${orders.releaseDate}</span>
                        <br>
                        <span>예산: <fmt:formatNumber value="${orders.budget}" groupingUsed="true"/>원 </span>
                        <span>총 금액: <fmt:formatNumber value="${orders.totalPrice}" groupingUsed="true"/>원</span>

                    </div>
                    <hr>
                    <button type="button" class="btn commBtn" id="orderCancelBtn">주문 취소</button>
					
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
	                                <td><fmt:formatNumber value="${d.releasePrice * d.amount}" groupingUsed="true"/></td>
                           		</tr>
                        	</c:forEach>
                        </tbody>

                    </table>

                    <button type="button" class="btn commBtn" onclick="location.href='comOrderList.sn'">목록으로</button>
                    
                </div>
            </div>
        </div>
    
    </section>

<script type="text/javascript">

$(function(){
	
	var status = '${orders.orderStatus}'
		
	if(status != 'Y'){
		$('#orderCancelBtn').attr('disabled', true);
	}
	
	<%-- 주문 취소 버튼 클릭 시 --%>
	$('#orderCancelBtn').on('click', function(){
		
		var orderNo = ${orders.orderNo}
		var result = confirm("정말 취소하시겠습니까?")
		if(result){
			
			$.ajax({
				
				url:"comOrderCancel.sn",
				type:'POST',
				data: {orderNo:orderNo},
				success: function(result){
					
					console.log(result);
					if(result == 'success'){
						alert("주문이 취소되었습니다.");
						$('#orderCancelBtn').attr('disabled', true);
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
		}
		
	})
	
	
})


</script>

</body>
</html>