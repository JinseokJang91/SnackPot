<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SnackList</title>
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

    <section class="snacklist-view">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <div class="content col-10">
                    <h5>간식 리스트 조회</h5>
                    <hr>

					<!--  화면에 항상 있어야 할 정보 
						    회사명, 예산, 주문 마감일, 리스트 번호      
					 -->
					<c:if test="${ empty o }">
						<p>주문 가능한 간식 리스트가 없습니다.</p>
					</c:if>
					
					<c:if test="${ !empty o }">
					
					
                    <span class="company-name">${o.comName}</span>
                    <br><br>
                    <span>주문 마감일 : ${o.orderDeadline}</span>&nbsp;&nbsp;&nbsp;
					<span>배송 예정일 : ${o.deliveryDate}</span><br>
                    <span>예산 : <fmt:formatNumber value="${o.budget}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
                    <span id="totalPrice"></span>
                 	
					
                    <button type="button" class="btn commBtn" data-toggle="modal" data-target="#wishModal" id="wishBtn">위시리스트 조회</button>
                    
					<!-- The Modal -->
					<div class="modal fade" id="wishModal">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">위시 리스트</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					      
					        <table class="table table-bordered wish-table" id="wish-table">
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
	                            </tbody>
					        </table>
					        
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
                   <!-- Modal end -->      
                                
                    <hr>
                 
                    <div class="search-list">
      
						<!-- 검색 부분 -->
                        <div class="search-sub form-inline">
                            <form action="comSearchSnack.sn" method="post">    
	                            <select class="search-select category form-control" name="category" id="category">
	                                <option value="0">카테고리</option>
	                                <option value="1">스낵</option>
	                                <option value="2">음료</option>
	                                <option value="3">간편식</option>
	                            </select>
	
	                            <select class="search-select subCategory form-control" name="subCategory" id="subCategory">
	                                <option value="0">상세 카테고리</option>
	                            </select>
	
	                            <input type="text" class="form-control" placeholder="검색어 입력" name="search" aria-describedby="searchBtn">
	                            <button class="btn btn-warning" type="submit" id="searchBtn">검색</button>
							</form>
                        </div>
                        
                        <!-- 검색 결과  리스트 -->
                        <table class="table table-bordered search-table">
                            <thead class="thead-light">
                                <tr>
                                    <th>카테고리</th>
                                    <th>상세 카테고리</th>
                                    <th>이미지</th>
                                    <th>품목명</th>
                                    <th>공급가</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th>리스트 추가</th>
                                </tr>
                            </thead>
    
                            <tbody>
                            
                            	<!-- 추가 버튼 클릭 시 회사 코드, 리스트번호, 해당 스낵 번호, 수량 넘기기 -->
                            	<c:forEach items="${searchList}" var="list">
                            		
                            		<form action="addOrderDList.sn" method="post" id="searchSubmitForm${list.snackNo}">
                            			<input type="hidden" name="comCode" value="${o.comCode}">
										<input type="hidden" name="orderNo" value="${o.orderNo}">
										<input type="hidden" name="snackNo" value="${list.snackNo}">
										<input type="hidden" name="amount" id="addDListAmount${list.snackNo}">
                            		</form>
                            		
                            		<input type="hidden" id="searchStock" value="${list.stock}">
                            		
                            		<tr>
	                                	<td>${list.categoryName}</td>
	                                    <td>${list.subCategoryName}</td>
	                                    <td><img class="image" src="${ pageContext.servletContext.contextPath }/resources/images/${list.imageName}"></td>
	                                    <td>${list.snackName}</td>
	                                    <td class="searchPrice">
		                                    <input type="hidden" id="searchPrice${list.snackNo}" value="${list.releasePrice}">
		                                    <fmt:formatNumber value="${list.releasePrice}" groupingUsed="true"/>
	                                    </td>
	                                    <td><input type="number" class="searchAmount" id="${list.snackNo}" min=1 max="${list.stock}" required></td>
	                                    <td class="searchTotalPrice" id="searchTotalPrice${list.snackNo}"></td>
	                                    <td><button type="button" class="btn addBtn" value="${list.snackNo}">추가</button></td>
                                	</tr>
                            	</c:forEach>
                            	
                            </tbody>
    
                        </table>

                    </div>

                    <!-- search end-->

                    <hr>
                    
                    <!-- 간식 리스트 부분 -->
                    <form action="deleteOrderDNo.sn" method="post" id="dListForm">
	                    <input type="hidden" name="orderNo" value="${o.orderNo}">
	                    
	                    <table class="table table-bordered list-table">
	                        <thead class="thead-light">
	                            <tr>
	                                <th>선택</th>
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
	                            <c:forEach items="${dList}" var="dList">
	                            	<input type="hidden" id="dListStock" value="${dList.stock}">
	                            	
	                            	<tr>
		                            	<td>
		                                    <div class="form-check form-check-inline" style='zoom:1.5;'>
		                                        <input class="form-check-input" type="checkbox" name="orderDNoCheck" id="inlineCheckbox${dList.orderDNo}" value="${dList.orderDNo}">
		                                    </div>
		                                </td>
		                            	<td>${dList.categoryName}</td>
		                                <td>${dList.subCategoryName}</td>
		                                <td><img class="image" src="${ pageContext.servletContext.contextPath }/resources/images/${dList.imageName}"></td>
		                                <td>${dList.snackName}</td>
		                                <td><fmt:formatNumber value="${dList.releasePrice}" groupingUsed="true"/></td>
		                                <td><input type="number" class="amount" id="${dList.orderDNo}" value="${dList.amount}" min=1 max="${dList.stock}"></td>
		                                <td><fmt:formatNumber value="${dList.releasePrice * dList.amount}" groupingUsed="true"/></td>
	                                </tr>
	                                
	                            </c:forEach>
	                        </tbody>
	                    </table>
                    </form>
                    
                    <form action="updateOrderAmount.sn" method="post" id="updateOrderAmount">
		                <input type="hidden" name="amount" id="snackAmount">
		                <input type="hidden" name="orderDNo" id="orderDNo">
		            </form>
		            
		             <form action="snackOrder.sn" method="post" id="snackOrder">
		                <input type="hidden" name="orderNo" value="${o.orderNo}">
		            </form>
		            
		            
                    <!-- list end-->

                    <button type="button" class="btn commBtn" id="orderBtn">주문 하기</button>
                    <button type="button" class="btn commBtn" id="deleteBtn" >선택 항목 삭제</button>
					</c:if>
					
                </div>
            </div>
        </div>
    
    </section>
    
<script type="text/javascript">

	$(function(){
		
		selectTotalPrice();
		
		<%-- select option 값 선택시 이벤트 : on change  --%>
		$('#category').on('change', function(){
			
			var c = $('select[name=category]').val();
			console.log(c)
			
			$.ajax({
				
				url:'selectSubCate.sn',
				data: {cNo : c},
				success: function(category){
					
					$('#subCategory').html('');
					var $default = $(document.createElement('option')).val(0).text('상세 카테고리');
					$('#subCategory').append($default);
					
					$.each(category, function(index, value){
						
						var $opt = $(document.createElement('option')).val(value.detailNo).text(value.detailCategory);
						$('#subCategory').append($opt);
					})
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			});

		})
		
		
		<%-- 선택항목 삭제 버튼 클릭 시--%>
		$('#deleteBtn').on('click', function(){
			
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result) $('#dListForm').submit();
			
		})
		
		<%-- 검색 부분 수량 변경 시 --%>
		$('.searchAmount').on('change', function(){
			var amount = $(this).val();
			var snackNo = $(this).attr('id');
			var stock = Number($('#searchStock').val());
			var price = $('#searchPrice' + snackNo).val();
			
			if(amount < 1){
				alert("최소 수량은 1입니다.");
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("주문 가능한 수량을 초과하였습니다.");
				$(this).val(stock);
			}
			
			$('#searchTotalPrice' + snackNo).text(addCommas($(this).val()*price));
			
		})
		
		<%-- 추가 버튼 클릭 시--%>
		$('.addBtn').on('click', function(){
			
			var orderNo = ${o.orderNo};
			var snackNo = $(this).val();
			var amount = $('#' + snackNo).val();
			
			if(amount < 1){
				alert("수량을 입력해 주세요.")
				$('#' + snackNo).focus();
			}else{
				$('#addDListAmount' + snackNo).attr('value', amount);
				
				<%-- snack중복 체크 --%>
				$.ajax({
					url:'checkOrderSnackDup.sn',
					data:{
						orderNo : orderNo,
						snackNo : snackNo
					},
					success: function(result){
						
						if(result > 0){
							alert("이미 리스트에 해당 항목이 존재합니다.");
						}else{
							$('#searchSubmitForm' + snackNo).submit();
							alert("추가되었습니다.");
						}
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}
		})
		
		<%-- 리스트에 있는 수량  변경 시--%>
		$('.amount').on('change', function(){
			
			var amount = $(this).val();
			var stock = Number($('#dListStock').val());
			var orderDNo = $(this).attr('id');
			
			if(amount < 1){
				alert("최소 수량은 1입니다.")
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("주문 가능한 수량을 초과하였습니다.");
				$(this).val(stock);
			}
			
			$('#snackAmount').val($(this).val());
			$('#orderDNo').val(orderDNo);
				
			$('#updateOrderAmount').submit();
			
		})
		
		<%-- 리스트 발송 버튼 클릭 시--%>
		$('#orderBtn').on('click', function(){
			
			var result = confirm("주문하시겠습니까?");
			if(result){
				
				var orderNo =  ${o.orderNo};
				
				$.ajax({
					
					url:'checkOrderStock.sn',
					data:{orderNo:orderNo},
					success: function(list){
						
						console.log(list);
						
						if(list.length == 0){
							 $('#snackOrder').submit();
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
	
		$('#wishBtn').on('click', function(){
			$('#wish-table tbody').empty();
			
			var wishNo = '${o.wishNo}';
			
			$.ajax({
				
				url:'selectComWishList.sn',
				type:'POST',
				data: {wishNo : wishNo},
				success: function(wishList){
					
					console.log(wishList);
					
					$.each(wishList, function(index, obj){
						
						console.log(obj);
						
						var category = $("<td>").text(obj.categoryName);
						var subCategory = $("<td>").text(obj.subCategoryName);
						var image = $("<td>").append($("<img>").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/"+obj.changeName ).attr('class', "image"))
						var name = $("<td>").text(obj.snackName);
						var price = $("<td>").text(addCommas(obj.releasePrice));
						var count = $("<td>").text(obj.count);
						var totalPrice = $("<td>").text(addCommas(obj.releasePrice*obj.count));
						var tr = $("<tr>").append(category, subCategory, image, name, price, count, totalPrice);
						
						$('#wish-table tbody').append(tr);
					})
					
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
		})
	
	})
	
	function addCommas(c){
			return c.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function selectTotalPrice(){
		var orderNo =  ${o.orderNo};
		
		$.ajax({
			
			url:'totalPrice.sn',
			data:{orderNo:orderNo},
			success: function(totalPrice){
				
				var totalPrice = addCommas(totalPrice);
				
				$('#totalPrice').text('총 금액 : ' + totalPrice + '원');
				
			},error:function(){
				console.log("ajax 통신 실패");
			}
		});
			
	}	
	

</script>

</body>
</html>