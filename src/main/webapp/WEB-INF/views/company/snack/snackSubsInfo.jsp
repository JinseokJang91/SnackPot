<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subscribe</title>

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

 	<!-- snack subscribe section-->
    <section class="snack-subs">

        <div class="container-fluid">
            <div class="row">

                <div class="content  col-10">
                    <h4>간식 구독 정보 조회</h4>
                    <hr>
                    
                    <c:if test="${ empty subs }">
                    	<p>현재 구독 중인 간식이 없습니다.</p>
                    </c:if>

					<c:if test="${ !empty subs }">
					
                    <form id="subsEnroll" method="post" action="updateSubs.sn" onsubmit="return false">
                    	<input type="hidden" name="subsNo" value="${subs.subsNo}">
                    	<input type="hidden" name="comCode" value="${subs.comCode}">

                        <div class="form-group row" id="snack-budget">

                            <!-- 숫자만 입력하도록 하기-->
                            <label for="budget" class="col-md-2 col-form-label">간식 예산</label> 
                            <div class="col-md-3 d-flex">
                                <input type="text" class="form-control" id="budgetInput" name="budgetInput" placeholder="금액을 입력해 주세요" value="${subs.budget}" required><p>원</p>
                                <input type="hidden" id="budgetHidden" name="budget" value="" >
                            </div>
                           
                        </div>

                        
                        <div class="form-group row" id="ratio">

                            <label class="col-md-2">간식 비율</label>

                            <div class="col-md-10 row">
                                    <!-- 숫자만 입력하도록 하기-->
                                <label for="snack-ratio" class="col-md-1 col-form-label">스낵</label> 
                                <div class="col-md-2 d-flex">
                                    <input type="text" class="form-control" id="snack-ratio" name="snackRatio" placeholder="숫자만 입력" value="${subs.snackRatio}" required><p>%</p>
                                </div>

                                <label for="drink-ratio" class="col-md-1 col-form-label">음료</label> 
                                <div class="col-md-2 d-flex">
                                    <input type="text" class="form-control" id="drink-ratio" name="drinkRatio" placeholder="숫자만 입력" value="${subs.drinkRatio}" required><p>%</p>
                                </div>

                                <label for="retort-ratio" class="col-md-1 col-form-label">간편식</label> 
                                <div class="col-md-2 d-flex">
                                    <input type="text" class="form-control" id="retort-ratio" name="retortRatio" placeholder="숫자만 입력" value="${subs.retortRatio}" required><p>%</p>
                                </div>
                            	
                            	<div class="col-md-12">
                                	<p id="ratioInfo">※ 간식 비율의 합이 100이 되도록 해주세요.</p>
                                </div>
                            
                            </div>
                        </div>
                        <hr>

                        <!-- 카테고리 선택-->
                        <div class="form-group row" id="category">

                            <label class="col-md-2">카테고리 선택</label>

                            <div class="col-md-10 category-menu" id="category-menu">

                                <div class="col-md-12 category-sub">
                                  <label>스낵류 카테고리 선택</label><br>
                                  
                                  <c:forEach items="${snackCategory}" var="s">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="snackCheckbox${s.detailNo}" name="snackCategory" value="${s.detailNo}">
	                                    <label class="form-check-label" for="snackCheckbox${s.detailNo}">${s.detailCategory }</label>
	                                  </div>
                                  </c:forEach>
                                 
                                </div>
                                

                                <div class="col-md-12 category-sub">
                                    <label>음료 카테고리 선택</label><br>
                                    
                                    <c:forEach items="${drinkCategory}" var="d">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="drinkCheckbox${d.detailNo}"  name="drinkCategory" value="${d.detailNo}">
	                                    <label class="form-check-label" for="drinkCheckbox${d.detailNo}">${d.detailCategory }</label>
	                                  </div>
                                  	</c:forEach>
                                  	
                                </div>

                                <div class="col-md-12 category-sub">
                                    <label>간편식 카테고리 선택</label><br>
                                   	
                                   	<c:forEach items="${retortCategory}" var="r">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="retortCheckbox${r.detailNo}" name="retortCategory" value="${r.detailNo}">
	                                    <label class="form-check-label" for="retortCheckbox${r.detailNo}">${r.detailCategory }</label>
	                                  </div>
                                  	</c:forEach>
                                   
                                </div>


                            </div>
                           
                        </div>
                        <!-- 카테고리 선택 끝-->

                        <hr>
                        <div class="form-group row" id="taste">

                            <label class="col-md-2">선호하는 맛</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12">
                                
                                <c:forEach items="${taste}" var="t">
                                	<div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="tasteCheckbox${t.tasteNo}" name="preferTaste" value="${t.tasteNo}">
                                        <label class="form-check-label" for="tasteCheckbox${t.tasteNo}">${t.taste}</label>
                                    </div>
                                </c:forEach>
                                    
                                </div>
                            
                            </div>

                        </div>

                        <div class="form-group row" id="flavour">

                            <label class="col-md-2">싫어하는 향</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12 ">
                                
                                <c:forEach items="${flavour}" var="f">
                                	<div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="flavourCheckbox${f.aromaNo}" name="dislikeFlavour" value="${f.aromaNo}">
                                        <label class="form-check-label" for="flavourCheckbox${f.aromaNo}">${f.aroma}</label>
                                    </div>
                                </c:forEach>
                    
                                </div>
                            
                            </div>

                        </div>
                        <hr>
                        <!-- 배송 예정일 --> 
                        <div class="form-group row" id="delivery">

                            <label for="delivery-date" class="col-md-2 col-form-label">배송 예정일</label> 
                            <div class="col-md-3 d-flex"> <!-- d-flex 인라인으로 정렬 -->
                                <p>매달</p><input type="text" class="form-control" id="delivery-date" name="deliveryDate" value="${subs.deliveryDate}" placeholder="숫자만 입력" required><p>일</p>
                            </div>
            
                        </div>

                        <!-- 결제일(신청일) --> 
                        <div class="form-group row" id="settlement">

                            <label for="settlement-date" class="col-md-2 col-form-label">결제 예정일(신청일)</label> 
                            <div class="col-md-3 d-flex" >
                                <p>매달</p><input type="text" class="form-control" id="settlement-date" name="" readonly><p>일</p>
                            </div>
            
                        </div>
                        
                        <hr>
                        
						<div>
							<p>※ 간식 리스트가 발송 된 후에는 수정된 내용이 반영되지 않습니다.</p>
						</div>
						
                        <button type="submit" class="btn btn-warning yellowBtn mr-2 float-right" id="updateBtn">내용 수정하기</button>
						<button type="button" class="btn btn-secondary mr-2 float-right" id="cancelBtn">구독 취소하기</button>

                    </form>
                    
                    <!-- 구독 취소하기 버튼 눌렀을 때 -->
                    <form action="cancelSubs.sn" method="post" id="postForm">
				    	<input type="hidden" name="subsNo" value="${subs.subsNo}">
				    </form>
				    
				    </c:if>

                </div>


            </div>
        </div>


    </section>
    
<script type="text/javascript">
	$(function(){
		
		var snackCate = "${subs.snackCategory}".split(",");
		var drinkCate = "${subs.drinkCategory}".split(",");
		var retortCate = "${subs.retortCategory}".split(",");
		var taste = "${subs.preferTaste}".split(",");
		var flavour = "${subs.dislikeFlavour}".split(",");
		var settleDate = new Date("${subs.settleDate}");
		
		/*구독 일자만 보여주기*/
		$('#settlement-date').attr('value', settleDate.getDate());

		/*선택한 카테고리 번호 이용 해당 번호 id에 checked 속성 주기*/
		snackCate.forEach(function(e){
			$('#snackCheckbox'+e).attr('checked', true);
			console.log(e);
		});

		drinkCate.forEach(function(e){
			$('#drinkCheckbox'+e).attr('checked', true);
			console.log(e);
		});
		
		retortCate.forEach(function(e){
			$('#retortCheckbox'+e).attr('checked', true);
			console.log(e);
		});
		
		taste.forEach(function(e){
			$('#tasteCheckbox'+e).attr('checked', true);
			console.log(e);
		});
		
		flavour.forEach(function(e){
			$('#flavourCheckbox'+e).attr('checked', true);
			console.log(e);
		});
		
		function addCommas(c){
			return c.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		function uncomma(value) {
			var value = value.replace(/[^\d]+/g, "");
	        return value;
		}
		
		function onlyNum(value){
			return value.replace(/[^0-9]/g,"");
		}
		
		$('#budgetInput').val(addCommas(onlyNum($('#budgetInput').val())));
		$('#budgetHidden').val(uncomma($('#budgetInput').val()));
		
		$('#budgetInput').on('keyup', function(){
			$(this).val(addCommas(onlyNum($(this).val())));
			$('#budgetHidden').val(uncomma($('#budgetInput').val()));
		});
		
		$('#snack-ratio').on('keyup', function(){
			$(this).val(onlyNum($(this).val()));
		});
		
		$('#drink-ratio').on('keyup', function(){
			$(this).val(onlyNum($(this).val()));
		});
		
		$('#retort-ratio').on('keyup', function(){
			$(this).val(onlyNum($(this).val()));
		});
		
		$('#delivery-date').on('keyup', function(){
			$(this).val(onlyNum($(this).val()));
		});
		
		$('#updateBtn').on('click', function(){
			
			var snack = Number($('#snack-ratio').val());
			var drink = Number($('#drink-ratio').val());
			var retort = Number($('#retort-ratio').val());
			var total = snack + drink + retort;
			console.log(total);
			
			if(total != 100){
				alert("간식 비율의 합이 100이 되도록 해주세요.");
			}else{
				$('#subsEnroll').attr('onsubmit', 'return true');
			}
		});
		
		/*구독 취소하기 버튼 클릭 시*/
		$('#cancelBtn').click(function(){
			var result = confirm("정말로 구독을 취소하시겠습니까?")
			
			if(result){
				/*replace 기존페이지를 새 페이지로 덮어씀, 뒤로가기 불가
				  href='' 새로운 페이지로 이동, 페이지가 기록됨 */
				$('#postForm').submit();
			}
		});
		
		
	});
</script>


</body>
</html>