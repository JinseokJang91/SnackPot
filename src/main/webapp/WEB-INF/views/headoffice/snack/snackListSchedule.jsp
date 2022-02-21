<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OfficeSnackList</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- css style -->
<link rel="stylesheet" type="text/css" href="resources/css/snackListAndOrder.css">

</head>
<body>

    <section class="list-schedule">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 발송</h5>
                    <hr>

                    <label class="month"></label>

                    <table class="table table-bordered ">
                        <thead class="thead-light">
                            <tr>
                                <th>회사명</th>
                                <th>리스트 발송 예정일</th>
                                <th>주문 마감일</th>
                                <th>간식 배송 예정일</th>
                                <th>리스트 발송 여부</th>
                            </tr>
                        </thead>

                        <tbody>
	                        <c:forEach items="${schedule}" var="s">
	                        
	                        	<form action="createListForm.sn" method="post"  class="postForm" id="postForm${s.subsNo}">
	                        		
	                        		<input type="hidden" name="comCode" value="${s.comCode}">
	                        		<input type="hidden" name="subsNo" value="${s.subsNo}">
	                        		<input type="hidden" name="comName" value="${s.comName}">
	                        		<input type="hidden" name="orderDeadline" value="${s.orderDeadline}">
	                        		<input type="hidden" name="wishEndDate" value="${s.wishEndDate}">
	                        		<input type="hidden" name="deliveryDate" value="${s.deliveryDate}">
	                        		<input type="hidden" name="budget" value="${s.budget}"> 
	                        	</form>
	                        
	                            <tr>
	                                <td><button type="button"  class="btn comBtn" id="comBtn" value="postForm${s.subsNo}">${s.comName}</button></td>
	                                <td>${s.listTransDate}</td>
	                                <td>${s.orderDeadline}</td>
	                                <td>${s.deliveryDate}</td>
	                                <td>${s.status}</td>
	                            </tr>
							</c:forEach>
                        </tbody>

                    </table>

                </div>
                
            </div>
        </div>
    
    </section>
    
    
<script type="text/javascript">
	$(function(){
		var today = new Date();
		var month = today.getMonth()+1+'월';
		$('.month').text(month);
	
		
		$('.comBtn').click(function(){
			
			var no = '#' + $(this).val();
			$(no).submit();
		});
		
		
	});
</script>

</body>
</html>