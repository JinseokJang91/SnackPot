<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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

    <section class="list-trans">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
                <div class="content col-8">
                    <h5>간식 리스트 발송</h5>
                    <hr>

					<!--  화면에 항상 있어야 할 정보 
						    회사명, 예산, 주문 마감일, 리스트 번호      -->
					 
					<form action="createList.sn" method="post" id="submitForm">
						<input type="hidden" name="comCode" value="${i.comCode}">
						<input type="hidden" name="listNo" value="${i.listNo}">
						<input type="hidden" name="defaultAmount" id="defaultAmount">
					</form> 
					
                    <span class="company-name">${i.comName}</span>
                    <br><br>
                    <span>주문 마감일 : ${i.orderDeadline}</span><br>
                    <span>예산 : <fmt:formatNumber value="${i.budget}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;
                    <span>총 금액 : <fmt:formatNumber value="${i.totalPrice}" groupingUsed="true"/>원</span>&nbsp;&nbsp;&nbsp;

                    <button type="button" class="btn commBtn" data-toggle="modal" data-target="#wishModal" id="wishBtn">위시리스트 조회</button>
                  	<button type="button" class="btn commBtn" id="createListBtn">리스트 생성</button>
                   
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
	                                    <th>재고</th>
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
                            <form action="searchSnack.sn" method="post">    
                            	<input type="hidden" name="comCode" value="${i.comCode}">
                            	<input type="hidden" name="listNo" value="${i.listNo}">
                            	
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
	                            <button class="btn btn-warning yellowBtn" type="submit" id="searchBtn">검색</button>
	
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
                                    <th>재고</th>
                                    <th>금액</th>
                                    <th>리스트 추가</th>
                                </tr>
                            </thead>
    
                            <tbody>
                            
                            	<!-- 추가 버튼 클릭 시 회사 코드, 리스트번호, 해당 스낵 번호, 수량 넘기기 -->
                            	<c:forEach items="${searchList}" var="list">
                            		
                            		<form action="addDList.sn" method="post" id="searchSubmitForm${list.snackNo}">
                            			<input type="hidden" name="comCode" value="${i.comCode}">
										<input type="hidden" name="snackListNo" value="${i.listNo}">
										<input type="hidden" name="snackNo" value="${list.snackNo}">
										<input type="hidden" name="amount" id="addDListAmount${list.snackNo}">
                            		</form>
                            	
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
	                                    <td>
	                                    	<fmt:formatNumber value="${list.stock}" groupingUsed="true"/>
	                                    	<input type="hidden" id="searchStock${list.snackNo}" value="${list.stock}">
	                                    </td>
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
                    <form action="deleteSnackDNo.sn" method="post" id="dListForm">
	                    <input type="hidden" name="comCode" value="${i.comCode}">
	                    <input type="hidden" name="listNo" value="${i.listNo}">
	                    
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
	                                <th>재고</th>
	                                <th>금액</th>
	                            </tr>
	                        </thead>
							
	                        <tbody>
	                            <c:forEach items="${dList}" var="dList">
	                            
	                            	<tr>
		                            	<td>
		                                    <div class="form-check form-check-inline" style='zoom:1.5;'>
		                                        <input class="form-check-input" type="checkbox" name="snackDNoCheck" id="inlineCheckbox${dList.snackDNo}" value="${dList.snackDNo}">
		                                    </div>
		                                </td>
		                            	<td>${dList.categoryName}</td>
		                                <td>${dList.subCategoryName}</td>
		                                <td><img class="image" src="${ pageContext.servletContext.contextPath }/resources/images/${dList.imageName}"></td>
		                                <td>${dList.snackName}</td>
		                                <td><fmt:formatNumber value="${dList.releasePrice}" groupingUsed="true"/></td>
		                                <td><input type="number" class="amount" id="${dList.snackDNo}" value="${dList.amount}" min=1 max="${dList.stock}"></td>
		                                <td>
			                                <fmt:formatNumber value="${dList.stock}" groupingUsed="true"/>
			                                <input type="hidden" id="dListStock" value="${dList.stock}">
		                                </td>
		                                <td><fmt:formatNumber value="${dList.releasePrice * dList.amount}" groupingUsed="true"/></td>
	                                </tr>
	                                
	                            </c:forEach>
	                        </tbody>
	                    </table>
                    </form>
                    
                    <form action="updateSnackAmount.sn" method="post" id="updateSnackAmount">
		             	<input type="hidden" name="comCode" value="${i.comCode}">
		                <input type="hidden" name="listNo" value="${i.listNo}">
		                <input type="hidden" name="amount" id="snackAmount">
		                <input type="hidden" name="snackDNo" id="snackDNo">
		            </form>
		            
		             <form action="sendSnackList.sn" method="post" id="sendSnackList">
		             	<input type="hidden" name="comCode" value="${i.comCode}">
		                <input type="hidden" name="listNo" value="${i.listNo}">
		                <input type="hidden" name="orderDeadline" value="${i.orderDeadline}">
		                <input type="hidden" name="deliveryDate" value="${i.deliveryDate}">
		                <input type="hidden" name="wishEndDate" value="${i.wishEndDate}">
		                <input type="hidden" name="budget" value="${i.budget}">
		                <input type="hidden" name="totalPrice" value="${i.totalPrice}">
		            </form>
		            
		            
                    <!-- list end-->

                    <button type="button" class="btn commBtn" id="sendBtn">리스트 발송</button>
                    <button type="button" class="btn commBtn" id="deleteBtn" >선택 항목 삭제</button>

                </div>

            </div>
        </div>
    
    </section>
    
<script type="text/javascript">

	$(function(){
		
		function addCommas(c){
			return c.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		<%-- select option 값 선택시 이벤트 : on change  --%>
		$('#category').on('change', function(){
			
			var c = $('select[name=category]').val();
			console.log(c)
			
			$.ajax({
				
				url:'selectSubCate.sn',
				type:'POST',
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
		
		<%-- 리스트 생성 버튼 클릭 시--%>
		$('#createListBtn').on('click', function(){
			
			var result = confirm("이전 리스트가 있을 경우 삭제됩니다. 리스트를 생성하시겠습니까?");
			if(result){
				
				var defaultAmount = prompt("기본 수량을 입력하세요.");
				$('#defaultAmount').attr('value', Number(defaultAmount));
				$('#submitForm').submit();
			}
			
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
			var stock = Number($('#searchStock' + snackNo).val());
			var price = $('#searchPrice' + snackNo).val();

			if(amount < 1){
				alert("최소 수량은 1입니다.");
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("재고를 초과하였습니다.");
				$(this).val(stock);
			}
			
			
			$('#searchTotalPrice' + snackNo).text(addCommas($(this).val()*price));
			
		})
		
		<%-- 추가 버튼 클릭 시--%>
		$('.addBtn').on('click', function(){
			
			var listNo = ${i.listNo};
			var snackNo = $(this).val();
			var amount = $('#' + snackNo).val();
			
			if(amount < 1){
				alert("수량을 입력해 주세요.")
				$('#' + snackNo).focus();
			}else{
				$('#addDListAmount' + snackNo).attr('value', amount);
				
				<%-- snack중복 체크 --%>
				$.ajax({
					url:'checkSnackDup.sn',
					type:'POST',
					data:{
						listNo : listNo,
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
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
			}
		})
		
		<%-- 리스트에 있는 수량  변경 시--%>
		$('.amount').on('change', function(){
			
			var amount = $(this).val();
			var stock = Number($('#dListStock').val());
			var snackDNo = $(this).attr('id');
			
			if(amount < 1){
				alert("최소 수량은 1입니다.")
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("재고를 초과하였습니다.");
				$(this).val(stock);
			}
			
			$('#snackAmount').val($(this).val());
			$('#snackDNo').val(snackDNo);
				
			$('#updateSnackAmount').submit();
		})
		
		<%-- 리스트 발송 버튼 클릭 시--%>
		$('#sendBtn').on('click', function(){
			
			var result = confirm("리스트를 전송하시겠습니까?");
			if(result) $('#sendSnackList').submit();
			
			
		})
		
		$('#wishBtn').on('click', function(){
			$('#wish-table tbody').empty();
			
			var comCode = '${i.comCode}';
			
			$.ajax({
				
				url:'selectWishList.sn',
				type:'POST',
				data: {comCode:comCode},
				success: function(wishList){
					
					$.each(wishList, function(index, obj){
						
						var category = $("<td>").text(obj.categoryName);
						var subCategory = $("<td>").text(obj.subCategoryName);
						var image = $("<td>").append($("<img>").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/"+obj.changeName ).attr('class', "image"))
						var name = $("<td>").text(obj.snackName);
						var price = $("<td>").text(addCommas(obj.releasePrice));
						var count = $("<td>").text(obj.count);
						var stock = $("<td>").text(obj.stock);
						var totalPrice = $("<td>").text(addCommas(obj.releasePrice*obj.count));
						var tr = $("<tr>").append(category, subCategory, image, name, price, count, stock, totalPrice);
						
						$('#wish-table tbody').append(tr);
					})
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
		})
		
		
		
	});

</script>

</body>
</html>