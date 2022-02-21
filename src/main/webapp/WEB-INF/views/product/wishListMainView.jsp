<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wishList</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<style>
/*회사명 , 마감시간*/
.header {
	text-align: center;
	font-weight: bold;
	margin-bottom: 10px;
}

.companyName {
	font-size: 20px;
}

/*위시리스트 기본정보*/
.wishContain{
	padding: 0 3% 0 3%;
}
.row {
	padding: 0 40px;
}

.col {
	padding: 10px;
}

.card.snack {
	border:none;
	position: relative;
}
/*위시리스트 나열*/
.countTxt {
	width: 40px;
	height: 30px;
	outline: none;
	border-radius: 4px;
	text-align: center;
}

.card-img-top {
	width: 50px;
	height: 185px;
	padding-left : 20px;
	padding-right : 20px;	
}

.minus, .plus {
	outline: none;
	box-shadow: none;
	border-style: none;
	border-radius: 4px;
	background-color: rgb(245, 208, 66);
}

.minus:focus, .plus:focus {
	outline: none;
}
/*위시리스트 각 제목*/
.snackTitle, .drinkTitle, .foodTitle {
	font-weight: bold;
	font-size: 15px;
	margin-left: 50px;
	margin-bottom: 10px;
}

/*삭제 버튼*/
.close {
	position: relative;
	display: inline-block;
	*display: inline;
	width: 0px;
	height: 0px;
	text-align: center;
	margin-right: 20px;
	opacity: 0;
	transition: opacity .35e ease;
}

.close:after {
	content: "\00d7"; /*\00d7 : css만으로 x버튼 만들기 가능*/
	font-size: 20pt; /*폰트 사이즈로 크기조절 가능*/
	line-height: 5px;
}

.card:hover .close {
	opacity: 1;
}
/*마감 버튼*/
.endBtn {
	display: block;
	margin: auto;
	margin-top: 5%;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	border-style: none;
	background-color: rgb(10, 23, 78);
	color: white;
}
.price{
    float: left;
    width: 70px;
    text-align: center;
    border-style: none;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<br>
	<br>
	<div class="header">
		<span class="companyName">${list[0].comName}</span><br>
		    <i class="far fa-clock"></i><div id="D-day"></div>
		<!--<fmt:formatDate value="${list[0].wishEndDate}" pattern="yyyy-MM-dd"/>-->
	</div>
	<br>
	<div class="wishContain" >
		<div class="snackTitle">Snack</div>
		<hr>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '1' }">
					<div class="col">
						<div class="card snack">
						   <div class="close" id="closeBtn" value1="${w.snackNo}" value2="${w.wishNo}"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									  <input type="text" class="price" value="${w.releasePrice * w.count}">원&nbsp;&nbsp;
									<button class="minus" id="minusId" value="${w.snackNo}" onclick="minusCount( this.value , ${w.wishNo})">
										<span> − </span>
									</button>
									<input type="text" class="countTxt" name="countTxt" value="${w.count}" readonly ></input>
									<button class="plus" id="plusId" value="${w.snackNo}" onclick="plusCount( this.value , ${w.wishNo})" >
										<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<!--음료  -->
		<div class="drinkTitle">Drink</div>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '2' }">
					<div class="col">
						<div class="card snack">
						   <div class="close" id="closeBtn" value1="${w.snackNo}" value2="${w.wishNo}"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									  <input type="text" class="price" value="${w.releasePrice * w.count}">원&nbsp;&nbsp;
									<button class="minus" id="minusId" value="${w.snackNo}" onclick="minusCount( this.value , ${w.wishNo})">
										<span>−</span>
									</button>
									<input type="text" class="countTxt" name="countTxt" value="${w.count}" readonly></input>
									<button class="plus" id="plusId" value="${w.snackNo}" onclick="plusCount( this.value , ${w.wishNo})">
										<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<!--간편식  -->
		<div class="foodTitle">Convenience food</div>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '3' }">
					<div class="col">
						<div class="card snack">
						   <div class="close" id="closeBtn" value1="${w.snackNo}" value2="${w.wishNo}"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									  <input type="text" class="price" value="${w.releasePrice * w.count}">원&nbsp;&nbsp;
									<button class="minus" id="minusId" value="${w.snackNo}" onclick="minusCount( this.value ${w.wishNo})">
									<span>−</span>
									</button>
									<input type="text" class="countTxt" name="countTxt" value="${w.count}" readonly></input>
									<button class="plus" id="plusId" value="${w.snackNo}" onclick="plusCount( this.value , ${w.wishNo})">
									<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	<c:if test="${loginUser.admin eq 'Y' }">
	<button type="submit" class="endBtn" value="${list[0].wishNo}"  onclick="endBtn(this.value)" >마감</button>
	</c:if>
	</div>
</body>
<script>

	//수량증가
	function plusCount(val , wishNo){
	//	console.log(${fn:length(list)});
	//	console.log(snackNo)
		const snackNo = val;

		const listSize = "${fn:length(list)}";
		const amount = $('.countTxt');
		
		for(let i = 0  ; i < listSize ; i++){
			if($('.plus')[i].value == snackNo){
				var prevAmount = amount[i].value;
			//	alert("동일함 : " + $('.plus')[i].value)
				amount[i].value++;
			
				$.ajax({
					url : "updateCount.wish",
					data : {
						snackNo : snackNo,
						addCount : amount[i].value,
						wishNo : wishNo
					},
					type : "post",
					
				})
				$('.price')[i].value = $('.price')[i].value/prevAmount*amount[i].value; 			
			  } 
				
			}
		}
		
	//수량감소
	function minusCount(val, wishNo){
		
			const snackNo = val;
			const listSize = "${fn:length(list)}";
			const amount = $('.countTxt');
		
			for(let i = 0  ; i < listSize ; i++){
				if($('.minus')[i].value == snackNo){
					var prevAmount = amount[i].value;
			
					if(prevAmount > 1){
						amount[i].value--;
					}else{
						alert('최소수량입니다.')
						amount[i].value = 1;
					}
				
					$.ajax({
						url : "updateCount.wish",
						data : {
							snackNo : snackNo,
							addCount : amount[i].value,
							wishNo : wishNo
						},
						type : "post",
						
					})
					$('.price')[i].value = $('.price')[i].value/prevAmount*amount[i].value; 
				  } 
				
			}
		}

	
	//제품 삭제
	$('.close').on('click',function(){
		var snackNo = $(this).attr('value1');
		var wishNo = $(this).attr('value2');
		
		if(confirm('삭제하시겠습니까?')){
		
		$.ajax({
			url : "delete.wish",
			data : {
				snackNo : snackNo,
				wishNo : wishNo
			},
			type : "post",
			success : function(data){
				location.reload();
				
				}
			})
		}
	})
	
	
	//관리자가 마감버튼 클릭
	function endBtn(val){
		const endWish = val;
		if(confirm("마감하시겠습니까?")){
			location.href="end.wish?wishNo=" + endWish;
		}else{
			return;
		}
	}
	

	//d-day
	$(function(){

		const wishEndDate = "<fmt:formatDate value="${list[0].wishEndDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" //초를 맞춰줘야할꺼같음
			console.log(wishEndDate)
	
		const closingDate = new Date(wishEndDate).getTime() //위시리스트 마감일
		console.log(closingDate)
		var x = setInterval(function(){
            var now = new Date().getTime();
        

            var distance = closingDate - now;
            
            var day = Math.floor(distance / (1000 * 60 * 60 * 24)); 
            var hour = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
            var minute = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); 
            var second = Math.floor((distance % (1000 * 60)) / 1000);
      
        
            document.getElementById("D-day").innerHTML = "마감시간까지 "+ "D-" + day + " " + hour + " : "  + minute + " : " + second ;
		
		})
	},1000);
	
	
	</script>
</html>