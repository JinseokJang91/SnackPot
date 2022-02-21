<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OfficeOrderDetail</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- css style -->
<link rel="stylesheet" type="text/css" href="resources/css/snackListAndOrder.css">

</head>
<body>

    <section class="order-d-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">


                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
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
                    <div>
	                    <button type="button" class="btn commBtn" id="releaseBtn">간식 출고</button>
	                    <button type="button" class="btn commBtn" id="orderCancelBtn">주문 취소</button>
                    </div>
					
                    <table class="table table-bordered ">
                        <thead class="thead-light">
                            <tr>
                                <th>카테고리</th>
                                <th>상세 카테고리</th>
                                <th>이미지</th>
                                <th>품목명</th>
                                <th>공급가</th>
                                <th>수량</th>
                                <th>재고</th>
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
	                                <td><fmt:formatNumber value="${d.stock}" groupingUsed="true"/></td>
	                                <td><fmt:formatNumber value="${d.releasePrice * d.amount}" groupingUsed="true"/></td>
                           		</tr>
                        	</c:forEach>
                        </tbody>

                    </table>

                    <button type="button" class="btn commBtn" onclick="location.href='hoOrderList.sn'">목록으로</button>
                    
                    <form action="" method="post" id="submitForm">
						<input type="hidden" name="orderNo" value="${orders.orderNo}">
					</form> 

                </div>
            </div>
        </div>
    
    </section>

<script type="text/javascript">

$(function(){
	
	var status = '${orders.orderStatus}'
		
	if(status != 'Y'){
		$('#releaseBtn').attr('disabled', true);
		$('#orderCancelBtn').attr('disabled', true);
	}
	
	<%-- 주문 취소 버튼 클릭 시 --%>
	$('#orderCancelBtn').on('click', function(){
		
		var orderNo = ${orders.orderNo}
		var result = confirm("정말 취소하시겠습니까?")
		if(result){
			
			$.ajax({
				
				url:"orderCancel.sn",
				type:'POST',
				data: {orderNo:orderNo},
				success: function(result){
					
					console.log(result);
					if(result == 'success'){
						alert("주문이 취소되었습니다.");
						$('#orderCancelBtn').attr('disabled', true);
						$('#releaseBtn').attr('disabled', true);
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
	})
	
	
	<%-- 간식 출고 버튼 클릭 시--%>
	$('#releaseBtn').on('click', function(){
		
		
		var result = confirm("출고 처리하시겠습니까?");
		if(result){
			
			var orderNo =  ${orders.orderNo};
			
			$.ajax({
				
				url:'checkOrderStock.sn',
				type:'POST',
				data:{orderNo:orderNo},
				success: function(list){
					
					console.log(list);
					
					if(list.length == 0){
						
						$('#submitForm').attr('action', 'orderRelease.sn').submit();
						
					}else{
						
						var snack = '';
						$.each(list, function(index, obj){
							snack += '품명 : ' + obj.snackName + ', 주문 가능 수량: ' + obj.stock + '\n'
						})
						
						alert('주문 수량을 초과한 제품이 있습니다.\n' +snack);
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
		
	});
	
})


</script>

</body>
</html>