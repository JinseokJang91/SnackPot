<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 목록 조회</title>

<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: lightgray;
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	color: rgb(10, 23, 78);
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	color: rgb(10, 23, 78);
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	color: white;
}

.inputLabel {
	display: flex;
}

.btn {
	width: 150px;
	background-color: rgb(245, 208, 66);
	color: rgb(10, 23, 78);
}

  
 .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }
   
                
             
 #addBtn{
 
        float: right;
        color: #F5D042;
        background-color: #0A174E;
 }
 
 
 .datepicker{
 
 margin: 20px 0px;
 
 }
        
       
        
        
</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">

			<jsp:include page="../../common/sidebar.jsp" />

		

			<div id="releaseWrap" class="content col-8">


				<h2>출고목록</h2>

				 <input type="text" id="datepicker" name="datepicker" class="datepicker">
	
    <script>
    
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  currentText: '오늘',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
    $(function() { $("#datepicker").datepicker({  maxDate: '0',
    	  onSelect: function (dateText, inst) {
    	      
          	var date = $( "#datepicker" ).datepicker( "getDate" );
          	releaseList();
          	
          }
    	
    
    
    }); });
    
        $(function () {
	
        	$("#datepicker").datepicker();
        	$("#datepicker").datepicker('setDate', new Date);

        });
    </script>
 <br>
				


				<table id="boardList" class="table table-hover" align="center">
					<thead>
						<tr>
							<th>출고번호</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>출고수량</th>
							<th>재고량</th>
							<th>단위</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>


				<script>

				$("document").ready(function() {

					var date = $( "#datepicker" ).datepicker( "getDate" );
					console.log(date);
					
				})
				
				
		function releaseList(){
			$.ajax({
				url: 'releaseListAjax.im',
				data: {'date' : $( "#datepicker" ).datepicker( "getDate" )},
				success: function(list){
					$tableBody = $('#boardList tbody');
					$tableBody.html('');
					
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
						var $releaseNo = $('<td>').text(obj.releaseNo);
						var $snackNo = $('<td>').text(obj.snackNo);
						var $snackName = $('<td>').text(obj.snackName);
						var $amount = $('<td>').text(obj.amount);
						var $stock = $('<td>').text(obj.stock);
						var $unit = $('<td>').text(obj.unit);
						var $remark = $('<td>').text(obj.remark);
						
				
						
						$tr.append($releaseNo);
						$tr.append($snackNo);
						$tr.append($snackName);
						$tr.append($amount);
						$tr.append($stock);
						$tr.append($unit);
						$tr.append($remark);
						$tableBody.append($tr);
					});
				}
			});
		}
		
		$(function(){
			releaseList();
			<%--setInterval(function(){
				topList();
			}, 5000);--%>
		})
	</script>

		<!-- 		<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="releaseListAjax.im?currentPage=${ pi.currentPage-1 }">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="releaseListAjax.im?currentPage=${ p }">${ p }</a></li>
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
									href="releaseListAjax.im?currentPage=${ pi.currentPage+1 }">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="releaseListAjax.im?currentPage=${ pi.currentPage+1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				
				 -->
				<button id="addBtn" class="btn btn-primary">출고 등록</button>

			</div>
			
			
			
				<div id="modal" class="modal-overlay">
				<div class="modal-window">
					<div class="title">
						<h2>출고등록</h2>
					</div>
					<div class="close-area">X</div>
					<form id="releaseEnroll" action="releaseInsert.im" method="post">
						<div class="content">
							<p>
								<label class="inputLabel">제품코드</label> <input type="number"
									name="snackNo"  id="snackNo" required="required">
							</p>
							<div id="checkSnackNo"></div>
							<p>
								<label class="inputLabel">수량</label> <input type="number"
									name="amount" id="amount" required="required">
								
							</p>
							<div id="checkAmount"></div>
							<p>
								<label class="inputLabel">비고</label> <input type="text"
									name="remark" maxlength="20" >
							</p>
							<br> <br> <input type="submit" value="등록하기" class="btn" id="submitBtn">
						</div>
					</form>
				</div>
			</div>


		</div>


	</div>

	<script>
	
	$('#snackNo').blur(function() {
		var snackNo = $('#snackNo').val();
		console.log(snackNo);
		$.ajax({
			url : 'checkSnackNo.im',
			type : 'post',
			data: {'snackNo' : $('#snackNo').val()},
			success : function (data) {
				console.log("스낵 번호: " + snackNo);
				if (data.snackName === "") {
					console.log("확인");
					$("#checkSnackNo").text("존재하지 않는 상품코드입니다");
					$("#checkSnackNo").css("color", "red");
					$("#submitBtn").attr("disabled", true);
				} else if(snackNo == ""){
					console.log("확인");
					$('#checkSnackNo').text('상품코드를 입력해주세요');
					$('#checkSnackNo').css('color', 'red');
					$("#submitBtn").attr("disabled", true);				
					
				} else{
					console.log("확인");
					$('#checkSnackNo').html('상품명 : ' + data.snackName + '<br>' + '재고량 : ' + data.stock);

					$('#checkSnackNo').css('color', 'blue');
					$("#checkAmount").removeAttr( 'readonly' );
					
				}
				
			},
			error : function() {
				console.log("통신실패");
			}
			
			
		})
	})
	
	
	$('#amount').blur(function() {
		var amount = $('#amount').val();
		console.log(amount);
		$.ajax({
			url : 'checkAmount.im',
			type : 'post',
			data: {'amount' : amount,
					'snackNo' : $('#snackNo').val()	},
			success : function (data) {
				console.log("출고 가능 여부: " + amount);
				if (data === 1) {
					console.log("check1");
					$("#checkAmount").text("재고가 충분하지 않습니다");
					$("#checkAmount").css("color", "red");
					$("#submitBtn").attr("disabled", true);
				} else if(amount == ""){
					console.log("check2");
					$('#checkAmount').text('수량을 입력해주세요');
					$('#checkAmount').css('color', 'red');
					$("#submitBtn").attr("disabled", true);				
					
				} else{
					$('#checkAmount').text('출고 가능');
					$('#checkAmount').css('color', 'blue');
					$("#submitBtn").removeAttr( 'disabled' );
					
				}
				
			},
			error : function() {
				console.log("통신실패");
			}
			
			
		})
	})
	
	
	
       
    
                const modal = document.getElementById("modal")
    const btnModal = document.getElementById("addBtn")
    btnModal.addEventListener("click", e => {
        modal.style.display = "flex"
    })
    
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modal.style.display = "none"
    })

    window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
})

// document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
        </script>
</body>


</html>